import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_state.dart';

class WeatherContentCard extends StatelessWidget {
  const WeatherContentCard({
    required this.temperature,
    required this.iconUrl,
    required this.location,
    required this.description,
    super.key,
  });
  final double temperature;
  final String iconUrl;
  final String location;
  final String description;

  String formatTemperature(BuildContext context) {
    if (BlocProvider.of<SettingsCubit>(context).state.temperature) {
      return " C\u00b0";
    } else {
      return " F\u00b0";
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('EEE, MMM d');
    return Card(
      color: const Color(0xff292829),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  format.format(DateTime.now()),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
                  return RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: temperature.round().toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: formatTemperature(context),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ]),
                  );
                }),
                SizedBox(
                  height: 125,
                  child: Image.network(
                    'https://openweathermap.org/img/wn/$iconUrl@4x.png',
                    fit: BoxFit.cover,
                    height: 290,
                    width: 200,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
