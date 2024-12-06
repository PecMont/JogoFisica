class GerenciadorDeSala{
  ArrayList<Sala> salas= new ArrayList<>();
  int salaAtual= 0;
  
  void addSala(Sala sala){
    salas.add(sala);
  }
  
  Sala getSalaAtual(){
    return salas.get(salaAtual);
  }
  //Renderização da sala
  void render(){
    Sala sala= getSalaAtual();
    sala.render();  //Inicio do render
    
    if(sala.todosDesafiosCompletos()){
      text("Sala concluída! Aperte P para ir para a próxima sala.", 260, 100);
    }else{
      fill(255);
      textSize(20);
      text("Sala: " + (salaAtual + 1), 33, 10);
      text("Desafio: " + (sala.getDesafioAtual() + 1), 45, 29);
    }
    
  }
  
  void handleMousePressed(float x, float y){
    Sala sala = getSalaAtual();
    sala.handleMousePressed(x, y);
  }
  
  void handleKeyPressed(char key){
    if( ( (key == 'p') || (key == 'P') ) && (getSalaAtual().todosDesafiosCompletos()) && (salaAtual < salas.size() - 1) ){
      salaAtual++;
    }else{
      getSalaAtual().handleKeyPressed(key);
    }
  }
}
