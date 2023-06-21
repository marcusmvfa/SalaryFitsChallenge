import 'package:get_it/get_it.dart';
import 'package:salary_fits_challenge/data/datasource/weather_datasource.dart';
import 'package:salary_fits_challenge/data/repositories/weather_api_repository_impl.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_cubit.dart';
import 'package:salary_fits_challenge/domain/repositories/weather_api_repository.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
  getIt.registerLazySingleton<WeatherCubit>(() => WeatherCubit(repository: getIt()));
  getIt.registerLazySingleton<WeatherApiRepository>(() => WeatherApiRepositoryImpl(weatherDataSource: getIt()));
  getIt.registerLazySingleton<WeatherDataSource>(() => WeatherDataSourceImpl());
}
