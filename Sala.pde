class Sala {
  PImage background; // Fundo principal da tela
  PImage backgroundDesafios[]; // Arrays de fundo dos desafios
  Desafio desafios[]; // Desafios da sala
  PVector pontosDeAtivacao[];
  String perguntas[]; // Perguntas para achar os desafios
  int desafioAtual = 0;
  boolean desafiosIniciados[];

  // Indicador se o fundo especial do desafio está ativo
  boolean fundoDesafioAtivo = false;

  Sala(PImage background, PImage backgroundDesafios[], Desafio desafios[], PVector pontosDeAtivacao[], String perguntas[]) {
    this.background = background;
    this.backgroundDesafios = backgroundDesafios;
    this.desafios = desafios;
    this.pontosDeAtivacao = pontosDeAtivacao;
    this.perguntas = perguntas;
    this.desafiosIniciados = new boolean[desafios.length];
  }

  // Gerar a tela
  void render() {
    // Verifica se o fundo especial do desafio está ativo
    if (fundoDesafioAtivo) {
      // Exibir imagem do fundo do desafio e ajustar para o tamanho da tela
      image(backgroundDesafios[desafioAtual], 0, 0, width, height);
    } else {
      // Exibe a imagem principal da sala
      image(background, 0, 0, width, height);
    }
    
  ////Ellipse para ajudar na posição dos desafios (DESATIVAR QUANDO JOGAR)
  //  fill(255);
  //  for(PVector ponto : pontosDeAtivacao){
  //    ellipse(ponto.x, ponto.y, ponto.z, ponto.z);
  //  }
    // Escrever pergunta para o desafio com caixa
    if (!desafiosIniciados[desafioAtual]) {
      drawTextBox("Dica: " + perguntas[desafioAtual], 95, height - 80, width - 190, 60);
    }

    // Renderização do desafio
    if (desafiosIniciados[desafioAtual]) {
      desafios[desafioAtual].render();
    } else {
      // Escrever texto padrão das salas com caixa
      drawTextBox("Ache os locais para iniciar os desafios.", width / 2 - 200, 80, 400, 50);
    }
  }

  // Função para desenhar um texto com uma caixa ao fundo
  void drawTextBox(String texto, float x, float y, float w, float h) {
    fill(0, 0, 0, 150); // Fundo semitransparente
    noStroke();
    rect(x, y, w, h, 10); // Caixa com cantos arredondados

    fill(255); // Texto branco
    textAlign(CENTER, CENTER);
    textSize(16);
    text(texto, x + w / 2, y + h / 2);
  }

  // Verifica se o ponto de ativação foi clicado
  boolean pontoDeAtivacaoClicado(float x, float y, PVector ponto) {
    float tolerancia = ponto.z;
    return dist(x, y, ponto.x, ponto.y) < tolerancia;
  }

  // Verifica se todos os desafios foram concluídos
  boolean todosDesafiosCompletos() {
    for (Desafio desafio : desafios) {
      if (!desafio.estaCompleto()) return false;
    }
    return true;
  }

  void handleMousePressed(float x, float y) {
    // Se todos os desafios foram concluídos, ignora interações
    if (todosDesafiosCompletos()) return;

    // Verifica se o ponto de ativação foi clicado
    if ((desafioAtual < desafios.length) && (pontoDeAtivacaoClicado(x, y, pontosDeAtivacao[desafioAtual]))) {
      desafiosIniciados[desafioAtual] = true; // Ativa o desafio encontrado
      fundoDesafioAtivo = true;
      render(); // Renderiza o desafio
    }

    // Se o desafio foi iniciado, verifica se o clique tem impacto no desafio
    if (desafiosIniciados[desafioAtual]) {
      desafios[desafioAtual].mousePressed();

      // Avança para o próximo desafio se o atual estiver completo
      if (desafios[desafioAtual].estaCompleto()) {
        fundoDesafioAtivo = false;
        if (desafioAtual < desafios.length - 1) { // Verifica se não é o último desafio
          desafioAtual++;
        }
      }
    }
  }

  void handleKeyPressed(char key) {
    // Se todos os desafios foram concluídos ignora a interação
    if (todosDesafiosCompletos()) return;

    if (desafiosIniciados[desafioAtual]) {
      desafios[desafioAtual].keyPressed(key);

      // Se o desafio foi completado via tecla
      if (desafios[desafioAtual].estaCompleto()) {
        fundoDesafioAtivo = false;
        if (desafioAtual < desafios.length - 1) {
          desafioAtual++;
        }
      }
    }
  }

  int getDesafioAtual() {
    return desafioAtual;
  }
}
