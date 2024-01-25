import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'city_screen.dart';

class locationscreen extends StatefulWidget {
  const locationscreen({super.key, this.locationWeather});
  final locationWeather;

  @override
  State<locationscreen> createState() => _locationscreenState();
}

class _locationscreenState extends State<locationscreen> {
  @override
  double? temp;
  int? temperature;
  double? tempMax;
  double? tempMin;
  String? cityName;
  String? description;
  int? id;
  int? sunrise;
  int? sunset;

  int? dt;
  DateTime? dateTime;
  DateTime? sunrisetime;
  DateTime? sunsettime;
  weathercondition picture = weathercondition();

  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherdata) {

  setState(() {
    if(weatherdata==null){
      temperature=0;
      cityName="";
      tempMin=0;
      tempMax=0;
      description="Unable to get Data";
      return ;

    }
    temp = weatherdata['main']['temp'];
    temperature = temp!.toInt();
    cityName = weatherdata['name'];
    tempMin = weatherdata['main']['temp_min'];
    tempMax = weatherdata['main']['temp_max'];
    description = weatherdata['weather'][0]['main'];
    dt = weatherdata['dt'];
    // dateTime=DateTime.parse(dt.toString()).toLocal();
    dateTime = DateTime.now();

    // dateTime=DateTime.fromMillisecondsSinceEpoch(dt! * 1000);
    sunrise = weatherdata['sys']['sunrise'];
    sunrisetime = DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000);
    sunset = weatherdata['sys']['sunset'];
    sunsettime = DateTime.fromMillisecondsSinceEpoch(sunset! * 1000);
    id = weatherdata['weather'][0]['id'];
  });
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$cityName",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: ()  async{
                         var typename= await Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CityScreen();
                          }));
                          if(typename!=null){
                            var weatherdata=await weathercondition().getcityweather(typename);
                            updateUI(weatherdata);

                          }
                        },
                        child: Container(
                            child: Column(
                          children: [
                            Icon(Icons.location_city),
                            Text("Change Location"),
                          ],
                        )),
                      )
                    ],
                  ),
                ),

                picture.setpicture(id!),

                // Image(
                //   image: AssetImage("asserts/3.png"),
                // ),

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
                    DateFormat('EEEE').add_jmz().format(dateTime!),

                    // "Friday ",
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
                              DateFormat().add_jmz().format(sunrisetime!),
                              // "5:34am",
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
                              DateFormat().add_jmz().format(sunsettime!),
                              // "5:34am",
                              style: TextStyle(fontWeight: FontWeight.w200),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 5, bottom: 5),
                  child: Divider(
                    color: Colors.blue,
                  ),
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
                              "$tempMax " + "\u2103",
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
                              "$tempMin " + "\u2103",
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
      ),
    );
  }
}
