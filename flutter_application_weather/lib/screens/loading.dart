import 'package:flutter/material.dart';
import 'package:flutter_application_weather/data/myLocation.dart';
import 'package:flutter_application_weather/data/network.dart';
import 'package:get/get.dart';

const apikey = '6633f123cbb79556ca021f2797a63e18';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    double myLati = myLocation.myLatitude;
    double myLong = myLocation.myLongitude;
    Network network = Network(
        'http://api.openweathermap.org/data/2.5/weather?lat=$myLati&lon=$myLong&appid=$apikey&units=metric');
    var weather = await network.getJsonData();
    Get.toNamed('/weather', arguments: weather);

    //  String cityName = weather['name'];
    //  double temperature = weather['main']['temp'];

    // Get.toNamed('/weather?cityName=$cityName&temperature=$temperature');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get My lacation'),
          onPressed: null,
        ),
      ),
    );
  }
}
