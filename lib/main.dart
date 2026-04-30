import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/tela_inicial.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 250, 246, 252),
        textTheme: GoogleFonts.orbitronTextTheme(),
      ),
      home: const TelaInicial(),
    );
  }
}
