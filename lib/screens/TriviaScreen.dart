import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        appBar: AppBar(title: Text("Hello " + this.widget.name)), body: Body());
  }
}

makeApiReq() async {
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

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var listItems = [];
  void show(array) => {
        this.setState(() {
          this.listItems = array;
        })
      };

  @override
  Widget build(BuildContext context) {
    print(this.listItems);
    return Container();
  }
}
