import 'package:flutter/material.dart';
import 'package:upstrivia/widgets/widgets.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {

    const int counter =1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiempo de responder',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pregunta ${counter}',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
            const Text('Que idioma es mas hablado en suiza'),
            const SizedBox(
              height: 30,
            ),
            const CustomAnswerButton(answer: 'Opcion 1 ', correct: false),
            const SizedBox(
              height: 20,
            ),
            const CustomAnswerButton(answer: 'Opcion 2 ', correct: true),
            const SizedBox(
              height: 20,
            ),
            const CustomAnswerButton(answer: 'Opcion 3 ', correct: false),
            const SizedBox(
              height: 20,
            ),
            const CustomAnswerButton(answer: 'Opcion 4 ', correct: false),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('QuestionPage');
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
