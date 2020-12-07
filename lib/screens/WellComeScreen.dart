import 'package:flutter/material.dart';
import 'package:trivia_game/components/TextInput.dart';
import 'package:trivia_game/screens/TriviaScreen.dart';

class WellComeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Trivia Game  ")),
        body: Column(children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('What is Your Name'))),
          Align(
              alignment: Alignment.center,
              child: Padding(padding: EdgeInsets.all(10), child: Body()))
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
