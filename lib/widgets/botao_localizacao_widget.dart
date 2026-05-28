import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BotaoLocalizacaoWidget extends StatelessWidget {
  const BotaoLocalizacaoWidget({super.key});

  Future<void> _pegarLocalizacao(BuildContext context) async {
    bool servicoAtivado;
    LocationPermission permissao;

    // Verifica se o GPS está ligado
    servicoAtivado = await Geolocator.isLocationServiceEnabled();

    if (!servicoAtivado) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('GPS desligado'),
          content: Text('Ative o serviço de localização do dispositivo.'),
        ),
      );
      return;
    }

    // Verifica permissões
    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            title: Text('Permissão negada'),
            content: Text('A permissão de localização foi negada.'),
          ),
        );
        return;
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Permissão bloqueada'),
          content: Text(
            'A permissão foi negada permanentemente. '
            'Ative nas configurações do celular.',
          ),
        ),
      );
      return;
    }

    // Obtém localização
    Position posicao = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Exibe dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sua localização'),
        content: Text(
          'Latitude: ${posicao.latitude}\n'
          'Longitude: ${posicao.longitude}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _pegarLocalizacao(context),
      child: const Text('Pegar localização'),
    );
  }
}