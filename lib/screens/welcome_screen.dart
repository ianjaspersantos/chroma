import 'package:chroma/main.dart';
import 'package:chroma/screens/home_screen.dart';
import 'package:chroma/stores/welcome_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WelcomeStore>(
      builder: (context) {
        return WelcomeStore();
      },
      child: Consumer2<AppStore, WelcomeStore>(
        builder: (context, appStore, welcomeStore, child) {
          return AbsorbPointer(
            absorbing: false,
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Particles(24, Colors.white.withOpacity(0.1)),
                    PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HIGH SCORE',
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4.0,
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                '${preferences.getInt('score') ?? 0}',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.keyboard_arrow_up),
                                    onPressed: () {
                                      final duration = Duration(milliseconds: 800);
                                      final curve = Curves.fastOutSlowIn;

                                      pageController.animateToPage(0, duration: duration, curve: curve);
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    'HIGH SCORE',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            appStore.color = welcomeStore.color;
                                            return HomeScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: true,
                                      child: AnimatedContainer(
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(
                                          milliseconds: 400,
                                        ),
                                        width: welcomeStore.width,
                                        height: welcomeStore.height,
                                        constraints: BoxConstraints(
                                          minWidth: 160.0,
                                          minHeight: 160.0,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              welcomeStore.color.withOpacity(1.0),
                                              welcomeStore.color.withOpacity(0.8),
                                              welcomeStore.color.withOpacity(0.6),
                                              welcomeStore.color.withOpacity(0.4),
                                              welcomeStore.color.withOpacity(0.2),
                                              welcomeStore.color.withOpacity(0.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            appStore.color = welcomeStore.color;
                                            return HomeScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'PLAY',
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 4.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'HOW TO PLAY',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    onPressed: () {
                                      final duration = Duration(milliseconds: 800);
                                      final curve = Curves.fastOutSlowIn;

                                      pageController.animateToPage(2, duration: duration, curve: curve);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HOW TO PLAY',
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4.0,
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Test your skills and train your brain. Rest your soul and relax your eyes. Find your color, meaning and hope.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
