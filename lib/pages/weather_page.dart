import 'package:flutter/material.dart';
import 'package:travellaaah/services/fetch_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temp_value = 0;

  @override
  Widget build(BuildContext context) {
    void fetchWeather() async {
      final weatherService = FetchWeather();
      final weatherData = await weatherService.getWeatherData();
      // print(weatherData);

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
