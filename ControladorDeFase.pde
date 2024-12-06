class ControladorDeFase{
  Fase faseAtual;
  
  ControladorDeFase(Fase faseInicial){
    this.faseAtual= faseInicial;
  }
  
  void setFase(Fase novaFase){
    this.faseAtual= novaFase;
  }
  
  void render(){
    faseAtual.render();
  }
  
  void handleMousePressed(float x, float y){
    faseAtual.handleMousePressed(x, y);
  }

  void handleKeyPressed(char key){
    faseAtual.handleKeyPressed(key);
  }

}
