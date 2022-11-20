import 'package:flutter/material.dart';


class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( 
      child: SizedBox(
        width: 200,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
  
      style: ButtonStyle(
          //shape: MaterialStateProperty.all(),
          //side: MaterialStateProperty.all(const BorderSide(width: 5,color: Color.fromARGB(255, 255, 255, 255),),),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
      onPressed: selectHandler,    
    );    
  }
}
      