import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../database/repositories/event_repository.dart';
import '../domain/models/match_state.dart';
import '../domain/models/player_state.dart';
import '../application/match_service.dart';

final exportServiceProvider = Provider<ExportService>((ref) {
  final repo = ref.watch(eventRepositoryProvider);
  return ExportService(repo);
});

class ExportService {
  final EventRepository repo;
  
  ExportService(this.repo);

  Future<String> exportMatchToJson(String matchId) async {
    final events = await repo.getEventsForMatch(matchId);
    final jsonList = events.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(jsonList);

    Directory dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/match_$matchId.json');
    await file.writeAsString(jsonString);
    
    return file.path;
  }

  Future<String> exportStateToPdf(MatchState state) async {
    final pdf = pw.Document();

    final firstBatter = state.players.firstWhere((p) => p.hasBatted, orElse: () => state.players.firstWhere((p) => p.teamId == 'team_1'));
    final teamBattingFirst = firstBatter.teamId;
    final teamBattingSecond = teamBattingFirst == 'team_1' ? 'team_2' : 'team_1';
    
    final t1Name = state.config.team1Name;
    final t2Name = state.config.team2Name;
    
    final teamBattingFirstName = teamBattingFirst == 'team_1' ? t1Name : t2Name;
    final teamBattingSecondName = teamBattingSecond == 'team_1' ? t1Name : t2Name;

    int firstInningsTotal = state.targetScore != null ? (state.targetScore! - 1) : state.totalRuns;
    int secondInningsTotal = state.targetScore != null ? state.totalRuns : 0;
    
    final primaryColor = PdfColor.fromHex('#0a192f');
    final secondaryColor = PdfColor.fromHex('#112240');
    final greenColor = PdfColor.fromHex('#d1e7dd');
    final accentColor = PdfColor.fromHex('#0056b3');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return [
            // Header Banner
            pw.Container(
              padding: const pw.EdgeInsets.all(20),
              decoration: pw.BoxDecoration(
                color: primaryColor,
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                   pw.Column(
                     crossAxisAlignment: pw.CrossAxisAlignment.start,
                     children: [
                        pw.Text("GullyScore", style: pw.TextStyle(color: PdfColors.white, fontSize: 24, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 4),
                        pw.Text("MATCH REPORT", style: pw.TextStyle(color: PdfColors.grey400, fontSize: 10, letterSpacing: 1.5)),
                        pw.SizedBox(height: 16),
                        pw.Text("$t1Name vs $t2Name", style: pw.TextStyle(color: PdfColors.white, fontSize: 28, fontWeight: pw.FontWeight.bold)),
                     ]
                   ),
                   pw.Column(
                     crossAxisAlignment: pw.CrossAxisAlignment.end,
                     children: [
                        pw.Text(state.matchStatus == MatchStatus.completed ? "Match Completed" : "Match In Progress", style: pw.TextStyle(color: PdfColors.greenAccent, fontSize: 12, fontWeight: pw.FontWeight.bold)),
                     ]
                   )
                ]
              )
            ),
            pw.SizedBox(height: 16),
            
            // Result Banner
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              width: double.infinity,
              decoration: pw.BoxDecoration(
                color: greenColor,
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                   pw.Text("RESULT", style: pw.TextStyle(color: PdfColors.grey700, fontSize: 10, fontWeight: pw.FontWeight.bold)),
                   pw.SizedBox(height: 4),
                   pw.Text("${(state.matchResult ?? '').isNotEmpty ? state.matchResult : 'IN PROGRESS'}", style: pw.TextStyle(color: primaryColor, fontSize: 20, fontWeight: pw.FontWeight.bold)),
                ]
              )
            ),
            pw.SizedBox(height: 24),

            // 1st Innings
            _buildInningsHeader(teamBattingFirstName, 1, firstInningsTotal, accentColor),
            pw.SizedBox(height: 12),
            _buildBattingTable(context, state, teamBattingFirst, accentColor),
            pw.SizedBox(height: 16),
            _buildBowlingTable(context, state, teamBattingSecond, accentColor),
            pw.SizedBox(height: 32),

            // 2nd Innings (if exists)
            if (state.targetScore != null || state.players.where((p) => p.teamId == teamBattingSecond && p.hasBatted).isNotEmpty) ...[
              _buildInningsHeader(teamBattingSecondName, 2, secondInningsTotal, accentColor),
              pw.SizedBox(height: 12),
              _buildBattingTable(context, state, teamBattingSecond, accentColor),
              pw.SizedBox(height: 16),
              _buildBowlingTable(context, state, teamBattingFirst, accentColor),
            ],
            
            pw.SizedBox(height: 40),
            pw.Center(
               child: pw.Text("Live updates and detailed stats powered by GullyScore", style: pw.TextStyle(color: PdfColors.grey600, fontSize: 10))
            )
          ];
        },
      ),
    );

    Directory dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/match_${state.matchId}.pdf');
    await file.writeAsBytes(await pdf.save());
    
    return file.path;
  }
  
  pw.Widget _buildInningsHeader(String teamName, int innings, int runs, PdfColor color) {
     return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
           pw.Text("${innings == 1 ? '1st' : '2nd'} INNINGS: $teamName", style: pw.TextStyle(color: color, fontSize: 16, fontWeight: pw.FontWeight.bold)),
           pw.Text("$runs RUNS", style: pw.TextStyle(color: color, fontSize: 16, fontWeight: pw.FontWeight.bold)),
        ]
     );
  }
  
  pw.Widget _buildBattingTable(pw.Context context, MatchState state, String teamId, PdfColor headerColor) {
      return pw.Column(
         crossAxisAlignment: pw.CrossAxisAlignment.start,
         children: [
            pw.Container(
               padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               decoration: pw.BoxDecoration(
                  color: headerColor,
                  borderRadius: const pw.BorderRadius.only(topLeft: pw.Radius.circular(8), topRight: pw.Radius.circular(8))
               ),
               child: pw.Text("BATTING SCORECARD", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 12))
            ),
            pw.TableHelper.fromTextArray(
              context: context,
              cellStyle: const pw.TextStyle(fontSize: 10),
              headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.blueGrey800),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
              border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
              data: <List<String>>[
                <String>['PLAYER', 'STATUS', 'R', 'B', '4s', '6s', 'SR'],
                ...state.players.where((p) => p.teamId == teamId && (p.ballsFaced > 0 || p.hasBatted)).map((p) {
                  String status = p.status.name;
                  if (p.status == PlayerMatchStatus.dismissed && p.dismissalDetails.isNotEmpty) {
                     status = p.dismissalDetails;
                  } else if (p.runsScored > 0 || p.ballsFaced > 0 || p.hasBatted) {
                     status = 'not out';
                  }
                  double sr = p.ballsFaced > 0 ? (p.runsScored / p.ballsFaced) * 100 : 0.0;
                  return [
                    p.name,
                    status,
                    p.runsScored.toString(),
                    p.ballsFaced.toString(),
                    p.fours.toString(),
                    p.sixes.toString(),
                    sr.toStringAsFixed(1),
                  ];
                })
              ],
            )
         ]
      );
  }
  
  pw.Widget _buildBowlingTable(pw.Context context, MatchState state, String teamId, PdfColor headerColor) {
      return pw.Column(
         crossAxisAlignment: pw.CrossAxisAlignment.start,
         children: [
            pw.Container(
               padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               decoration: pw.BoxDecoration(
                  color: PdfColor.fromHex('#4caf50'),
                  borderRadius: const pw.BorderRadius.only(topLeft: pw.Radius.circular(8), topRight: pw.Radius.circular(8))
               ),
               child: pw.Text("BOWLING FIGURES", style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 12))
            ),
            pw.TableHelper.fromTextArray(
              context: context,
              cellStyle: const pw.TextStyle(fontSize: 10),
              headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.blueGrey800),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.grey100),
              border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
              data: <List<String>>[
                <String>['PLAYER', 'O', 'M', 'R', 'W', 'ECON'],
                ...state.players.where((p) => p.teamId == teamId && p.ballsBowled > 0).map((p) {
                  int overs = p.ballsBowled ~/ 6;
                  int balls = p.ballsBowled % 6;
                  double oversDecimal = overs + (balls / 6.0);
                  double econ = oversDecimal > 0 ? (p.runsConceded / oversDecimal) : 0.0;
                  return [
                    p.name,
                    '$overs.$balls',
                    p.maidens.toString(),
                    p.runsConceded.toString(),
                    p.wicketsTaken.toString(),
                    econ.toStringAsFixed(1),
                  ];
                })
              ],
            )
         ]
      );
  }

}
