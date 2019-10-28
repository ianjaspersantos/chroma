import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class WelcomeStore extends ChangeNotifier {
  double width = 160.0;
  double height = 160.0;

  Color color = Color.fromRGBO(0, 0, 0, 0.0);

  WelcomeStore() {
    final random = Random();

    Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (Timer timer) {
        color = getColor();

        width = random.nextInt(320).toDouble();
        height = random.nextInt(320).toDouble();

        notifyListeners();
      },
    );
  }

  Color getColor() {
    final random = Random();

    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);

    final opacity = 1.0;

    return Color.fromRGBO(r, g, b, opacity);
  }
}
