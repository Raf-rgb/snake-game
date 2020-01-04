class Snake {
  PVector posicion, velocidad;
  int tamano, puntos;
  boolean f;
  ArrayList<PVector> cuerpo = new ArrayList<PVector>();
  
  Snake() {
    f = false; //Indica que la serpiente no esta muerta
    tamano = 20; //Tamaño de la serpiente
    puntos = 0; 
    posicion = new PVector(width/2, height/2); //Inicialmente la serpiente se ubicará en el centro de la pantalla
    velocidad = new PVector(1,1);
    
    cuerpo.add(new PVector(posicion.x, posicion.y)); //Se agrega un elemento al ArrayLista con la ubicacion inicial
  }
  
  //Metodo para dibujar la serpiente
  void mostrar() {
    fill(0, 128, 60);
    stroke(0, 64, 30);
    strokeWeight(3);
    rectMode(CENTER);
    
    for(PVector c : cuerpo) {
      rect(c.x + tamano/2, c.y + tamano/2, tamano, tamano);
    }
  }
  
  //Metodo para mover a la serpiente con el teclado
  void mover() {
    if(key == 'w') {
      posicion.y -= velocidad.y * tamano;
    } else if(key == 's') {
      posicion.y += velocidad.y * tamano;
    } else if(key == 'a') {
      posicion.x -= velocidad.x * tamano;
    } else if(key == 'd') {
      posicion.x += velocidad.x * tamano;
    }
    
    //Se agrega un elemento al ArrayList cada que se mueve la serpiente
    //Y se elimina el primer elemento para hacer el efecto de movimiento
    cuerpo.add(new PVector(posicion.x, posicion.y));
    cuerpo.remove(0); //Elimina el primer elemento del ArrayList
  }
  
  boolean comer(PVector comida) {
    PVector cabeza = cuerpo.get(cuerpo.size() - 1); //Se declara al ultimo elemento del ArrayList como la cabeza de la serpiente
    float distancia = dist(cabeza.x, cabeza.y, comida.x, comida.y); //Se calcula la distancia entre la cabeza de la serpiente y la comida
    
    //Si la distancia es menor a 1, quiere decir que la serpiente ha comido
    if(distancia < 1) {
      return true;
    }
    //Si la distancia no es menor a 1, entonce la serpiente no ha comido
    else {
      return false;
    }
  }
  
  //Metodo para verificar si la serpiente ha muerto por chocar con si misma
  void muerte() {
    //Se declara al ultimo elemento del ArrayList como la cabeza de la serpiente
    PVector cabeza = cuerpo.get(cuerpo.size() - 1);
    
    for(int i = 0; i < (cuerpo.size() - 1); i++) {
      //Se declara ha cada uno de los cuadrados de la serpiente (excepto el ultimo por ser la cabeza)
      //como el cuerpo de la serpiente
      PVector cuerpo = this.cuerpo.get(i);
      
      //Se calcula la distancia entre el cuerpo y la cabeza de la serpiente
      float distancia = dist(cuerpo.x, cuerpo.y, cabeza.x, cabeza.y);
      
      //Si la distancia es menor a 1, quiere decir que la serpiente ha chocado con ella misma
      if(distancia < 1) {
        f = true; //La serpiente esta muerta
      }
    }
  }
  
  void crecer() {
    //Se agrega un elemento al ArrayList y de esta manera la serpiente 
    //ahora mantiene su largo 
    cuerpo.add(new PVector(posicion.x, posicion.y));
    puntos++; //Se suma un punto por cada vez que la serpiente logre crecer
  }
  
  void validarBordes() {
    //Se declara al ultimo elemento del ArrayList como la cabeza de la serpiente
    PVector cabeza = cuerpo.get(cuerpo.size() - 1);
    
    //Si la cabeza de la serpiente choca con cualquiera de los 4 bordes de la pantalla, la serpiente muere
    if(cabeza.x > width - tamano/2 || cabeza.x < tamano/2 || cabeza.y > height - tamano/2 || cabeza.y < tamano/2) {
      f = true; //La serpiente esta muerta
    }
  }
  
  int getPuntos() {
    return puntos;
  }
  
  boolean getF() {
    return f;
  }
}
