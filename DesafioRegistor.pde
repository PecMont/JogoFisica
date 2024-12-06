class DesafioResistor extends Desafio{
  Resistor[] resistores = new Resistor[5]; // array para armazenar os 5 resistores
  float resistenciaTotal = 0; // resistência total do circuito
  float resistenciaAlvo = 10; // resistência que o jogador precisa alcançar (pode ser ajustada)
  boolean venceu = false; // condição de vitória
  int valorFixo = 50; // Definindo o valor fixo dos resistores
  
  DesafioResistor(){
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

  void render(){
    if (abs(resistenciaTotal - resistenciaAlvo) < 0.1) {
    text("Você venceu! LETRA I", 400, 300);
    completo= true;
    }
  
    // Exibe os resistores e suas posições (série ou paralelo)
    for (int i = 0; i < resistores.length; i++) {
      text("R" + (i + 1) + ": " + resistores[i].valor + " Ω " + (resistores[i].emSerie ? "Série" : "Paralelo"), 300, 100 + i * 30);
    }
    
    // Mostra a resistência total e a resistência alvo
    text("Resistência Total: " + resistenciaTotal + " Ω", 340, 460);
    text("Resistência Alvo: " + resistenciaAlvo + " Ω",  340, 490);
    
    // Instruções para o jogador
    text("Clique nos resistores para mudar entre Série/Paralelo", 400, 10);
    
    
  
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
