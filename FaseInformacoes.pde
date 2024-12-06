class FaseInformacoes extends Fase{
  FaseInformacoes(ControladorDeFase controlador){
    super(controlador);
  }
  
  void render(){
    background(50, 150, 200);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Este jogo foi desenvolvido pelo Gatão e a Mari!", width / 2, height / 4);
    text("Clique nos botões e resolva os desafios para avançar.", width / 2, height / 4 + 50);
    text("Pressione B para voltar ao menu.", width / 2, height - 50);
  }
  
  void handleMousePressed(float x, float y){}
  
  void handleKeyPressed(char key){
    if((key == 'b') || (key == 'B')){
      controlador.setFase(new MenuInicial(controlador));
    }
  }



}
