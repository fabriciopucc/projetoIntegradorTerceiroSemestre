import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../widgets/snackbar_widget.dart';
import '../providers/sessao_provider.dart';
import 'tela_jogo.dart';

class TelaNovoJogo extends StatefulWidget {
  const TelaNovoJogo({super.key});

  @override
  State<TelaNovoJogo> createState() =>
      _TelaNovoJogoState();
}

class _TelaNovoJogoState
    extends State<TelaNovoJogo> {

  final TextEditingController nomeController =
      TextEditingController();

  final collection = FirebaseFirestore.instance.collection('saves');

  Future<void> salvarSave() async {

    String nome = nomeController.text.trim();

    // Validações
    if (nome.length < 4) {
      SnackbarWidget.mostrar(context, 'O nome deve possuir ao menos 4 letras');
      return;
    }

    // Verifica se já existe
    final query = await collection.get();

    bool nomeJaExiste = query.docs.any((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final nomeExistente = (data['nome'] ?? '') .toString() .toLowerCase();

      return nomeExistente == nome.toLowerCase();
    });

    if (nomeJaExiste) {
      SnackbarWidget.mostrar( context, 'Já existe um save com esse nome');

      return;
    }

    // Salvar no firestone
    final novoSave =
        await collection.add({
      'nome': nome,
      'pontuacao': 0,
      'niveis_desbloqueados': []
    });

    // Cria sessão
    Provider.of<SessaoProvider>(
      context,
      listen: false,
    ).carregarSave(
      novoSaveId: novoSave.id,
      novoNome: nome,
      novaPontuacao: 0,
      novoNiveisDesbloqueados: []
    );

    // Sucesso
    SnackbarWidget.mostrar(context, 'Save criado com sucesso!');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const TelaJogo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(
        title: const Text('Novo jogo'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Criar Novo Save",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Save',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvarSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255,138,18,236),
                  padding:const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),

                child: const Text(
                  'Criar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}