import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),

        // style: ElevatedButton.styleFrom(
        //   primary: Colors.yellow,
        //   onPrimary: Colors.red,
        // ),

        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
