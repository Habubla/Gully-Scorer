import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/database.dart';
import '../../application/match_service.dart';

class PlayerProfileScreen extends ConsumerWidget {
  final PlayerGlobalStat playerStat;
  const PlayerProfileScreen({super.key, required this.playerStat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sr = playerStat.totalBallsFaced > 0 ? (playerStat.totalRuns / playerStat.totalBallsFaced) * 100 : 0.0;
    int overs = playerStat.totalBallsBowled ~/ 6;
    int balls = playerStat.totalBallsBowled % 6;
    double oversDecimal = overs + (balls / 6.0);
    double econ = oversDecimal > 0 ? (playerStat.totalRunsConceded / oversDecimal) : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(playerStat.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteDialog(context, ref),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(playerStat.name, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Batting'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Matches', playerStat.matchesPlayed.toString()),
                    _buildStatItem('Runs', playerStat.totalRuns.toString()),
                    _buildStatItem('Balls', playerStat.totalBallsFaced.toString()),
                    _buildStatItem('SR', sr.toStringAsFixed(1)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('4s', playerStat.totalFours.toString()),
                    _buildStatItem('6s', playerStat.totalSixes.toString()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader(context, 'Bowling'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Overs', '$overs.$balls'),
                    _buildStatItem('Wickets', playerStat.totalWicketsTaken.toString()),
                    _buildStatItem('Runs', playerStat.totalRunsConceded.toString()),
                    _buildStatItem('Econ', econ.toStringAsFixed(1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Player?'),
        content: const Text('Are you sure you want to delete this player? This will remove them from the global player stats, but will not affect any matches they have already played in.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              final repo = ref.read(eventRepositoryProvider);
              await (repo.db.delete(repo.db.playerGlobalStats)..where((t) => t.playerId.equals(playerStat.playerId))).go();
              if (context.mounted) {
                 Navigator.pop(context); // Close dialog
                 Navigator.pop(context); // Close profile screen
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Player deleted successfully')));
              }
            }, 
            child: const Text('Delete')
          )
        ],
      ),
    );
  }
}
