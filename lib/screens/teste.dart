import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/pergunta_quiz.dart';
import 'package:rpg_projeto_integrador/widgets/quiz_widget.dart';

import '../widgets/botao_menu.dart';

class TelaTeste extends StatefulWidget {
  const TelaTeste({super.key});

  @override
  State<TelaTeste> createState() => _TelaTesteState();
}

class _TelaTesteState extends State<TelaTeste> {

  @override
  Widget build(BuildContext context) {

    bool exibir = true;

    return Scaffold(
      body: Center(
        child: Row(
          children: [
  /// Subsolo
  Icon(
    Icons.keyboard_double_arrow_down,
    color: Color.fromARGB(255, 191, 94, 255),
  ),

  /// Térreo
  Icon(
    Icons.home,
    color: Color.fromARGB(255, 191, 94, 255),
  ),

  /// 1º andar
  Icon(
    Icons.looks_one,
    color: Color.fromARGB(255, 168, 67, 235),
  ),

  /// 2º andar
  Icon(
    Icons.looks_two,
    color: Color.fromARGB(255, 162, 48, 238),
  ),

  /// 3º andar
  Icon(
    Icons.looks_3,
    color: Color.fromARGB(255, 166, 54, 241),
  ),
],
        )
      ),
    );
  }
}