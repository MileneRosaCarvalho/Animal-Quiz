import 'package:flutter/material.dart';
import './question.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'future.dart';

class Result extends StatelessWidget {
  final double resultScore;
  final VoidCallback resetHandler;
  //Assinatura de callbacks que não possuem argumentos e não retornam dados.

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    final score = num.parse(resultScore.toStringAsFixed(2));

    if (score <= 10.00) {
      resultText =
          'Você tentou e marcou $score pontos !';
    } else if (score > 10.00 && score <= 25.00) {
      resultText =
          'Você tentou e marocu $score ponros !';
    } else if (score > 25.00 && score <= 40.00) {
      resultText =
          'Você entendeu e marcou $score pontos !';
    } else {
      resultText =
          'Parabéns! Você marcou $score pontos !';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 360,
                      child: Question(
                        resultPhrase,
                      ),
                    )),
                ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'Finalizar',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => MinhaPaginaPrincipal())));
                  },
                )
              ],
            )));
  }
}
