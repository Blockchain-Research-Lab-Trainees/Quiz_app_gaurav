import 'package:flutter/material.dart';
import 'package:flutter_application_1/answer_button.dart';
import 'package:flutter_application_1/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';


class QuestionsScreen extends StatefulWidget{
 const QuestionsScreen({super.key, required this.onSelectAnswer});
 
 final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
   return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
var currentQuestionIndex = 0;

void answerQuestion(String selectedAnswer){
  widget.onSelectAnswer(selectedAnswer);
setState(() {
  currentQuestionIndex = currentQuestionIndex + 1;

});



}


@override
  Widget build(BuildContext context) {
final currentQuestion = questions[currentQuestionIndex];

 return SizedBox(
  width: double.infinity, //take entire width or whole screen
   child: Container(
    margin: const EdgeInsets.all(15),
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.stretch ,
      children: [
          Text(
            textAlign: TextAlign.center,
          currentQuestion.text ,
           style:GoogleFonts.croissantOne(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
           ),
         ),
         const  SizedBox(height: 40, width: 100,),
   
         ...currentQuestion.getShuffledAnswers().map((answer){
   
          return AnswerButton(answerText: answer,onTap :(){
            answerQuestion(answer);

          },
          );
         })
         
            
    
     ],
     ),
   ),
 );


       
       
 
   
 
  }

}

