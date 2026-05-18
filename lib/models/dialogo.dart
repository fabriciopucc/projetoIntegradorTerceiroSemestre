class Dialogo {
  final String autor;
  final String texto;
  final String lado;

  Dialogo(this.autor, this.texto, this.lado);
}

final dialogosFase1 = [
  Dialogo("Alfa", "Intruso detectado. Identidade… Vector. Estado: enfraquecido.", "esquerdo"),
  Dialogo("Vector", "Vamos ver se você é tudo isso mesmo. Resolva meu mais novo passatempo, e lhe direi aonde ir.", "direito"),
  Dialogo("Alfa", "Tou bem, e voce?", "direito"),
  Dialogo("Alfa", "Ok, se é isso que você quer. Lá vai: \nVinte telas observam o mestre, mas ninguém as vê. \nEntre o código e o cano, o segundo nível guarda o plano. \nProcure o apoio onde os bits descansam ao lado do fluxo das águas", "esquerdo"),
];

final dialogosFase2 = [
  Dialogo("Fafa", "Olá amigo", "direito"),
  Dialogo("Jose", "Olá, eai?", "esquerdo")
];

final listaDeDialogos = [
  dialogosFase1,
  dialogosFase2
];