import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';
import 'package:void_riddles/widgets/snackbar_widget.dart';

import '../models/localizacao_model.dart';
import '../providers/sessao_provider.dart';

class ProgressaoService {

  //Alterar pontuação
  Future<void> alterarPontuacao( SessaoProvider sessao, String operacao, VariaveisGlobaisProvider global) async {
    final collection = FirebaseFirestore.instance .collection('saves');
    int novaPontuacao = sessao.pontuacao;

    if ( operacao == "aumentar" && sessao.pontuacao < 4) novaPontuacao++; //Soma 1
    if ( operacao == "diminuir" && sessao.pontuacao > 0) novaPontuacao--; //Subtrai 1

    final docRef = collection.doc(sessao.saveId);

    // Atualiza no firestone
    await docRef.update({ 'pontuacao': novaPontuacao});
    sessao.pontuacao = novaPontuacao;

    global.encerrarDialogo();
    global.alterarExibirCutscene(true);
    global.alterarExibirBotaoAvancarFase(false);
    sessao.notifyListeners();
  }

  //Alterar nivel no documento no banco
  Future<void> adicionarNivelDesbloqueado(SessaoProvider sessao) async {

    final collection = FirebaseFirestore.instance.collection('saves');

    final docRef = collection.doc(sessao.saveId);
    final doc = await docRef.get();

    if (!doc.exists) return;
    
    final data = doc.data();

    List<int>  niveisDesbloqueados = [];

    if (data != null && data['niveis_desbloqueados'] != null) {

      niveisDesbloqueados = List<int>.from( data['niveis_desbloqueados']);
    }

    // Adiciona se não existir
    if (!niveisDesbloqueados.contains( sessao.pontuacao)) {
      niveisDesbloqueados.add(sessao.pontuacao);

      //Atualiza no firestone
      await docRef.update({'niveis_desbloqueados':niveisDesbloqueados,});

      sessao.adicionarNivelDesbloqueado(sessao.pontuacao);
    }
  }

  // Abrir loading
  void abrirLoading(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const PopScope(
          canPop: false,
          child: Material(
            color: Colors.black54,
            child: Center(
              child:
                CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  // Fechar loading
  void fecharLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Desbloquear nivel
  Future<void> verificarEDesbloquear(BuildContext context, SessaoProvider sessao, String andar) async {
    abrirLoading(context);

    try {
      final localizacaoAlvo = listaLocalizacoes[sessao.pontuacao];

      Position posicaoAtual = await Geolocator.getCurrentPosition(
        desiredAccuracy:LocationAccuracy.medium,
        timeLimit: const Duration( seconds: 15),
      );

      // Distância
      double distancia = Geolocator.distanceBetween(
        //Atual
        posicaoAtual.latitude, posicaoAtual.longitude,
        
        //Do alvo
        localizacaoAlvo.latitude, localizacaoAlvo.longitude,
      );

      bool chegou = distancia <= 10;

      fecharLoading(context);

      if (chegou && localizacaoAlvo.nivel.toLowerCase() == andar.toLowerCase()) {
       await adicionarNivelDesbloqueado(sessao,);
        final nivelFase = sessao.pontuacao + 1;

        SnackbarWidget.mostrar(context,  'Fase $nivelFase desbloqueada!');
      } else {
        SnackbarWidget.mostrar(context,  'Você não está no local correto!!');
      }
    } catch (e) {
      fecharLoading(context);

      SnackbarWidget.mostrar(context,  'Erro ao verificar localização: $e');
    }
  }

  Future<void> finalizarJogo(SessaoProvider sessao) async {
    try {
      await FirebaseFirestore.instance
          .collection('saves')
          .doc(sessao.saveId)
          .update({
        'finalizado': true,
      });

      sessao.notifyListeners();

      print('Jogo finalizado com sucesso!');
    } catch (e) {
      print('Erro ao finalizar jogo: $e');
    }
  }
}