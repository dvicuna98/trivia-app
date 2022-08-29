import 'package:flutter/material.dart';

class GameSelectorButton extends StatelessWidget {
  final String title;
  final Color color;
  const GameSelectorButton({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      onTap: (){
        Navigator.of(context).pushReplacementNamed('QuestionPage');
      },
    );
  }
}
