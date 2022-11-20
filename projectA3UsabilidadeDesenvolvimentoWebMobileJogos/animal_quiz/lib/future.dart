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

  Future lerEscreverPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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
