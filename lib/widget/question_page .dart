import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Map<String, dynamic>> questionsAndAnswers = [
    {
      'question': 'What is the old name of Umm Qais??',
      'answers': ['Paris', 'Jidaran', 'Berlin'],
      'correctAnswer': 'Jidaran',
    },
    {
      'question': 'How old is the city of Umm Qais?"?',
      'answers': ['Until 2400 years ago', 'Until 2100 years ago', 'Until 100 years ago'],
      'correctAnswer': 'Until 2400 years ago',
    },

    {
      'question': 'Who lived in Jordan in ancient times?"?',
      'answers': ['Nabataeans, Moabites, Edomites, Byzantines, and Romans.', 'The Ottomans', 'Vikings'],
      'correctAnswer': 'Nabataeans, Moabites, Edomites, Byzantines, and Romans.',
    },
    // Add more questions and answers here
  ];

  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool answered = false;
  int correctCount = 0;
  int incorrectCount = 0;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      answered = true;
      if (answer == questionsAndAnswers[currentQuestionIndex]['correctAnswer']) {
        correctCount++;
      } else {
        incorrectCount++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionsAndAnswers.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        answered = false;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text('You have answered all the questions.\nCorrect: $correctCount\nIncorrect: $incorrectCount'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    restartGame(); // Call restartGame function
                  },
                  child: Text('Restart'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void restartGame() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswer = null;
      answered = false;
      correctCount = 0;
      incorrectCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MainColor,
        title: Text('Question and Answer' ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: MainColor
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              questionsAndAnswers[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18.0 ),
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                questionsAndAnswers[currentQuestionIndex]['answers'].length,
                (index) {
                  String answer =
                      questionsAndAnswers[currentQuestionIndex]['answers'][index];
                  return ElevatedButton(
                    onPressed: () {
                      if (!answered) {
                        checkAnswer(answer);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: selectedAnswer == answer
                          ? MaterialStateProperty.all(MainColor2)
                          : MaterialStateProperty.all(MainColor),
                    ),
                    child: Text(answer,style: TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            answered
                ? Text(
                    selectedAnswer == questionsAndAnswers[currentQuestionIndex]['correctAnswer']
                        ? 'Correct!'
                        : 'Incorrect. The correct answer is: ${questionsAndAnswers[currentQuestionIndex]['correctAnswer']}',
                    style: TextStyle(
                      color: selectedAnswer == questionsAndAnswers[currentQuestionIndex]['correctAnswer']
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MainColor2 

              ),
              
              onPressed: answered ? nextQuestion : null,
              child: Text('Next Question' ,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
