abstract class Fase{
  ControladorDeFase controlador;
  
  Fase(ControladorDeFase controlador){
    this.controlador= controlador;
  }
  
  abstract void render();
  abstract void handleMousePressed(float x, float y);
  abstract void handleKeyPressed(char key);
}
