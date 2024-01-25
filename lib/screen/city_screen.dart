import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:  SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: MediaQuery.of(context).size.height/5,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 30),
                  child: Text(
                    "Get Weather",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: TextField(
                    onChanged: (value){
                      cityname=value;
                    },
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        hintText: "Enter city name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context,cityname);
                }, child: Text("Enter",style: TextStyle(color: Colors.black,fontSize: 20),),style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)) ,)
              ],
            ),
          ),
        ),
      );

  }
}
