import 'package:flutter/material.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';

class PuzzleWidget extends StatefulWidget {
  final VariaveisGlobaisProvider global;

  const PuzzleWidget({super.key, required this.global});

  @override
  State<PuzzleWidget> createState() => _PuzzleWidgetState();
}

class _PuzzleWidgetState extends State<PuzzleWidget> {
  int? valor1;
  int? valor2;
  int? valor3;
  int? valor4;

  final List<int> opcoes = [1, 2, 3, 4];

  void verificar() {
    final resultado = '${valor1 ?? ''}${valor2 ?? ''}${valor3 ?? ''}${valor4 ?? ''}';

    if (resultado == '3142') {
      widget.global.alterarExibirPuzzle(false);
      widget.global.alterarExibirBotaoAvancarFase(true);
    } else {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A sequência está incorreta!'),
        ),
      );
    }
  }

  Widget caixaSelecao({
    required int? valor,
    required Function(int?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<int>(
        value: valor,
        dropdownColor: Colors.black87,
        underline: const SizedBox(),
        hint: const Text(
          '?',
          style: TextStyle(color: Colors.white),
        ),
        items: opcoes.map((numero) {
          return DropdownMenuItem<int>(
            value: numero,
            child: Text(
              numero.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
  child: IntrinsicWidth(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1135),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF6C3483),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Qual a sequência correta?",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              caixaSelecao(
                valor: valor1,
                onChanged: (v) => setState(() => valor1 = v),
              ),

              const SizedBox(width: 12),

              caixaSelecao(
                valor: valor2,
                onChanged: (v) => setState(() => valor2 = v),
              ),

              const SizedBox(width: 12),

              caixaSelecao(
                valor: valor3,
                onChanged: (v) => setState(() => valor3 = v),
              ),

              const SizedBox(width: 12),

              caixaSelecao(
                valor: valor4,
                onChanged: (v) => setState(() => valor4 = v),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ).copyWith(
              overlayColor: WidgetStateProperty.all(
                Colors.white.withOpacity(0.08),
              ),
            ),
            onPressed: verificar,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child:  Text(
                  'Verificar',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
}