
// VIDEO EXPLICATIVO:
// https://youtu.be/zLswkFlUa8k // (disculpe que supere los 2 minutos!!)

PImage ilusion;

// VARIABLES
boolean colorCambiado = false;

float colorR = 255;
float colorG = 0;
float colorB = 120;

int incrementoJBase;
int incrementoIBase;

// VARIABLES PARA MOUSEPRESSED
float ruidoExtra = 0;
float pulsoAleatorio = 1;

void setup() {
  size(800, 400);
  
  // ILUSION ORIGINAL
  ilusion = loadImage("ilusion.png");
  
  // VALORES BASE
  incrementoJBase = 30;
  incrementoIBase = 20;
}

void draw() {
  background(255);
  
  // VARIABLES MODULADAS
  int incrementoJ = incrementoJBase + int(map(mouseX, 0, width, -6, 6));
  int incrementoI = incrementoIBase + int(map(mouseY, 0, height, -4, 4));
  
  float corrimientoMalla = map(mouseX, 0, width, -6, 6) + ruidoExtra;
  float tamanoCentro = (100 + map(mouseY, 0, height, -25, 35)) * pulsoAleatorio;
  float opacidadCentro = 40 + map(mouseY, 0, height, 20, -20);
  
  // MATRIZ 1
  dibujarMalla(6, width/2 + 10, height, incrementoI, incrementoJ, 15, 10, 0);
  
  // MATRIZ 2
  dibujarMalla(15, width/2 + 25, height, incrementoI, incrementoJ, 15, 10, corrimientoMalla);
  
  // ELIPSE CENTRAL
  dibujarCentro(width * 3/4, height/2, 70, tamanoCentro, opacidadCentro);
  
  // ILUSION ORIGINAL
  image(ilusion, 0, 0, width/2, height);
  
}

void dibujarMalla(int inicioY, int inicioX, int finY, int pasoY, int pasoX, float ancho, float alto, float extraX) {
  pushStyle();
  
  noStroke();
  fill(0);
  
  for (int i = inicioY; i <= finY; i += pasoY) {
    for (int j = inicioX; j <= width; j += pasoX) {
      float influencia = calcularInfluencia(j, i, width * 3/4, height/2); // FUNCION RETORNA VALOR
      float deformacion = map(influencia, 0, 1, 0, 8);
      ellipse(j + extraX + deformacion, i, ancho, alto);
    }
  }
  
  popStyle();
}

void dibujarCentro(float xCentro, float yCentro, int capas, float diametroBase, float opacidadBase) {
  pushStyle();
  
  noStroke();
  
  for (int i = 0; i <= capas; i++) {
    if (colorCambiado) {
      fill(colorR, colorG, colorB, opacidadBase);
    } else {
      fill(0, opacidadBase);
    }
    ellipse(xCentro, yCentro, diametroBase + i * 5, 1 + i * 5);
  }
  
  popStyle();
}

float calcularInfluencia(float x, float y, float xCentro, float yCentro) { // FUNCION RETORNA VALOR
  float d = dist(x, y, xCentro, yCentro);
  return map(d, 0, 260, 2, 0);
}

void keyPressed() {

  if (key == 'c' || key == 'C') {

    colorCambiado = !colorCambiado;

    if (colorCambiado) {
      colorR = random(255);
      colorG = random(255);
      colorB = random(255);
    }

  }
  
  if (key == 'r' || key == 'R') {
    reiniciarVariables();
  }
}

void mousePressed() {
  pulsoAleatorio = random(0.5, 1.30);
  ruidoExtra = random(-4, 4);
}

void reiniciarVariables() {
  // REINICIAR
  colorCambiado = false;
  incrementoJBase = 30;
  incrementoIBase = 20;
  pulsoAleatorio = 1;
  ruidoExtra = 0;
}
