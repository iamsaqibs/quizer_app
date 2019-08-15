import 'package:flutter/material.dart';
import 'questions.dart';

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
  List<Icon> score = [];
  List<String> questions = [
    'Parent constructors are not called implicitly if the child class defines a constructor?',
    'Parent constructors are not called implicitly if the child class defines a constructor.',
    'Interface constant can be override in class implementing the interface.',
    'Static methods can be call with class name and colon operator, \"this\" is not available inside the method declared as static.',
    'Static properties can be accessed through the object using the arrow operator \"->\".',
    'If parent class has Final method abc(). Method abc() can be overridden in child class.',
    'In PHP, a class can be inherited from one base class and with multiple base classes.',
    'To create instance of class \"new\" keyword is not required.',
    '\"this\" is a reference to the calling object',
    'The variable name is case-sensitive in PHP.',
    'PHP is an open source software',
    'A function cannot be defined inside another function',
    'Functions cannot return more than one value at a time',
  ];
  List<bool> answers = [
    true,
    false,
    true,
    false,
    false,
    false,
    false,
    true,
    true,
    true,
    true,
    true,
  ];
  
  void checkAnswer({bool answer}){
    setState(() {
      if(index <= limit){
        if(answer == answers[index]){
          score.add(Icon(Icons.check, color: Colors.green,));
        } else {
          score.add(Icon(Icons.close, color: Colors.red,));
        }

        index++;
      }
    });
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
                questions[index],
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
