class DesafioResistor extends Desafio{
  Resistor[] resistores = new Resistor[5]; // array para armazenar os 5 resistores
  float resistenciaTotal = 0; // resistência total do circuito
  float resistenciaAlvo = 10; // resistência que o jogador precisa alcançar (pode ser ajustada)
  boolean venceu = false; // condição de vitória
  int valorFixo = 50; // Definindo o valor fixo dos resistores
  
  FaseJogo faseJogo;
  
  DesafioResistor(FaseJogo faseJogo){
    for (int i = 0; i < resistores.length; i++) {
      resistores[i] = new Resistor(valorFixo, true); // Todos os resistores começam em série
    }
    calcularResistencia();
  }
  
  void calcularResistencia() {
    float resistenciaSerie = 0;
    float resistenciaParalelo = 0;
    int resistoresParalelo = 0;
    
    for (Resistor r : resistores) {
      if (r.emSerie) {
        resistenciaSerie += r.valor; // Soma direto para resistores em série
      } else {
        resistenciaParalelo += 1.0 / r.valor; // Soma dos inversos para resistores em paralelo
        resistoresParalelo++;
      }
    }
    
    // Se houver resistores em paralelo, calcula a resistência equivalente
    if (resistoresParalelo > 0) {
      resistenciaParalelo = 1.0 / resistenciaParalelo;
    }
    
    // A resistência total é a soma da série com a resistência equivalente em paralelo
    resistenciaTotal = resistenciaSerie + resistenciaParalelo;
}

  void render() {
    // Verifica se a resistência total está suficientemente próxima da resistência alvo
    if (abs(resistenciaTotal - resistenciaAlvo) < 0.1) {
        fill(255); // Cor para o "I"
        textSize(20); // Tamanho maior para a letra "I"
        text("   Letra misteriosa: I\n  Clique para continuar.", 300, 400);
        venceu = true;
        completo= true;
    }

    // Exibe os resistores e suas posições (série ou paralelo)
    for (int i = 0; i < resistores.length; i++) {
      
      
        fill(0, 0, 0, 150);
        stroke(0);
        rect(width / 2 - 120, ((height - 510) + (i *30)), 180, 20); 
        textSize(20); // Tamanho de texto padrão
        fill(255); // s
        text("R" + (i + 1) + ": " + resistores[i].valor + " Ω " + (resistores[i].emSerie ? "Série" : "Paralelo"), 300, 100 + i * 30);
    }
    
    // Mostra a resistência total e a resistência alvo
    textSize(20); // Tamanho de texto padrão
    fill(0); // Cor preta para os textos
    text("Resistência Total: " + resistenciaTotal + " Ω", 300, 460);
    text("Resistência Alvo: " + resistenciaAlvo + " Ω", 300, 490);
    
    // Instruções para o jogador
    fill(50, 50, 50, 190);  // Cor de fundo do retângulo 
    rect(139, 8, width - 300, 50, 9);

    fill(255);  // Cor do texto (preto)
    text("Clique nos resistores para mudar entre Série/Paralelo", 155, 30);
}

  void mousePressed() {
   for (int i = 0; i < resistores.length; i++) {
      if (mouseY > 100 + i * 30 - 10 && mouseY < 100 + i * 30 + 10) {
        resistores[i].emSerie = !resistores[i].emSerie; // Alterna entre série e paralelo
        calcularResistencia(); // Recalcula a resistência total
      }
    }
  }
  void keyPressed(char key){}
}

class Resistor {
  int valor; // valor do resistor
  boolean emSerie; // se o resistor está em série ou paralelo

  Resistor(int valor, boolean emSerie) {
    this.valor = valor;
    this.emSerie = emSerie;
  }
}
