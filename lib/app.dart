import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/questao.dart';
import 'package:flutter_quiz/resposta.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Pergunta 1",
      'respostas': ['r1', 'r2', 'r3', 'r4']
    },
    {
      'texto': "Pergunta 2",
      'respostas': ['r1', 'r2', 'r3', 'r4']
    },
    {
      'texto': "Pergunta 3",
      'respostas': ['r1', 'r2', 'r3', 'r4']
    },
    {
      'texto': "Pergunta 4",
      'respostas': ['r1', 'r2', 'r3', 'r4']
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
      if (kDebugMode) {
        print("Pergunta selecionada $_perguntaSelecionada");
      }
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Quiz'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: temPerguntaSelecionada
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas
                      .map((texto) => Resposta(texto, _responder))
                      .toList(),
                ],
              )
            : null,
      ),
    );
  }
}
