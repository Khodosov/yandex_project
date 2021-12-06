import 'package:auto_route/auto_route.dart';
import 'package:yandex_project/presentation/screens/settings/settings_screen.dart';
import 'package:yandex_project/presentation/screens/splash_screen.dart';

export 'package:auto_route/auto_route.dart';

export 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: SettingsScreen),
])
class $AppRouter {}
