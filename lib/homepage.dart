import 'dart:async';

import 'package:flutter/material.dart';
import './smiley.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double smileyveraxis = 0;
  double height = 0;
  double time = 0;
  double initialHeight = 0;
  bool gameStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = smileyveraxis;
    });
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        smileyveraxis = initialHeight - height;
      });
      if (smileyveraxis > 1) {
        timer.cancel();
        gameStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (gameStarted) {
                  jump();
                } else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0, smileyveraxis),
                duration: Duration(milliseconds: 0),
                color: Colors.blue,
                child: MySmiley(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
