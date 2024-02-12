import 'package:flutter/material.dart';

extension Extnum on num {
  Widget get vs => SizedBox(height: toDouble());

  Widget get hs => SizedBox(width: toDouble());
}

extension GestureDetectorExtension on Widget {
  GestureDetector onTap(VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }
}
