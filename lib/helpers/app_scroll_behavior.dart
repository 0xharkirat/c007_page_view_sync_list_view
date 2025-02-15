import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Enable scroll behavior on web: https://stackoverflow.com/a/69435100/436422
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
