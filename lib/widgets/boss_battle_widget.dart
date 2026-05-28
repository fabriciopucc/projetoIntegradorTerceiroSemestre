import 'dart:async';

import 'package:flutter/material.dart';
import 'package:void_riddles/providers/sessao_provider.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';
import 'package:void_riddles/services/progressao_service.dart';

class BossBattleWidget extends StatefulWidget {
  final SessaoProvider sessao;
  final VariaveisGlobaisProvider global;

  const BossBattleWidget({super.key, required this.sessao, required this.global});

  @override
  State<BossBattleWidget> createState() => _BossBattleWidgetState();
}

class _BossBattleWidgetState extends State<BossBattleWidget> {
  final progressaoService = ProgressaoService();

  double vidaVector = 100;
  double vidaSenhorVazio = 100;

  bool iniciou = false;
  bool perdeu = false;
  bool venceu = false;

  Timer? timer;

  void iniciarBatalha() {
    timer?.cancel();

    setState(() {
      vidaVector = 100;
      vidaSenhorVazio = 100;
      iniciou = true;
      perdeu = false;
      venceu = false;
    });

    timer = Timer.periodic(const Duration(milliseconds: 120), (timer) {
      setState(() {
        vidaVector -= 1.5;

        if (vidaVector <= 0) {
          vidaVector = 0;
          perdeu = true;
          iniciou = false;
          timer.cancel();
        }
      });
    });
  }

  void atacar() {
    if (!iniciou) return;

    setState(() {
      vidaSenhorVazio -= 3.5;

      if (vidaSenhorVazio <= 0) {
        vidaSenhorVazio = 0;
        venceu = true;
        iniciou = false;

        timer?.cancel();

        print("Vitória!");
      }
    });
  }

  Widget barraVida({
    required String nome,
    required double vida,
    required Color cor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nome,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          width: 320,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white24,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 320 * (vida / 100),
                decoration: BoxDecoration(
                  color: cor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: atacar,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1B1135),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF6C3483),
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              barraVida(
                nome: "Senhor Vazio",
                vida: vidaSenhorVazio,
                cor: const Color.fromARGB(255, 155, 25, 226),
              ),

              const SizedBox(height: 28),

              barraVida(
                nome: "Vector",
                vida: vidaVector,
                cor: const Color.fromARGB(255, 144, 70, 217),
              ),

              const SizedBox(height: 35),

              if (!iniciou && !perdeu && !venceu && !widget.sessao.finalizado)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(
                      Colors.white.withOpacity(0.08),
                    ),
                  ),
                  onPressed: iniciarBatalha,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        'Iniciar batalha',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),

              if (perdeu) ...[
                const Text(
                  "Você perdeu!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(
                      Colors.white.withOpacity(0.08),
                    ),
                  ),
                  onPressed: iniciarBatalha,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        'Tentar novamente',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              if (venceu || widget.sessao.finalizado) ... [
                const Text(
                  "Vitória!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 32, 223, 147),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.all(
                      Colors.white.withOpacity(0.08),
                    ),
                  ),
                  onPressed:  () {
                    progressaoService.finalizarJogo(widget.sessao);
                    widget.global.alterarExibirCutsceneFinal(true);
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Text(
                        'Prosseguir',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              if (iniciou)
                const Text(
                  "Clique rapidamente na tela para golpear!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}