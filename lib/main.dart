import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';

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
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIdx,
                questions: questions)
            : Result(),
      ),
    );
  }
}
