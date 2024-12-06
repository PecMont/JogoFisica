class FaseFinal extends Fase {
  FaseFinal(ControladorDeFase controlador) {
    super(controlador);
  }
  boolean exibindoDistancia = false;
  int tempoExibicaoDistancia = 0;
  int countdown= 10;
  
  boolean venceu = false;  // Flag para verificar se o jogador venceu
  String pergunta = "Escreva as pistas que você recebeu:";
  String tentativa = "";  // Variável para armazenar a resposta do usuário

  

  void handleMousePressed(float x, float y) {
    // A função não está sendo usada no momento, mas pode ser expandida mais tarde
  }
  
  void handleKeyPressed(char key) {
    // Adiciona a letra digitada à tentativa
    if (Character.isLetterOrDigit(key)) {
        tentativa += key;
    } else if (key == BACKSPACE && tentativa.length() > 0) {
        // Remove o último caractere se o BACKSPACE for pressionado
        tentativa = tentativa.substring(0, tentativa.length() - 1);
    }

    // Verifica se a resposta foi correta
    if (tentativa.equalsIgnoreCase("SIM")) {
        venceu = true;
    }

    // Se a tecla C for pressionada
    if (key == 'c' || key == 'C') {
        if (!exibindoDistancia) {
            // Marca o início da exibição e define o tempo
            exibindoDistancia = true;
            tempoExibicaoDistancia = millis();
        }
    }
}

void render() {
    background(50, 150, 200);

    // Renderizar a pergunta no topo da tela
    fill(255);
    textSize(28);
    textAlign(CENTER, CENTER);
    text(pergunta, width / 2, height / 4);

    // Renderizar o campo de entrada e a tentativa atual
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Digite sua resposta:", width / 2 - 200, height / 2 - 20);

    fill(240);
    rect(width / 2 - 200, height / 2, 400, 40); // Campo de entrada visual

    fill(0);
    textAlign(LEFT, CENTER);
    text(tentativa, width / 2 - 190, height / 2 + 20);

    if (exibindoDistancia) {
        
        // Exibe a imagem enquanto estiver no tempo estipulado
        image(loadImage("portaAberta3.png"), 0, 0, width, height);
        
        if (millis() - tempoExibicaoDistancia >= 1000) {
        tempoExibicaoDistancia = millis();
        countdown--;
        }
        fill(0, 0, 0, 150); // Fundo semitransparente
        noStroke();
        rect(270, 540, 290, 100, 10); // Caixa com cantos arredondados
        fill(240);
        textSize(38);
        text("Saindo em", 300, 568);
        text(countdown, 500, 568);
        
        if (countdown < 0) {
            // Após 2 segundos, muda para o menu inicial
            exibindoDistancia = false;
            controlador.setFase(new MenuInicial(controlador));
            
        }
        return; // Sai do método render para evitar renderizar outras coisas enquanto exibe a imagem
    }

    // Mensagem de vitória ou tentativa
    if (venceu) {
        fill(255);
        textSize(26);
        textAlign(CENTER, CENTER);
        textSize(20);
        text("Pressione C para continuar.", width / 2, height / 2 + 150);
    } else {
        fill(255);
        textSize(26);
        textAlign(CENTER, CENTER);
        //text("Apague e tente novamente", width / 2, height / 2 + 100);
    }
}

}
