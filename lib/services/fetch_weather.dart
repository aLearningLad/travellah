import "dart:convert";
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FetchWeather {
// call my api key from env
  final String _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

  String get weatherUrl =>
      'https://api.tomorrow.io/v4/weather/forecast?location=42.3478,-71.0466&apikey=$_apiKey';

  Future<dynamic> getWeatherData() async {
    try {
      final response = await http.get(Uri.parse(weatherUrl));

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var prettyJson = JsonEncoder.withIndent('  ').convert(decodedResponse);
        print("Weather Data Here: $prettyJson");
        print("Value for humidity: ${response.body}");
        return response.body;
      } else {
        throw Exception(
            "Failed to fetch weather data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching weather data: $error");
    }
  }
}
