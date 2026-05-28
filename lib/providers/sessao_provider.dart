import 'package:flutter/material.dart';

class SessaoProvider extends ChangeNotifier {

  String saveId = '';
  String nome = '';
  int pontuacao = 0;
  List<int> niveisDesbloqueados = [];
  bool carregado = false;
  bool finalizado = false;

  void carregarSave({
    required String novoSaveId,
    required String novoNome,
    required int novaPontuacao,
    required List<int> novoNiveisDesbloqueados,
    required bool novoFinalizado
  }) {
    saveId = novoSaveId;
    nome = novoNome;
    pontuacao = novaPontuacao;
    niveisDesbloqueados = novoNiveisDesbloqueados;
    carregado = true;
    finalizado = novoFinalizado;

    notifyListeners();
  }

  void encerrarSessao() {
    saveId = '';
    nome = '';
    pontuacao = 0;
    niveisDesbloqueados = [];
    carregado = false;
    finalizado = false;

    notifyListeners();
  }

  void adicionarNivelDesbloqueado(int nivel) {

    if (!niveisDesbloqueados.contains(nivel)) {
      niveisDesbloqueados.add(nivel);
      notifyListeners();
    }
  }
}