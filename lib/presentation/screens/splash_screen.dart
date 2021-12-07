import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yandex_project/presentation/routes/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.router.popAndPush(const SettingsScreenRoute());
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Splash',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
