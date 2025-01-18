import 'package:flutter/material.dart';
import 'package:travellaaah/pages/weather_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  try {
// this makes sure flutter binding is initialized before async operations
    WidgetsFlutterBinding.ensureInitialized();

    // asycn load envs I need
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error while loading .env $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}
