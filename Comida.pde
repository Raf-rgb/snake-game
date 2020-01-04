class Comida {
  PVector posicion; //
  int tamano;
  
  Comida() {
    tamano = 20; //Tamaño de la comida
    posicion = new PVector(int(random(width/tamano)), int(random(height/tamano))); //La comida tendrá una ubicacion aleatoria
    posicion.mult(tamano); //Se multiplica para reajustar el rango de la ubicacion
  }
  
  //Metodo para dibujar la comida en la pantalla
  void mostrar() {
    fill(0, 255, 0);
    noStroke();
    rectMode(CENTER);
    rect(posicion.x + tamano/2, posicion.y + tamano/2, tamano, tamano);
  }
  
  PVector getPosicion() {
    return posicion;
  }
}
