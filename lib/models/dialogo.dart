class Dialogo {
  final String autor;
  final String texto;
  final String lado;

  Dialogo(this.autor, this.texto, this.lado);
}

final dialogosFase1 = [
  Dialogo("Alfa", "Intruso detectado. Identidade… Vector. Estado: enfraquecido.", "esquerdo"),
  Dialogo("Vector", "Vamos ver se você é tudo isso mesmo. Resolva meu mais novo passatempo, e lhe direi aonde ir.", "direito"),
  Dialogo("Alfa", "Eu sou o começo. E o começo sempre decide o fim.", "esquerdo"),
  Dialogo("Vector", "Ótimo. Então vamos começar direito", "direito"),
  Dialogo("Alfa", "Vamos ver se você é tudo isso mesmo. Resolva meu mais novo passatempo, e lhe direi aonde ir.", "esquerdo"),
];

final dialogosFase2 = [
  Dialogo("Beta", "Você passou pelo Alfa. Isso já estava calculado.", "esquerdo"),
  Dialogo("Vector", "Então calcula isso: eu ainda vou sair daqui com meu bracelete", "direito"),
  Dialogo("Beta", "Improvável. Eu não erro.", "esquerdo"),
  Dialogo("Vector", "Sorte minha… eu não sou um cálculo.", "direito"),
  Dialogo("Beta", "Pode não ser, mas agora você precisará deles como nunca!", "esquerdo"),
  Dialogo("Vector", "E agora? Qual a próxima gracinha? Posso estar sem meus poderes, mas ainda sou um gênio dos números.", "direito"),
  Dialogo("Beta", "Vejo que você de fato é muito inteligente. Mas duvido que possa desvendar o mistério que leva ao próximo passo.", "esquerdo"),
  Dialogo("Vector", "Não duvide de mim... Anda! Desembucha!", "direito"),
  Dialogo("Beta", "Já que você insiste...\nAntes da ascensão ao saber, curve-se perante o alicerce.\nNo ponto onde a fundação encontra o horizonte, reside a mente por trás da ordem.\nBusque o epicentro da autoridade onde o nível é nulo, mas a influência é absoluta.\nOnde o plano de voo é traçado antes das asas serem dadas aos aprendizes.", "esquerdo"),
];

final dialogosFase3 = [
  Dialogo("Gama", "Você chegou mais longe do que os dados previam.", "esquerdo"),
  Dialogo("Vector", "E você? Vai me dar uma prova ou só falar difícil?", "direito"),
  Dialogo("Gama", "Conhecimento é poder. E você… perdeu o seu.", "esquerdo"),
  Dialogo("Vector", "Não. Eu perdi um atalho.", "direito"),
  Dialogo("Gama", "Interessante… você aprende…\nNão farei igual aos meus irmãos, não lhe darei um desafio propriamente dito. Apenas o que eu lhe disser já será o maior desafio da sua vida!", "esquerdo"),
  Dialogo("Vector", "Não seja tão exibido, diga logo.", "direito"),
  Dialogo("Gama", "Pobre coitado, mas se é isso que quer ouvir... Preste muita atenção:", "esquerdo"),
  Dialogo("Gama", "O selo do seu destino não é dado, é extraído. Eleve-se ao terceiro plano da existência acadêmica, onde o horizonte se expande e o fôlego diminui. Diante do corredor de infinitas portas, apenas uma cederá ao seu toque: aquela cujo nome é o resultado da convergência dos três fragmentos...", "esquerdo"),
  Dialogo("Vector", "Hã?!! Três fragmentos? Como assim? Isso não significa nada!", "direito"),
  Dialogo("Gama", "Um momento, jovem Padawan, não terminei o que dizia!\n...Tome o valor do seu Alfa e duplique sua força. Una-o ao peso do seu Beta, mas cuidado com a instabilidade: o Gama não deseja a união, ele exige a subtração do que restou do equilíbrio. Onde o cálculo termina, a porta se revela.", "esquerdo"),
  Dialogo("Vector", "Continuo a não entender, seja mais claro.", "direito"),
  Dialogo("Gama", "Ok, é a última dica: Alfa vale o mesmo que uma nota que carrega um peixe, Beta vale o mesmo que um intervalo de quinzena e Gama vale o mesmo que metade de uma dúzia. Você já tem os valores. Basta desenolver uma expressão e desvendar o mistério!", "esquerdo"),
  Dialogo("Vector", "Hmm, então devo montar uma expressão? Interessante, vejo que você seria um professor muito exigente.", "direito"),
];

final dialogosFase4 = [
  Dialogo("Delta", "Você não deveria ter chegado aqui.", "esquerdo"),
  Dialogo("Vector", "E você não deveria estar no meu caminho.", "direito"),
  Dialogo("Delta", "Eu sou o fim do caminho.", "esquerdo"),
  Dialogo("Vector", "Então vou ter que abrir um novo.", "direito"),
  Dialogo("Delta", "Tudo bem, mas não será tão simples.", "esquerdo"),
  Dialogo("Vector", "Diga logo, que loucura irá querer que eu faça agora?", "direito"),
  Dialogo("Delta", "Não é nada muito complicado. Para eu te falar onde meu criador está, basta você juntar as peças de um poema que criei. Porém, atenção: você só possui uma única chance, senão lhe obliterarei aqui mesmo!!", "esquerdo"),
  Dialogo("Vector", "O-ok, diga-me então esse poema!", "direito"),
  Dialogo("Delta", "Tem certeza que deseja continuar?", "esquerdo"),
  Dialogo("Delta", "Muita atenção agora. Irei falar por partes:", "esquerdo"),
  
  Dialogo("Delta", "Parte 1: '...onde a inclinação do solo dita a hierarquia do olhar e a acústica devora os sussurros...'", "esquerdo"),
  Dialogo("Delta", "Parte 2: '...para que o iniciado seja finalmente devolvido ao mundo sob as luzes do grande palco.'", "esquerdo"),
  Dialogo("Delta", "Parte 3: 'Busque o ventre vasto da estrutura, o vazio organizado que abriga as multidões...'", "esquerdo"),
  Dialogo("Delta", "Parte 4: '...convergindo todos os passos para o ponto de fuga da oratória sagrada...'", "esquerdo"),

  Dialogo("Vector", "E agora?", "direito"),
  Dialogo("Delta", "Diga-me: qual a ordem correta das partes?", "esquerdo"),
  Dialogo("Vector", "A sequência correta é 3-1-4-2!", "direito"),
  Dialogo("Delta", "Fico deveras impressionado, você realmente é tudo isso que dizem. Parabéns, você acertou!", "esquerdo"),
  Dialogo("Vector", "Não tinha dúvidas! Agora me diga: onde está seu chefe??!", "direito"),
  Dialogo("Delta", "Faça novamente o que já fez, junte os subpoemas na mesma ordem. A junção é a resposta para o que precisa!", "esquerdo"),
  
];

final dialogosFase5 = [
  Dialogo("Senhor Vazio", "Você passou pelo Alfa. Isso já estava calculado.", "esquerdo"),
  Dialogo("Vector", "Então calcula isso: eu ainda vou sair daqui com meu bracelete", "direito"),
];

final listaDeDialogos = [
  dialogosFase1,
  dialogosFase2, 
  dialogosFase3,
  dialogosFase4,
  dialogosFase5
];