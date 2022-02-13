import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/models/future_weather.dart';

class WeatherHttp {

  static const api_key = '44720de95fc3031f240bfac2ab9ea2cc';

  static Future<CurrentWeather> getCurrentJSONWeather(String city) async {
    final String currentWeatherURL =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$api_key&lang=ru';
    if(city == null) {
      final String currentWeatherURL =
          'http://api.openweathermap.org/data/2.5/weather?q=Москва&units=metric&appid=$api_key&lang=ru';
    }
    final response = await http.get(Uri.parse(currentWeatherURL));
    if (response.statusCode == 200) {
      print(response.body);
      return CurrentWeather.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('No data received');
    }
  }

  static Future<FutureWeather> getFutureJSONWeather(String city) async {
    final String futureWeatherURL =
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$api_key&lang=ru&units=metric';

    final response = await http.get(Uri.parse(futureWeatherURL));
    if (response.statusCode == 200) {
      print(response.body);
      return FutureWeather.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('No data received');
    }
  }
}
