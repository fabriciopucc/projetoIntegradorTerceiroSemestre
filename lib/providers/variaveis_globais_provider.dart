import 'package:flutter/material.dart';
import 'package:void_riddles/models/dialogo_model.dart';

class VariaveisGlobaisProvider extends ChangeNotifier {
  //Cutscene 
  bool exibirCutsceneInicial = false;

  void alterarExibirCutsceneInicial(bool valor){
    exibirCutsceneInicial = valor;
    notifyListeners();
  }

  int _indiceDoDialogo = 0;
  bool _exibirCutscene = true;

  int get indiceDoDialogo => _indiceDoDialogo;
  bool get exibirCutscene => _exibirCutscene;

  void alterarExibirCutscene(bool valor) {
    _exibirCutscene = valor;
    notifyListeners();
  }

  //Cutscene 
  bool exibirCutsceneFinal = false;

  void alterarExibirCutsceneFinal(bool valor){
    exibirCutsceneFinal = valor;
    notifyListeners();
  }

  // Dialogo
  int indiceAtual = -1;

  bool iniciouDialogo() {
    return indiceAtual >= 0;
  }

  Dialogo? dialogoAtual(List<Dialogo> dialogos) {
    if (!iniciouDialogo()) return null;

    return dialogos[indiceAtual];
  }

  void proximoDialogo(List<Dialogo> dialogos, int indice) {
    if (indiceAtual < dialogos.length - 1) {
      alterarExibirQuiz(false);
      alterarExibirPuzzle(false);
      alterarExibirBossBattle(false);
      indiceAtual++;
    } else {
      encerrarDialogo();

      //Exibir quiz se for fase 1 ou 2
      if(!exibirBotaoAvancarFase && [0, 1].contains(indice)) alterarExibirQuiz(true);
      //Liberar botão avançar na fase 3, pois ela só tem diálogo. Não possui quiz/puzzle
      if(indice == 2) alterarExibirBotaoAvancarFase(true);
      //Exibir Puzzle ao terminar dialogo da fase 4
      if(!exibirBotaoAvancarFase && indice == 3) alterarExibirPuzzle(true);
       //Exibir Boss Battke
      if(indice == 4) alterarExibirBossBattle(true);
    }
  }

  void encerrarDialogo() {
    indiceAtual = -1;
  }

  //Quiz
  bool exibirQuiz = false;

  void alterarExibirQuiz(bool valor){
    exibirQuiz = valor;
    notifyListeners();
  }

  //Quiz
  bool exibirPuzzle = false;

  void alterarExibirPuzzle(bool valor){
    exibirPuzzle = valor;
    notifyListeners();
  }

  //Botaõ vançar fase
  bool exibirBotaoAvancarFase = false;

  void alterarExibirBotaoAvancarFase(bool valor){
    exibirBotaoAvancarFase = valor;
    notifyListeners();
  }

  //Boss Battle
  bool exibirBossBattle = false;

  void alterarExibirBossBattle(bool valor){
    exibirBossBattle = valor;
    notifyListeners();
  }
}