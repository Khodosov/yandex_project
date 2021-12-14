import 'package:flutter/material.dart';
import 'package:yandex_project/constants/constants.dart';

import 'blur_widget.dart';

class CustomAppBar extends StatelessWidget {
  final Widget title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      child: BlurWidget(
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppConstants.smallRadius)),
        bottom: false,
        child: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: title,
        ),
      ),
    );
  }
}
