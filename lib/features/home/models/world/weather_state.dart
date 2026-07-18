enum WeatherType {
  sunny,
  cloudy,
  rainy,
  snowy,
}

enum SeasonType {
  spring,
  summer,
  autumn,
  winter,
}

class WeatherState {
  final WeatherType weather;
  final SeasonType season;
  final bool isNight;
  final bool fireflies;
  final bool butterflies;

  const WeatherState({
    required this.weather,
    required this.season,
    required this.isNight,
    required this.fireflies,
    required this.butterflies,
  });

  factory WeatherState.initial() {
    return const WeatherState(
      weather: WeatherType.sunny,
      season: SeasonType.spring,
      isNight: true,
      fireflies: true,
      butterflies: true,
    );
  }
}