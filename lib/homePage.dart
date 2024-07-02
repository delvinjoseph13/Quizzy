import 'package:flutter/material.dart';
import 'package:quizzy/quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzy extends StatefulWidget {
  const Quizzy({super.key});

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
  int questionNumber = 0;
  Quizbank quizBank = Quizbank();

  List<Icon> ScoreKeeper = [];

  void checkAnswer(bool getTheanswer) {
    bool correctanswer = quizBank.getQuestionanswer();
    setState(() {
      if (quizBank.isfinished() == true) {
        Alert(
                context: context,
                title: "quizz finished",
                desc: "Your are successfully finished the quiz")
            .show();
        quizBank.reset();
        ScoreKeeper=[];
      } else {
        if (getTheanswer == correctanswer) {
          ScoreKeeper.add(Icon(
            Icons.done,
            color: Colors.green,
          ));
        } else {
          ScoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    quizBank.getQuestiontext(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Row(children: ScoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}
