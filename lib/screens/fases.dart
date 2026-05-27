import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/cena.dart';
import 'package:rpg_projeto_integrador/models/enigma.dart';
import 'package:rpg_projeto_integrador/models/pergunta_quiz.dart';
import 'package:rpg_projeto_integrador/providers/sessao_provider.dart';
import 'package:rpg_projeto_integrador/providers/variaveis_globais_provider.dart';
import 'package:rpg_projeto_integrador/services/progressao_service.dart';
import 'package:rpg_projeto_integrador/widgets/carrossel_de_imagem.dart';
import 'package:rpg_projeto_integrador/widgets/lista_dialogos.dart';
import 'package:rpg_projeto_integrador/widgets/quiz_widget.dart';

import '../models/dialogo.dart';

class Fases {

  static Widget faseWidget({
    required String titulo,
    required Color cor,
    required int indice,
    required SessaoProvider sessao,
    required VariaveisGlobaisProvider global,
  }) {
    final ProgressaoService progressaoService = ProgressaoService();
    var fase = indice + 1;

    return ConstrainedBox(
      constraints: const BoxConstraints(
      minHeight: 500,
      ),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/scenarios/cena_0$fase.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: global.exibirCutscene
          ? CarrosselDeImagens(
              imagens: listaDeCenas[indice],
              global: global,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetDialogos(
                  dialogos: listaDeDialogos[indice],
                  global: global,
                ),

                const SizedBox(height: 20),

                if (global.exibirQuiz)
                  QuizWidget(
                    perguntas:
                        listaDeListaDePerguntas[indice],
                    global: global,
                  ),

                if (global.exibirBotaoAvancarFase)
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
                  onPressed: () async {
                    await progressaoService.alterarPontuacao(sessao, "aumentar", global);
                  },
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
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 22,
                          ),

                          SizedBox(width: 5,),

                          Text(
                            "Avançar fase",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
      ),
    );
  }

  static Widget enigma(int indice) {
    
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1135),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enigma: ",
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Text(
            enigmas[indice].texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 213, 213, 213),
              fontSize: 17.5,
            ),
          ),
        ],
      ),
    );
  }

  // Fase 1
  static Widget fase_1(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    return faseWidget(
      titulo: 'FASE 1',
      cor: Colors.red.shade200,
      indice: 0,
      sessao: sessao,
      global: global
    );
  }

  // Fase 2
  static Widget fase_2(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    return faseWidget(
      titulo: 'FASE 2',
      cor: Colors.orange.shade200,
      indice: 1,
      sessao: sessao,
      global: global
    );
  }

  // FAse 3
  static Widget fase_3(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    return faseWidget(
      titulo: 'FASE 3',
      cor: Colors.yellow.shade200,
      indice: 2,
      sessao: sessao,
      global: global
    );
  }

  // Fase 4
  static Widget fase_4(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    return faseWidget(
      titulo: 'FASE 4',
      cor: Colors.green.shade200,
      indice: 3,
      sessao: sessao,
      global: global
    );
  }

  // Fase 5
  static Widget fase_5(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    return faseWidget(
      titulo: 'FASE 5',
      cor: Colors.blue.shade200,
      indice: 4,
      sessao: sessao,
      global: global
    );
  }

  // Renderizar fase
  static Widget renderizarFase(SessaoProvider sessao, VariaveisGlobaisProvider global) {

    if (sessao.pontuacao == 0 && sessao.niveisDesbloqueados.contains(0)) return fase_1(sessao, global);
    if (sessao.pontuacao == 1 && sessao.niveisDesbloqueados.contains(1)) return fase_2(sessao, global);
    if (sessao.pontuacao == 2 && sessao.niveisDesbloqueados.contains(2)) return fase_3(sessao, global);
    if (sessao.pontuacao == 3 && sessao.niveisDesbloqueados.contains(3)) return fase_4(sessao, global);
    if (sessao.pontuacao == 4 && sessao.niveisDesbloqueados.contains(4)) return fase_5(sessao, global);

    //Cópia para testes
    /*if (sessao.pontuacao == 0) return fase_1(sessao, global);
    if (sessao.pontuacao == 1) return fase_2(sessao, global);
    if (sessao.pontuacao == 2) return fase_3(sessao, global);
    if (sessao.pontuacao == 3) return fase_4(sessao, global);
    if (sessao.pontuacao == 4) return fase_5(sessao, global);*/

    return enigma(sessao.pontuacao);
  }
}