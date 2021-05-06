import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

//Run App
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//add '_' to change public class to private

class _MyAppState extends State<MyApp> {
  //mapping
  final questions = const [
    {
      'answerQuestion': 'Question 1',
      'answer': ['Ans 1', 'Ans 2', 'Ans 3'],
    },
    {
      'answerQuestion': 'Question 2',
      'answer': ['Ans 4', 'Ans 5', 'Ans 6'],
    },
    {
      'answerQuestion': 'Question 3',
      'answer': ['Ans 7', 'Ans 8', 'Ans 9'],
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {

    if (_questionIndex < questions.length) {
      print('Next question');
    } else {
      print('No more question');
    }

    setState(() {
      //re-render state
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['answerQuestion'],
            ),

            //get mapping list (answer)
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()

            // Answer(_answerQuestion),

            // RaisedButton(
            //     child: Text('Answer 2'),
            //     //also can use anonymous function
            //     onPressed: () => print('Answer 2')),
            // RaisedButton(
            //     child: Text('Answer 2'),
            //     onPressed: () {
            //       //..//do somthing here`
            //       print('Answer 3');
            //     }),
          ],
        ) : Center(child: Text('Finished !'),
        ),
      ),
    );
  }
}
