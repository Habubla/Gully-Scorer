import 'package:flutter/material.dart';
import '../setup/match_setup_screen.dart';
import 'match_history_screen.dart';
import 'player_stats_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GullyScore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.sports_cricket, size: 32),
              label: const Text('Start Match', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(24), backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MatchSetupScreen()));
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.history, size: 24),
              label: const Text('Match History', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MatchHistoryScreen()));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.bar_chart, size: 24),
              label: const Text('Player Stats', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PlayerStatsScreen()));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings, size: 24),
              label: const Text('Settings', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
