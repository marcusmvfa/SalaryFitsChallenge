// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:salary_fits_challenge/data/model/weather_detail.dart';

class WeatherDTO {
  final WeatherDetail? current;
  final List<WeatherDetail>? nextDays;
  WeatherDTO({
    this.current,
    this.nextDays,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current': current?.toMap(),
      'daily': nextDays!.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherDTO.fromMap(Map<String, dynamic> map) {
    return WeatherDTO(
      current: map['current'] != null ? WeatherDetail.fromJson(map['current'] as Map<String, dynamic>) : null,
      nextDays: map['daily'] != null
          ? List<WeatherDetail>.from(
              (map['daily'] as List).map<WeatherDetail?>(
                (x) => WeatherDetail.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDTO.fromJson(String source) => WeatherDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
