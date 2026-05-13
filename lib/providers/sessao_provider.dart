import 'package:flutter/material.dart';

class SessaoProvider extends ChangeNotifier {

  String saveId = '';
  String nome = '';
  int pontuacao = 0;
  List<int> niveisDesbloqueados = [];
  bool carregado = false;

  void carregarSave({
    required String novoSaveId,
    required String novoNome,
    required int novaPontuacao,
    required List<int> novoNiveisDesbloqueados
  }) {
    saveId = novoSaveId;
    nome = novoNome;
    pontuacao = novaPontuacao;
    niveisDesbloqueados = novoNiveisDesbloqueados;
    carregado = true;

    notifyListeners();
  }

  void encerrarSessao() {
    saveId = '';
    nome = '';
    pontuacao = 0;
    niveisDesbloqueados = [];
    carregado = false;

    notifyListeners();
  }

  void adicionarNivelDesbloqueado(int nivel) {

    if (!niveisDesbloqueados.contains(nivel)) {
      niveisDesbloqueados.add(nivel);
      notifyListeners();
    }
  }
}