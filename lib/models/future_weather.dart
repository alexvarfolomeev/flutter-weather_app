
class FutureWeather {
  String cod;
  int message;
  int cnt;
  List<FiveDaysWeatherList> weather_list;

  FutureWeather(
      {
        required this.cod,
        required this.message,
        required this.cnt,
        required this.weather_list
      });

  factory FutureWeather.fromJSON(Map<String, dynamic> json) {
    var list = json['list'] as List;
    print(list.runtimeType);
    List<FiveDaysWeatherList> list_of_weather = list.map((i) => FiveDaysWeatherList.fromJSON(i)).toList();
    return FutureWeather(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      weather_list: list_of_weather,
    );
  }
}

class FiveDaysWeatherList {
  int dt;
  MainJson mainJson;
  List<Weather> weather;
  Clounds clouds;
  Wind wind;
  int visibility;
  int pop;
  Sys sys;
  String dt_txt;

  FiveDaysWeatherList (
      {
        required this.dt,
        required this.mainJson,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dt_txt,
      });

  factory FiveDaysWeatherList.fromJSON(Map<String, dynamic> json) {
    var list = json['weather'] as List;
    print(list.runtimeType);
    List<Weather> weatherList = list.map((i) => Weather.fromJSON(i)).toList();
    return FiveDaysWeatherList(
      dt: json['dt'],
      mainJson: MainJson.fromJSON(json['main']),
      weather: weatherList,
      clouds: Clounds.fromJSON(json['clouds']),
      wind: Wind.fromJSON(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'],
      sys: Sys.fromJSON(json['sys']),
      dt_txt: json['dt_txt'],
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
  int? sea_level;
  int? grnd_level;
  int? humidity;
  dynamic temp_kf;

  MainJson(
      {this.temp,
        this.feels_like,
        this.temp_min,
        this.temp_max,
        this.pressure,
        this.sea_level,
        this.grnd_level,
        this.humidity,
        this.temp_kf});

  factory MainJson.fromJSON(Map<String, dynamic> json) {
    return MainJson(
      temp: json['temp'],
      feels_like: json['feels_like'],
      temp_min: json['temp_min'],
      temp_max: json['temp_max'],
      pressure: json['pressure'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      humidity: json['humidity'],
      temp_kf: json['temp_kf'],
    );
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final dynamic gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJSON(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
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
  final String? pod;

  Sys({this.pod});

  factory Sys.fromJSON(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'],
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