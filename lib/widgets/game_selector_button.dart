import 'package:flutter/material.dart';
import 'package:upstrivia/providers/trivia_provider.dart';
import 'package:provider/provider.dart';

class GameSelectorButton extends StatelessWidget {
  final String title;
  final Color color;
  final String gameUuid;
  const GameSelectorButton({Key? key, required this.title, required this.color, required this.gameUuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TriviaProvider>(context);

    return InkWell(
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ),
      onTap: () async {
        await provider.getQuestionOfCategories(gameUuid);
        Navigator.of(context).pushReplacementNamed('QuestionPage');
      },
    );
  }
}
