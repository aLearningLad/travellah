import 'package:geolocator/geolocator.dart';

class GetLocation {
  // 1. will return name of location (string)
  Future<Set<double>> getCurrentCity() async {
    // get location permission from device
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // once permission granted, get position's longitude & latitude
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return {position.longitude, position.latitude};
  }
}
