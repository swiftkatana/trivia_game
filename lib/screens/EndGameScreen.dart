import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  final String correctAnswers;
  EndGame(this.correctAnswers);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: mediaQuery.size.width / 2 / 7,
            top: 10,
            right: mediaQuery.size.width / 2 / 7,
            bottom: 10),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: mediaQuery.size.width / 3 / 6,
                      right: mediaQuery.size.width / 3 / 6,
                      bottom: mediaQuery.size.width / 2 / 6),
                  child: Text(
                      "Congratulations on finishing the game. The number of questions you answered correctly  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15))),
              Padding(
                  padding: EdgeInsets.only(
                      left: mediaQuery.size.width / 3 / 6,
                      right: mediaQuery.size.width / 3 / 6,
                      bottom: mediaQuery.size.width / 2 / 6),
                  child: Text(
                    this.correctAnswers,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
