import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      buildWhen: (previous, current){
        return previous.darkMode != current.darkMode;
      },
      builder: (context, state){
        return Scaffold(
          body: Center(
            child: IconButton(
              onPressed: (){
                BlocProvider.of<PreferencesBloc>(context).add(const PreferencesEvent.changeTheme());
              },
              icon: Icon(state.darkMode ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
        );
      },
    );
  }
}
