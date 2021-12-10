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
    print(insets.bottom);
    return Padding(
      padding: EdgeInsets.only(
        bottom: insets.bottom,
      ),
      child: MediaQuery.removeViewInsets(
        context: context,
        removeBottom: true,
        child: child,
      ),
    );
  }
}
