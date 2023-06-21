import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_cubit.dart';
import 'package:salary_fits_challenge/injection.dart' as injection;
import 'package:salary_fits_challenge/presentation/home/home_view.dart';

void main() async {
  await injection.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.getIt<SettingsCubit>(),
        ),
        BlocProvider(
          create: (_) => injection.getIt<WeatherCubit>(),
        ),
      ],
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
