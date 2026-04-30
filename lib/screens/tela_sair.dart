import 'package:flutter/material.dart';

class TelaSair extends StatelessWidget {
  const TelaSair({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), 
        backgroundColor: const Color.fromARGB(255, 138, 18, 236),
      ),
      body: Center(
        child: Text(
          "Tela de Sair",
          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
