import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './result.dart';
import 'game.dart';

void main() {
  runApp(const Finished());
}

class Finished extends StatelessWidget {
  const Finished({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MinhaPaginaPrincipal(),
    );
  }
}

class MinhaPaginaPrincipal extends StatefulWidget {
  const MinhaPaginaPrincipal({super.key});

  @override
  State<MinhaPaginaPrincipal> createState() => _MinhaPaginaPrincipalState();
  //Cria o estado mutável para este widget em um determinado local na árvore.
}

class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {
  int contadorApp = 0;

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Este quiz foi acessado ' +
                      contadorApp.toString() +
                      ' vezes.',
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Game())));
                  },
                  child: Text("Jogar Novamente"),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                )
              ],
            ),
          ),
        ));
  }

  //Future determina que uma função irá retornar algo no “futuro”, ou seja, é uma função que levará um tempo até ser finalizada.
  Future lerEscreverPreferencias() async {
    //determina que um método será assíncrono, ou seja, não irá retornar algo imediatamente,
    //então o aplicativo pode continuar a execução de outras tarefas enquanto o processamento não é finalizado.

    //Envolve o armazenamento persistente específico da plataforma para dados simples,Os dados podem ser mantidos no disco de forma assíncrona

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //serve para determinar que o aplicativo deve esperar uma resposta de uma função antes de continuar a execução.
    //Isso é muito importante pois há casos em que uma função depende do retorno de outra.

    int? valorSalvo = prefs.getInt('contadorApp');
    if (valorSalvo == null) {
      contadorApp = 1;
    } else {
      contadorApp = valorSalvo;
      contadorApp++;
    }
    //Salvar o contadorApp no armazenamento offline
    await prefs.setInt('contadorApp', contadorApp);

    // Como é dinâmico é necessário esse método para atualizar o valor de alguma variável
    setState(() {
      contadorApp = contadorApp;
    });
  }

  @override
  void initState() {
    lerEscreverPreferencias();
    super.initState();
  }
}
