import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude;
  double Longitude;

  Future getCurrentLocation() async {
    //async modifier
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always) {
      //print('Running');
      Position position = await Geolocator.getCurrentPosition(
          //Await returns the result of the future
          desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      getCurrentLocation();
    }
  }
}
