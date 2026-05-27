import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/models/dialogo.dart';

class VariaveisGlobaisProvider extends ChangeNotifier {
  //Cutscene 
  int _indiceDoDialogo = 0;
  bool _exibirCutscene = true;

  int get indiceDoDialogo => _indiceDoDialogo;
  bool get exibirCutscene => _exibirCutscene;

  void alterarExibirCutscene(bool valor) {
    _exibirCutscene = valor;
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

  void proximoDialogo(List<Dialogo> dialogos) {
    if (indiceAtual < dialogos.length - 1) {
      alterarExibirQuiz(false);
      indiceAtual++;
    } else {
      encerrarDialogo();

      if(!exibirBotaoAvancarFase) alterarExibirQuiz(true);
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

  //Avançar fase
  bool exibirBotaoAvancarFase = false;

  void alterarExibirBotaoAvancarFase(bool valor){
    exibirBotaoAvancarFase = valor;
    notifyListeners();
  }
}