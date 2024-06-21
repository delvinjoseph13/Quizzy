import 'package:flutter/material.dart';
import 'package:quizzy/quizBank.dart';

class Quizzy extends StatefulWidget {
  const Quizzy({super.key});

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
  int questionNumber = 0;
  Quizbank quizBank = Quizbank();

  List<Icon> ScoreKeeper = [];
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
                    quizBank.questionBank[questionNumber].qusetionText,
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
                      if (quizBank.questionBank[questionNumber].questionAnswer == true) {
                        print("The answer is Correct");
                      } else {
                        print("The answer is wrong");
                      }

                      setState(() {
                        questionNumber++;
                        ScoreKeeper.add(Icon(
                          Icons.done,
                          color: Colors.green,
                        ));
                      });
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
                      if (quizBank.questionBank[questionNumber].questionAnswer ==
                          false) {
                        print('The answer is Correct');
                      } else {
                        print("The answer is wrong");
                      }

                      setState(() {
                        questionNumber++;
                        ScoreKeeper.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                      });
                    },
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              // Row(children: ScoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}
