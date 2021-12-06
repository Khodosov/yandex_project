import 'package:flutter/material.dart';
import 'package:yandex_project/presentation/routes/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        context.router.push(const SettingsScreenRoute());
      },
    );
    return const Placeholder();
  }
}
