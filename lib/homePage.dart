import 'package:flutter/material.dart';

class Quizzy extends StatefulWidget {
  const Quizzy({super.key});

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {
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
                    "What is the most common surname in the United States?",
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
                      setState(() {
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
                      setState(() {
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
              Row(children: ScoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}
