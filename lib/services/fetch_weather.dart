import "package:http/http.dart" as http;

class FetchWeather {
  static const weatherUrl =
      'https://api.tomorrow.io/v4/weather/forecast?location=42.3478,-71.0466&apikey=EWQETg6N6oL8gqRa6ObYPgOMZoqCy32I';

  Future<dynamic> getWeatherData() async {
    try {
      final response = await http.get(Uri.parse(weatherUrl));

      print(response);
    } catch (error) {
      print("Error while fetching weather data: $error");
    }
  }
}
