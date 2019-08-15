import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(QuizzerApp());

class QuizzerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MainApp(),
          ),
        ),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  int limit = 11;
  List<Question> questions = [
    Question(question: 'Parent constructors are not called implicitly if the child class defines a constructor?', answer: true),
    Question(question: 'Interface constant can be override in class implementing the interface.', answer: false),
    Question(question: 'Static methods can be call with class name and colon operator, \"this\" is not available inside the method declared as static.',  answer: true),
    Question(question: 'Static properties can be accessed through the object using the arrow operator \"->\".', answer: false),
    Question(question: 'If parent class has Final method abc(). Method abc() can be overridden in child class.', answer: false),
    Question(question: 'In PHP, a class can be inherited from one base class and with multiple base classes.', answer: false),
    Question(question: 'To create instance of class \"new\" keyword is not required.', answer: false),
    Question(question: '\"this\" is a reference to the calling object', answer: true),
    Question(question: 'The variable name is case-sensitive in PHP.', answer: true),
    Question(question: 'PHP is an open source software', answer: true),
    Question(question: 'A function cannot be defined inside another function', answer: true),
    Question(question: 'Functions cannot return more than one value at a time', answer: true)
  ];
  List<Icon> score = [];
  int marks = 0;

  void checkAnswer({bool answer}){
    if(index < questions.length - 1) {
      setState(() {
        if (questions[index].answer == answer) {
          score.add(Icon(Icons.check, color: Colors.green,));
          marks++;
        } else {
          score.add(Icon(Icons.close, color: Colors.red,));
        }
        index++;
      });
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Congradulations!",
        desc: "Your score is $marks",
        buttons: [
          DialogButton(
            child: Text(
              "Retake",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                index = 0;
                marks = 0;
                score.clear();
              });
            },
            width: 120,
          )
        ],
      ).show();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[index].question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(answer: true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(answer: false);
              },
            ),
          ),
        ),
        Row(
            children: score,
          ),
        ]
    );
  }
}
