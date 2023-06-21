import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/weather/weather_state.dart';
import 'package:salary_fits_challenge/presentation/settings/settings_view.dart';
import 'package:salary_fits_challenge/presentation/shared/weather_content_card.dart';
import 'package:salary_fits_challenge/injection.dart' as di;
import 'package:salary_fits_challenge/presentation/weather_next_days/weather_next_days.dart';
import 'package:salary_fits_challenge/presentation/weather_next_days/widgets/weather_grid_characteristic.dart';
import 'package:salary_fits_challenge/presentation/weather_next_days/widgets/weather_next_day_widget.dart';
import 'package:salary_fits_challenge/utils/local_files.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      appBar: AppBar(
        backgroundColor: const Color(0xff1e1e1e),
        title: const Text("SalaryFits - Teste"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsView()));
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => di.getIt<SettingsCubit>()..enableLocationService(),
        child: BlocProvider(
          create: (context) => di.getIt<WeatherCubit>()..getWeather(),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherStateLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => di.getIt<WeatherCubit>()..getWeather(),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(
                              "Click to update",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            )
                          ]),
                        ),
                      ),
                      WeatherContentCard(
                        temperature: state.weatherDetail!.temp!,
                        iconUrl: state.weatherDetail!.weather!.first.icon!,
                        location: "Toledo - PR, Brasil",
                        description: state.weatherDetail?.weather?.first.description ?? "",
                      ),
                      Card(
                        margin: const EdgeInsets.all(8),
                        color: const Color(0xff292829),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherGridCharacteristic(icon: LocalFiles.windIcon, title: "${state.weatherDetail!.windSpeed} m/s", subTitle: "Wind"),
                              WeatherGridCharacteristic(icon: LocalFiles.humidityIcon, title: "${state.weatherDetail!.humidity}%", subTitle: "Humidity"),
                              WeatherGridCharacteristic(
                                  icon: LocalFiles.precipitationIcon, title: "${(state.weatherDetail!.pop ?? 0 * 100).round()}%", subTitle: "Rain"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Next Days...",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      Container(
                        height: 145,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.daily!.length - 3,
                            itemBuilder: (context, index) {
                              final weather = state.daily![index];
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const WeatherNextDays(),
                                    ),
                                  );
                                },
                                child: WeatherNextDayWidget(weather: weather),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
