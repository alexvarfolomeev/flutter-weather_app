import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/future_forecast_cards.dart';
import 'package:weather_app/components/search_weather_screen.dart';
import 'package:weather_app/components/tempurature_component.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/future_weather.dart';
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
  late Future<CurrentWeather> currentWeather;
  late Future<FutureWeather> futureWeather;
  final WeatherHttp weatherHttp = WeatherHttp();
  String cityName = '';

  @override
  void initState() {
    super.initState();
    cityName = 'Москва';
    currentWeather = WeatherHttp.getCurrentJSONWeather(cityName);
    futureWeather = WeatherHttp.getFutureJSONWeather(cityName);
  }

  void _returnDataFromSearchScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SearchWeather());
    final result = await Navigator.push(context, route);

    setState(() {
      cityName = result;
      cityName.isEmpty
          ? currentWeather = WeatherHttp.getCurrentJSONWeather("Москва")
          : currentWeather = WeatherHttp.getCurrentJSONWeather(cityName);
    });
  }

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
                future: currentWeather,
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
                                (snapshot.data!.mainJson.temp).toStringAsFixed(0)),
                          ),
                          FutureBuilder<FutureWeather>(
                            future: futureWeather,
                            builder: (context, snapshot_1) {
                              if(snapshot_1.hasData){
                              return Stack(children: <Widget>[
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      FutureForecastCards.getForecastCard('Sunday',
                                          'assets/' +
                                              ImagesDetector.findImageByIconName(snapshot_1
                                                  .data!.weather_list
                                                  .map((e) => e.weather[0].icon)
                                                  .first), (snapshot_1.data!.weather_list[1].mainJson.temp).toString()),
                                      FutureForecastCards.getForecastCard('Sunday',
                                          'assets/' +
                                              ImagesDetector.findImageByIconName(snapshot_1
                                                  .data!.weather_list
                                                  .map((e) => e.weather[0].icon)
                                                  .first), (snapshot_1.data!.weather_list[2].mainJson.temp).toString()),
                                      FutureForecastCards.getForecastCard('Sunday',
                                          'assets/' +
                                              ImagesDetector.findImageByIconName(snapshot_1
                                                  .data!.weather_list
                                                  .map((e) => e.weather[0].icon)
                                                  .first), (snapshot_1.data!.weather_list[3].mainJson.temp).toString()),
                                      FutureForecastCards.getForecastCard('Sunday',
                                          'assets/' +
                                              ImagesDetector.findImageByIconName(snapshot_1
                                                  .data!.weather_list
                                                  .map((e) => e.weather[0].icon)
                                                  .first), (snapshot_1.data!.weather_list[4].mainJson.temp).toString()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Center(child: Text("Погода на ближайшие 4 дня", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black),)),
                                ),
                              ]);
                            } else {
                                 return Text('${snapshot.error}');
                              }
                            }),
                        ],),
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
