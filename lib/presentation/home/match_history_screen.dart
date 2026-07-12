import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/match_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import '../../application/export_service.dart';
import '../scoring/scoring_dashboard.dart';
import 'package:open_file/open_file.dart';

class MatchHistoryScreen extends ConsumerStatefulWidget {
  const MatchHistoryScreen({super.key});

  @override
  ConsumerState<MatchHistoryScreen> createState() => _MatchHistoryScreenState();
}

class _MatchHistoryScreenState extends ConsumerState<MatchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final repo = ref.watch(eventRepositoryProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Match History')),
      body: FutureBuilder(
        future: repo.db.select(repo.db.matches).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
             return Center(child: Text('Error: ${snapshot.error}'));
          }

          final matches = snapshot.data ?? [];
          if (matches.isEmpty) {
             return const Center(child: Text('No match history found.'));
          }

          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              String title = 'Match: ${match.id}';
              
              try {
                if (match.config.isNotEmpty && match.config != '{}') {
                   final configJson = jsonDecode(match.config);
                   if (configJson['team1Name'] != null && configJson['team2Name'] != null) {
                      title = '${configJson['team1Name']} vs ${configJson['team2Name']}';
                   }
                }
              } catch (_) {}

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.sports_cricket, size: 32),
                  title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Status: ${match.status}\nDate: ${match.createdAt.toLocal().toString().split('.')[0]}'),
                  trailing: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                        IconButton(
                           icon: const Icon(Icons.picture_as_pdf, color: Colors.blue),
                           onPressed: () async {
                              final notifier = ref.read(matchStateProvider(match.id).notifier);
                              await notifier.loadMatch();
                              final state = ref.read(matchStateProvider(match.id));
                              if (state != null) {
                                final exportService = ref.read(exportServiceProvider);
                                final path = await exportService.exportStateToPdf(state);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sharing PDF...')));
                                  await Share.shareXFiles([XFile(path)], text: 'Match Scorecard');
                                }
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please open the match first to load data.')));
                                }
                              }
                           },
                        ),
                        IconButton(
                           icon: const Icon(Icons.delete, color: Colors.red),
                           onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Delete Match?'),
                                  content: const Text('Are you sure you want to delete this match? This action cannot be undone.'),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                                      onPressed: () async {
                                        Navigator.pop(ctx);
                                        await (repo.db.delete(repo.db.matches)..where((t) => t.id.equals(match.id))).go();
                                        await (repo.db.delete(repo.db.matchEvents)..where((t) => t.matchId.equals(match.id))).go();
                                        setState(() {});
                                      },
                                      child: const Text('Delete'),
                                    )
                                  ]
                                )
                              );
                           },
                        ),
                        const Icon(Icons.arrow_forward_ios)
                     ],
                  ),
                  onTap: () async {
                     final notifier = ref.read(matchStateProvider(match.id).notifier);
                     await notifier.loadMatch();
                     if (context.mounted) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ScoringDashboard(matchId: match.id)));
                     }
                  },
                ),
              );
            },
          );
        }
      ),
    );
  }
}
