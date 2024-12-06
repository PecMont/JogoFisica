class FaseFinal extends Fase{
  FaseFinal(ControladorDeFase controlador){
    super(controlador);
  }
   
  void render(){
    background(50, 150, 200);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Obrigado por jogar!", width / 2, height / 2 - 50);

    textSize(20);
    text("Pressione R para reiniciar.", width / 2, height / 2 + 50);
  }
   
  void handleMousePressed(float x, float y){}
   
  void handleKeyPressed(char key){
    if((key == 'r') || (key == 'R')) {
      controlador.setFase(new MenuInicial(controlador));
    }
   }
 }
