import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scoreKeeper = [
    // Icon(Icons.check,color: Colors.green,),
    // Icon(Icons.close,color: Colors.red,),
    // Icon(Icons.close,color: Colors.red,),
    // Icon(Icons.close,color: Colors.red,),
    // Icon(Icons.close,color: Colors.red,),
  ];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswers = quizBrain.getCorrectAnswer();
    // if (userPickedAnswer == correctAnswers) {
    //   scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    // } else {
    //   scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    // }
    setState(() {
      //using if else check whether we're reached the end of quiz.
      if (quizBrain.isFinished() == true) {
        //show an alert
        //this is the code for the basic alert from the docs for rflutter Alert.
        // Alert(context: context,title: "RFLUTTER", desc: "Flutter is Awesom.").show();

        //modification for our purpose
        Alert(
                context: context,
                title: 'Finished',
                desc: 'your Score is ${quizBrain.totalCorrectAnswer}')
            .show();

        //reset the questionNumber
        quizBrain.reset();
        quizBrain.result();
        //empty out the scorekeeper
        scoreKeeper = [];
      } else {
        //if we wrw not reached the end.
        if (userPickedAnswer == correctAnswers) {
          quizBrain.increaseTotalCorrectCount();
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextquestion();
      }
    });
  }

//   List<String> questions= [
//     'You can lead a cow down stairs but not up stairs.',
//     'Approximately one quarter of human bones are in the feet.',
//     'A slug\'s blood is green.'
//   ];
//   List<bool> answers= [
//     false,
//     true,
//     true
//   ];
// Question q1= Question(q:'You can lead a cow down stairs but not up stairs.', a:false);

  // int questionNumber=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.cyan.shade300,
            title: Center(
                child: Text(
              "QUIZZLER",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      "True",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                      //the user picked true
                      //  bool correctAnswers = quizBrain.getCorrectAnswer();
                      //  if (correctAnswers == true) {
                      //    print("user get it right");
                      //  } else {
                      //    print("user get it wrong");
                      //  }
                      //  // to show the next question of the list
                      //  setState(() {
                      // //   questionNumber++;
                      //    quizBrain.nextquestion();
                      //  });
                    }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      "False",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                      //the user picked flase
                      //    bool correctAnswers= quizBrain.getCorrectAnswer();
                      //    if(correctAnswers==false){
                      //      print("user get it right");
                      //    }else{
                      //      print("user get it wrong");
                      //    }
                      //   setState(() {
                      // //   questionNumber++;
                      //     quizBrain.nextquestion();
                      //   });
                    }),
              ),
            ),
            //Row for score keeper

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ],
        ));
  }
}
