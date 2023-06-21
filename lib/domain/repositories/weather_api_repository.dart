import 'package:salary_fits_challenge/data/model/weather_dto.dart';

abstract class WeatherApiRepository {
  Future<WeatherDTO> getWeatherDetails(String lang, String units, double lat, double lon);
}
