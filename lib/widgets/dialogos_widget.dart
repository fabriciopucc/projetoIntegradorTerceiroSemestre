import 'package:flutter/material.dart';
import 'package:void_riddles/models/dialogo_model.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';

class DialogosWidget extends StatefulWidget {
  final List<Dialogo> dialogos;
  final VariaveisGlobaisProvider global;
  final int indice;

  const DialogosWidget({
    super.key,
    required this.dialogos,
    required this.global,
    required this.indice
  });

  @override
  State<DialogosWidget> createState() => _DialogosWidgetState();
}

class _DialogosWidgetState extends State<DialogosWidget> {
  void atualizarDialogo() {
    setState(() {
      widget.global.proximoDialogo(widget.dialogos, widget.indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool iniciou = widget.global.iniciouDialogo();
    final dialogoAtual = widget.global.dialogoAtual(widget.dialogos);

    final bool mostrarOverlay = iniciou && dialogoAtual != null;

    return Stack(
      children: [
        if (mostrarOverlay)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

        // ===== CONTEÚDO =====
        Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iniciou && dialogoAtual != null)
                  _buildDialogo(dialogoAtual),

                const SizedBox(height: 20),

                if (!iniciou)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      fixedSize: const Size(200, 45),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: atualizarDialogo,
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
                          ((widget.global.exibirQuiz && [0, 1].contains(widget.indice)) || (widget.global.exibirPuzzle && widget.indice == 3) || (widget.global.exibirBossBattle && widget.indice == 4)) 
                            ? "Retomar diálogo"
                            : "Iniciar diálogo",
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDialogo(Dialogo dialogo) {
    final bool esquerda = dialogo.lado == "esquerdo";

    return GestureDetector(
      onTap: atualizarDialogo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (esquerda) _iconePersonagem(dialogo.autor),

          const SizedBox(width: 5),

          Card(
            elevation: 4,
            child: Container(
              width: 220,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dialogo.autor,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    dialogo.texto,
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Clique para continuar",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          if (!esquerda) _iconePersonagem(dialogo.autor),
        ],
      ),
    );
  }

  Widget _iconePersonagem(String autor) {

    final img = 
      (autor.toLowerCase() == "vector") ? "vector.png"
    : (autor.toLowerCase() == "alfa") ? "alfa.png" 
    : (autor.toLowerCase() == "beta") ? "beta.png"
    : (autor.toLowerCase() == "gama") ? "gama.png"
    : (autor.toLowerCase() == "delta") ? "delta.png"
    : "senhorVazio.png";

    return Image.asset(
      'assets/images/characters/$img',
      height: 200,
      fit: BoxFit.fitHeight,
    );
  }
}