import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';
import 'game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'future.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Um identificador para a localização de um widget na árvore de widgets.
    return MaterialApp(
      //O MaterialApp é um widget de conveniência que envolve vários widgets
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        //Um widget responsável por criar um layout “padrão” para o app, contendo uma appBar e o conteúdo da tela.
        appBar: AppBar(
          //Uma barra de aplicativos do Material Design.
          title: Center(
            child: Text('Animal Quiz'),
            //A criança contida pelo contêiner.
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



