import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_projeto_integrador/services/progressao_service.dart';
import 'package:rpg_projeto_integrador/widgets/botao_desbloquear_nivel.dart';

import 'fases.dart';
import '../providers/sessao_provider.dart';

class TelaJogo extends StatefulWidget {

  const TelaJogo({
    super.key,
  });

  @override
  State<TelaJogo> createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {

  final ProgressaoService progressaoService = ProgressaoService();
  String andarSelecionado = 'Térreo';

  @override
  Widget build(BuildContext context) {

    final sessao = Provider.of<SessaoProvider>(context);

    return PopScope(

      onPopInvoked: (didPop) {
        if (didPop) sessao.encerrarSessao();
      },

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jogo'),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.all(0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Fases.renderizarFase(sessao),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: DropdownButtonFormField<String>(
                        decoration:InputDecoration(
                          labelText: 'Andar',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                        ),

                        value: andarSelecionado,

                        items: const [
                          DropdownMenuItem(
                            value: 'Subsolo',
                            child: Text('Subsolo'),
                          ),

                          DropdownMenuItem(
                            value: 'Térreo',
                            child: Text('Térreo'),
                          ),

                          DropdownMenuItem(
                            value: '1º andar',
                            child: Text('1º andar'),
                          ),

                          DropdownMenuItem(
                            value: '2º andar',
                            child: Text('2º andar'),
                          ),

                          DropdownMenuItem(
                            value: '3º andar',
                            child: Text('3º andar',),
                          ),
                        ],

                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              andarSelecionado = value;
                            });
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: 10),

                    BotaoDesbloquearNivel(sessao: sessao, andar: andarSelecionado),
                  ],
                ),

                const SizedBox(height: 10),
                /*const SizedBox(height: 25),

                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await progressaoService.alterarPontuacao(sessao,"diminuir",);
                      },

                      child: const Text('Voltar fase'),
                    ),

                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () async {
                        await progressaoService.alterarPontuacao(sessao, "aumentar");
                      },

                      child: const Text('Avançar fase'),
                    ),
                  ],
                ),

                const SizedBox(height: 25),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}