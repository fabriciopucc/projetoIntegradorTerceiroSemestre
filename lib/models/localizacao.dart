class Localizacao {
  final String nome;
  final double lat;
  final double lng;
  final String nivel;

  Localizacao(this.nome, this.lat, this.lng, this.nivel);
}

final lista = [
  Localizacao("Sala A02", -22.833048, -47.052658, "terreo"),
  Localizacao("Sala apoio computacional!", -22.833169, -47.052813, "1º andar"),
  Localizacao("Sala dos professores", -22.833077, -47.052552, "terreo"),
  Localizacao("Sala 209", -22.833073, -47.052574, "3º andar"),
  Localizacao("Auditório", -22.833201, -47.052908, "subsolo"),
];