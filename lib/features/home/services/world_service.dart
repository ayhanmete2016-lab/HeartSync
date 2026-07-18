import '../models/world/world_state.dart';

class WorldService {
  Future<WorldState> loadWorld() async {
    return WorldState.initial();
  }
}