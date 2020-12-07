import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trivia_game/components/TriviaCard.dart';

class TriviaList extends StatefulWidget {
  final dynamic quesition;
  final Function onClick;
  TriviaList({this.quesition, this.onClick});

  @override
  _TriviaListState createState() => _TriviaListState();
}

class _TriviaListState extends State<TriviaList> {
  var items = [];
  String quesition;
  List<Widget> render;
  @override
  Widget build(BuildContext context) {
    if (this.widget.quesition.isNotEmpty) {
      setState(() {
        this.quesition = this.widget.quesition['question'];

        Random rnd = new Random();
        var num = 1 + rnd.nextInt(3 - 1);
        this.items = this.widget.quesition["incorrect_answers"];
        this.items[num - 1] = this.widget.quesition["correct_answer"];
        print(this.items);
        print(this.widget.quesition["correct_answer"]);
      });
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    this.quesition,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
            ),
            TriviaCard(
              onClick: this.widget.onClick,
              text: this.items[0],
            ),
            TriviaCard(
              onClick: this.widget.onClick,
              text: this.items[1],
            ),
            TriviaCard(
              onClick: this.widget.onClick,
              text: this.items[2],
            )
          ],
        ),
      );
    } else
      print(this.widget.quesition);
    return Container(
      child: Column(
        children: [
          Text("loding"),
        ],
      ),
    );
  }
}
