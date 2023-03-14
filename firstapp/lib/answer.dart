import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final int value;
  var questions;

  Answer(this.value, this.selectHandler, this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber, // sets background color
          onPrimary: Colors.white, // sets text color
        ),
        child: Text(questions[value]),
        onPressed: () => selectHandler(value),
      ),
    );
  }
}
