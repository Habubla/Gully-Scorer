import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/models/match_configuration.dart';
import '../../application/match_service.dart';
import 'toss_screen.dart';

class MatchSetupScreen extends ConsumerStatefulWidget {
  const MatchSetupScreen({super.key});

  @override
  ConsumerState<MatchSetupScreen> createState() => _MatchSetupScreenState();
}

class _MatchSetupScreenState extends ConsumerState<MatchSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  
  MatchFormat _format = MatchFormat.whiteBall;
  String _team1Name = 'Team 1';
  String _team2Name = 'Team 2';
  int _playersPerTeam = 11;
  double _maxOvers = 20.0;
  bool _lastManStanding = true;
  bool _isStarting = false;

  void _startMatch() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final config = MatchConfiguration(
      format: _format,
      maxOvers: _format == MatchFormat.whiteBall ? _maxOvers : null,
      playersPerTeam: _playersPerTeam,
      team1Name: _team1Name,
      team2Name: _team2Name,
      lastManStanding: _lastManStanding,
    );
    
    final uuid = const Uuid().v4();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TossScreen(matchId: uuid, config: config))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start New Match')),
      body: _isStarting 
        ? const Center(child: CircularProgressIndicator())
        : Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const SizedBox(height: 16),
                const Text('Match Format', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SegmentedButton<MatchFormat>(
                  segments: const [
                    ButtonSegment(value: MatchFormat.whiteBall, label: Text('White Ball (Limited)')),
                    ButtonSegment(value: MatchFormat.redBall, label: Text('Red Ball (Test)')),
                  ],
                  selected: {_format},
                  onSelectionChanged: (Set<MatchFormat> newSelection) {
                    setState(() {
                      _format = newSelection.first;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _team1Name,
                  decoration: const InputDecoration(labelText: 'Team 1 Name'),
                  onSaved: (val) => _team1Name = val ?? 'Team 1',
                ),
                TextFormField(
                  initialValue: _team2Name,
                  decoration: const InputDecoration(labelText: 'Team 2 Name'),
                  onSaved: (val) => _team2Name = val ?? 'Team 2',
                ),
                TextFormField(
                  initialValue: _playersPerTeam.toString(),
                  decoration: const InputDecoration(labelText: 'Players Per Team'),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                     int? parsed = int.tryParse(val ?? '');
                     if (parsed == null || parsed <= 0) return 'Must be an integer > 0';
                     return null;
                  },
                  onSaved: (val) => _playersPerTeam = int.tryParse(val ?? '11') ?? 11,
                ),
                if (_format == MatchFormat.whiteBall)
                  TextFormField(
                    initialValue: _maxOvers.toString(),
                    decoration: const InputDecoration(labelText: 'Max Overs'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (val) {
                       double? parsed = double.tryParse(val ?? '');
                       if (parsed == null || parsed <= 0) return 'Must be a number > 0';
                       return null;
                    },
                    onSaved: (val) => _maxOvers = double.tryParse(val ?? '20') ?? 20.0,
                  ),
                SwitchListTile(
                  title: const Text('Last Man Standing'),
                  subtitle: const Text('Allow single batter without non-striker'),
                  value: _lastManStanding,
                  onChanged: (val) => setState(() => _lastManStanding = val),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _startMatch,
                  child: const Text('Continue to Toss'),
                )
              ],
            ),
          ),
    );
  }
}
