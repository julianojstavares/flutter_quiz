import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int total;
  final Function() reiniciar;

  const Resultado({super.key, required this.total, required this.reiniciar});

  String get texto {
    if (total == 0) {
      return "Sua nota é $total";
    } else if (total < 2) {
      return "Você acertou $total questão";
    } else {
      return "Parabéns! \n Você acertou $total questões";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: reiniciar,
          child: const Text("Reiniciar"),
        ),
      ],
    );
  }
}
