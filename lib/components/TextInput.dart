import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function onClick;
  TextInput(this.onClick);
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String text;
  TextEditingController controller = new TextEditingController();
  void onCkick() {
    this.setState(() {
      this.text = controller.text;
    });
    this.widget.onClick(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.black)),
            prefixIcon: Icon(Icons.person),
            labelText: 'Type Your Name:',
            suffixIcon: IconButton(
              icon: Icon(Icons.done),
              splashColor: Colors.green,
              tooltip: "Submit ",
              onPressed: onCkick,
            )));
  }
}
