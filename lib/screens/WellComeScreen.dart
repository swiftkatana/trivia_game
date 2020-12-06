import 'package:flutter/material.dart';
import 'package:trivia_game/components/TextInput.dart';

class WellComeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello world")),
        body: Align(
            alignment: Alignment.center,
            child: Padding(padding: EdgeInsets.all(10), child: Body())));
  }
}

// body: Column(children: <Widget>[
//   Text('Hello world', style: TextStyle(fontSize: 50)),
//   Expanded(child: Body()),
// ]),
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void onCkick() {
    // Navigator.push(context,
    // MaterialPageRoute(builder: (context) => MyHomePage(controller.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Wellcome To The Best Trivia',
          style: TextStyle(
            fontSize: 25,
          )),
      Padding(padding: EdgeInsets.all(40), child: TextInput(onCkick)),
    ]);
  }
}
