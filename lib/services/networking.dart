import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class networkhelper{
  networkhelper(this.url);
  final String url;
  Future getdata() async{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode==200){

      String data=response.body;
       return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }



  }
}