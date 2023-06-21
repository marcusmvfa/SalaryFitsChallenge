import 'package:dio/dio.dart';
import 'package:salary_fits_challenge/data/model/weather_dto.dart';

abstract class WeatherDataSource {
  Future<WeatherDTO> getWeatherDetail({required String lang, required double lat, required double lon, required String units});
}

class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<WeatherDTO> getWeatherDetail({
    required String lang,
    required double lat,
    required double lon,
    required String units,
  }) async {
    final response = await Dio().get("https://api.openweathermap.org/data/3.0/onecall", queryParameters: {
      'appid': '20c55347683a9a2864d280060e816949',
      'lat': lat,
      'lon': lon,
      'units': units,
      'lang': lang,
    });
    final result = WeatherDTO.fromMap(response.data);
    // final result = WeatherDetail.fromJson(response.data['current']);
    return result;
  }
}
