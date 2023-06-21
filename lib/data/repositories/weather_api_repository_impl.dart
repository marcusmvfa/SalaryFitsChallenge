import 'package:salary_fits_challenge/data/datasource/weather_datasource.dart';
import 'package:salary_fits_challenge/data/model/weather_dto.dart';
import 'package:salary_fits_challenge/domain/repositories/weather_api_repository.dart';

class WeatherApiRepositoryImpl implements WeatherApiRepository {
  final WeatherDataSource weatherDataSource;

  WeatherApiRepositoryImpl({required this.weatherDataSource});

  @override
  Future<WeatherDTO> getWeatherDetails(String lang, String units, double lat, double lon) async {
    final weather = await weatherDataSource.getWeatherDetail(lang: lang, units: units, lat: lat, lon: lon);
    return weather;
  }
}
