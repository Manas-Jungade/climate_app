import 'package:flutter/material.dart';

class locationscreen extends StatefulWidget {
  const locationscreen({super.key,this.locationWeather});
  final locationWeather;

  @override
  State<locationscreen> createState() => _locationscreenState();
}

class _locationscreenState extends State<locationscreen> {
  @override
  double? temperature;
  double? tempMax;
  double? tempMin;
  String? cityName;
  String? description;
  String? sunrisetime;
  String? sunsettime;
  String? day;
  String? time;



  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherdata){
        temperature=weatherdata['main']['temp'];
        cityName=weatherdata['name'];
        tempMin=weatherdata['main']['temp_min'];
        tempMax=weatherdata['main']['temp_max'];
        description=weatherdata['weather'][0]['main'];
        time=weatherdata['timezone'];


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Weather App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue,
        elevation: 10,
        toolbarHeight: 50,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                    "$cityName",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
              ),


              Image(
                image: AssetImage("asserts/3.png"),
              ),

              Center(
                child: Text(
                  "$temperature" + "\u2103",
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
                ),
              ),
              // Here \u2103 is degree notation
              Center(
                child: Text(
                  "$description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  "Friday 24 - 09:41am",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "asserts/11.png",
                        scale: 8,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sunrise",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "5:34am",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "asserts/12.png",
                        scale: 8,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sunset",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "5:34am",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
                child: Divider(color: Colors.blue,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "asserts/13.png",
                        scale: 8,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TempMax",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "$tempMax "+"\u2103",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "asserts/14.png",
                        scale: 8,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TempMin",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "$tempMin "+"\u2103",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
