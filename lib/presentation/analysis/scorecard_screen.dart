import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/match_service.dart';
import '../../domain/models/match_state.dart';
import '../../domain/models/player_state.dart';

class ScorecardScreen extends ConsumerWidget {
  final String matchId;
  const ScorecardScreen({super.key, required this.matchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchStateProvider(matchId));
    if (state == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final hasSecondInnings = state.targetScore != null;
    
    final firstInningsBatting = state.firstInningsBattingTeamId;
    final firstInningsBowling = firstInningsBatting == 'team_1' ? 'team_2' : 'team_1';
    
    final secondInningsBatting = firstInningsBowling;
    final secondInningsBowling = firstInningsBatting;
    
    return DefaultTabController(
      length: hasSecondInnings ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detailed Scorecard'),
          bottom: TabBar(
            tabs: [
              const Tab(text: '1st Innings'),
              if (hasSecondInnings) const Tab(text: '2nd Innings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _InningsView(
              matchId: matchId,
              batters: state.players.where((p) => p.teamId == firstInningsBatting).toList(),
              bowlers: state.players.where((p) => p.teamId == firstInningsBowling).toList(),
            ),
            if (hasSecondInnings)
              _InningsView(
                matchId: matchId,
                batters: state.players.where((p) => p.teamId == secondInningsBatting).toList(),
                bowlers: state.players.where((p) => p.teamId == secondInningsBowling).toList(),
              )
          ],
        )
      ),
    );
  }
}

class _InningsView extends ConsumerWidget {
  final String matchId;
  final List<PlayerState> batters;
  final List<PlayerState> bowlers;

  const _InningsView({required this.matchId, required this.batters, required this.bowlers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionHeader('Batting'),
            _buildBattingTable(context, ref, batters),
            const SizedBox(height: 32),
            _buildSectionHeader('Bowling'),
            _buildBowlingTable(bowlers),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBattingTable(BuildContext context, WidgetRef ref, List<PlayerState> batters) {
    final activeBatters = batters.where((b) => b.runsScored > 0 || b.ballsFaced > 0 || b.hasBatted || b.status != PlayerMatchStatus.waiting).toList();
    
    if (activeBatters.isEmpty) {
       return const Padding(padding: EdgeInsets.all(16), child: Text("No batting data yet."));
    }

    return DataTable(
      columnSpacing: 16,
      horizontalMargin: 8,
      headingRowHeight: 40,
      dataRowMinHeight: 40,
      dataRowMaxHeight: 48,
      columns: const [
        DataColumn(label: Text('Batter')),
        DataColumn(label: Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('B', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('4s', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('6s', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('SR', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: activeBatters.map((b) {
        String details = '';
        if (b.status == PlayerMatchStatus.dismissed) {
          details = b.dismissalDetails.isNotEmpty ? b.dismissalDetails : 'Out';
        } else if (b.status == PlayerMatchStatus.retiredHurt) {
          details = 'Retired Hurt';
        } else if (b.status == PlayerMatchStatus.retiredOut) {
          details = 'Retired Out';
        } else if (b.runsScored > 0 || b.ballsFaced > 0 || b.hasBatted) {
          details = 'Not out';
        }

        double sr = b.ballsFaced > 0 ? (b.runsScored / b.ballsFaced) * 100 : 0.0;

        return DataRow(
          cells: [
            DataCell(
               InkWell(
                 onTap: (b.status == PlayerMatchStatus.dismissed && details.contains('run out') || details.contains('st ') || details.contains('c ')) ? () async {
                    String newFielder = '';
                    await showDialog(
                       context: context,
                       builder: (ctx) => AlertDialog(
                         title: const Text('Edit Fielder'),
                         content: TextField(
                            decoration: const InputDecoration(labelText: 'New Fielder Name'),
                            onChanged: (val) => newFielder = val,
                         ),
                         actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () {
                                 if (newFielder.isNotEmpty) {
                                    ref.read(matchStateProvider(matchId).notifier).updateFielderName(b.id, newFielder);
                                 }
                                 Navigator.pop(ctx);
                              },
                              child: const Text('Update'),
                            )
                         ],
                       )
                    );
                 } : null,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(b.name, style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                     if (details.isNotEmpty) 
                        Row(
                          children: [
                            Text(details, style: TextStyle(fontSize: 11, color: Colors.grey)),
                            if (b.status == PlayerMatchStatus.dismissed && (details.contains('run out') || details.contains('st ') || details.contains('c ')))
                               const Icon(Icons.edit, size: 12, color: Colors.blueAccent),
                          ],
                        ),
                   ],
                 ),
               )
            ),
            DataCell(Text('${b.runsScored}')),
            DataCell(Text('${b.ballsFaced}')),
            DataCell(Text('${b.fours}')),
            DataCell(Text('${b.sixes}')),
            DataCell(Text(sr.toStringAsFixed(1))),
          ]
        );
      }).toList(),
    );
  }

  Widget _buildBowlingTable(List<PlayerState> bowlers) {
    final activeBowlers = bowlers.where((b) => b.ballsBowled > 0).toList();

    if (activeBowlers.isEmpty) {
       return const Padding(padding: EdgeInsets.all(16), child: Text("No bowling data yet."));
    }

    return DataTable(
      columnSpacing: 16,
      horizontalMargin: 8,
      headingRowHeight: 40,
      dataRowMinHeight: 40,
      dataRowMaxHeight: 48,
      columns: const [
        DataColumn(label: Text('Bowler')),
        DataColumn(label: Text('O', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('R', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('W', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Econ', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: activeBowlers.map((b) {
        int overs = b.ballsBowled ~/ 6;
        int balls = b.ballsBowled % 6;
        double oversDecimal = overs + (balls / 6.0);
        double econ = oversDecimal > 0 ? (b.runsConceded / oversDecimal) : 0.0;
        return DataRow(
          cells: [
            DataCell(Text(b.name, overflow: TextOverflow.ellipsis)),
            DataCell(Text('$overs.$balls')),
            DataCell(Text('${b.runsConceded}')),
            DataCell(Text('${b.wicketsTaken}')),
            DataCell(Text(econ.toStringAsFixed(1))),
          ]
        );
      }).toList(),
    );
  }
}
