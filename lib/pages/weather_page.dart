import 'package:flutter/material.dart';
import 'package:travellaaah/services/fetch_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    void fetchWeatherExample() async {
      final weatherService = FetchWeather();
      final weatherData = await weatherService.getWeatherData();
      print(weatherData);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// test button
            ElevatedButton(
                onPressed: fetchWeatherExample, child: Text("Click to fetch")),

// city name

// temp reading

// humidity, chance of rain
          ],
        ),
      ),
    );
  }
}
