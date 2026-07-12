import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/match_service.dart';
import 'player_profile_screen.dart';

class PlayerStatsScreen extends ConsumerWidget {
  const PlayerStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(eventRepositoryProvider);
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Player Stats'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Batting'),
              Tab(text: 'Bowling'),
            ],
          ),
        ),
        body: FutureBuilder(
          future: repo.db.select(repo.db.playerGlobalStats).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
               return Center(child: Text('Error: ${snapshot.error}'));
            }

            final stats = snapshot.data ?? [];
            if (stats.isEmpty) {
               return const Center(child: Text('No player stats found. Play a match to generate stats!'));
            }

            return TabBarView(
              children: [
                // Batting Tab
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text('Player')),
                        DataColumn(label: Text('M')),
                        DataColumn(label: Text('R')),
                        DataColumn(label: Text('B')),
                        DataColumn(label: Text('4s')),
                        DataColumn(label: Text('6s')),
                        DataColumn(label: Text('SR')),
                      ],
                      rows: stats.map((stat) {
                        double sr = stat.totalBallsFaced > 0 ? (stat.totalRuns / stat.totalBallsFaced) * 100 : 0.0;
                        return DataRow(
                          onSelectChanged: (b) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerProfileScreen(playerStat: stat)));
                          },
                          cells: [
                            DataCell(Text(stat.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
                            DataCell(Text(stat.matchesPlayed.toString())),
                            DataCell(Text(stat.totalRuns.toString())),
                            DataCell(Text(stat.totalBallsFaced.toString())),
                            DataCell(Text(stat.totalFours.toString())),
                            DataCell(Text(stat.totalSixes.toString())),
                            DataCell(Text(sr.toStringAsFixed(1))),
                          ]
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Bowling Tab
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text('Player')),
                        DataColumn(label: Text('M')),
                        DataColumn(label: Text('O')),
                        DataColumn(label: Text('W')),
                        DataColumn(label: Text('R')),
                        DataColumn(label: Text('Econ')),
                      ],
                      rows: stats.map((stat) {
                        int overs = stat.totalBallsBowled ~/ 6;
                        int balls = stat.totalBallsBowled % 6;
                        double oversDecimal = overs + (balls / 6.0);
                        double econ = oversDecimal > 0 ? (stat.totalRunsConceded / oversDecimal) : 0.0;
                        return DataRow(
                          onSelectChanged: (b) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerProfileScreen(playerStat: stat)));
                          },
                          cells: [
                            DataCell(Text(stat.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
                            DataCell(Text(stat.matchesPlayed.toString())),
                            DataCell(Text('$overs.$balls')),
                            DataCell(Text(stat.totalWicketsTaken.toString())),
                            DataCell(Text(stat.totalRunsConceded.toString())),
                            DataCell(Text(econ.toStringAsFixed(1))),
                          ]
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
