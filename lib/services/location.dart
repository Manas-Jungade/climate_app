import 'package:geolocator/geolocator.dart';
class Location{
  late double latitude;
  late double longitude;
  Future<void> getcurrlocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }


}