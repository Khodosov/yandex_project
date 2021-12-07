import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/presentation/routes/router.gr.dart';
import 'application/preferences/preferences_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesBloc>(
          create: (_) => PreferencesBloc(),
        ),
      ],
      child: BlocBuilder<PreferencesBloc, PreferencesState>(
        buildWhen: (previous, current) {
          return previous.darkMode != current.darkMode;
        },
        builder: (context, state) {
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            builder: (context, child) {
              return child!;
            },
          );
        },
      ),
    );
  }
}
