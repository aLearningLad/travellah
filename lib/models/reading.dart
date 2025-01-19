class WeatherReading {
  final double temperature;

  WeatherReading({required this.temperature});

// method to recieve the data & extract only data I need
  factory WeatherReading.fromJson(Map<String, dynamic> jsonData) {
    return WeatherReading(
        // cityName: cityName,
        temperature: jsonData['timelines']['minutely'][0]['values']
            ['temperature']);
  }
}
