class DesafioFE extends Desafio { 
  String resposta = "sim";
  String respostaM = "M";
    int distancia = 20; // Valor correto para o desafio
    float posX = 100; // Posição inicial do objeto
    float imaX = 400; // Posição do ímã
    float imaY = 300; // Posição do ímã
    boolean desafioCompleto = false; // Flag para verificar se o jogo foi vencido
    boolean mostrarLetra = false; // Flag para controlar exibição da letra misteriosa

    String pergunta = "            Digite a distância em metros para que a Força Elétrica \n      seja = 8.9×10^7 N.\n         q1 = 2C e q2 = 2C  ";
    String tentativa = ""; // Valor atual da tentativa convertida

    int tempoExibicao = 0; // Armazena o tempo para exibir a letra misteriosa
    PImage reguaImg; // Variável para armazenar a imagem da régua
    FaseJogo faseJogo;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////RESPOSTA = 20


    // Construtor
    DesafioFE (FaseJogo faseJogo) {
        this.faseJogo = faseJogo;
    }

    void render() {
        // Caixa de texto superior com a pergunta
        fill(0, 0, 0, 150);
        rect(140, 60, width - 200, 100, 9);
        fill(255);
        textSize(18);
        textAlign(CENTER);
        text(pergunta, width / 2, 100);

        // Desenha os objetos (círculos)
        fill(128, 128, 128);
        ellipse(posX-25, height / 2, 50, 50);
        ellipse(posX + 292, height / 2, 50, 50);


        // Mostra a tentativa do usuário na tela
        fill(100);
        stroke(0);
        rect(width / 2 - 200, height - 81, 400, 50);
        fill(225);
        text("Insira a distância que resolva a equação: " + tentativa, width / 2, height - 45);


        // Mostra a fórmula da força eletromagnética
        float formulaWidth = 200; // Largura do retângulo ao redor da fórmula
        float formulaHeight = 80; // Altura do retângulo
        float offsetX = 100; // Distância da borda direita

        float formulaX = imaX + offsetX; // Alinhando a fórmula à direita
        float formulaY = imaY - formulaHeight / 2; // Mantém a fórmula na mesma linha Y das bolas

        fill(100);
        stroke(0);
        rect(formulaX, formulaY, formulaWidth, formulaHeight);

        fill(225);
        textSize(18);
        text("          F = (k .(q1 . q2)) \n                -------------\n                 d^2", formulaX + 80, formulaY + 35);
        
        
        // Verifica se a tentativa está correta
        if (tentativa.equals("20")) {
            fill(255);
            textSize(20);
            text("Letra misteriosa: M\n  Clique para continuar.", width / 1.2, height / 1.5);
       
            desafioCompleto = true;
            //completo = true;
        }
        
        
        
    }


      void keyPressed(char key) { 
          //if(completo) return;
      
          if(key == BACKSPACE && tentativa.length() > 0){
            tentativa = tentativa.substring(0, tentativa.length() - 1);
          }else if(key == ENTER){
            if(tentativa.equals(respostaM)){
              
              //desafioCompleto = true;
              //completo = true;
            }
          }else if(key != BACKSPACE){
            tentativa += key;
          }
        }



    @Override
    void mousePressed() {
        if(desafioCompleto){
          completo= true;
        }
        // if (completo) return;
    }


}
