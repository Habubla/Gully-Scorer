// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchStateNotifier)
final matchStateProvider = MatchStateNotifierFamily._();

final class MatchStateNotifierProvider
    extends $NotifierProvider<MatchStateNotifier, MatchState?> {
  MatchStateNotifierProvider._({
    required MatchStateNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'matchStateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$matchStateNotifierHash();

  @override
  String toString() {
    return r'matchStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MatchStateNotifier create() => MatchStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MatchState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MatchState?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MatchStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$matchStateNotifierHash() =>
    r'bb0f9ff9c357f82c60b190f9ccba835171f6230f';

final class MatchStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MatchStateNotifier,
          MatchState?,
          MatchState?,
          MatchState?,
          String
        > {
  MatchStateNotifierFamily._()
    : super(
        retry: null,
        name: r'matchStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MatchStateNotifierProvider call(String matchId) =>
      MatchStateNotifierProvider._(argument: matchId, from: this);

  @override
  String toString() => r'matchStateProvider';
}

abstract class _$MatchStateNotifier extends $Notifier<MatchState?> {
  late final _$args = ref.$arg as String;
  String get matchId => _$args;

  MatchState? build(String matchId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MatchState?, MatchState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MatchState?, MatchState?>,
              MatchState?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
