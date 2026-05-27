class PerguntaQuiz {
  final String pergunta;
  final String alternativa1;
  final String alternativa2;
  final String alternativa3;
  final String alternativa4;

  final int correta;

  const PerguntaQuiz({
    required this.pergunta,
    required this.alternativa1,
    required this.alternativa2,
    required this.alternativa3,
    required this.alternativa4,
    required this.correta,
  });
}

List<PerguntaQuiz> perguntasFase1 = [
  PerguntaQuiz(
    pergunta: "Qual linguagem o Flutter utiliza?",

    alternativa1: "Java",
    alternativa2: "Python",
    alternativa3: "Dart",
    alternativa4: "C++",

    correta: 3,
  ),

  PerguntaQuiz(
    pergunta: "Qual widget é usado para organizar itens verticalmente?",

    alternativa1: "Row",
    alternativa2: "Column",
    alternativa3: "Stack",
    alternativa4: "Container",

    correta: 2,
  ),
];


List<PerguntaQuiz> perguntasFase2 = [
  PerguntaQuiz(
    pergunta: "Qual widget permite criar uma lista rolável no Flutter?",

    alternativa1: "Container",
    alternativa2: "Scaffold",
    alternativa3: "ListView",
    alternativa4: "Padding",

    correta: 3,
  ),

  PerguntaQuiz(
    pergunta: "Qual método é chamado automaticamente ao iniciar um StatefulWidget?",

    alternativa1: "build()",
    alternativa2: "createState()",
    alternativa3: "dispose()",
    alternativa4: "initState()",

    correta: 4,
  ),

  PerguntaQuiz(
    pergunta: "Qual palavra-chave torna uma variável imutável em Dart?",

    alternativa1: "final",
    alternativa2: "dynamic",
    alternativa3: "var",
    alternativa4: "late",

    correta: 1,
  ),
];

List<PerguntaQuiz> perguntasFase3 = [
  PerguntaQuiz(
    pergunta: "Quanto é 15% de 200?",

    alternativa1: "20",
    alternativa2: "25",
    alternativa3: "30",
    alternativa4: "35",

    correta: 3,
  ),

  PerguntaQuiz(
    pergunta: "Qual é o valor de 2³ + 4²?",

    alternativa1: "20",
    alternativa2: "24",
    alternativa3: "18",
    alternativa4: "16",

    correta: 2,
  ),

  PerguntaQuiz(
    pergunta: "Um triângulo possui lados 3, 4 e 5. Ele é:",

    alternativa1: "Equilátero",
    alternativa2: "Isósceles",
    alternativa3: "Retângulo",
    alternativa4: "Obtusângulo",

    correta: 3,
  ),

  PerguntaQuiz(
    pergunta: "Se f(x) = 2x + 3, qual é o valor de f(5)?",

    alternativa1: "10",
    alternativa2: "12",
    alternativa3: "13",
    alternativa4: "15",

    correta: 3,
  ),
];

List<PerguntaQuiz> perguntasFase4 = [
    PerguntaQuiz(
      pergunta: 'Qual a ordem correta dos poemas?',
      alternativa1: '2-3-1-4',
      alternativa2: '4-2-3-1',
      alternativa3: '1-2-4-3',
      alternativa4: '3-4-2-1',
      correta: 2,
    ),
];

List<PerguntaQuiz> perguntasFase5 = [
    PerguntaQuiz(
      pergunta: 'Qual a cordem correta?',
      alternativa1: '2-3-1-4',
      alternativa2: '4-2-3-1',
      alternativa3: '1-2-4-3',
      alternativa4: '3-4-2-1',
      correta: 2,
    ),
];

List<List<PerguntaQuiz>> listaDeListaDePerguntas = [perguntasFase1, perguntasFase2, perguntasFase3, perguntasFase4, perguntasFase5];