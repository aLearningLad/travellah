import "dart:convert";
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:travellaaah/models/reading.dart";

class FetchWeather {
  final double longitudeValue; // value recieved as arg
  final double latitudeValue; // value recieved as arg

// constructor to recieve & use coordinate values
  FetchWeather(this.latitudeValue, this.longitudeValue);

// call my api key from env
  final String _apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

// connection string
  String get weatherUrl =>
      'https://api.tomorrow.io/v4/weather/forecast?location=$latitudeValue,$longitudeValue&apikey=$_apiKey';

  Future<WeatherReading> getWeatherData() async {
    try {
      final response = await http.get(Uri.parse(weatherUrl));

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var prettyJson = JsonEncoder.withIndent('  ').convert(decodedResponse);
        print("Weather Data Here: $prettyJson");
        print("Value for humidity: ${response.body}");
        return WeatherReading.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            "Failed to fetch weather data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching weather data: $error");
      rethrow;
    }
  }
}
