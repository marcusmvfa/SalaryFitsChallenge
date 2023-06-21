import 'package:flutter/material.dart';
import 'package:salary_fits_challenge/data/model/weather_detail.dart';
import 'package:salary_fits_challenge/presentation/weather_next_days/widgets/weather_grid_characteristic.dart';
import 'package:salary_fits_challenge/utils/local_files.dart';

class WeatherNextDayContent extends StatelessWidget {
  const WeatherNextDayContent({super.key, required this.weather});
  final WeatherDetail weather;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: const Color(0xff292829),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Image.network('https://openweathermap.org/img/wn/${weather.weather!.first.icon}@4x.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${weather.temp?.round()}\u00b0",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Text(
                          "Feels like ${weather.feelsLike?.round()}\u00b0",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text(
              "${weather.weather?.first.description}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherGridCharacteristic(icon: LocalFiles.windIcon, title: "${weather.windSpeed} m/s", subTitle: "Wind"),
                  WeatherGridCharacteristic(icon: LocalFiles.humidityIcon, title: "${weather.humidity}%", subTitle: "Humidity"),
                  WeatherGridCharacteristic(icon: LocalFiles.precipitationIcon, title: "${(weather.pop! * 100).round()}%", subTitle: "Rain"),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
