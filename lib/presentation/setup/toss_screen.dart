import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../../domain/models/match_configuration.dart';
import '../../application/match_service.dart';
import '../scoring/scoring_dashboard.dart';

class TossScreen extends ConsumerStatefulWidget {
  final String matchId;
  final MatchConfiguration config;

  const TossScreen({super.key, required this.matchId, required this.config});

  @override
  ConsumerState<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends ConsumerState<TossScreen> {
  bool _isFlipping = false;
  String? _coinResult;
  String? _tossWinner;
  String? _tossDecision;

  void _flipCoin() async {
    setState(() {
      _isFlipping = true;
      _coinResult = null;
    });

    // Simulate animation delay
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    final isHeads = Random().nextBool();
    setState(() {
      _isFlipping = false;
      _coinResult = isHeads ? 'Heads' : 'Tails';
    });
  }

  void _startMatch() async {
    if (_tossWinner == null || _tossDecision == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select winner and decision')));
      return;
    }

    try {
      await ref.read(matchStateProvider(widget.matchId).notifier).startMatch(
        widget.config, 
        tossWinner: _tossWinner!, 
        tossDecision: _tossDecision!
      );

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ScoringDashboard(matchId: widget.matchId))
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toss Coin')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isFlipping)
                const CircularProgressIndicator()
              else if (_coinResult != null)
                Text('Result: $_coinResult', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
              else
                const Text('Tap below to flip the coin', style: TextStyle(fontSize: 20)),
              
              const SizedBox(height: 32),
              
              ElevatedButton(
                onPressed: _isFlipping ? null : _flipCoin,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16)),
                child: const Text('FLIP COIN', style: TextStyle(fontSize: 24)),
              ),

              const SizedBox(height: 48),
              
              if (_coinResult != null) ...[
                const Text('Who won the toss?', style: TextStyle(fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text(widget.config.team1Name),
                      selected: _tossWinner == widget.config.team1Name,
                      onSelected: (val) => setState(() => _tossWinner = widget.config.team1Name),
                    ),
                    const SizedBox(width: 16),
                    ChoiceChip(
                      label: Text(widget.config.team2Name),
                      selected: _tossWinner == widget.config.team2Name,
                      onSelected: (val) => setState(() => _tossWinner = widget.config.team2Name),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('What did they elect to do?', style: TextStyle(fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('Bat'),
                      selected: _tossDecision == 'Bat',
                      onSelected: (val) => setState(() => _tossDecision = 'Bat'),
                    ),
                    const SizedBox(width: 16),
                    ChoiceChip(
                      label: const Text('Bowl'),
                      selected: _tossDecision == 'Bowl',
                      onSelected: (val) => setState(() => _tossDecision = 'Bowl'),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: _startMatch,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16)),
                  child: const Text('Play Ball!', style: TextStyle(fontSize: 24)),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
