import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/presentation/screens/home/home_page.dart';
import 'package:yandex_project/presentation/screens/settings/settings_screen.dart';
import 'application/preferences/preferences_bloc.dart';
import 'application/search/search_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesBloc>(
          create: (_) => PreferencesBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        ),
      ],
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        buildWhen: (previous, current) {
          return previous.themeMode != current.themeMode;
        },
        builder: (context, state) {
          return MaterialApp(
            navigatorObservers: [],
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.amber,
              scaffoldBackgroundColor: Colors.amber,
              progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
            ),
            darkTheme: ThemeData.dark(),
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => const HomePage(),
              '/settings': (BuildContext context) => const SettingsScreen(),
            },
            home: const HomePage(),
          );
        },
      ),
    );
  }
}


class Observer extends NavigatorObserver {

}