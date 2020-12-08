import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function onClick;
  final String placeHolder;
  TextInput({this.onClick, this.placeHolder});
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String text;
  TextEditingController controller = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onCkick() {
    this.widget.onClick(controller.text);
    this.controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.black)),
            prefixIcon: Icon(Icons.person),
            labelText: this.widget.placeHolder,
            suffixIcon: IconButton(
              icon: Icon(Icons.done),
              splashColor: Colors.green,
              tooltip: "Submit ",
              onPressed: onCkick,
            )));
  }
}
