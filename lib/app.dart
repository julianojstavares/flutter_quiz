import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void responder() {
    if (kDebugMode) {
      print("Pergunta respondida");
    }
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      "pergunta 1",
      "pergunta 2",
    ];

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(perguntas[0]),
            ElevatedButton(
              onPressed: responder,
              child: const Text("Resposta 1"),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text("Resposta 2"),
            ),
            ElevatedButton(
              onPressed: responder,
              child: const Text("Resposta 3"),
            ),
          ],
        ),
      ),
    );
  }
}
