class Dialogo {
  final String autor;
  final String texto;
  final String lado;

  Dialogo(this.autor, this.texto, this.lado);
}

final dialogosFase1 = [
  Dialogo("Fafa", "Olá amigo", "direito"),
  Dialogo("Pedro", "Olá, eai?", "esquerdo"),
  Dialogo("Fafa", "Tou bem, e voce?", "direito"),
  Dialogo("Pedro", "Estou bem tambem", "esquerdo"),
];

final dialogosFase2 = [
  Dialogo("Fafa", "Olá amigo", "direito"),
  Dialogo("Jose", "Olá, eai?", "esquerdo")
];

final listaDeDialogos = [
  dialogosFase1,
  dialogosFase2
];