import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:weather_app/components/future_forecast_cards.dart';
import 'package:weather_app/components/search_weather_screen.dart';
import 'package:weather_app/components/tempurature_component.dart';
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
      cityName.isEmpty
          ? futureWeather = WeatherHttp.getCurrentJSONWeather("Москва")
          : futureWeather = WeatherHttp.getCurrentJSONWeather(cityName);
    });
  }

  final color_1 = Color(0x30A2C5);
  final color_2 = Color(0xFFFFFF);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.white]),
          ),
          child: Center(
            child: FutureBuilder<CurrentWeather>(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.9, 0.5),
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 40,
                              ),
                              onPressed: () {
                                _returnDataFromSearchScreen(context);
                              },
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            child: Text(
                              snapshot.data!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            (snapshot.data!.weather[0].description),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 100.0),
                            child: TempuratureWidget(
                                'assets/' +
                                    ImagesDetector.findImageByIconName(snapshot
                                        .data!.weather
                                        .map((e) => e.icon)
                                        .first),
                                (snapshot.data!.mainJson.temp).toStringAsFixed(0) + '℃'),
                          ),
                          Stack(children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  FutureForecastCards.getForecastCard('Sunday',
                                      'assets/' +
                                          ImagesDetector.findImageByIconName(snapshot
                                              .data!.weather
                                              .map((e) => e.icon)
                                              .first), (snapshot.data!.mainJson.temp).toString()),
                                  FutureForecastCards.getForecastCard('Sunday',
                                      'assets/' +
                                          ImagesDetector.findImageByIconName(snapshot
                                              .data!.weather
                                              .map((e) => e.icon)
                                              .first), (snapshot.data!.mainJson.temp).toString()),
                                  FutureForecastCards.getForecastCard('Sunday',
                                      'assets/' +
                                          ImagesDetector.findImageByIconName(snapshot
                                              .data!.weather
                                              .map((e) => e.icon)
                                              .first), (snapshot.data!.mainJson.temp).toString()),
                                  FutureForecastCards.getForecastCard('Sunday',
                                      'assets/' +
                                          ImagesDetector.findImageByIconName(snapshot
                                              .data!.weather
                                              .map((e) => e.icon)
                                              .first), (snapshot.data!.mainJson.temp).toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text("Погода на ближайшие 4 дня", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black),),
                            ),
                          ]),
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
