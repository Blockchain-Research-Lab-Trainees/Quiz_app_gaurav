import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/question_screen.dart';
import 'package:flutter_application_1/result_screen.dart';
import 'package:flutter_application_1/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
 
  @override
  State<Quiz> createState() {
  return _QuizState();
  }

}

class _QuizState extends State<Quiz>{
 List<String> selectedAnswers =[];
var activeScreen = 'start-screen';

void switchScreen(){

setState(() {
  
});(() {
activeScreen ='start-screen';

}

);

}
void chooseAnswer(String answer){
selectedAnswers.add(answer);

if(selectedAnswers.length == questions.length){
  setState(() {
    
    activeScreen='results-screen';
  });
}

}

void restartQuiz(){
  setState(() {
    
    selectedAnswers =[];
    activeScreen = 'question-screen';
  });
}
@override
Widget build(context) {
Widget screenWidget =StartScreen(switchScreen);
if(activeScreen ==  'questions-screen') {

screenWidget = QuestionsScreen(onSelectAnswer:chooseAnswer);

}
 if(activeScreen=='results-screen'){
  screenWidget= ResultScreen(
    chosenAnswers:selectedAnswers ,
    onRestart: restartQuiz,
  );
 } 

  return  MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:  [
                 Color.fromARGB(255, 94, 5, 5),
                 Color.fromARGB(255, 167, 100, 160),
                Color.fromARGB(255, 2, 79, 61),
                Color.fromARGB(255, 20, 52, 44),
                Color.fromARGB(255, 4, 20, 17),
                 Color.fromARGB(255, 50, 6, 46),
                Color.fromARGB(255, 94, 5, 5)
              ],
              begin: Alignment.centerRight,
              end: Alignment.bottomRight,
              ),
          ),
          child:screenWidget,
          
            
          
        ),
   ),
   ) ;
}

}