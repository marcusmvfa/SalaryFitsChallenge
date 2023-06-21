import 'package:salary_fits_challenge/data/model/weather_summary.dart';

class WeatherDetail {
  int? dt;
  DateTime? sunrise;
  DateTime? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  double? pop;
  List<WeatherSummary>? weather;

  WeatherDetail(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});

  WeatherDetail.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = DateTime.fromMillisecondsSinceEpoch(json['sunrise']);
    sunset = DateTime.fromMillisecondsSinceEpoch(json['sunset']);
    if (json['temp'] is double) {
      temp = json['temp'];
    } else {
      temp = json['temp']['day'];
    }
    if (json['feels_like'] is double) {
      feelsLike = json['feels_like'];
    } else {
      feelsLike = json['feels_like']['day'];
    }

    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'].toDouble();
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'].toDouble();
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    pop = json['pop']?.toDouble();
    if (json['weather'] != null) {
      weather = <WeatherSummary>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    data['pop'] = pop;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
