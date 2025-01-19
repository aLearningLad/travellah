import 'package:flutter/material.dart';
import 'package:travellaaah/services/fetch_weather.dart';
import 'package:travellaaah/services/get_location.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temp_value = 0;
  double latitude = 0;
  double longitude = 0;

  @override
  Widget build(BuildContext context) {
    void fetchWeather() async {
      final location = await GetLocation().getCurrentCity();
      try {
        double latitudeValue = location['latitude']!;
        double longitudeValue = location['longitude']!;

        if (longitudeValue != 0 && latitudeValue != 0) {
          setState(() {
            latitude = latitudeValue;
            longitude = longitudeValue;
          });
          print(
              "latitude reads $latitudeValue, and longitude reads $longitudeValue");
        }

        if (latitudeValue < 0 || longitudeValue < 0) {
          throw Exception("coordinates not loaded");
        }
      } catch (e) {
        print(e);
      }

      final weatherService = FetchWeather(latitude, longitude);
      final weatherData = await weatherService.getWeatherData();
      print(weatherData);

      setState(() {
        temp_value = weatherData.temperature ?? 9.0;
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// test button
            ElevatedButton(
                onPressed: fetchWeather, child: Text("Click to fetch!")),

// dummy display to delete later
            Text("$temp_value deg celcius!")

// city name

// temp reading

// humidity, chance of rain
          ],
        ),
      ),
    );
  }
}
