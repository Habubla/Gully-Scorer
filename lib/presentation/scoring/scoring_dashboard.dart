import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/match_service.dart';
import '../../domain/events/match_event.dart';
import '../../domain/models/match_state.dart';
import '../../domain/models/player_state.dart';
import '../../domain/models/match_configuration.dart';
import '../analysis/scorecard_screen.dart';

class ScoringDashboard extends ConsumerWidget {
  final String matchId;

  const ScoringDashboard({super.key, required this.matchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchStateProvider(matchId));

    if (state == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('GullyScore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ScorecardScreen(matchId: matchId))
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () => ref.read(matchStateProvider(matchId).notifier).undo(),
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: () => ref.read(matchStateProvider(matchId).notifier).redo(),
          ),
          if (state.targetScore != null)
             IconButton(
               icon: const Icon(Icons.edit_note),
               tooltip: 'Adjust Target (Rain/DLS)',
               onPressed: () {
                  int newTarget = state.targetScore!;
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                       title: const Text('Adjust Target Score'),
                       content: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'New Target Score'),
                          onChanged: (val) => newTarget = int.tryParse(val) ?? state.targetScore!,
                       ),
                       actions: [
                          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                          ElevatedButton(
                             onPressed: () => Navigator.pop(ctx, newTarget),
                             child: const Text('Update')
                          )
                       ]
                    )
                  ).then((val) {
                     if (val != null) {
                        ref.read(matchStateProvider(matchId).notifier).updateTargetScore(val);
                     }
                  });
               },
             ),
        ],
      ),
      body: Column(
        children: [
          _ScorecardHeader(state: state),
          _ActivePlayers(matchId: matchId, state: state),
          Expanded(
            child: _buildKeypadOrOverlay(context, ref, state),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypadOrOverlay(BuildContext context, WidgetRef ref, dynamic state) {
    if (state.matchStatus == MatchStatus.completed) {
       return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.green.shade900.withValues(alpha: 0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
                 const SizedBox(height: 16),
                 const Text('Match Completed', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                 const SizedBox(height: 16),
                 Text(state.matchResult ?? '', style: const TextStyle(fontSize: 20, color: Colors.white70)),
                 const SizedBox(height: 32),
                 ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.greenAccent,
                       foregroundColor: Colors.black,
                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    icon: const Icon(Icons.replay),
                    label: const Text('Start Super Over', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: () => ref.read(matchStateProvider(matchId).notifier).startSuperOver(),
                 )
              ],
            )
          )
       );
    } else if (state.inningsStatus == InningsStatus.completed || state.inningsStatus == InningsStatus.declared) {
       return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.blue.shade900.withValues(alpha: 0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Icon(Icons.sports_cricket, size: 64, color: Colors.blueAccent),
                 const SizedBox(height: 16),
                 Text(state.inningsStatus == InningsStatus.declared ? 'Innings Declared' : 'Innings Break', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                 const SizedBox(height: 32),
                 if (state.config.format == MatchFormat.whiteBall)
                   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blueAccent,
                         foregroundColor: Colors.white,
                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () => ref.read(matchStateProvider(matchId).notifier).startSecondInnings(),
                      child: const Text('Start 2nd Innings', style: TextStyle(fontSize: 20))
                   )
                 else ...[
                   Text('Start Innings ${state.inningsCount}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70)),
                   const SizedBox(height: 16),
                   ElevatedButton(
                      onPressed: () => ref.read(matchStateProvider(matchId).notifier).startNextInnings('team_1'),
                      child: Text('Bat: ${state.config.team1Name}', style: const TextStyle(fontSize: 18))
                   ),
                   const SizedBox(height: 8),
                   ElevatedButton(
                      onPressed: () => ref.read(matchStateProvider(matchId).notifier).startNextInnings('team_2'),
                      child: Text('Bat: ${state.config.team2Name}', style: const TextStyle(fontSize: 18))
                   ),
                 ]
              ],
            )
          )
       );
    }
    return _ScoringKeypad(matchId: matchId, state: state);
  }
}

class _ScorecardHeader extends StatelessWidget {
  final dynamic state;
  const _ScorecardHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    int overs = state.legalDeliveries ~/ 6;
    int balls = state.legalDeliveries % 6;
    double crr = state.legalDeliveries > 0 ? (state.totalRuns / state.legalDeliveries) * 6 : 0.0;
    
    double maxOvers = state.config.maxOvers ?? 0.0;
    
    String reqRrStr = '-';
    if (state.targetScore != null && maxOvers > 0 && state.matchStatus != MatchStatus.completed) {
       int runsNeeded = (state.targetScore! as int) - (state.totalRuns as int);
       int maxDeliveries = (maxOvers.floor() * 6) + ((maxOvers - maxOvers.floor()) * 10).round();
       int ballsRemaining = maxDeliveries - (state.legalDeliveries as int);
       double rrr = ballsRemaining > 0 ? (runsNeeded / ballsRemaining) * 6 : 0.0;
       reqRrStr = rrr.toStringAsFixed(2);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, 8))
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Row: Badges and Target
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.2),
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, color: Colors.greenAccent, size: 10),
                        SizedBox(width: 4),
                        Text('LIVE', style: TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  if (state.isFreeHit) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text('FREE HIT', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ]
                ],
              ),
              if (state.targetScore != null)
                 Container(
                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                   decoration: BoxDecoration(
                     color: Colors.black26,
                     borderRadius: BorderRadius.circular(16),
                   ),
                   child: Text('Target: ${state.targetScore}', style: const TextStyle(color: Colors.amberAccent, fontSize: 14, fontWeight: FontWeight.bold)),
                 ),
            ],
          ),
          
          // Middle Row: Score
          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${state.totalRuns} / ${state.totalWickets}',
                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white, height: 1.2),
              ),
            ),
          ),
          
          const Divider(color: Colors.white24, height: 24),
          
          // Bottom Row: Overs, CRR, REQ RR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Overs
              Column(
                children: [
                  const Text('OVERS', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$overs.$balls', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      if (maxOvers > 0)
                        Text(' / $maxOvers', style: const TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                ],
              ),
              Container(height: 30, width: 1, color: Colors.white24),
              
              // CRR
              Column(
                children: [
                  const Text('CRR', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(crr.toStringAsFixed(2), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              
              // REQ RR
              if (state.targetScore != null) ...[
                Container(height: 30, width: 1, color: Colors.white24),
                Column(
                  children: [
                    const Text('REQ RR', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(reqRrStr, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivePlayers extends ConsumerWidget {
  final String matchId;
  final dynamic state;
  const _ActivePlayers({required this.matchId, required this.state});

  void _showPlayerSelectionSheet(BuildContext context, WidgetRef ref, String role) {
    String battingTeamId = state.currentBattingTeamId;
    String bowlingTeamId = battingTeamId == 'team_1' ? 'team_2' : 'team_1';
    final teamId = role == 'Bowler' ? bowlingTeamId : battingTeamId;

    // Filter available players
    final allTeamPlayers = (state.players as Iterable).where((p) => p.teamId == teamId).toList();
    List availablePlayers = [];
    if (role == 'Striker' || role == 'Non-Striker') {
       availablePlayers = allTeamPlayers.where((p) => 
          p.id != state.currentStrikerId && 
          p.id != state.currentNonStrikerId && 
          p.status != PlayerMatchStatus.dismissed &&
          p.status != PlayerMatchStatus.retiredOut
       ).toList();
    } else if (role == 'Bowler') {
       availablePlayers = allTeamPlayers.where((p) => p.id != state.currentBowlerId).toList();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
         String newPlayerName = '';
         return Padding(
           padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom, left: 16, right: 16, top: 16),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text('Select $role', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
               const SizedBox(height: 16),
               Row(
                 children: [
                   Expanded(
                     child: TextField(
                       decoration: const InputDecoration(labelText: 'Add New Player', border: OutlineInputBorder()),
                       onChanged: (val) => newPlayerName = val,
                     ),
                   ),
                   const SizedBox(width: 8),
                   ElevatedButton(
                     onPressed: () {
                        if (newPlayerName.isNotEmpty) {
                           Navigator.pop(ctx, {'isNew': true, 'name': newPlayerName});
                        }
                     },
                     child: const Text('Add')
                   )
                 ],
               ),
               const Divider(height: 32),
               if (availablePlayers.isEmpty)
                  const Padding(padding: EdgeInsets.all(16), child: Text('No available players. Add a new one.'))
               else
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: availablePlayers.length,
                    itemBuilder: (ctx, idx) {
                       final p = availablePlayers[idx];
                       return ListTile(
                         leading: const Icon(Icons.person),
                         title: Text(p.name),
                         onTap: () => Navigator.pop(ctx, {'isNew': false, 'id': p.id})
                       );
                    }
                  ),
               const SizedBox(height: 16),
             ]
           )
         );
      }
    ).then((result) async {
       if (result != null) {
          final notifier = ref.read(matchStateProvider(matchId).notifier);
          String selectedId;
          
          if (result['isNew'] == true) {
             selectedId = DateTime.now().millisecondsSinceEpoch.toString();
             await ref.read(eventRepositoryProvider).appendEvent(matchId, 
                MatchEvent.playerAdded(matchId: matchId, playerId: selectedId, name: result['name'], teamId: teamId, timestamp: DateTime.now())
             );
          } else {
             selectedId = result['id'];
          }

          if (role == 'Striker') {
            await notifier.selectBatters(strikerId: selectedId, nonStrikerId: state.currentNonStrikerId);
          } else if (role == 'Non-Striker') {
            await notifier.selectBatters(strikerId: state.currentStrikerId ?? selectedId, nonStrikerId: selectedId);
          } else if (role == 'Bowler') {
            await notifier.selectBowler(selectedId);
          }
       }
    });
  }

  void _renamePlayer(BuildContext context, WidgetRef ref, String playerId, String currentName) {
    String newName = currentName;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename Player'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(labelText: 'New Name'),
          controller: TextEditingController(text: currentName)..selection = TextSelection(baseOffset: 0, extentOffset: currentName.length),
          onChanged: (val) => newName = val,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, newName),
            child: const Text('Rename'),
          )
        ],
      ),
    ).then((name) async {
       if (name != null && name.toString().isNotEmpty && name != currentName) {
         await ref.read(matchStateProvider(matchId).notifier).renamePlayer(playerId, name);
       }
    });
  }

  Widget _buildPlayerCard(BuildContext context, WidgetRef ref, String role, String? playerId) {
    String displayName = role;
    if (playerId != null) {
      final player = (state.players as Iterable).where((p) => p.id == playerId).firstOrNull;
      if (player != null) displayName = player.name;
    }
    
    bool isStriker = role == 'Striker';
    bool isBowler = role == 'Bowler';
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: InkWell(
        onTap: (role != 'Bowler' && playerId != null) ? null : () => _showPlayerSelectionSheet(context, ref, role),
        onLongPress: playerId != null ? () => _renamePlayer(context, ref, playerId, displayName) : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: playerId == null ? (isDark ? Colors.grey.shade900 : Colors.grey.shade100) : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (isStriker && playerId != null) ? Colors.blueAccent : (isDark ? Colors.grey.shade800 : Colors.grey.shade200),
              width: (isStriker && playerId != null) ? 2 : 1,
            ),
            boxShadow: [
              if (!isDark) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
            ],
          ),
          child: Stack(
            children: [
              if (isStriker && playerId != null)
                 Positioned(
                   top: 8,
                   right: 8,
                   child: Icon(Icons.check_circle, color: Colors.blueAccent, size: 20),
                 ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isBowler ? Icons.sports_baseball : Icons.sports_cricket, 
                        color: isBowler ? (isDark ? Colors.redAccent : Colors.red.shade700) : (isDark ? Colors.blueAccent : Colors.blue.shade900), 
                        size: 48
                      ),
                      const SizedBox(height: 12),
                      Text(
                        playerId == null ? 'Tap to select' : displayName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: playerId == null ? FontWeight.normal : FontWeight.bold,
                          color: playerId == null ? Colors.grey : (isDark ? Colors.white : Colors.black87),
                          fontSize: 14,
                        ),
                      ),
                      if (playerId != null) ...[
                        const SizedBox(height: 4),
                        Text(role, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8),
          child: Text('Select Player Role', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 _buildPlayerCard(context, ref, 'Striker', state.currentStrikerId),
                 IconButton(
                   icon: const Icon(Icons.swap_horiz, size: 28, color: Colors.blue),
                   onPressed: () => ref.read(matchStateProvider(matchId).notifier).swapStrike(),
                 ),
                 _buildPlayerCard(context, ref, 'Non-Striker', state.currentNonStrikerId),
                 const SizedBox(width: 8),
                 _buildPlayerCard(context, ref, 'Bowler', state.currentBowlerId),
              ]
            ),
          ),
        ),
      ],
    );
  }
}

class _ScoringKeypad extends ConsumerWidget {
  final String matchId;
  final dynamic state;
  const _ScoringKeypad({required this.matchId, required this.state});

  void _scoreRuns(WidgetRef ref, int runs) {
    ref.read(matchStateProvider(matchId).notifier).recordDelivery(runs: runs);
  }

  void _scoreExtra(BuildContext context, WidgetRef ref) {
    ExtraType? selectedExtra;
    int runsSelected = 0;
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Extra + Runs'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<ExtraType>(
                 isExpanded: true,
                 hint: const Text('Select Extra'),
                 value: selectedExtra,
                 items: [ExtraType.wide, ExtraType.noBall, ExtraType.bye, ExtraType.legBye, ExtraType.penaltyRuns]
                     .map((e) {
                        String name = e.name.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), ' ');
                        name = name[0].toUpperCase() + name.substring(1);
                        return DropdownMenuItem(value: e, child: Text(name));
                     }).toList(),
                 onChanged: (val) => setState(() => selectedExtra = val),
              ),
              const SizedBox(height: 16),
              const Text('Runs (with extra):'),
              Wrap(
                 spacing: 8,
                 children: [0, 1, 2, 3, 4, 5, 6].map((r) => ChoiceChip(
                    label: Text('$r'),
                    selected: runsSelected == r,
                    onSelected: (val) => setState(() => runsSelected = r),
                 )).toList()
              )
            ],
          ),
          actions: [
             TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
             ElevatedButton(
                onPressed: selectedExtra == null ? null : () => Navigator.pop(context, {'type': selectedExtra, 'runs': runsSelected}), 
                child: const Text('Confirm')
             )
          ]
        )
      )
    ).then((result) {
       if (result != null) {
          ref.read(matchStateProvider(matchId).notifier).recordDelivery(runs: result['runs'], extras: [result['type']]);
       }
    });
  }

  void _scoreWicket(BuildContext context, WidgetRef ref) {
     final bowlingTeamId = state.currentBowlerId != null 
         ? (state.players as Iterable).firstWhere((p) => p.id == state.currentBowlerId).teamId 
         : '';
     final fieldingTeamPlayers = (state.players as Iterable).where((p) => p.teamId == bowlingTeamId).toList();

     showDialog(
      context: context,
      builder: (context) => _WicketDialog(
        strikerId: state.currentStrikerId!,
        nonStrikerId: state.currentNonStrikerId,
        strikerName: (state.players as Iterable).where((p) => p.id == state.currentStrikerId).firstOrNull?.name ?? 'Striker',
        nonStrikerName: (state.players as Iterable).where((p) => p.id == state.currentNonStrikerId).firstOrNull?.name ?? 'Non-Striker',
        fieldingTeamPlayers: fieldingTeamPlayers,
        isFreeHit: state.isFreeHit,
      )
    ).then((result) {
       if (result != null) {
          final wicket = Wicket(dismissedPlayerId: result['playerId'], type: result['type'], fielderId: result['fielderId']);
          ref.read(matchStateProvider(matchId).notifier).recordDelivery(runs: result['runs'], wicket: wicket);
       }
    });
  }

  void _scoreRetire(BuildContext context, WidgetRef ref) {
     showDialog(
      context: context,
      builder: (context) => _WicketDialog(
        strikerId: state.currentStrikerId!,
        nonStrikerId: state.currentNonStrikerId,
        strikerName: (state.players as Iterable).where((p) => p.id == state.currentStrikerId).firstOrNull?.name ?? 'Striker',
        nonStrikerName: (state.players as Iterable).where((p) => p.id == state.currentNonStrikerId).firstOrNull?.name ?? 'Non-Striker',
        fieldingTeamPlayers: const [],
        isRetireOnly: true,
      )
    ).then((result) {
       if (result != null) {
          final wicket = Wicket(dismissedPlayerId: result['playerId'], type: result['type']);
          ref.read(matchStateProvider(matchId).notifier).recordDelivery(runs: result['runs'] ?? 0, wicket: wicket);
       }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLastManStanding = false;
    if (state.config.lastManStanding) {
      String currentBattingTeam = (state.players as Iterable).firstWhere((p) => p.id == state.currentStrikerId, orElse: () => const PlayerState(id: '', name: '', teamId: '')).teamId;
      if (currentBattingTeam.isNotEmpty) {
        int dismissedCount = (state.players as Iterable).where((p) => p.teamId == currentBattingTeam && (p.status == PlayerMatchStatus.dismissed || p.status == PlayerMatchStatus.retiredOut)).length;
        if (dismissedCount == state.config.playersPerTeam - 1) {
          isLastManStanding = true;
        }
      }
    }

    bool isReady = state.currentStrikerId != null && state.currentBowlerId != null && (state.currentNonStrikerId != null || isLastManStanding);

    return IgnorePointer(
      ignoring: !isReady,
      child: Opacity(
        opacity: isReady ? 1.0 : 0.4,
        child: SingleChildScrollView(
           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('Add Runs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               const SizedBox(height: 12),
               Row(
                 children: [
                   _KeypadBtn(label: '0', onPressed: () => _scoreRuns(ref, 0)),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: '1', onPressed: () => _scoreRuns(ref, 1)),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: '2', onPressed: () => _scoreRuns(ref, 2)),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: '3', onPressed: () => _scoreRuns(ref, 3)),
                 ],
               ),
               const SizedBox(height: 8),
               Row(
                 children: [
                   _KeypadBtn(label: '4', onPressed: () => _scoreRuns(ref, 4), color: Theme.of(context).brightness == Brightness.dark ? Colors.blue.withOpacity(0.2) : Colors.blue.shade50, textColor: Colors.blueAccent),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: '6', onPressed: () => _scoreRuns(ref, 6), color: Colors.blueAccent, textColor: Colors.white, flex: 2),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: '5', onPressed: () => _scoreRuns(ref, 5)), // In place of ...
                 ],
               ),
               const SizedBox(height: 24),
               const Text('Extras', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               const SizedBox(height: 12),
               Row(
                 children: [
                   _KeypadBtn(label: 'Wicket', onPressed: () => _scoreWicket(context, ref), color: Theme.of(context).brightness == Brightness.dark ? Colors.red.withOpacity(0.1) : Colors.red.shade50, textColor: Colors.redAccent, icon: Icons.sports_cricket),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: 'Retire', onPressed: () => _scoreRetire(context, ref), color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.withOpacity(0.2) : Colors.grey.shade100, textColor: Colors.grey, icon: Icons.directions_walk),
                   const SizedBox(width: 8),
                   _KeypadBtn(label: 'Extra', onPressed: () => _scoreExtra(context, ref), color: Theme.of(context).brightness == Brightness.dark ? Colors.orange.withOpacity(0.1) : Colors.orange.shade50, textColor: Colors.orangeAccent, icon: Icons.add_circle_outline),
                   if (state.config.format == MatchFormat.redBall) ...[
                      const SizedBox(width: 8),
                      _KeypadBtn(label: 'Declare', onPressed: () => ref.read(matchStateProvider(matchId).notifier).declareInnings(), color: Theme.of(context).brightness == Brightness.dark ? Colors.purple.withOpacity(0.1) : Colors.purple.shade50, textColor: Colors.purpleAccent, icon: Icons.assignment_turned_in),
                   ]
                 ],
               )
             ]
           )
        )
      ),
    );
  }
}

// Dialog definitions remain unchanged...

class _WicketDialog extends StatefulWidget {
  final String strikerId;
  final String? nonStrikerId;
  final String strikerName;
  final String nonStrikerName;
  final List<dynamic> fieldingTeamPlayers;
  final bool isRetireOnly;
  final bool isFreeHit;
  
  const _WicketDialog({
    super.key,
    required this.strikerId, 
    this.nonStrikerId, 
    required this.strikerName,
    required this.nonStrikerName,
    required this.fieldingTeamPlayers,
    this.isRetireOnly = false,
    this.isFreeHit = false,
  });

  @override
  State<_WicketDialog> createState() => _WicketDialogState();
}

class _WicketDialogState extends State<_WicketDialog> {
  late DismissalType _type;
  late String _dismissedId;
  String? _fielderId;
  int _runsScored = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isRetireOnly) {
       _type = DismissalType.retiredHurt;
    } else if (widget.isFreeHit) {
       _type = DismissalType.runOut;
    } else {
       _type = DismissalType.bowled;
    }
    _dismissedId = widget.strikerId;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isRetireOnly ? 'Retire Batter' : 'Wicket details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isRetireOnly) ...[
              const Text('Dismissal Type:', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<DismissalType>(
                isExpanded: true,
                value: _type,
                items: DismissalType.values.where((t) {
                   if (t == DismissalType.retiredHurt || t == DismissalType.retiredOut) return false;
                   if (widget.isFreeHit) {
                      return t == DismissalType.runOut || t == DismissalType.obstructingField;
                   }
                   return true;
                }).map((t) {
                  // simple name formatting
                  String name = t.name.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), ' ');
                  name = name[0].toUpperCase() + name.substring(1);
                  return DropdownMenuItem(value: t, child: Text(name));
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                     setState(() {
                        _type = val;
                        if (val != DismissalType.runOut && val != DismissalType.obstructingField) {
                           _dismissedId = widget.strikerId;
                        }
                     });
                  }
                }
              ),
              const SizedBox(height: 16),
              if (_type == DismissalType.caught || _type == DismissalType.runOut || _type == DismissalType.stumped) ...[
                const Text('Fielder Involved:', style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Fielder Name (Optional)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) => setState(() => _fielderId = val.trim().isEmpty ? null : val.trim()),
                ),
                const SizedBox(height: 16),
              ],
            ],
            if (widget.isRetireOnly) ...[
              const Text('Retirement Type:', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<DismissalType>(
                isExpanded: true,
                value: _type,
                items: const [
                  DropdownMenuItem(value: DismissalType.retiredHurt, child: Text('Retired Hurt (Can return)')),
                  DropdownMenuItem(value: DismissalType.retiredOut, child: Text('Retired Out (Permanent)')),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => _type = val);
                }
              ),
              const SizedBox(height: 16),
            ],
            if (widget.isRetireOnly || _type == DismissalType.runOut || _type == DismissalType.obstructingField) ...[
               Text(widget.isRetireOnly ? 'Who is retiring?' : 'Who is out?', style: const TextStyle(fontWeight: FontWeight.bold)),
               RadioListTile<String>(
                 title: Text('${widget.strikerName} (Striker)'),
                 value: widget.strikerId,
                 groupValue: _dismissedId,
                 onChanged: (val) => setState(() => _dismissedId = val!),
               ),
               if (widget.nonStrikerId != null)
                 RadioListTile<String>(
                   title: Text('${widget.nonStrikerName} (Non-Striker)'),
                   value: widget.nonStrikerId!,
                   groupValue: _dismissedId,
                   onChanged: (val) => setState(() => _dismissedId = val!),
                 ),
               const SizedBox(height: 16),
            ],
            const Text('Runs scored (if any):', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
               spacing: 8,
               children: [0, 1, 2, 3, 4].map((r) => ChoiceChip(
                  label: Text('$r'),
                  selected: _runsScored == r,
                  onSelected: (val) => setState(() => _runsScored = r),
               )).toList()
            )
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: widget.isRetireOnly ? Colors.blueGrey : Colors.red, foregroundColor: Colors.white),
          onPressed: () => Navigator.pop(context, {'playerId': _dismissedId, 'type': _type, 'runs': _runsScored, 'fielderId': _fielderId}), 
          child: Text(widget.isRetireOnly ? 'Confirm Retire' : 'Confirm Wicket')
        )
      ],
    );
  }
}

class _KeypadBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final int flex;
  
  const _KeypadBtn({
    required this.label, 
    required this.onPressed, 
    this.color,
    this.textColor,
    this.icon,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isDark ? Colors.grey.shade800 : Colors.grey.withOpacity(0.2)),
            boxShadow: [
              if (!isDark) BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))
            ]
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor ?? (isDark ? Colors.white : Colors.black87), size: 24),
                  const SizedBox(height: 4),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: icon != null ? 12 : 24, 
                    fontWeight: FontWeight.bold,
                    color: textColor ?? (isDark ? Colors.white : Colors.black87)
                  )
                ),
              ],
            ),
          )
        )
      )
    );
  }
}
