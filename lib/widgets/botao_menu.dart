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
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return const Color.fromARGB(255, 113, 13, 195);
              }
              return const Color.fromARGB(255, 138, 18, 236);
            },
          ),
          fixedSize: WidgetStateProperty.all(const Size(200, 40)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => telaDestino),
          );
        },
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}