import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';
import 'game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'future.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  get answerQuestion => null;
  get data => List<Map<String, Object>>;
  get indexQuestion => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Animal Quiz'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/image/logo.png'),
              //FlutterLogo(size: 300),
            
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Game');
                },
                child: Text('Jogar', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



