import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  int _answerdQuestion = 0;
  num total_score = 0;

  void _resetQuiz() {
    setState(() {
      _answerdQuestion = 0;
      total_score = 0;
    });
  }

  void _answerQuestion(value) {
    total_score += value;

    print(total_score);
    setState(() {
      _answerdQuestion = _answerdQuestion + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What is your favourite color?',
        'answer': [
          {'text': 'Black', 'score': 2},
          {'text': 'Green', 'score': 1},
          {'text': 'Blue', 'score': 4},
          {'text': 'Orange', 'score': 5}
        ]
      },
      {
        'question': 'What is your favourite animal?',
        'answer': [
          {'text': 'Cat', 'score': 4},
          {'text': 'Tiger', 'score': 1},
          {'text': 'Dog', 'score': 5},
          {'text': 'Lion', 'score': 2},
        ]
      },
      {
        'question': 'What is your favourite food?',
        'answer': [
          {'text': 'Shak Shobji', 'score': 9},
          {'text': 'Bilai er mangsho', 'score': 10},
          {'text': 'Kuttar Mangsho', 'score': 3},
          {'text': 'Murgir Pocha kolija', 'score': 1}
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: _answerdQuestion < questions.length
            ? Quiz(_answerQuestion, questions, _answerdQuestion)
            : Result(total_score, _resetQuiz),
      ),
    );
  }
}
