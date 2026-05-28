class Dialogo {
  final String autor;
  final String texto;
  final String lado;

  Dialogo(this.autor, this.texto, this.lado);
}

final dialogosFase1 = [
  Dialogo("Alfa", "Intruso detectado. Identidade… Vector. Estado: enfraquecido.", "esquerdo"),
  Dialogo("Vector", "Então você é o comitê de boas-vindas?”", "direito"),
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
  Dialogo("Beta", "Vejo que você de fato é muito inteligente. Mas duvido que possa superar o proximo desafio.", "esquerdo"),
  Dialogo("Vector", "Não duvide de mim... Anda! Desembucha!", "direito"),
  Dialogo("Beta", "Já que você insiste...", "esquerdo"),
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
  Dialogo("Delta", "Não é nada muito complicado. Para eu te falar onde meu criador está, basta você juntar as peças de um poema que criei.", "esquerdo"),
  Dialogo("Vector", "O-ok, diga-me então esse poema!", "direito"),
  Dialogo("Delta", "Tem certeza que deseja continuar?", "esquerdo"),
  Dialogo("Delta", "Muita atenção agora. Irei falar por partes:", "esquerdo"),
  
  Dialogo("Delta", "Parte 1: '...onde a inclinação do solo dita a hierarquia do olhar e a acústica devora os sussurros...'", "esquerdo"),
  Dialogo("Delta", "Parte 2: '...para que o iniciado seja finalmente devolvido ao mundo sob as luzes do grande palco.'", "esquerdo"),
  Dialogo("Delta", "Parte 3: 'Busque o ventre vasto da estrutura, o vazio organizado que abriga as multidões...'", "esquerdo"),
  Dialogo("Delta", "Parte 4: '...convergindo todos os passos para o ponto de fuga da oratória sagrada...'", "esquerdo"),

  Dialogo("Vector", "E agora?", "direito"),
  Dialogo("Delta", "Diga-me: qual a ordem correta das partes? É ela quem lhe dira à onde ir!", "esquerdo"),
];

final dialogosFase5 = [
  Dialogo("Senhor Vazio", "Finalmente… o herói sem poderes.", "esquerdo"),
  Dialogo("Vector", "Você fala demais para alguém que se esconde tanto.", "direito"),
  Dialogo("Senhor Vazio", "Eu não me escondo… eu observo.", "esquerdo"),
  Dialogo("Vector", "Então observa isso de perto.”", "direito"),
  Dialogo("Senhor Vazio", "Você chegou até aqui sem o Nemetrix… curioso.", "esquerdo"),
  Dialogo("Vector", "Talvez o poder nunca tenha sido ele.”", "direito"),
  Dialogo("Senhor Vazio", "Vamos testar esa teoria!", "esquerdo"),
];

final listaDeDialogos = [
  dialogosFase1,
  dialogosFase2, 
  dialogosFase3,
  dialogosFase4,
  dialogosFase5
];