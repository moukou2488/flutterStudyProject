import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double myLatitude;
  late double myLongitude;
  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } on Exception catch (e) {
      print('your internet dead!! hurry');
    }
  }
}
