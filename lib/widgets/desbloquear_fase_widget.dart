import 'package:flutter/material.dart';

import '../providers/sessao_provider.dart';
import '../services/progressao_service.dart';

class BotaoDesbloquearFaseWidget extends StatelessWidget {

  final SessaoProvider sessao;
  final String andar;

  const BotaoDesbloquearFaseWidget({super.key, required this.sessao, required this.andar});

  @override
  Widget build(BuildContext context) {
    final progressaoService = ProgressaoService();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        fixedSize: const Size(200, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          Colors.white.withOpacity(0.08),
        ),
      ),
      onPressed: () {
        progressaoService.verificarEDesbloquear(context,sessao,andar);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_rounded,
                color: Colors.white,
                size: 22,
              ),

              SizedBox(width: 10),

              Text(
              'Desbloquear',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}