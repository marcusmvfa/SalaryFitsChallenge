import 'package:flutter/material.dart';

class WeatherGridCharacteristic extends StatelessWidget {
  const WeatherGridCharacteristic({super.key, required this.icon, required this.title, required this.subTitle});
  final String icon;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(children: [
        Image.asset(
          icon,
          width: 50,
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
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
          subTitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade200,
          ),
        ),
      ]),
    );
  }
}
