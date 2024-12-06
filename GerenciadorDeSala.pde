class GerenciadorDeSala {
  ArrayList<Sala> salas = new ArrayList<>();
  int salaAtual = 0;

  void addSala(Sala sala) {
    salas.add(sala);
  }

  Sala getSalaAtual() {
    return salas.get(salaAtual);
  }

  // Renderização da sala
  void render() {
    Sala sala = getSalaAtual();
    sala.render(); // Início do render

    if (sala.todosDesafiosCompletos()) {
      // Caixa para a mensagem "Sala concluída"
      fill(0, 0,0, 150); // Fundo semitransparente
      noStroke();
      rect(150, 80, 600, 50, 10);

      fill(255); // Texto branco
      textAlign(CENTER, CENTER);
      textSize(20);
      text("Sala concluída! Aperte P para ir para a próxima sala.", 450, 105);
    } else {
      // Caixa para o texto da sala
      fill(0, 0, 0, 150); // Fundo semitransparente
      noStroke();
      //rect(15, 10, 100, 40, 10);

      // Caixa para o texto do desafio
      rect(15, 10, 120, 40, 10);

      fill(255); // Texto branco
      textAlign(LEFT, CENTER);
      textSize(20);
      //text("Sala: " + (salaAtual + 1), 35, 30);
      text("Desafio: " + (sala.getDesafioAtual() + 1), 32, 30);
    }
  }

  void handleMousePressed(float x, float y) {
    Sala sala = getSalaAtual();
    sala.handleMousePressed(x, y);
  }

  void handleKeyPressed(char key) {
    if (((key == 'p') || (key == 'P')) && (getSalaAtual().todosDesafiosCompletos()) && (salaAtual < salas.size() - 1)) {
      salaAtual++;
    } else {
      getSalaAtual().handleKeyPressed(key);
    }
  }
}
