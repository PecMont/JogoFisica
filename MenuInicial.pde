class MenuInicial extends Fase {
  PFont fonteTitulo;
  PFont fonteBotao;

  MenuInicial(ControladorDeFase controlador) {
    super(controlador);
    fonteTitulo = createFont("Arial Bold", 48); // Fonte para o título
    fonteBotao = createFont("Arial", 24); // Fonte para os botões
  }

  void render() {
    // Fundo com gradiente
    for (int i = 0; i < height; i++) {
      float inter = map(i, 0, height, 0, 1);
      stroke(50 * inter, 150, 200 + (255 - 200) * inter);
      line(0, i, width, i);
    }

    // Elementos decorativos
    noStroke();
    fill(255, 255, 0, 50);
    ellipse(width / 2, height / 2, 500, 500); // Sol brilhante
    fill(255, 255, 255, 30);
    rect(0, height - 50, width, 50); // Efeito de chão

    // Título do jogo
    textFont(fonteTitulo);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Seja Bem-Vindo!", width / 2, height / 3);

    // Botão "Jogar" com sombra
    drawButton(width / 2 - 100, height / 2 - 50, 200, 50, "Jogar", color(0, 200, 0));

    // Botão "Informações" com sombra
    drawButton(width / 2 - 100, height / 2 + 50, 200, 50, "Informações", color(0, 0, 200));
  }

  // Função para desenhar botões com sombra
  void drawButton(float x, float y, float w, float h, String label, color fillColor) {
    fill(0, 100); // Sombra
    rect(x + 5, y + 5, w, h, 10);

    fill(fillColor); // Cor do botão
    rect(x, y, w, h, 10);

    fill(255); // Cor do texto
    textFont(fonteBotao);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }

  void handleMousePressed(float x, float y) {
    if ((x > width / 2 - 100) && (x < width / 2 + 100)) {
      if ((y > height / 2 - 50) && (y < height / 2)) {
        controlador.setFase(new FaseJogo(controlador)); // Inicia o jogo
      } else if ((y > height / 2 + 50) && (y < height / 2 + 100)) {
        controlador.setFase(new FaseInformacoes(controlador)); // Mostra informações
      }
    }
  }

  void handleKeyPressed(char key) {}
}
