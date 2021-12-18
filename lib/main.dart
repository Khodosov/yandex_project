import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/di.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/presentation/screens/drink_info/drink_info_screen.dart';
import 'package:yandex_project/presentation/screens/home/home_page.dart';
import 'package:yandex_project/presentation/screens/settings/settings_screen.dart';
import 'application/preferences/preferences_bloc.dart';
import 'application/search/search_bloc.dart';

import 'application/services/application_initialConfig.dart';

void main() async {
  Locator.initLocator();
  await onStartApp().then((value) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesBloc>(
          create: (_) => PreferencesBloc(dataBase: Locator.dataBase)..add(const PreferencesEvent.init()),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(
            dataBase: Locator.dataBase,
            apiCall: Locator.network,
            connectivityEnsure: Locator.connectivity,
          )..add(const SearchEvent.init()),
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
            theme: AppConstants.theme,
            darkTheme: AppConstants.darkTheme,
            navigatorObservers: [routeObserver],
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
