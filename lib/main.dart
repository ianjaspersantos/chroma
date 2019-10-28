import 'dart:math';

import 'package:chroma/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

void main() async {
  preferences = await SharedPreferences.getInstance();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStore>(
      builder: (context) {
        return AppStore();
      },
      child: MaterialApp(
        title: 'Chroma',
        theme: ThemeData.dark(),
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: kDebugMode,
      ),
    );
  }
}

class AppStore extends ChangeNotifier {
  Random random = Random();

  Color color;
}
