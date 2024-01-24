
import 'package:climate/screen/location_screen.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const  apikey='582cb6e1d291181447c180f26d6acba1';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getlocationdata();
  }

  void getlocationdata() async {
    Location location=Location();
    await location.getcurrlocation();
    latitude=location.latitude;
    longitude=location.longitude;
    networkhelper network_helper=networkhelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$apikey&units=metric');
    var weatherData=await network_helper.getdata();
    String cityname=weatherData['name'];
    int condition=weatherData['weather'][0]['id'];
    double temperature=weatherData['main']['temp'];
    print(cityname);
    print(temperature);
    print(condition);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return locationscreen(
        locationWeather: weatherData,
      );
    }));
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:  SpinKitWave(color: Colors.white,size: 100,),
      ),
    );
  }
}
