import 'package:flutter/material.dart';
import 'package:trivia_game/components/TextInput.dart';
import 'package:trivia_game/screens/TriviaScreen.dart';

// this screen is the first one you enter your name and then you move to the game

// !! be aware i have weird bug that the system Ui isn't responding sometimes
class WellComeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Trivia Game',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'What is Your Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Align(alignment: Alignment.center, child: Body())
            ]));
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void onCkick(String text) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TriviaScreen(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(40),
        child: TextInput(
          onClick: this.onCkick,
          placeHolder: 'Type Your Name:',
        ));
  }
}
