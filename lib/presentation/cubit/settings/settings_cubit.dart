import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus permissionGranted = PermissionStatus.denied;

  set setTemperature(bool value) => emit(state.copyWith(temperature: value));
  set setUnit(bool value) => emit(state.copyWith(units: value));
  set setLang(String value) => emit(state.copyWith(language: value));

  enableLocationService() async {
    LocationData? locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    emit(state.copyWith(locationData: locationData));
  }
}
