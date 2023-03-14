import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  void _answerQuestion(int index) {
    setState(() {
      _answerdQuestion = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _question = [
      'What is your name?',
      'What is your phone number?',
      'What is your addresss?',
      'What is your email?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(_question[_answerdQuestion]),
            // ElevatedButton(
            //   onPressed: () => print("Number 1 Choosen"),
            //   child: const Text("Answer 1"),
            // ),
            Answer(0,_answerQuestion, _question),
            Answer(1,_answerQuestion, _question),
            Answer(2,_answerQuestion, _question),
            Answer(3,_answerQuestion, _question),
          ],
        ),
      ),
    );
  }
}
