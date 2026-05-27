import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_projeto_integrador/providers/variaveis_globais_provider.dart';
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
    final global = Provider.of<VariaveisGlobaisProvider>(context);

    return PopScope(

      onPopInvoked: (didPop) {
        if (didPop) sessao.encerrarSessao();
      },

      child: Scaffold(
        backgroundColor: const Color(0xFF1B1135),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1B1135),
          title: const Text(
            'Jogo',
            style: TextStyle(
              color: Colors.white, // Deixa o texto branco
              fontSize: 20,
            ),
          ),
          iconTheme: const IconThemeData( color: Colors.white),
          actionsIconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Fases.renderizarFase(sessao, global),
                ),

                const SizedBox(height: 25),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.apartment_rounded,
                          color: Color.fromARGB(255, 191, 94, 255),
                        ),

                        SizedBox(width: 8),

                        Text(
                          'SELECIONE O ANDAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 35, 35, 50),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color.fromARGB(255, 170, 70, 255),
                              width: 1.5,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: andarSelecionado,
                              dropdownColor: const Color.fromARGB(255, 35, 35, 50),
                              iconEnabledColor: Colors.white,
                              isExpanded: true,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),

                              items: const [
                                DropdownMenuItem(
                                  value: 'Subsolo',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.keyboard_double_arrow_down,
                                        color: Color(0xFFA855F7),
                                      ),

                                      SizedBox(width: 5,),

                                      Text('Subsolo'),
                                    ],
                                  )
                                ),

                                DropdownMenuItem(
                                  value: 'Térreo',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Color(0xFFA855F7),
                                      ),

                                      SizedBox(width: 5,),

                                      Text('Térreo'),
                                    ],
                                  )
                                ),

                                DropdownMenuItem(
                                  value: '1º andar',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.looks_one,
                                        color: Color(0xFFA855F7),
                                      ),

                                      SizedBox(width: 5,),

                                      Text('1º andar'),
                                    ],
                                  )
                                ),
                                DropdownMenuItem(
                                  value: '2º andar',
                                 child: Row(
                                    children: [
                                      Icon(
                                        Icons.looks_two,
                                        color: Color(0xFFA855F7),
                                      ),

                                      SizedBox(width: 5,),

                                      Text('2º andar'),
                                    ],
                                  )
                                ),

                                DropdownMenuItem(
                                  value: '3º andar',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.looks_3,
                                        color: Color(0xFFA855F7),
                                      ),

                                      SizedBox(width: 5,),

                                      Text('3º andar'),
                                    ],
                                  )
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
                        ),

                        const SizedBox(height: 15),

                        BotaoDesbloquearNivel(sessao: sessao, andar: andarSelecionado),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}