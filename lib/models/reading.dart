class WeatherReading {
  final String cityName;
  final String temperature;
  final String humidity;
  final String chanceRain;
  final String cloudCover;

  WeatherReading({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.chanceRain,
    required this.cloudCover,
  });

// method to recieve the data & extract only data I need
  // factory WeatherReading.fromJson(Map<String, dynamic> jsonData) {
  //   return WeatherReading(
  //     cityName: cityName,
  //     temperature: temperature,
  //     humidity: ['values'],
  //     chanceRain: chanceRain,
  //     cloudCover:
  //   );
  // }
}
