PImage backgrounds[];  //Imagens das salas
ControladorDeFase controlador;

void setup(){
  size(800,600);
  
  //Carregando backgrounds
  backgrounds = new PImage[3];
    backgrounds[0] = loadImage("imagemInicio2.png");
    backgrounds[1] = loadImage("sala2.png");
    backgrounds[2] = loadImage("sala3.png");
    
  controlador= new ControladorDeFase(null);
  controlador.setFase(new MenuInicial(controlador));
}

void draw(){
  controlador.render();
}

void mousePressed(){
  controlador.handleMousePressed(mouseX, mouseY);
}

void keyPressed(){
  controlador.handleKeyPressed(key);
}
