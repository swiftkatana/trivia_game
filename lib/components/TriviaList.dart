import 'package:flutter/material.dart';
import 'dart:math';
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
        var num = 1 + rnd.nextInt(3 - 0);
        this.items = this.widget.quesition["incorrect_answers"];
        this.items[num - 1] = this.widget.quesition["correct_answer"];
      });
      return Container(
        child: ListView.builder(
            itemCount: this.items.length,
            itemBuilder: (context, index) {
              return TriviaCard(
                onClick: this.widget.onClick,
                text: this.items[index],
              );
            }),
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
