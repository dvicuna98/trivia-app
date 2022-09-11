import 'package:flutter/material.dart';

class CustomAnswerButton extends StatefulWidget {

  final String answer;
  final bool correct;
  final String uuid;
  final Function(String) callback;
  const CustomAnswerButton({Key? key, required this.answer, required this.correct, required this.uuid, required this.callback}) : super(key: key);

  @override
  State<CustomAnswerButton> createState() => _CustomAnswerButtonState();
}

class _CustomAnswerButtonState extends State<CustomAnswerButton> {
  bool selected = false;

  @override
  void didUpdateWidget(covariant oldWidget){
    super.didUpdateWidget(oldWidget);
    selected = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: (){
        selected = true;
        print("callback?");
        print(widget.uuid);
        widget.callback(widget.uuid);
        setState(() {});

      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
              color: selected ? widget.correct ? Colors.green : Colors.red :Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(widget.answer),
          ),
        )
      ),
    );
  }
}
