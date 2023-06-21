import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:salary_fits_challenge/data/model/weather_detail.dart';
import 'package:salary_fits_challenge/domain/repositories/weather_api_repository.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.repository}) : super(WeatherStateInitial());
  final WeatherApiRepository repository;
  final settings = GetIt.instance<SettingsCubit>();
  Future getWeather() async {
    emit(WeatherStateLoading());
    final result = await repository.getWeatherDetails(
      settings.state.language,
      settings.state.units ? "metric" : "imperial",
      settings.state.locationData?.latitude ?? -24.763229, // Toledo, Parana
      settings.state.locationData?.longitude ?? -53.713608, // Toledo, Parana
    );
    emit(
      WeatherStateLoaded(
        weatherDetail: result.current,
        daily: result.nextDays,
        daySelected: result.nextDays!.first,
      ),
    );
  }

  setDaySelected(WeatherDetail weather) {
    final currentState = state as WeatherStateLoaded;

    emit(currentState.copyWith(daySelected: weather));
  }
}
