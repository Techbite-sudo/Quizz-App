import 'package:flutter/material.dart';

import '../model/question.dart';
import '../util/hexcolor.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("Kenya got independence in the year 1964", true),
    Question.name("KNLS is a non-governmental institution", false),
    Question.name("Wajakhoya is the fifth president of Kenya", false),
    Question.name("Kenya is a country in the East African Region", true),
    Question.name("Telcom is widely used in kenya than Safaricom", false),
    Question.name("Uhuru Kenyatta is the third president of kenya ", true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
          builder: (context) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset("images/flag.png",
                      width: 250,
                      height: 180,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.blueGrey.shade700,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      height: 120,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            questionBank[_currentQuestionIndex].questionText,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          onPressed: () => _previousQuestion(),
                          color: Colors.blueGrey.shade900,
                          child: Icon(Icons.arrow_back,color: Colors.white,)
                      ),
                      RaisedButton(
                        onPressed: () => _checkAnswer(true, context),
                        color: Colors.blueGrey.shade900,
                        child: Text(
                          "TRUE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () => _checkAnswer(false, context),
                        color: Colors.blueGrey.shade900,
                        child: Text(
                          "FALSE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RaisedButton(
                          onPressed: () => _nextQuestion(),
                          color: Colors.blueGrey.shade900,
                          child: Icon(Icons.arrow_forward,color: Colors.white,)
                      ),

                    ],
                  ),
                  Spacer(),

                ],

              ),
            );
          }
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    setState(() {
      if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
        debugPrint("Correct");
        _updateQuestion();
        final snackBar = SnackBar(
          content: Text("Correct",style: TextStyle(color: Colors.white,fontSize: 18),),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
        );
        Scaffold.of(context).showSnackBar(snackBar);

      } else {
        debugPrint("Wrong");
        _updateQuestion();
        final snackBar = SnackBar(
          content: Text("Incorrect", style: TextStyle(color: Colors.white,fontSize: 18),),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red.shade900,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }
    });
  }
  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

}

