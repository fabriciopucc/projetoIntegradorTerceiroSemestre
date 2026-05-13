import 'package:flutter/material.dart';

import '../providers/sessao_provider.dart';
import '../services/progressao_service.dart';

class BotaoDesbloquearNivel extends StatelessWidget {

  final SessaoProvider sessao;
  final String andar;

  const BotaoDesbloquearNivel({super.key, required this.sessao, required this.andar});

  @override
  Widget build(BuildContext context) {
    final progressaoService = ProgressaoService();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:const Color.fromARGB(255,138,18,236,),
        foregroundColor:Colors.white,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),

      onPressed: () {
        progressaoService.verificarEDesbloquear(context,sessao,andar);
      },
      child: const Text(
        'Desbloquear nível',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}