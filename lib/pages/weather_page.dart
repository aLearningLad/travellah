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
    // fetch weather data
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
      appBar: AppBar(
        // title: Text("Weather app"),
        automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.dashboard_customize_rounded));
          }),
          FilledButton(
            onPressed: () {
              print("Settings button clicked");
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.transparent),
            child: Icon(Icons.menu, color: Colors.black),
          )
        ],
      ),
      body: ListView(
        children: [
// location name

// current temp value, heading ('sunny', 'overcast' ect), date, max & min ===> all like in phone weather app

// 15 day forecast with readings, images etc. ===> check if API allows this for free
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                child: Text(
              "Hi there!",
              style: TextStyle(color: Colors.black),
            )),
            ListTile(
              title: Text(
                "Tap me!",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
