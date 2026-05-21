import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/enigma.dart';
import 'package:rpg_projeto_integrador/providers/sessao_provider.dart';
import 'package:rpg_projeto_integrador/services/progressao_service.dart';
import 'package:rpg_projeto_integrador/widgets/lista_dialogos.dart';

import '../models/localizacao.dart';
import '../models/dialogo.dart';

class Fases {

  static Widget faseWidget({
    required String titulo,
    required Color cor,
    required int indice,
    required List<Dialogo> dialogos,
    required SessaoProvider sessao,
  }) {
    final ProgressaoService progressaoService = ProgressaoService();
    final localizacao = listaLocalizacoes[indice];
    var fase = indice + 1;

    return Container(
      height: 575,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/cena_0$fase.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetDialogos(dialogos: dialogos, indice: indice),

          ElevatedButton(
            onPressed: () async {
              await progressaoService.alterarPontuacao(sessao, "aumentar");
            },

            child: const Text('Avançar fase'),
          ),
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
        color: const Color.fromRGBO(255, 255, 255, 1),
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30,),

          Text(
            enigmas[indice].texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Fase 1
  static Widget fase_1(SessaoProvider sessao) {

    return faseWidget(
      titulo: 'FASE 1',
      cor: Colors.red.shade200,
      indice: 0,
      dialogos: listaDeDialogos[0],
      sessao: sessao
    );
  }

  // Fase 2
  static Widget fase_2(SessaoProvider sessao) {

    return faseWidget(
      titulo: 'FASE 2',
      cor: Colors.orange.shade200,
      indice: 1,
      dialogos: listaDeDialogos[1],
      sessao: sessao
    );
  }

  // FAse 3
  static Widget fase_3(SessaoProvider sessao) {

    return faseWidget(
      titulo: 'FASE 3',
      cor: Colors.yellow.shade200,
      indice: 2,
      dialogos: listaDeDialogos[2],
      sessao: sessao
    );
  }

  // Fase 4
  static Widget fase_4(SessaoProvider sessao) {

    return faseWidget(
      titulo: 'FASE 4',
      cor: Colors.green.shade200,
      indice: 3,
      dialogos: listaDeDialogos[3],
      sessao: sessao
    );
  }

  // Fase 5
  static Widget fase_5(SessaoProvider sessao) {

    return faseWidget(
      titulo: 'FASE 5',
      cor: Colors.blue.shade200,
      indice: 4,
      dialogos: listaDeDialogos[4],
      sessao: sessao
    );
  }

  // Renderizar fase
  static Widget renderizarFase(SessaoProvider sessao) {

    if (sessao.pontuacao == 0 && sessao.niveisDesbloqueados.contains(0)) return fase_1(sessao);
    if (sessao.pontuacao == 1 && sessao.niveisDesbloqueados.contains(1)) return fase_2(sessao);
    if (sessao.pontuacao == 2 && sessao.niveisDesbloqueados.contains(2)) return fase_3(sessao);
    if (sessao.pontuacao == 3 && sessao.niveisDesbloqueados.contains(3)) return fase_4(sessao);
    if (sessao.pontuacao == 4 && sessao.niveisDesbloqueados.contains(4)) return fase_5(sessao);

    //Cópia para testes
    /*if (sessao.pontuacao == 0) return fase_1();
    if (sessao.pontuacao == 1) return fase_2();
    if (sessao.pontuacao == 2) return fase_3();
    if (sessao.pontuacao == 3) return fase_4();
    if (sessao.pontuacao == 4) return fase_5();*/

    return enigma(sessao.pontuacao);
  }
}