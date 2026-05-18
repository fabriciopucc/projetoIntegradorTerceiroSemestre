import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_projeto_integrador/models/dialogo.dart';
import 'package:rpg_projeto_integrador/providers/sessao_provider.dart';
import 'package:rpg_projeto_integrador/services/dialogo_service.dart';

class WidgetDialogos extends StatefulWidget {
  final List<Dialogo> dialogos;
  final int indice;

  const WidgetDialogos({
    super.key,
    required this.dialogos,
    required this.indice
  });

  @override
  State<WidgetDialogos> createState() => _WidgetDialogosState();
}

class _WidgetDialogosState extends State<WidgetDialogos> {
  final DialogoService service = DialogoService();

  void atualizarDialogo() {
    setState(() {
      service.proximoDialogo(widget.dialogos);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool iniciou = service.iniciouDialogo();
    final dialogoAtual = service.dialogoAtual(widget.dialogos);

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
                      backgroundColor:Color.fromARGB(255, 0, 182, 76),
                      foregroundColor:Colors.white,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    onPressed: atualizarDialogo,
                    child: const Text("Iniciar diálogo"),
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
        children: [
          if (esquerda) _iconePersonagem(dialogo.autor),

          const SizedBox(width: 5),

          Card(
            elevation: 4,
            child: Container(
              width: 220,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    dialogo.autor,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    dialogo.texto,
                    style: const TextStyle(fontSize: 16),
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
      (autor.toLowerCase() == "alfa") ? "alfa.png" 
    : (autor.toLowerCase() == "beta") ? "beta.png"
    : (autor.toLowerCase() == "gama") ? "gama.png"
    : "delta.png";

    return Image.asset(
      'lib/assets/images/$img',
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }
}