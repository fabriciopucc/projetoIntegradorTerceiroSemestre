import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:void_riddles/models/localizacao_model.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';
import 'package:void_riddles/widgets/snackbar_widget.dart';

import '../providers/sessao_provider.dart';

import 'jogo_screen.dart';

class CarregarJogoScreen extends StatelessWidget {
  const CarregarJogoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final collection = FirebaseFirestore.instance.collection('saves');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saves'),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar saves'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {

            return const Center(
              child: Text('Nenhum save encontrado'),
            );
          }

          final colletion = snapshot.data!.docs;

          return ListView.builder(
            itemCount: colletion.length,
            itemBuilder: (context, index) {

              final doc = colletion[index];
              final data = doc.data() as Map<String, dynamic>;
              final nome = data['nome'] ?? 'Sem nome';
              final pontuacao = data['pontuacao'] ?? 0;
              final List<int> niveisDesbloqueados = List<int>.from(
                data['niveis_desbloqueados'] ?? [],
              );
              final finalizado = data['finalizado'] ?? false;
              final fase = pontuacao + 1;

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(nome.toString(), style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),),

                  subtitle: Text(
                    finalizado
                        ? "Finalizado"
                        : niveisDesbloqueados.contains(pontuacao)
                            ? listaLocalizacoes[pontuacao].nome
                            : "Procurando local fase $fase",

                    style: TextStyle(
                      color: finalizado
                          ? const Color.fromARGB(255, 19, 186, 105)
                          : const Color.fromARGB(255, 75, 74, 74),
                    ),
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botão carregar
                      ElevatedButton(
                        onPressed: () {
                          final global = Provider.of<VariaveisGlobaisProvider>(context, listen: false);
                          
                          global.alterarExibirQuiz(false);
                          global.alterarExibirPuzzle(false);
                          global.alterarExibirBotaoAvancarFase(false);
                          global.alterarExibirCutscene(true);
                          if(pontuacao == 0) global.alterarExibirCutsceneInicial(true);
                          global.alterarExibirBossBattle(false);

                          Provider.of<SessaoProvider>(context, listen: false).carregarSave(
                            novoSaveId: doc.id,
                            novoNome: nome,
                            novaPontuacao: pontuacao,
                            novoNiveisDesbloqueados: niveisDesbloqueados,
                            novoFinalizado: finalizado
                          );
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const JogoScreen()),
                          );
                        },
                        child: const Text('Carregar'),
                      ),

                      const SizedBox(width: 8),

                      // Botão apagar
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () async {
                          try {
                            // Apaga documento
                            await collection.doc(doc.id).delete();
                            SnackbarWidget.mostrar(context,  '$nome apagado');
                          } catch (e) {
                            SnackbarWidget.mostrar(context,  'Erro ao apagar save');
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}