import 'package:flutter/material.dart';

//Screens
import 'tela_novo_jogo.dart';
import 'tela_carregar_jogo.dart';
import 'tela_configuracoes.dart';

//Fonte
import 'package:google_fonts/google_fonts.dart';

//Widgets
import '../widgets/botao_menu.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Void Riddles',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: const Color.fromARGB(255, 99, 98, 98),
                ),
              ),
              
              const SizedBox(height: 30),

              BotaoMenu(texto: "Novo Jogo", telaDestino: const TelaNovoJogo()),
              BotaoMenu(texto: "Carregar Jogo", telaDestino: const TelaCarregarJogo()),
              BotaoMenu(texto: "Configurações", telaDestino: const TelaConfiguracoes()),
              BotaoMenu(texto: "Sair", telaDestino: const TelaInicial()),
            ],
          ),
        ) 
      ),
    );
  }
}
