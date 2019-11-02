import 'package:chroma/items/chroma_item.dart';
import 'package:chroma/main.dart';
import 'package:chroma/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<AppStore, HomeStore>(
      initialBuilder: (context) => HomeStore(),
      builder: (context, appStore, homeStore) {
        return homeStore
          ..color = appStore.color
          ..heroIndex = appStore.random.nextInt(10)
          ..generateChromas();
      },
      child: Consumer2<AppStore, HomeStore>(
        builder: (context, appStore, homeStore, child) {
          return AbsorbPointer(
            absorbing: homeStore.absorbing,
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Particles(32, Colors.white.withOpacity(0.1)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Hero(
                                  tag: homeStore.life == 0,
                                  child: AnimatedContainer(
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(
                                      milliseconds: 400,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          homeStore.color.withOpacity(1.0),
                                          homeStore.color.withOpacity(0.8),
                                          homeStore.color.withOpacity(0.6),
                                          homeStore.color.withOpacity(0.4),
                                          homeStore.color.withOpacity(0.2),
                                          homeStore.color.withOpacity(0.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'HIGH SCORE',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 2.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                '${homeStore.highScore}',
                                                style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w200,
                                                  letterSpacing: 2.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'GAME SCORE',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 2.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                '${homeStore.gameScore}',
                                                style: TextStyle(
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w200,
                                                  letterSpacing: 2.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      height: 0.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              '${homeStore.life == 0 ? homeStore.encourager : homeStore.data}',
                                              style: TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w200,
                                                letterSpacing: 4.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: homeStore.life >= 1 ? Colors.white : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: homeStore.life >= 2 ? Colors.white : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: homeStore.life >= 3 ? Colors.white : Colors.transparent,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              IgnorePointer(
                                ignoring: homeStore.life == 0,
                                child: AnimatedOpacity(
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  opacity: homeStore.life == 0 ? 0.0 : 1.0,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.0 / 1.0,
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: homeStore.chromas.length,
                                    itemBuilder: (context, index) {
                                      if (index == homeStore.heroIndex) {
                                        return Hero(
                                          tag: homeStore.life != 0,
                                          child: ChromaItem(
                                            index: index,
                                            chroma: homeStore.chromas[index],
                                            onTap: homeStore.validate,
                                          ),
                                        );
                                      } else {
                                        return ChromaItem(
                                          index: index,
                                          chroma: homeStore.chromas[index],
                                          onTap: homeStore.validate,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                ignoring: homeStore.life != 0,
                                child: AnimatedOpacity(
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(
                                    milliseconds: 400,
                                  ),
                                  opacity: homeStore.life == 0 ? 1.0 : 0.0,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'PLAY AGAIN?',
                                        style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w200,
                                          letterSpacing: 4.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      InkWell(
                                        onTap: () => homeStore.playAgain(),
                                        child: Text(
                                          'YES',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w200,
                                            letterSpacing: 4.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.of(context).pop(),
                                        child: Text(
                                          'NO',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w200,
                                            letterSpacing: 4.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
