import 'package:flutter/material.dart';
import 'package:void_riddles/models/pergunta_quiz_model.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';

class QuizWidget extends StatefulWidget {
  final List<PerguntaQuiz> perguntas;
  final VariaveisGlobaisProvider global;

  const QuizWidget({
    super.key,
    required this.perguntas,
    required this.global
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int perguntaAtual = 0;

  /// Alternativa errada clicada
  int? alternativaErrada;

  bool bloqueado = false;

  PerguntaQuiz get pergunta => widget.perguntas[perguntaAtual];

  Future<void> responder(int alternativa) async {
    if (bloqueado) return;

    bloqueado = true;

    /// Acertou
    if (alternativa == pergunta.correta) {
      /// Última pergunta
      if (perguntaAtual == widget.perguntas.length - 1) {
        widget.global.alterarExibirQuiz(false);
        widget.global.alterarExibirBotaoAvancarFase(true);
      } else {
        setState(() {
          perguntaAtual++;
        });
      }
    }

    /// Errou
    else {
      setState(() {
        alternativaErrada = alternativa;
      });

      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        alternativaErrada = null;
      });
    }

    bloqueado = false;
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(30),
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
              pergunta.pergunta,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            _alternativa(
              texto: pergunta.alternativa1,
              indice: 1,
            ),

            const SizedBox(height: 12),

            _alternativa(
              texto: pergunta.alternativa2,
              indice: 2,
            ),

            const SizedBox(height: 12),

            _alternativa(
              texto: pergunta.alternativa3,
              indice: 3,
            ),

            const SizedBox(height: 12),

            _alternativa(
              texto: pergunta.alternativa4,
              indice: 4,
            ),
          ],
        ),
      )
    );
  }

  Widget _alternativa({
    required String texto,
    required int indice,
  }) {
    final bool errada = alternativaErrada == indice;

    return GestureDetector(
      onTap: () => responder(indice),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: errada
                ? Colors.red
                : const Color(0xFF6C3483),
            width: 2,
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Color.fromARGB(255, 229, 229, 229),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}