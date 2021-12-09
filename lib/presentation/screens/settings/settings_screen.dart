import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      buildWhen: (previous, current) {
        return previous.themeMode != current.themeMode;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent.withAlpha(30),
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    brightness(context),
                    appMode(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget brightness(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.brightness_medium),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Theme',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          PopupMenuButton<ThemeMode>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            initialValue: context.read<PreferencesBloc>().state.themeMode,
            onSelected: (value) {
              BlocProvider.of<PreferencesBloc>(context)
                  .add(PreferencesEvent.changeTheme(themeMode: value));
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.dark,
                  child: Row(
                    children: const [
                      Icon(Icons.dark_mode),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Dark mode'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.light,
                  child: Row(
                    children: const [
                      Icon(Icons.light_mode),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Light mode'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.system,
                  child: Row(
                    children: const [
                      Icon(Icons.smartphone),
                      SizedBox(
                        width: 5,
                      ),
                      Text('System'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  Widget appMode(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.wine_bar),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Alcohol',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          PopupMenuButton<bool>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            initialValue: false,
            onSelected: (value) {},
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem<bool>(
                  value: false,
                  child: Row(
                    children: const [
                      Icon(Icons.local_bar),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Alcohol'),
                    ],
                  ),
                ),
                PopupMenuItem<bool>(
                  value: true,
                  child: Row(
                    children: const [
                      Icon(Icons.no_drinks),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Alcohol free'),
                    ],
                  ),
                ),

              ];
            },
          ),
        ],
      ),
    );
  }
}
