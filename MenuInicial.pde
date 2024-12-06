class MenuInicial extends Fase{
  MenuInicial(ControladorDeFase controlador){
    super(controlador);
  }
  
  void render(){
    //Fundo
    background(50, 150, 200);
    
    //Titulo
    fill(255);
    textAlign(CENTER, CENTER);
    text("Bem-vindo ao Jogo", width / 2, height / 4);
    
    //Botão Iniciar
    fill(0, 200, 0);
    rect(width / 2 - 100, height / 2- 50, 200, 50);
    fill(0);
    text("Jogor", width / 2, height / 2 - 25);
    
    //Botão Informações
    fill(0, 0, 200);
    rect(width / 2 - 100, height / 2 + 50, 200, 50);
    fill(0);
    text("Informações", width / 2, height / 2 + 75);
  }
  
  void handleMousePressed(float x, float y){
    if((x > width / 2 - 100) && (x < width / 2 + 100)){
      if((y > height / 2 - 50) && (y < height / 2)){
        controlador.setFase(new FaseJogo(controlador)); // Inicia o jogo
      }else if((y > height / 2 + 50) && (y < height / 2 + 100)){
        controlador.setFase(new FaseInformacoes(controlador)); // Mostra informações
      }
    }
  }
  
  void handleKeyPressed(char key){}
}
