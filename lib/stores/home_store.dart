import 'dart:math';
import 'dart:ui';

import 'package:chroma/main.dart';
import 'package:chroma/models/chroma.dart';
import 'package:flutter/foundation.dart';

class HomeStore extends ChangeNotifier {
  Color color;
  int heroIndex;

  List<Chroma> chromas = [
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
    Chroma.transparent(),
  ];

  List<String> adjectives = <String>[
    'ADMIRABLE',
    'AMAZING',
    'ASTONISHING',
    'ASTOUNDING',
    'AWESOME',
    'BREATHTAKING',
    'ELEGANT',
    'EXCELLENT',
    'EXTRAORDINARY',
    'INCREDIBLE',
    'MAGNIFICENT',
    'MARVELOUS',
    'REMARKABLE',
    'SENSATIONAL',
    'SPECTACULAR',
    'SPLENDID',
    'STUNNING',
    'SUBLIME',
    'SUPERB',
    'WONDERFUL',
  ];

  List<String> encouragers = <String>[
    'BE PERSISTENT',
    'DO NOT GIVE UP',
    'HANG IN THERE',
    'KEEP ON TRYING',
    'NEVER SAY DIE',
    'NEVER SAY NEVER',
    'NEVER SURRENDER',
    'PERSEVERE',
    'PERSIST',
    'STAY STRONG',
  ];

  bool absorbing = true;

  int index = -1;

  String data = 'FIND THE COLOR';

  int life = 3;

  int highScore = preferences.getInt('score') ?? 0;
  int gameScore = 0;

  String get encourager => encouragers[Random().nextInt(encouragers.length)];

  void generateChromas() {
    // ---------------------------------------------------------------------------------
    for (int index = 0; index < chromas.length; index++) {
      chromas[index] = absorbing ? Chroma.fromColor(color) : Chroma.randomColor();
    }

    // ---------------------------------------------------------------------------------
    index = Random().nextInt(absorbing ? adjectives.length : chromas.length);

    if (absorbing) {
      if (gameScore == 0) {
        data = 'FIND THE COLOR';
      } else {
        data = '${adjectives[index]}';
      }
    } else {
      data = 'RGB(${chromas[index].color.red}, ${chromas[index].color.green}, ${chromas[index].color.blue})';
    }

    // ---------------------------------------------------------------------------------
    if (absorbing) {
      Future<bool>.delayed(Duration(seconds: 1), () => true).then((value) {
        if (value) {
          absorbing = false;
          generateChromas();
        } else {
          throw Exception('');
        }
      }).catchError((error) {
        throw Exception('');
      });
    }

    // ---------------------------------------------------------------------------------
    notifyListeners();
  }

  void validate(int index, Chroma chroma) {
    if (this.index == index) {
      // INCREASE SCORE
      gameScore += 100 * life;

      // LINISIN TO
      life = 3;

      color = chroma.color;

      absorbing = true;
      generateChromas();
    } else {
      life = life - 1;

      if (life == 0) {
        color = chromas[this.index].color;

        if (gameScore > highScore) {
          preferences.setInt('score', gameScore);
        }
      }

      chromas[index] = Chroma.transparent();

      notifyListeners();
    }
  }

  void playAgain() {
    highScore = preferences.getInt('score') ?? 0;
    gameScore = 0;
    life = 3;

    color = generateColor();

    absorbing = true;
    generateChromas();
  }
}

Color generateColor() {
  final random = Random();

  final r = random.nextInt(256);
  final g = random.nextInt(256);
  final b = random.nextInt(256);

  final opacity = 1.0;

  return Color.fromRGBO(r, g, b, opacity);
}
