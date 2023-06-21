import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_state.dart';
import 'package:salary_fits_challenge/presentation/shared/sunrise_widget.dart';
import 'package:salary_fits_challenge/presentation/weather_next_days/widgets/weather_next_day_content.dart';
import 'package:salary_fits_challenge/presentation/weather_next_days/widgets/weather_next_day_widget.dart';

class WeatherNextDays extends StatelessWidget {
  const WeatherNextDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      appBar: AppBar(
        backgroundColor: const Color(0xff1e1e1e),
        title: const Text("Next Days"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoaded) {
            return Column(children: [
              Container(
                height: 145,
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.daily!.length - 3,
                    itemBuilder: (context, index) {
                      final weather = state.daily![index];
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<WeatherCubit>(context).setDaySelected(weather);
                        },
                        child: WeatherNextDayWidget(weather: weather),
                      );
                    }),
              ),
              WeatherNextDayContent(
                weather: state.daySelected!,
              ),
              SunriseWidget(
                sunrise: state.daySelected!.sunrise!,
                sunset: state.daySelected!.sunset!,
              )
            ]);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
