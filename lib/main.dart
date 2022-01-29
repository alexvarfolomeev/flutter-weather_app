import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/components/search_weather_screen.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/util/images_detector.dart';
import 'package:weather_app/util/weather_http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<CurrentWeather> futureWeather;
  WeatherHttp weatherHttp = WeatherHttp();
  String cityName = '';

  @override
  void initState() {
    super.initState();
    cityName = 'Москва';
    futureWeather = WeatherHttp.getCurrentJSONWeather(cityName);
  }

  void _returnDataFromSearchScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SearchWeather());
    final result = await Navigator.push(context, route);

    setState(() {
      cityName = result;
      cityName.isEmpty ? futureWeather = WeatherHttp.getCurrentJSONWeather("Москва") :
      futureWeather = WeatherHttp.getCurrentJSONWeather(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: SafeArea(
          child: Center(
            child: FutureBuilder<CurrentWeather>(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.0),
                            margin: EdgeInsets.all(20.0),
                            child: Text(
                              snapshot.data!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 50.0),
                            ),
                          ),
                          Text(
                            (snapshot.data!.mainJson.temp).toString(),
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.weather
                                .map((e) => e.description)
                                .first,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                          // if (snapshot.data!.weather.map((e) => e.icon).first ==
                          //     ImagesDetector.findImageByIconName(snapshot.data!.weather
                          //         .map((e) => e.icon)
                          //         .first))
                            Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Image(
                                image: AssetImage('assets/' + ImagesDetector.findImageByIconName(
                                  snapshot.data!.weather.map((e) => e.icon).first)),
                                height: 200,
                                width: 200,
                              ),
                            ),
                          SizedBox(
                            height: 100.0,
                            width: 100.0,
                          ),
                          RaisedButton(
                            onPressed: () {
                              _returnDataFromSearchScreen(context);
                            },
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Search weather"),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ),
      ),
    );
  }
}
