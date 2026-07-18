class TreeState {
  final int level;
  final int branchCount;
  final int flowerCount;
  final int fruitCount;
  final DateTime? lastGrowth;

  const TreeState({
    required this.level,
    required this.branchCount,
    required this.flowerCount,
    required this.fruitCount,
    this.lastGrowth,
  });

  factory TreeState.initial() {
    return const TreeState(
      level: 1,
      branchCount: 0,
      flowerCount: 0,
      fruitCount: 0,
    );
  }
}