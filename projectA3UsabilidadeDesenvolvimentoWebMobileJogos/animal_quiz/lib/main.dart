import "package:flutter/material.dart";
import 'package:animal_quiz/future.dart';
import 'package:animal_quiz/home.dart';
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';
import 'game.dart';
import 'future.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // Sintaxe para declarar parâmetros opcionais,  : super(key: key) é um separador que especifica a lista inicializadora.

  @override
  Widget build(BuildContext context) {
    //Um identificador para a localização de um widget na árvore de widgets.
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        'Game': (context) => Game(),
        'MinhaPaginaPrincipal': (context) => MinhaPaginaPrincipal(),
      },
    );
  }
}
