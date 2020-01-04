Snake s;
Comida c;
boolean gameOver;

void setup() {
  size(600,600);
  frameRate(10);
  s = new Snake();
  c = new Comida();
  gameOver = false;
}

void draw() {
  background(0, 191, 89);
  stroke(255);
  
  //Mientras gameOver sea falso, se ejecutara el juego
  if(!gameOver) {
    
    c.mostrar(); //Muestra la comida en algun lugar de la pantalla
    
    //Si la serpiente comio su comida, se vuelve a generar otra
    if(s.comer(c.getPosicion())) {
      c = new Comida(); //Se genera la comida nuevamente
      s.crecer(); //Crece el tamaño de la serpiente
    }
    
    //Si la serpiente chocó con las paredes o con ella misma el juego acaba
    if(s.getF()) {
      gameOver = true;
    }
  
    s.mostrar(); //Se dibuja la serpiente
    s.mover(); //Se le da la propiedad de moverse
    s.validarBordes(); //Se verifica si llega a chocar con las paredes
    s.muerte(); //Se verifica si la serpiente chocó con ella misma
  } else {
    fill(255);
    textAlign(CENTER);
    textSize(100);
    text("Game over", width/2, height/2); //Se le indica al jugador que el juego a terminado
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", width/2, height/2 + 50);
    text("Puntos: " + s.getPuntos(), width/2, height/2 + 100); //Se le indican sus puntos obtenidos
  }
}
