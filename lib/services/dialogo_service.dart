import 'package:rpg_projeto_integrador/models/dialogo.dart';

class DialogoService {
  int indiceAtual = -1;

  bool iniciouDialogo() {
    return indiceAtual >= 0;
  }

  Dialogo? dialogoAtual(List<Dialogo> dialogos) {
    if (!iniciouDialogo()) return null;

    return dialogos[indiceAtual];
  }

  void proximoDialogo(List<Dialogo> dialogos) {
    if (indiceAtual < dialogos.length - 1) {
      indiceAtual++;
    } else {
      encerrarDialogo();
    }
  }

  void encerrarDialogo() {
    indiceAtual = -1;
  }
}