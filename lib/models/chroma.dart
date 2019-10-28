import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class Chroma {
  final Color color;
  final bool visible;

  const Chroma({
    @required this.color,
    @required this.visible,
  })  : assert(color != null),
        assert(visible != null);

  factory Chroma.transparent() {
    return Chroma(
      color: Color.fromRGBO(0, 0, 0, 0.0),
      visible: false,
    );
  }

  factory Chroma.fromColor(Color color) {
    return Chroma(
      color: color,
      visible: true,
    );
  }

  factory Chroma.randomColor() {
    return Chroma(
      color: _generateColor(),
      visible: true,
    );
  }

  static Color _generateColor() {
    final random = Random();

    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);

    final opacity = 1.0;

    return Color.fromRGBO(r, g, b, opacity);
  }
}
