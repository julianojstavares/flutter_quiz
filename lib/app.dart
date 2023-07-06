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
      'texto': "Qual é a linguagem de programação usada pelo Flutter ?",
      'respostas': [
        {"texto": 'Java', "nota": 0},
        {"texto": 'Swift', "nota": 0},
        {"texto": 'Kotlin', "nota": 0},
        {"texto": 'Dart ', "nota": 1},
      ]
    },
    {
      'texto': "O que é um widget no Flutter ?",
      'respostas': [
        {"texto": 'Um elemento de interface do usuário', "nota": 1},
        {"texto": 'Um banco de dados', "nota": 0},
        {"texto": 'Um servidor web', "nota": 0},
        {"texto": 'Um sistema operacional', "nota": 0},
      ]
    },
    {
      'texto': "O que é o hot reload no Flutter ?",
      'respostas': [
        {
          "texto":
              'Uma funcionalidade que mostra alterações no código imediatamente',
          "nota": 1
        },
        {
          "texto": 'Um recurso que permite que você crie layouts responsivos',
          "nota": 0
        },
        {"texto": 'Um widget para exibir imagens', "nota": 0},
        {
          "texto": 'Um banco de dados para armazenar dados do usuário',
          "nota": 0
        },
      ]
    },
    {
      'texto': "Como você adiciona uma imagem a um aplicativo Flutter ?",
      'respostas': [
        {"texto": 'Usando o widget Image.asset ou Image.network', "nota": 1},
        {"texto": 'Usando o widget Text', "nota": 0},
        {"texto": 'Usando o widget Container', "nota": 0},
        {"texto": 'Usando o widget ListView', "nota": 0},
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

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaFinal = 0;
    });
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
            : Resultado(total: _notaFinal, reiniciar: _reiniciar),
      ),
    );
  }
}
