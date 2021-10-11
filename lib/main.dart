import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'Blue'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Rabbit', 'Snake'],
    },
    {
      'questionText': 'What\'s your favorite musician?',
      'answers': ['F. Mercury', 'Bob Dylan', 'R. Plant', 'F. Chopin'],
    },
  ];
  var _questionIdx = 0;

  void _answerQuestion() {
    if (_questionIdx < questions.length) {
      setState(() {
        _questionIdx += 1;
      });
      print(_questionIdx);
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIdx < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIdx]['questionText'] as String,
                  ),
                  ...(questions[_questionIdx]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
