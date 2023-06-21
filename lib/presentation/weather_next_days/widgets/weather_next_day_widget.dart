import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_challenge/data/model/weather_detail.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_state.dart';

class WeatherNextDayWidget extends StatelessWidget {
  const WeatherNextDayWidget({super.key, required this.weather});
  final WeatherDetail weather;

  bool isSelected(WeatherStateLoaded state) {
    if (state.daySelected!.dt == weather.dt) {
      return true;
    } else {
      return false;
    }
  }

  String dateFormatted() {
    final format = DateFormat.EEEE();
    return format.format(DateTime.fromMillisecondsSinceEpoch(weather.dt! * 1000));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherStateLoaded) {
        return Container(
          width: 90,
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected(state) ? null : const Color(0xff393839),
            gradient: isSelected(state)
                ? const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xff3960f2),
                      Color(0xffd604fb),
                    ],
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dateFormatted(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Image.network(
                'https://openweathermap.org/img/wn/${weather.weather!.first.icon}@2x.png',
                width: 50,
              ),
              Text(
                "${weather.temp?.round()}\u00b0",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }
}
