import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/presentation/screens/drink_info/drink_info_widget.dart';
import 'package:yandex_project/presentation/screens/home/home_page.dart';
import 'package:yandex_project/presentation/screens/settings/settings_screen.dart';
import 'application/preferences/preferences_bloc.dart';
import 'application/search/search_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'application/services/application_initialConfig.dart';

void main() async {
  await onStartApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesBloc>(
          create: (_) => PreferencesBloc()..add(const PreferencesEvent.init()),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc()..add(const SearchEvent.init()),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        buildWhen: (previous, current) {
          return previous.themeMode != current.themeMode;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(),
              primarySwatch: Colors.amber,
              scaffoldBackgroundColor: Colors.amber,
              progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: GoogleFonts.latoTextTheme(
                  ThemeData.dark().textTheme
              ),
            ),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/home':
                  return MaterialPageRoute(builder: (context) => const HomePage(), settings: settings);
                case '/settings':
                  return MaterialPageRoute(builder: (context) => const SettingsScreen(), settings: settings);
                case '/drink':
                  return MaterialPageRoute(builder: (context) => const DrinkInfoScreen(), settings: settings);
              }
            },
            initialRoute: '/home',
          );
        },
      ),
    );
  }
}
