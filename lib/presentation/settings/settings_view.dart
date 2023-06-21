import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_cubit.dart';
import 'package:salary_fits_challenge/presentation/cubit/settings/settings_state.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late final SettingsCubit _cubit;

  String getLanguage(String language) {
    String name = "";
    switch (language) {
      case 'pt_br':
        name = "Português";
        break;
      case 'en':
        name = "English";
        break;
      case 'es':
        name = "Spanish";
        break;
    }
    return name;
  }

  @override
  void initState() {
    _cubit = BlocProvider.of<SettingsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      appBar: AppBar(
        backgroundColor: const Color(0xff1e1e1e),
        title: const Text("Settings"),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Temperature",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "F \u00b0",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          Flexible(
                            child: Switch(
                                value: state.temperature,
                                onChanged: (value) {
                                  // setState(() {
                                  _cubit.setTemperature = value;
                                  // });
                                }),
                          ),
                          Text(
                            "C \u00b0",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Units of Measurement",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Metric",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          Flexible(
                            child: Switch(
                                value: state.units,
                                onChanged: (value) {
                                  _cubit.setUnit = value;
                                }),
                          ),
                          Text(
                            "Imperial",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    PopupMenuButton<String>(
                      initialValue: state.language,
                      // Callback that sets the selected popup menu item.
                      onSelected: (String item) {
                        _cubit.setLang = item;
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'pt_br',
                          child: Text('Português'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'en',
                          child: Text('English'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'es',
                          child: Text('Spanish'),
                        ),
                      ],
                      child: Card(
                        margin: const EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            getLanguage(state.language),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
