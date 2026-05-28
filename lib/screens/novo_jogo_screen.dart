import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';

import '../widgets/snackbar_widget.dart';
import '../providers/sessao_provider.dart';
import 'jogo_screen.dart';

class NovoJogoScreen extends StatefulWidget {
  const NovoJogoScreen({super.key});

  @override
  State<NovoJogoScreen> createState() => _NovoJogoScreenState();
}

class _NovoJogoScreenState extends State<NovoJogoScreen> {

  final TextEditingController nomeController = TextEditingController();

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
      SnackbarWidget.mostrar(context, 'Já existe um save com esse nome');

      return;
    }

    final global = Provider.of<VariaveisGlobaisProvider>(context, listen: false);
                          
    global.alterarExibirQuiz(false);
    global.alterarExibirPuzzle(false);
    global.alterarExibirBotaoAvancarFase(false);
    global.alterarExibirCutscene(true);
    global.alterarExibirCutsceneInicial(true);
    global.alterarExibirBossBattle(false);

    // Salvar no firestone
    final novoSave = await collection.add({
      'nome': nome,
      'pontuacao': 0,
      'niveis_desbloqueados': [],
      'finalizado': false
    });

    // Cria sessão
    Provider.of<SessaoProvider>(
      context,
      listen: false,
    ).carregarSave(
      novoSaveId: novoSave.id,
      novoNome: nome,
      novaPontuacao: 0,
      novoNiveisDesbloqueados: [],
      novoFinalizado: false
    );

    // Sucesso
    SnackbarWidget.mostrar(context, 'Save criado com sucesso!');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const JogoScreen(),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  fixedSize: const Size(200, 45),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: salvarSave,
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
                      "Criar",
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
            ),
          ],
        ),
      ),
    );
  }
}