class Localizacao {
  final String nome;
  final double latitude;
  final double longitude;
  final String nivel;

  Localizacao(this.nome, this.latitude, this.longitude, this.nivel);
}

final listaLocalizacoes = [
  //Oficiais
  Localizacao("Sala A02", -22.8332087, -47.0526311, "térreo"),
  Localizacao("Sala apoio computacional!", -22.8331507, -47.0528881, "1º andar"),
  Localizacao("Sala dos professores", -22.8331008, -47.0525102, "térreo"),
  Localizacao("Sala 209", -22.8331778, -47.0525477, "3º andar"),
  Localizacao("Auditório", -22.8332298, -47.0528363, "subsolo"),
];