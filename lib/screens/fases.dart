import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/enigma.dart';
import 'package:rpg_projeto_integrador/providers/sessao_provider.dart';
import 'package:rpg_projeto_integrador/widgets/lista_dialogos.dart';

import '../models/localizacao.dart';
import '../models/dialogo.dart';

class Fases {

  static Widget faseWidget({
    required String titulo,
    required Color cor,
    required int indice,
    required List<Dialogo> dialogos,
  }) {
    final localizacao = listaLocalizacoes[indice];

    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius:BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 40,
              fontWeight:FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Text(
            localizacao.nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            'Latitude: ${localizacao.latitude}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Longitude: ${localizacao.longitude}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

           WidgetDialogos(dialogos: dialogos),
        ],
      ),
    );
  }

  static Widget enigma(int indice) {
    
    return Container(
      height: 550,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 181, 231, 179),
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Text(
            "Enigma: ",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30,),

          Text(
            enigmas[indice].texto,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  // Fase 1
  static Widget fase_1() {

    return faseWidget(
      titulo: 'FASE 1',
      cor: Colors.red.shade200,
      indice: 0,
      dialogos: listaDeDialogos[0]
    );
  }

  // Fase 2
  static Widget fase_2() {

    return faseWidget(
      titulo: 'FASE 2',
      cor: Colors.orange.shade200,
      indice: 1,
      dialogos: listaDeDialogos[1]
    );
  }

  // FAse 3
  static Widget fase_3() {

    return faseWidget(
      titulo: 'FASE 3',
      cor: Colors.yellow.shade200,
      indice: 2,
      dialogos: listaDeDialogos[1]
    );
  }

  // Fase 4
  static Widget fase_4() {

    return faseWidget(
      titulo: 'FASE 4',
      cor: Colors.green.shade200,
      indice: 3,
      dialogos: listaDeDialogos[1]
    );
  }

  // Fase 5
  static Widget fase_5() {

    return faseWidget(
      titulo: 'FASE 5',
      cor: Colors.blue.shade200,
      indice: 4,
      dialogos: listaDeDialogos[1]
    );
  }

  // Renderizar fase
  static Widget renderizarFase(SessaoProvider sessao) {

    if (sessao.pontuacao == 0 && sessao.niveisDesbloqueados.contains(0)) return fase_1();
    if (sessao.pontuacao == 1 && sessao.niveisDesbloqueados.contains(1)) return fase_2();
    if (sessao.pontuacao == 2 && sessao.niveisDesbloqueados.contains(2)) return fase_3();
    if (sessao.pontuacao == 3 && sessao.niveisDesbloqueados.contains(3)) return fase_4();
    if (sessao.pontuacao == 4 && sessao.niveisDesbloqueados.contains(4)) return fase_5();

    return enigma(sessao.pontuacao);
  }
}