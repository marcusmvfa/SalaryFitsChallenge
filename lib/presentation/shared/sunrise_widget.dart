import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_challenge/utils/local_files.dart';

class SunriseWidget extends StatelessWidget {
  const SunriseWidget({super.key, required this.sunrise, required this.sunset});
  final DateTime sunrise;
  final DateTime sunset;

  String formatTime(DateTime date) {
    return DateFormat.Hm().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xff292829),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                formatTime(sunrise),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade200,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Sunrise",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
          Image.asset(LocalFiles.sunsetImage),
          Column(
            children: [
              Text(
                formatTime(sunset),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade200,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Sunset",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
