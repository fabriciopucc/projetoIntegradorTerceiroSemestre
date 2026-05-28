import 'package:audioplayers/audioplayers.dart';

class AudioService {

  static final AudioService _instance =
      AudioService._internal();

  factory AudioService() => _instance;

  AudioService._internal();

  final AudioPlayer player = AudioPlayer();

  String? musicaAtual;

  Future<void> tocarMusica(
    String caminho,
  ) async {

    // Evita reiniciar mesma música
    if (musicaAtual == caminho) return;

    musicaAtual = caminho;

    await player.stop();

    await player.setReleaseMode(
      ReleaseMode.loop,
    );

    await player.setVolume(0.7);

    await player.play(
      AssetSource(caminho),
    );
  }

  Future<void> parar() async {
    await player.stop();
  }

  Future<void> pausar() async {
    await player.pause();
  }

  Future<void> continuar() async {
    await player.resume();
  }

  Future<void> alterarVolume(
    double volume,
  ) async {
    await player.setVolume(volume);
  }

  void dispose() {
    player.dispose();
  }
}