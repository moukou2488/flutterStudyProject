import 'package:flutter/material.dart';
import 'package:flutter_application_weather/screens/Loading.dart';
import 'package:flutter_application_weather/screens/weatherScreen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      theme: ThemeData(primaryColor: Colors.amber[100]),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Loading()),
        GetPage(name: '/weather', page: () => WeatherScreen()),
      ],
    );
  }
}
