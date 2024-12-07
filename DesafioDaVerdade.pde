import java.time.LocalDateTime;
class DesafioDaVerdade extends Desafio {
  String pergunta = "Insira o ângulo de refração correto tendo em vista\n o ângulo de incidência.\n Indices de refração: Água = 1,33 e Ar = 1,00";
  String resposta = "sim";
  boolean desafioConcluido = false; 
  FaseJogo faseJogo;

  String respostaS = "S";
  String tentativa = "";
  
  DesafioDaVerdade(FaseJogo faseJogo) {
    this.faseJogo = faseJogo; 

  }

  void render() {
    fill(0, 0, 0, 150);
    rect(150, 40, width - 300, 100, 9);
    fill(255);
    textSize(18);
    textAlign(CENTER);
    text(pergunta, width / 2, 25 + 50);

    // Mostra a tentativa do usuário na tela
        fill(100);
        stroke(0);
        rect(10, height - 81, 350, 50); 
        fill(225);
        text("Insira o ângulo de refração: ", 150, 551);
        text(tentativa, 295, 551);

        // Verifica se a tentativa está correta
        if (tentativa.equals("33,83") || tentativa.equals("33.83")) {
            fill(100);
            stroke(0);
            rect(565, 530, 210, 55);
            fill(255);
            textSize(20);
            text("Letra misteriosa: S\n Clique para continuar.", 666, 552);
            completo = true;

        }

    // Mostra a fórmula da 
        fill(0, 0, 0, 150);
        stroke(0);
        rect(width / 2 - 200, height - 450, 400, 50); 
        fill(225);
        textSize(18);
        text("n1 . sen(θ1) = n2 . sen(θ2)", 405,180);

    
  }

  void mousePressed() {
    if (completo) return;
    
  }

  void keyPressed(char key) { 
    if(completo) return;

    if(key == BACKSPACE && tentativa.length() > 0){
      tentativa = tentativa.substring(0, tentativa.length() - 1);
    }else if(key == ENTER){
      if(tentativa.equals(respostaS)){
        completo = true;
      }
    }else if(key != BACKSPACE){
      tentativa += key;
    }
  }

  
   
  
}
