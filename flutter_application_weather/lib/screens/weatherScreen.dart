import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  dynamic weather = Get.arguments;
  @override
  Widget build(BuildContext context) {
    String cityName = weather['name'];
    int temperature = weather['main']['temp'].round();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$cityName',
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(height: 20.0),
              Text(
                '$temperature',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
