import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yandex_project/constants/constants.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  final bool? top;
  final bool? bottom;
  final bool? right;
  final bool? left;
  final BorderRadius? borderRadius;

  const BlurWidget({
    Key? key,
    required this.child,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ?? BorderRadius.circular(AppConstants.smallRadius),
      child: ColoredBox(
        color: Colors.black12,
        child: SafeArea(
          top: top ?? true,
          bottom: bottom ?? true,
          right: right ?? true,
          left: left ?? true,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 40.0,
                  sigmaY: 40.0,
                ),
                child: ColoredBox(
                  color: Colors.black.withOpacity(0),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
