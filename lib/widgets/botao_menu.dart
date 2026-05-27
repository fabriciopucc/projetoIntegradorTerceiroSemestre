import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoMenu extends StatelessWidget {
  final String texto;
  final Widget telaDestino;

  const BotaoMenu({
    super.key,
    required this.texto,
    required this.telaDestino,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          fixedSize: const Size(200, 45),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => telaDestino),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFA855F7),
                Color(0xFF7E22CE),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: const Color.fromARGB(255, 154, 5, 228),
              width: 3,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}