// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

// abstract class SettingsState extends Equatable {
//   const SettingsState();
// }

// ignore: must_be_immutable
import 'package:location/location.dart';

class SettingsState {
  bool temperature = true;
  bool units = false;
  String language = 'pt_br';
  LocationData? locationData;

  SettingsState({this.temperature = false, this.units = false, this.language = 'pt_br', this.locationData});
  // @override
  // List<Object> get props => [temperature, units, language];

  SettingsState copyWith({
    bool? temperature,
    bool? units,
    String? language,
    LocationData? locationData,
  }) {
    return SettingsState(
        temperature: temperature ?? this.temperature,
        units: units ?? this.units,
        language: language ?? this.language,
        locationData: locationData ?? this.locationData);
  }
}
