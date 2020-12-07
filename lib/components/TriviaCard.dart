import 'package:flutter/material.dart';

class TriviaCard extends StatelessWidget {
  final String text;
  final Function onClick;
  TriviaCard({this.text, this.onClick});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          this.onClick(text);
        },
        child: Container(
          width: 200,
          height: 50,
          child: Align(alignment: Alignment.center, child: Text(this.text)),
        ),
      ),
    );
  }
}
