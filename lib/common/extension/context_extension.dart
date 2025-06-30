import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get screenSize {
    return MediaQuery.sizeOf(this);
  }
}
