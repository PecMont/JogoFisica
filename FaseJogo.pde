class FaseJogo extends Fase{
  GerenciadorDeSala gerenciador;

  FaseJogo(ControladorDeFase controlador){
    super(controlador);
    
    //Configurar SALAS
    //SALA 1
    gerenciador = new GerenciadorDeSala();
    gerenciador.addSala(new Sala(
      backgrounds[0],  //Fundo padrão
      new PImage[]{loadImage("espelhoRaios.png"), loadImage("DJ.png"), loadImage("madeiraRegua.png")}, //Fundo dos desafios
      new Desafio[]{new DesafioDaVerdade(this), new DesafioResistor(this), new DesafioFE(this)},
      new PVector[]{
        new PVector(533, 150, 110), // Espelho
        new PVector(435, 315, 45), // Disjuntor
        new PVector(570, 468, 27)  // FE
      },
      new String[]{"Espelho, espelho meu, quem é mais bela do que eu?", "Quem acende uma luz é o primeiro a se beneficiar da claridade.", "Um é pouco, dois é bom, três é demais!"}
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
