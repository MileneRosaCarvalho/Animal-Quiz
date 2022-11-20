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

  @override
  Widget build(BuildContext context) {
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
