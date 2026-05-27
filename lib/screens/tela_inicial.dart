import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/screens/teste.dart';

// Screens
import 'tela_novo_jogo.dart';
import 'tela_carregar_jogo.dart';

// Widgets
import '../widgets/botao_menu.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  bool carregando = true;

  // LISTA DOS ASSETS
  final List<String> assets = [
    //Fundo
    "assets/images/bg.png",
    //Characters
    "assets/images/characters/alfa.png", "assets/images/characters/beta.png", "assets/images/characters/delta.png", "assets/images/characters/bg.png", "assets/images/characters/gama.png", "assets/images/characters/senhorVazio.png", "assets/images/characters/vector.png",
    //Scenarios
    "assets/images/scenarios/cena_01.png", "assets/images/scenarios/cena_02.png", "assets/images/scenarios/cena_03.png", "assets/images/scenarios/cena_04.png", "assets/images/scenarios/cena_05.png",
    //Cutscenes
    "assets/images/cutscenes/cena1_1.png", "assets/images/cutscenes/cena1_2.png", "assets/images/cutscenes/cena2_1.png", "assets/images/cutscenes/cena2_2.png", "assets/images/cutscenes/cena3_1.png", "assets/images/cutscenes/cena3_2.png", "assets/images/cutscenes/cena4_1.png", "assets/images/cutscenes/cena4_2.png", "assets/images/cutscenes/cena5.png",
  ];

  @override
  void initState() {
    super.initState();
    
     WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarAssets();
    });
  }

  Future<void> carregarAssets() async {
    // Pré-carrega todas as imagens
    for (final asset in assets) {
      await precacheImage(
        AssetImage(asset),
        context,
      );
    }

    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    // TELA DE LOADING
    if (carregando) {
      return const Scaffold(
        backgroundColor: Color(0xFF1B1135),
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFB388FF),
          ),
        ),
      );
    }

    // TELA NORMAL
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Void Riddles",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF8EFFF),
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Color(0xFFB388FF),
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              BotaoMenu(
                texto: "Novo Jogo",
                telaDestino: const TelaNovoJogo(),
              ),

              BotaoMenu(
                texto: "Carregar Jogo",
                telaDestino: const TelaCarregarJogo(),
              ),

              BotaoMenu(
                texto: "Sair",
                telaDestino: const TelaTeste(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}