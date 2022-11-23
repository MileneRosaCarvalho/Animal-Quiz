import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    
    return _GameState();
  }
}

class _GameState extends State<Game> {
  static const _data = [
    {
      'questionText':
          'Marque qual impacto ambiental causado no ecossistemas pelo homem e que não representa as consequências do desmatamento',
      'answers': [
        {'text': 'Aumento do nível de chuvas.', 'score': 10.00},
        {'text': 'Enchentes e assoreamento dos rio', 'score': 4.61},
        {'text': 'Erosão e empobrecimento dos solos.', 'score': 1.95},
        {'text': 'Destruição da biodiversidade', 'score': 0.01},
      ]
    },   
    {
      'questionText':
          'Como preservar árvores e florestas?',
      'answers': [
        {'text': 'Construindo uma casa na árvore.', 'score': 2.3},
        {'text': 'Reutilizando metais e vidros.', 'score': 0.32},
        {'text': 'Indo em parques.', 'score': 3.00},
        {'text': 'Reciclando papéis, jornais e revistas.', 'score': 10.00},
      ]
    },
    {
      'questionText': 'Qual é o habitat preferido da maioria das espécies de macaco?',
      'answers': [
        {'text': 'Uma casa com vários suportes para se pendurar e muita comida', 'score': 0.64},
        {'text': 'Florestas, savanas e pântanos tropicais', 'score': 10.00},
        {'text': 'Cidades', 'score': 3.28},
        {'text': 'Florestas e savanas temperadas', 'score': 1.02}
      ]
    },
    {
      'questionText': ' Os gases que provocam efeito estufa incluem: ',
      'answers': [
        {'text': 'O Ácido Sulfúrico, o Dióxido de Carbono, o Metano e os CFC', 'score': 0.12},
        {'text': 'O Oxigénio, o Ozono e os Aerossóis', 'score': 2.13},
        {'text': 'O Dióxido de Carbono, o Metano, o Hidrogénio e o Óxido Nitroso', 'score': 6.42},
        {'text': 'O Vapor de Água, o Metano, o Dióxido de Carbono e os CFC', 'score': 10.00}
      ]
    },
    {
      'questionText': 'Qual é o país cujo o símbolo da biodiversidade é a onça-pintada?',
      'answers': [
        {'text': 'Peru', 'score': 5.53},
        {'text': 'Brasil', 'score': 10.00},
        {'text': 'Bolívia', 'score': 2.47},
        {'text': 'México', 'score': 2.35}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      //Ao chamar o método setState(), nosso widget será reconstruído já com o novo valor da variável.
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: Align(
              alignment: 
              Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  : Result(_totalScore, _restart))),
    );
  }
}
