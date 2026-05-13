import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:rpg_projeto_integrador/models/localizacao.dart';

import '../providers/sessao_provider.dart';

import 'tela_jogo.dart';

class TelaCarregarJogo extends StatelessWidget {
  const TelaCarregarJogo({super.key});

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
              final fase = pontuacao + 1;

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(nome.toString(), style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),),

                  subtitle: Text(
                    niveisDesbloqueados.contains(pontuacao) 
                      ?  listaLocalizacoes[pontuacao].nome 
                      : "Procurando local fase $fase",
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // Botão carregar
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<SessaoProvider>(context, listen: false).carregarSave(
                            novoSaveId: doc.id,
                            novoNome: nome,
                            novaPontuacao: pontuacao,
                            novoNiveisDesbloqueados: niveisDesbloqueados
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const TelaJogo()),
                          );
                        },
                        child: const Text('Carregar'),
                      ),

                      const SizedBox(width: 8),

                      // Botão apagar
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () async {

                          try {
                            // Apaga documento
                            await collection.doc(doc.id).delete();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$nome apagado',
                                ),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(
                                content: Text(
                                  'Erro ao apagar save',
                                ),
                              ),
                            );
                          }
                        },

                        child: const Text(
                          'Apagar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
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