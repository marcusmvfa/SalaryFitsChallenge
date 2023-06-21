// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:salary_fits_challenge/data/model/weather_detail.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherStateLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherStateLoaded extends WeatherState {
  final WeatherDetail? weatherDetail;
  final List<WeatherDetail>? daily;
  final WeatherDetail? daySelected;

  const WeatherStateLoaded({this.weatherDetail, this.daily, this.daySelected});
  @override
  List<Object> get props => [daySelected!];

  WeatherStateLoaded copyWith({
    WeatherDetail? weatherDetail,
    List<WeatherDetail>? daily,
    WeatherDetail? daySelected,
  }) {
    return WeatherStateLoaded(
      weatherDetail: weatherDetail ?? this.weatherDetail,
      daily: daily ?? this.daily,
      daySelected: daySelected ?? this.daySelected,
    );
  }
}
