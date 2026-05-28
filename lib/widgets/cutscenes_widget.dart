import 'package:flutter/material.dart';
import 'package:void_riddles/models/cena_model.dart';
import 'package:void_riddles/providers/variaveis_globais_provider.dart';
import 'package:void_riddles/screens/creditos_screen.dart';

class CutscenesWidget extends StatefulWidget {
  final List<Cena> imagens;
  final VariaveisGlobaisProvider global;
  final VoidCallback? onFinalizado;

  const CutscenesWidget({
    super.key,
    required this.imagens,
    required this.global,
    this.onFinalizado,
  });

  @override
  State<CutscenesWidget> createState() => _CutscenesWidgetState();
}

class _CutscenesWidgetState extends State<CutscenesWidget> {
  int indiceAtual = 0;

  void proximaImagem() {
    if (indiceAtual < widget.imagens.length - 1) {
      setState(() {
        indiceAtual++;
      });
    } else {
      if(widget.global.exibirCutsceneInicial) widget.global.alterarExibirCutsceneInicial(false);
      else if(widget.global.exibirCutsceneFinal){
        widget.global.alterarExibirCutsceneFinal(false);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => CreditosScreen(),
          ),
          (route) => route.isFirst,
        );
      }
      else widget.global.alterarExibirCutscene(false);
      
      widget.onFinalizado?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagens.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: proximaImagem,
      child: SizedBox.expand(
        child: Image.asset(
          'assets/images/cutscenes/${widget.imagens[indiceAtual].url}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}