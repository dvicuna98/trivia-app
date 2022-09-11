import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upstrivia/widgets/widgets.dart';
import 'package:upstrivia/providers/trivia_provider.dart';
import 'package:provider/provider.dart';
import 'package:upstrivia/models/models.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int counter =0;
  List attempts = [] ;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TriviaProvider>(context);
    bool hasAnswerSelected = false;

    addAnswerSelected (String answerId){
      if(!hasAnswerSelected){
        // Attempt(questionId: provider.questionsList[counter]['uuid'], answerId: answerId)
        attempts.add({
          "question_id":provider.questionsList[counter]['uuid'],
          "answer_id":answerId
        });
      }
      hasAnswerSelected = true;

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiempo de responder',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pregunta ${counter+1}',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
            Text(provider.questionsList[counter]['question']),
            const SizedBox(
              height: 30,
            ),
            CustomAnswerButton(
                answer: provider.questionsList[counter]['answers'][0]['answer'],
                correct: provider.questionsList[counter]['answers'][0]['is_correct'],
              uuid: provider.questionsList[counter]['answers'][0]['uuid'],
              callback:(answerId)=> addAnswerSelected(answerId),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAnswerButton(
                answer: provider.questionsList[counter]['answers'][1]['answer'],
                correct: provider.questionsList[counter]['answers'][1]['is_correct'],
              uuid: provider.questionsList[counter]['answers'][1]['uuid'],
              callback:(answerId)=> addAnswerSelected(answerId),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAnswerButton(
                answer: provider.questionsList[counter]['answers'][2]['answer'],
                correct: provider.questionsList[counter]['answers'][2]['is_correct'],
              uuid: provider.questionsList[counter]['answers'][2]['uuid'],
              callback:(answerId)=> addAnswerSelected(answerId),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAnswerButton(
                answer: provider.questionsList[counter]['answers'][3]['answer'],
                correct: provider.questionsList[counter]['answers'][3]['is_correct'],
              uuid: provider.questionsList[counter]['answers'][3]['uuid'],
              callback:(answerId)=> addAnswerSelected(answerId),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  if(counter <9){
                    counter +=1;
                  }
                  hasAnswerSelected = false;
                  setState(() {});
                  if(counter ==9){
                    provider.postGameAnswer(attempts);
                    Navigator.of(context).pushNamed('HomePage');
                  }

                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Center(child: Text('Continuar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                )
            )
          ],
        ),
      ),
    );
  }
}
