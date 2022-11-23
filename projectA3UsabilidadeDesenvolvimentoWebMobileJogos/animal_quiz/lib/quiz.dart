import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  
  final List<Map<String, Object>> data;
  // Lista de mapas. Ela permite que você insira um conjunto de chaves e valores formando uma estrutura.
  final int indexQuestion;
  final Function answerQuestion;

   Quiz(
      {required this.data,
      required this.answerQuestion,
      required this.indexQuestion,
      Key? key})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(

            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: 350,
              child: Question(
                data[indexQuestion]['questionText'] as String,
              ),
            )),
        ...(data[indexQuestion]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList(),
      ],
    );
  }

    




}
