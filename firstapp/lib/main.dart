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

  void _answerQuestion() {
    print(_answerdQuestion);
    setState(() {
      _answerdQuestion = _answerdQuestion + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What is your favourite color?',
        'answer': ['Black', 'Green', 'Blue', 'Orange']
      },
      {
        'question': 'What is your favourite animal?',
        'answer': ['Cat', 'Tiger', 'Dog', 'Lion']
      },
      {
        'question': 'What is your favourite food?',
        'answer': [
          'Shak Shobji',
          'Bilai er mangsho',
          'Kuttar Mangsho',
          'Murgir Pocha kolija'
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: _answerdQuestion < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_answerdQuestion]['question'].toString()),
                  ...(questions[_answerdQuestion]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text("Sultan dine Jindabad"),
              ),
      ),
    );
  }
}
