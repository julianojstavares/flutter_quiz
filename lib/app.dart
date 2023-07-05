import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/questionario.dart';
import 'package:flutter_quiz/resultado.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _perguntaSelecionada = 0;
  int _notaFinal = 0;
  final _perguntas = const [
    {
      'texto': "Pergunta 1",
      'respostas': [
        {"texto": 'r1', "nota": 0},
        {"texto": 'r2', "nota": 0},
        {"texto": 'r3', "nota": 0},
        {"texto": 'r4', "nota": 0},
      ]
    },
    {
      'texto': "Pergunta 2",
      'respostas': [
        {"texto": 'r1', "nota": 0},
        {"texto": 'r2', "nota": 0},
        {"texto": 'r3', "nota": 0},
        {"texto": 'r4', "nota": 0},
      ]
    },
    {
      'texto': "Pergunta 3",
      'respostas': [
        {"texto": 'r1', "nota": 0},
        {"texto": 'r2', "nota": 0},
        {"texto": 'r3', "nota": 0},
        {"texto": 'r4', "nota": 0},
      ]
    },
    {
      'texto': "Pergunta 4",
      'respostas': [
        {"texto": 'r1', "nota": 0},
        {"texto": 'r2', "nota": 0},
        {"texto": 'r3', "nota": 0},
        {"texto": 'r4', "nota": 0},
      ]
    },
  ];

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaFinal += pontos;
      });
      if (kDebugMode) {
        print("Nota Final $_notaFinal");
      }
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
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
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : const Resultado(),
      ),
    );
  }
}
