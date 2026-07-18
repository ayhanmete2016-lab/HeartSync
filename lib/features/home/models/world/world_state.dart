import 'heart_state.dart';
import 'tree_state.dart';
import 'weather_state.dart';

class WorldState {
  final TreeState tree;
  final HeartState heart;
  final WeatherState weather;

  const WorldState({
    required this.tree,
    required this.heart,
    required this.weather,
  });

  factory WorldState.initial() {
    return WorldState(
      tree: TreeState.initial(),
      heart: HeartState.initial(),
      weather: WeatherState.initial(),
    );
  }
}