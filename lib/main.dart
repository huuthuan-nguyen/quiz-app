import 'package:flutter/material.dart';
import 'package:my_app/quiz.dart';
import 'package:my_app/result.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainWidget> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What's your favourite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favourite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 9},
      ]
    },
    {
      "questionText": "Who's your favourite instructor?",
      "answers": [
        {"text": "Me", "score": 1},
        {"text": "Tin", "score": 1},
        {"text": "Duy", "score": 1},
        {"text": "Huy", "score": 1},
      ]
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext contenxt) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
