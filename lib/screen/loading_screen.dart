

import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate/screen/location_screen.dart';




class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // late double latitude;
  // late double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getlocationdata();
  }

  void getlocationdata() async {


     weathercondition condition=weathercondition();
     var weatherData=await condition.getlocationweather();

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
