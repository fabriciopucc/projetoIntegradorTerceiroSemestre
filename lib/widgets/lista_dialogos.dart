import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/dialogo.dart';
import 'package:rpg_projeto_integrador/services/dialogo_service.dart';

class WidgetDialogos extends StatefulWidget {
  final List<Dialogo> dialogos;

  const WidgetDialogos({
    super.key,
    required this.dialogos,
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

    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iniciou && dialogoAtual != null)
            _buildDialogo(dialogoAtual),

          const SizedBox(height: 20),

          if (!iniciou)
            ElevatedButton(
              onPressed: atualizarDialogo,
              child: const Text("Iniciar diálogo"),
            ),
        ],
      ),
    );
  }

  Widget _buildDialogo(Dialogo dialogo) {
    final bool esquerda = dialogo.lado == "esquerdo";

    return GestureDetector(
      onTap: atualizarDialogo,
      child: Row(
        mainAxisAlignment: esquerda ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (esquerda) _iconePersonagem(),

          const SizedBox(width: 10),

          Card(
            elevation: 4,
            child: Container(
              width: 220,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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

                  const SizedBox(height: 10),

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

          if (!esquerda) _iconePersonagem(),
        ],
      ),
    );
  }

  Widget _iconePersonagem() {
    return const CircleAvatar(
      radius: 25,
      child: Icon(Icons.person),
    );
  }
}