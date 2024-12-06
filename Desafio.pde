abstract class Desafio{
  public boolean completo= false;
  
  abstract void render();  //Montar desafio
  abstract void mousePressed();  //Verifica clique com o Mouse
  abstract void keyPressed(char key);  //Verifica texto do teclado
  
  boolean estaCompleto(){
    return completo;
  }
}
