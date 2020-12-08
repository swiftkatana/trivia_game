import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_game/classs/Quesitions.dart';
import 'package:trivia_game/components/TriviaList.dart';
import 'package:trivia_game/screens/EndGameScreen.dart';

// this screen is the game part when you enter it its make an api request to an out side database
// not sure yet but sometimes the database data is not 100% right

class TriviaScreen extends StatefulWidget {
  final String name;
  TriviaScreen(this.name);
  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello " + this.widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var quesitions;
  var quesition;
  var status;

  @override
  void initState() {
    makeApiReq().then((arry) => this.setState(() {
          this.quesitions = new Quesitions(arry);
        }));
    super.initState();
  }

  onClickQuis(text) {
    setState(() {
      this.quesition = this.quesitions.nextQues(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.quesitions is Quesitions) {
      this.status = this.quesitions.gameDone();
      if (!this.status['done']) {
        this.quesition = this.quesitions.startGame();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(46),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      this.quesition['question'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ),
            ),
            Expanded(
                child: TriviaList(
              quesition: this.quesition,
              onClick: onClickQuis,
            ))
          ],
        );
      } else {
        return EndGame(this.status['counter'].toString());
      }
    }
    return Align(
      child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 10,
          )),
    );
  }
}

Future makeApiReq() async {
  return await http
      .get(
          "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple")
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    return json.decode(response.body)["results"];
  });
}
