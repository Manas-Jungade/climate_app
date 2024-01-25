

import 'package:flutter/material.dart';

import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
const  apikey='582cb6e1d291181447c180f26d6acba1';
class weathercondition{

  late double latitude;
  late double longitude;
  Future<dynamic> getlocationweather() async{
    Location location=Location();
    await location.getcurrlocation();
    latitude=location.latitude;
    longitude=location.longitude;
    networkhelper network_helper=networkhelper('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&APPID=$apikey&units=metric');
    var weatherData=await network_helper.getdata();
    return weatherData;
  }
    Future<dynamic> getcityweather(String cityname) async{
        var url='http://api.openweathermap.org/data/2.5/weather?q=$cityname&APPID=$apikey&units=metric';
        networkhelper network_helper=networkhelper(url);
        var weatherdata=await network_helper.getdata();
        return weatherdata;
    }

   Widget setpicture(int code){
        if(code>=200 && code<300){
          return Image.asset("asserts/1.png");
        }
        else if(code>=300 && code<400){
          return Image.asset("asserts/2.png");
        }
        else if(code>=500 && code<600){
          return Image.asset("asserts/3.png");
        }
        else if(code>=600 && code<700){
          return Image.asset("asserts/4.png");
        }
        else if(code>=700 && code<800){
          return Image.asset("asserts/5.png");
        }
        else if(code==800){
          return Image.asset("asserts/6.png");
        }
          return Image.asset("asserts/7.png");
   }
}