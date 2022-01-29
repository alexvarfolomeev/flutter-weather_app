import 'dart:convert';

class CurrentWeather {
  Coord coord;
  int id;
  List<Weather> weather;
  String base;
  MainJson mainJson;
  int visibility;
  Wind wind;
  Clounds clouds;
  int dt;
  Sys sys;
  int timezone;
  int cityID;
  String name;
  int cod;

  CurrentWeather(
      {required this.coord,
      required this.id,
      required this.weather,
      required this.base,
      required this.mainJson,
      required this.visibility,
      required this.wind,
      required this.clouds,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.cityID,
      required this.name,
      required this.cod});

  factory CurrentWeather.fromJSON(Map<String, dynamic> json) {
    var list = json['weather'] as List;
    print(list.runtimeType);
    List<Weather> weatherList = list.map((i) => Weather.fromJSON(i)).toList();
    return CurrentWeather(
      coord: Coord.fromJSON(json['coord']),
      id: json['id'],
      weather: weatherList,
      base: json['base'],
      mainJson: MainJson.fromJSON(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJSON(json['wind']),
      clouds: Clounds.fromJSON(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJSON(json['sys']),
      timezone: json['timezone'],
      cityID: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Temperature {
  String temp;
  String tempFeelsLike;
  String tempMin;
  String tempMax;

  Temperature(this.temp, this.tempFeelsLike, this.tempMin, this.tempMax);

  Temperature.fromJSON(Map<String, dynamic> json)
      : temp = json['temp'].toString(),
        tempFeelsLike = json['feels_like'].toString(),
        tempMin = json['temp_min'].toString(),
        tempMax = json['temp_max'].toString();
}

class Coord {
  final dynamic lon;
  final dynamic lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJSON(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

class MainJson {
  dynamic temp;
  dynamic feels_like;
  dynamic temp_min;
  dynamic temp_max;
  int? pressure;
  int? humidity;

  MainJson(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainJson.fromJSON(Map<String, dynamic> json) {
    return MainJson(
      temp: json['temp'],
      feels_like: json['feels_like'],
      temp_min: json['temp_min'],
      temp_max: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Wind {
  final double? speed;
  final int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJSON(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}

class Clounds {
  final int? all;

  Clounds({this.all});

  factory Clounds.fromJSON(Map<String, dynamic> json) {
    return Clounds(
      all: json['all'],
    );
  }
}

class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJSON(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'].toString(),
      description: json['description'].toString(),
      icon: json['icon'].toString(),
    );
  }
}
