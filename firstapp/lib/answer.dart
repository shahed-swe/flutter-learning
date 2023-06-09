import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

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
        child: Text(answerText),
        onPressed: () => selectHandler(),
      ),
    );
  }
}
