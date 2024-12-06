class DesafioDaVerdade extends Desafio{
  String pergunta = "O Pedro é lindo?(responda sim ou não)";
  String resposta = "sim";
  String tentativa = "";
  boolean mostrouParabens = false;

  void render() {
    fill(0);
    textSize(16);
    text(pergunta, 200, 300);
    text("Digite sua resposta: " + tentativa, 200, 350);
    
    if(mostrouParabens){
      text("Parabéns! Você sabe o obvio!", 200, 400); // Mensagem de parabéns
      text("Aperte o Esquerdo do mouse para continuar", 200, 500); // Mensagem de parabéns
    }
  }
  
  void mousePressed() {} // Não precisa de clique do mouse nesse desafio
  
  void keyPressed(char key){
    if(completo) return; // Ignora interações se já estiver completo

    if(key == BACKSPACE && tentativa.length() > 0){
      tentativa = tentativa.substring(0, tentativa.length() - 1);
    }else if(key == ENTER){
      if(tentativa.equals(resposta)){
        completo = true;  // Marca o desafio como concluído
        mostrouParabens = true; // Exibe a mensagem de parabéns
      }
    }else if(key != BACKSPACE){
      tentativa += key;
    }
  }
}
