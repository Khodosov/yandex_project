import 'dart:math';

import 'package:flutter/material.dart';

class KeyboardArea extends StatelessWidget {
  const KeyboardArea({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    EdgeInsets insets = data.viewInsets;
    return Padding(
      padding: EdgeInsets.only(
        bottom: max(0.0, insets.bottom - data.size.width / 5.5),
      ),
      child: MediaQuery.removeViewInsets(
        context: context,
        removeBottom: true,
        child: child,
      ),
    );
  }
}
