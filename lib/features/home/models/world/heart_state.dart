class HeartState {
  final int level;
  final double energy;
  final double glow;
  final DateTime? lastInteraction;

  const HeartState({
    required this.level,
    required this.energy,
    required this.glow,
    this.lastInteraction,
  });

  factory HeartState.initial() {
    return const HeartState(
      level: 1,
      energy: 100,
      glow: 1.0,
    );
  }
}