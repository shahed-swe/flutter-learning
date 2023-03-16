import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function _answerQuestion;
  final List<Map<String, Object>> _questions;
  final int questionIndex;

  Quiz(@required this._answerQuestion, @required this._questions,
      @required this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(_questions[questionIndex]['question'].toString()),
        ...(_questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => _answerQuestion(answer['score']),
              answer['text'].toString());
        }).toList(),
      ],
    );
  }
}
