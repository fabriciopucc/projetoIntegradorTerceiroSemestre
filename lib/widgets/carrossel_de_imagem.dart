import 'package:flutter/material.dart';
import 'package:rpg_projeto_integrador/providers/variaveis_globais_provider.dart';

class CarrosselDeImagens extends StatefulWidget {
  final List<String> imagens;
  final VariaveisGlobaisProvider global;
  final VoidCallback? onFinalizado;

  const CarrosselDeImagens({
    super.key,
    required this.imagens,
    required this.global,
    this.onFinalizado,
  });

  @override
  State<CarrosselDeImagens> createState() => _CarrosselDeImagensState();
}

class _CarrosselDeImagensState extends State<CarrosselDeImagens> {
  int indiceAtual = 0;

  void proximaImagem() {
    if (indiceAtual < widget.imagens.length - 1) {
      setState(() {
        indiceAtual++;
      });
    } else {
      widget.global.alterarExibirCutscene(false);
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
          'assets/images/cutscenes/${widget.imagens[indiceAtual]}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}