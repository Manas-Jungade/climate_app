import 'package:climate/screen/loading_screen.dart';
import 'package:climate/screen/location_screen.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData.dark(),
      home: LoadingScreen(),
      // home: locationscreen(),
    );
  }
}
