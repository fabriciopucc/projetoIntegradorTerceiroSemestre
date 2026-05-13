import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Center(
        child: Text(
          "Tela de Configurações",
          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
