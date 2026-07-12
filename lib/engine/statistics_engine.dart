import '../domain/events/match_event.dart';
import '../domain/models/match_state.dart';
import '../domain/models/player_state.dart';
import '../domain/models/match_configuration.dart';

class StatisticsEngine {
  /// Safe player lookup helper. Returns null if player not found instead of crashing.
  static PlayerState? _findPlayer(List<PlayerState> players, String? id) {
    if (id == null) return null;
    try {
      return players.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static MatchState reduce(MatchState initialState, List<MatchEvent> events) {
    MatchState state = initialState;
    for (var event in events) {
      state = _applyEvent(state, event);
    }
    return state;
  }

  static MatchState _applyEvent(MatchState state, MatchEvent event) {
    return switch (event) {
      MatchStartedEvent e => _applyMatchStarted(state, e),
      DeliveryRecordedEvent e => _applyDeliveryRecorded(state, e),
      InningsStartedEvent e => _applyInningsStarted(state, e),
      OverCompletedEvent e => _applyOverCompleted(state, e),
      SessionEndedEvent e => _applySessionEnded(state, e),
      PlayerAddedEvent e => _applyPlayerAdded(state, e),
      BatterSelectedEvent e => _applyBatterSelected(state, e),
      BowlerSelectedEvent e => _applyBowlerSelected(state, e),
      PlayerRenamedEvent e => _applyPlayerRenamed(state, e),
      InningsCompletedEvent e => _applyInningsCompleted(state, e),
      InningsDeclaredEvent e => _applyInningsDeclared(state, e),
      MatchCompletedEvent e => _applyMatchCompleted(state, e),
      SuperOverStartedEvent e => _applySuperOverStarted(state, e),
    };
  }

  static MatchState _applyMatchStarted(MatchState state, MatchStartedEvent e) {
    String battingTeamId = 'team_1';
    if (e.tossWinner == e.config.team1Name) {
       battingTeamId = e.tossDecision == 'Bat' ? 'team_1' : 'team_2';
    } else if (e.tossWinner == e.config.team2Name) {
       battingTeamId = e.tossDecision == 'Bat' ? 'team_2' : 'team_1';
    }

    return state.copyWith(
      matchId: e.matchId,
      config: e.config,
      matchStatus: MatchStatus.running,
      firstInningsBattingTeamId: battingTeamId,
      currentBattingTeamId: battingTeamId,
    );
  }

  static MatchState _applyInningsStarted(MatchState state, InningsStartedEvent e) {
    return state.copyWith(
      inningsStatus: InningsStatus.running,
      currentBattingTeamId: e.battingTeamId,
    );
  }

  static MatchState _applyPlayerAdded(MatchState state, PlayerAddedEvent e) {
    return state.copyWith(
      players: [
        ...state.players,
        PlayerState(id: e.playerId, name: e.name, teamId: e.teamId)
      ]
    );
  }

  static MatchState _applyBatterSelected(MatchState state, BatterSelectedEvent e) {
    return state.copyWith(
      currentStrikerId: e.strikerId,
      currentNonStrikerId: e.nonStrikerId,
      players: state.players.map((p) {
        if (p.id == e.strikerId || p.id == e.nonStrikerId) {
          return p.copyWith(
            hasBatted: true,
            status: p.status == PlayerMatchStatus.retiredHurt ? PlayerMatchStatus.batting : p.status,
            dismissalDetails: p.status == PlayerMatchStatus.retiredHurt ? '' : p.dismissalDetails,
          );
        }
        return p;
      }).toList(),
    );
  }

  static MatchState _applyBowlerSelected(MatchState state, BowlerSelectedEvent e) {
    return state.copyWith(
      currentBowlerId: e.bowlerId,
    );
  }

  static MatchState _applyPlayerRenamed(MatchState state, PlayerRenamedEvent e) {
    return state.copyWith(
      players: state.players.map((p) {
        if (p.id == e.playerId) {
          return p.copyWith(name: e.newName);
        }
        return p;
      }).toList(),
    );
  }

  static MatchState _applyDeliveryRecorded(MatchState state, DeliveryRecordedEvent e) {
    int runDelta = e.runsOffBat;
    int legalDeliveryDelta = 1;

    for (var extra in e.extras) {
      if (extra == ExtraType.wide || extra == ExtraType.noBall) {
        legalDeliveryDelta = 0;
        runDelta += 1;
      }
      if (extra == ExtraType.penaltyRuns) {
        runDelta += 5;
      }
    }

    int wicketsDelta = (e.wicket != null && e.wicket!.type != DismissalType.retiredHurt) ? 1 : 0;
    
    // Update player stats
    List<PlayerState> updatedPlayers = state.players.map((p) {
      if (p.id == e.strikerId) {
        String details = '';
        if (e.wicket != null && e.wicket!.dismissedPlayerId == p.id) {
          final type = e.wicket!.type.name;
          final bowlerName = _findPlayer(state.players, e.bowlerId)?.name ?? 'Unknown';
          final fielderName = e.wicket!.fielderId != null 
              ? (_findPlayer(state.players, e.wicket!.fielderId)?.name ?? e.wicket!.fielderId!) 
              : '';
          
          if (e.wicket!.type == DismissalType.bowled) {
             details = 'b $bowlerName';
          } else if (e.wicket!.type == DismissalType.caught) {
             details = 'c $fielderName b $bowlerName';
          } else if (e.wicket!.type == DismissalType.runOut) {
             details = 'run out ($fielderName)';
          } else if (e.wicket!.type == DismissalType.stumped) {
             details = 'st $fielderName b $bowlerName';
          } else if (e.wicket!.type == DismissalType.lbw) {
             details = 'lbw b $bowlerName';
          } else if (e.wicket!.type == DismissalType.hitWicket) {
             details = 'hit wicket b $bowlerName';
          } else if (e.wicket!.type == DismissalType.fieldRestriction) {
             details = 'field restriction b $bowlerName';
          } else {
             details = type;
          }
        }

        return p.copyWith(
          runsScored: p.runsScored + e.runsOffBat,
          ballsFaced: (legalDeliveryDelta == 1 || e.extras.contains(ExtraType.noBall)) ? p.ballsFaced + 1 : p.ballsFaced,
          fours: e.runsOffBat == 4 ? p.fours + 1 : p.fours,
          sixes: e.runsOffBat == 6 ? p.sixes + 1 : p.sixes,
          status: (e.wicket != null && e.wicket!.dismissedPlayerId == p.id) ? PlayerMatchStatus.dismissed : p.status,
          dismissalDetails: details.isNotEmpty ? details : p.dismissalDetails,
        );
      } else if (p.id == e.nonStrikerId) {
        String details = '';
        if (e.wicket != null && e.wicket!.dismissedPlayerId == p.id) {
           final type = e.wicket!.type.name;
           final bowlerName = _findPlayer(state.players, e.bowlerId)?.name ?? 'Unknown';
           final fielderName = e.wicket!.fielderId != null 
               ? (_findPlayer(state.players, e.wicket!.fielderId)?.name ?? e.wicket!.fielderId!) 
               : '';
          if (e.wicket!.type == DismissalType.runOut) {
             details = 'run out ($fielderName)';
          } else {
             details = type;
          }
        }
        return p.copyWith(
           status: (e.wicket != null && e.wicket!.dismissedPlayerId == p.id) ? PlayerMatchStatus.dismissed : p.status,
           dismissalDetails: details.isNotEmpty ? details : p.dismissalDetails,
        );
      } else if (p.id == e.bowlerId) {
         // Bowler is only charged for runs off the bat, wides, and no-balls.
         // Byes, leg-byes, and penalty runs do NOT count against the bowler.
         int bowlerRuns = e.runsOffBat;
         if (e.extras.contains(ExtraType.wide) || e.extras.contains(ExtraType.noBall)) {
           bowlerRuns += 1; 
         }
         
         bool isBowlerWicket = false;
         if (e.wicket != null) {
           var wt = e.wicket!.type;
           if (wt != DismissalType.runOut && wt != DismissalType.retiredHurt && wt != DismissalType.retiredOut) {
             isBowlerWicket = true; 
           }
         }

         return p.copyWith(
           ballsBowled: p.ballsBowled + legalDeliveryDelta,
           runsConceded: p.runsConceded + bowlerRuns,
           wicketsTaken: p.wicketsTaken + (isBowlerWicket ? 1 : 0),
         );
      }
      return p;
    }).toList();

    // Strike rotation logic
    String? nextStriker = e.strikerId;
    String? nextNonStriker = e.nonStrikerId;
    
    if (e.runsOffBat % 2 != 0) {
      if (nextNonStriker != null) {
        nextStriker = e.nonStrikerId;
        nextNonStriker = e.strikerId;
      }
    }

    // Over-end strike rotation
    bool overEnded = (state.legalDeliveries + legalDeliveryDelta) % 6 == 0 && legalDeliveryDelta > 0;
    if (overEnded) {
       if (nextNonStriker != null) {
           String? temp = nextStriker;
           nextStriker = nextNonStriker;
           nextNonStriker = temp;
       }
    }

    // Handle wicket and Last Man Standing
    if (e.wicket != null) {
       if (e.wicket!.dismissedPlayerId == nextStriker) {
          nextStriker = null;
       } else if (e.wicket!.dismissedPlayerId == nextNonStriker) {
          nextNonStriker = null;
       }
       
       if (state.config.lastManStanding) {
          String currentBattingTeam = (_findPlayer(updatedPlayers, e.strikerId)?.teamId) ?? 'team_1';
          int dismissedCount = updatedPlayers.where((p) => p.teamId == currentBattingTeam && (p.status == PlayerMatchStatus.dismissed || p.status == PlayerMatchStatus.retiredOut)).length;
         
         if (dismissedCount == state.config.playersPerTeam - 1) {
            // Only 1 player left. They play freely without a non-striker.
            if (nextStriker == null) {
               nextStriker = nextNonStriker;
            }
            nextNonStriker = null;
         } else if (dismissedCount >= state.config.playersPerTeam) {
            // All out
            nextStriker = null;
            nextNonStriker = null;
         }
       }
    }

    int newTeam1Score = state.team1Score;
    int newTeam2Score = state.team2Score;
    String currentBattingTeam = _findPlayer(updatedPlayers, e.strikerId)?.teamId ?? 'team_1';
    if (currentBattingTeam == 'team_1') {
       newTeam1Score += runDelta;
    } else {
       newTeam2Score += runDelta;
    }
    
    bool nextIsFreeHit = state.isFreeHit;
    if (e.extras.contains(ExtraType.noBall)) {
       nextIsFreeHit = true;
    } else if (legalDeliveryDelta > 0) {
       nextIsFreeHit = false;
    }

    // Calculate bowler runs for tracking maidens (same logic as bowler stats above)
    int bowlerRunsForOver = e.runsOffBat;
    if (e.extras.contains(ExtraType.wide) || e.extras.contains(ExtraType.noBall)) {
      bowlerRunsForOver += 1;
    }

    return state.copyWith(
      totalRuns: state.totalRuns + runDelta,
      totalWickets: state.totalWickets + wicketsDelta,
      legalDeliveries: state.legalDeliveries + legalDeliveryDelta,
      team1Score: newTeam1Score,
      team2Score: newTeam2Score,
      players: updatedPlayers,
      currentStrikerId: nextStriker,
      currentNonStrikerId: nextNonStriker,
      isFreeHit: nextIsFreeHit,
      runsInCurrentOver: state.runsInCurrentOver + bowlerRunsForOver,
    );
  }

  static MatchState _applyOverCompleted(MatchState state, OverCompletedEvent e) {
    // Track maiden overs: if the bowler conceded 0 runs in this over, it's a maiden
    List<PlayerState> updatedPlayers = state.players;
    if (state.currentBowlerId != null && state.runsInCurrentOver == 0) {
      updatedPlayers = state.players.map((p) {
        if (p.id == state.currentBowlerId) {
          return p.copyWith(maidens: p.maidens + 1);
        }
        return p;
      }).toList();
    }
    
    return state.copyWith(
      currentBowlerId: null, // Force bowler selection for next over
      players: updatedPlayers,
      runsInCurrentOver: 0, // Reset for next over
    );
  }

  /// SessionEndedEvent is an intentional no-op marker event.
  /// It is recorded in the event stream to mark the end of a playing session
  /// (e.g., end of a day's play in a multi-day match). The event itself does not
  /// alter the match state — it serves purely as an audit trail marker for
  /// session boundaries, which can be used for analytics and session replay.
  static MatchState _applySessionEnded(MatchState state, SessionEndedEvent e) {
    return state;
  }

  static MatchState _applyInningsCompleted(MatchState state, InningsCompletedEvent e) {
    return _finishInnings(state);
  }

  static MatchState _applyInningsDeclared(MatchState state, InningsDeclaredEvent e) {
    return _finishInnings(state).copyWith(inningsStatus: InningsStatus.declared);
  }

  static MatchState _finishInnings(MatchState state) {
    int? target;
    if (state.config.format == MatchFormat.whiteBall && state.inningsCount == 1) {
      target = state.totalRuns + 1;
    } else if (state.config.format == MatchFormat.redBall && state.inningsCount == 3) {
      // In red ball, target is lead + 1 after 3 innings. 
      // It's calculated based on team1Score and team2Score.
      String battingTeam = state.firstInningsBattingTeamId; // Team that batted 1st and 3rd
      int team1Total = state.team1Score;
      int team2Total = state.team2Score;
      
      // If team 1 batted 1st and 3rd, their total is team1Total, team 2 total is team2Total (just 1 innings).
      // Target for team 2 is (team1Total - team2Total) + 1.
      // We can just look at the difference.
      if (battingTeam == 'team_1') {
         target = team1Total - team2Total + 1;
      } else {
         target = team2Total - team1Total + 1;
      }
      if (target <= 0) target = 1; // E.g. innings defeat avoided
    }

    return state.copyWith(
      inningsStatus: InningsStatus.completed,
      inningsCount: state.inningsCount + 1,
      targetScore: target,
      currentStrikerId: null,
      currentNonStrikerId: null,
      currentBowlerId: null,
      totalRuns: 0,
      totalWickets: 0,
      legalDeliveries: 0,
    );
  }

  static MatchState _applyMatchCompleted(MatchState state, MatchCompletedEvent e) {
    return state.copyWith(
      matchStatus: MatchStatus.completed,
      matchResult: e.result,
    );
  }

  static MatchState _applySuperOverStarted(MatchState state, SuperOverStartedEvent e) {
    // Basic super over setup: reset runs for the super over
    return state.copyWith(
      totalRuns: 0,
      totalWickets: 0,
      legalDeliveries: 0,
      inningsStatus: InningsStatus.running,
      matchStatus: MatchStatus.running,
      targetScore: null,
      currentStrikerId: null,
      currentNonStrikerId: null,
      currentBowlerId: null,
    );
  }
}
