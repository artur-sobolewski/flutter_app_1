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
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 11},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite musician?',
      'answers': [
        {'text': 'F. Mercury', 'score': 1},
        {'text': 'Bob Dylan', 'score': 3},
        {'text': 'R. Plant', 'score': 2},
        {'text': 'F. Chopin', 'score': 5},
      ],
    },
  ];
  var _questionIdx = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIdx < questions.length) {
      setState(() {
        _questionIdx += 1;
      });
    } else {
      print('No more questions');
    }
    print(_questionIdx);
    print("points $_totalScore");
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
