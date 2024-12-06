class FaseJogo extends Fase{
  GerenciadorDeSala gerenciador;
  
  FaseJogo(ControladorDeFase controlador){
    super(controlador);
    
    //Configurar SALAS
    //SALA 1
    gerenciador= new GerenciadorDeSala();
    gerenciador.addSala(new Sala(
      backgrounds[0],  //Fundo padrão
      new PImage[]{loadImage("fundoSala1Desafio1.png"), loadImage("fundoSala1Desafio2.png"), loadImage("fundoSala1Desafio3.png")}, //Fundo dos desafios
      new Desafio[]{new DesafioDaVerdade(), new DesafioResistor(), new DesafioDaVerdade()},
      new PVector[]{new PVector(533, 160, 200), new PVector(435, 317, 55), new PVector(575, 500, 20)},
      new String[]{"Planeta laranja", "Planeta cinza.", "Planeta azul."}
    ));
    //SALA 2
    gerenciador.addSala(new Sala(
        backgrounds[1],
        new PImage[]{loadImage("fundoSala2Desafio1.png"), loadImage("fundoSala2Desafio2.png"), loadImage("fundoSala2Desafio3.png")}, 
        new Desafio[]{new DesafioDaVerdade(), new DesafioDaVerdade(), new DesafioDaVerdade()},
        new PVector[]{new PVector(205, 85, 70), new PVector(470, 525, 15), new PVector(550, 350, 20)},
        new String[]{"O botão está perto da entrada!", "Está no centro da sala.", "Olhe perto da janela."}
        ));
    //SALA 3
    gerenciador.addSala(new Sala(
        backgrounds[2],
        new PImage[]{loadImage("fundoSala3Desafio1.png"), loadImage("fundoSala3Desafio2.png"), loadImage("fundoSala3Desafio3.png")}, 
        new Desafio[]{new DesafioDaVerdade(), new DesafioDaVerdade(), new DesafioDaVerdade()},
        new PVector[]{new PVector(200, 200, 20), new PVector(600, 300, 20), new PVector(600, 400, 20)},
        new String[]{"O botão está perto da entrada!", "Está no centro da sala.", "Olhe perto da janela."}
        ));
  }
  
    void render(){
      gerenciador.render();
      if( (gerenciador.salaAtual == gerenciador.salas.size() - 1) && (gerenciador.getSalaAtual().todosDesafiosCompletos()) ){
        controlador.setFase(new FaseFinal(controlador));
      }
    }
    
    void handleMousePressed(float x, float y){
      gerenciador.handleMousePressed(x, y);
    }
  
    void handleKeyPressed(char key){
      gerenciador.handleKeyPressed(key);
    }
}
