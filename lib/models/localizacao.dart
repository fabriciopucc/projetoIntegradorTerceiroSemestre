class Localizacao {
  final String nome;
  final double latitude;
  final double longitude;
  final String nivel;

  Localizacao(this.nome, this.latitude, this.longitude, this.nivel);
}

final listaLocalizacoes = [
  Localizacao("Sala A02", -22.84670, -47.05530, "térreo"),
  //Localizacao("Sala A02", -22.833048, -47.052658, "terreo"),
  Localizacao("Sala apoio computacional!", -22.833169, -47.052813, "1º andar"),
  Localizacao("Sala dos professores", -22.833077, -47.052552, "térreo"),
  Localizacao("Sala 209", -22.833073, -47.052574, "3º andar"),
  Localizacao("Auditório", -22.833201, -47.052908, "subsolo"),
];