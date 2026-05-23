//IMAGENES PANTALLA DE INICIO:

PImage fondo;
PImage ghostShip;
PImage logo;

//IMAGENES DIAPOSITIVA 1:

PImage fondoD1;
PImage man1;
PImage globodetexto1;

//IMAGENES DIAPOSITIVA 2:

PImage fondoD2;
PImage scout;
PImage gunner;
PImage engineer;
PImage driller;

//IMAGENES DIAPOSITIVA 3:

PImage fondoD3Roja;
PImage fondoD3Celeste;
PImage fondoD3Izquierda;

//IMAGENES DIAPOSITIVA 4:

PImage fondoD4;

//IMAGENES DIAPOSITIVA 5:

PImage fondoFinal;
PImage botonReiniciar;

PFont fuente;

int estado;

// ----------------------------
//VARIABLES PANTALLA DE INICIO:
// ----------------------------

// VARIABLES FONDO:
float fondoOpacidad = 0;
float fondoEscala = 0.95;


// VARIABLES LOGO: 
float logoY;
float logoV = 15;
float logoTargetY = 18;
float logoSalidaTargetY = -130;
float logoSalidaSpeed = 10;
float logoX = 142.5;


// VARIABLES TEXTO "Presione ENTER para Empezar":
float alphaTexto = 255;
boolean bajando = true;
boolean saliendoInicio = false;

// ----------------------------
// VARIABLES DIAPOSITIVA 1:
// ----------------------------

boolean d1Inicializada = false;
boolean d1Saliendo = false;

int d1InicioMillis = 0;
int d1SalidaMillis = 0;

int d1Duracion = 10000;        // tiempo visible antes de salir (10 segundos)
int d1SalidaDuracion = 1000;   // tiempo de salida (1 segundo)

//VARIABLE FONDO:
float d1FondoX;
float d1FondoSpeed = 10;

//VARIABLES HOMBRE: 
float d1ManX;
float d1ManY = 280;
float d1ManTargetX = 30;
float d1ManSpeed = 11;
float d1ManStartX = -123;

//VARIBALES CAJA DE TEXTO:
float d1CajaX;
float d1CajaY = 315;
float d1CajaTargetX = 92;
float d1CajaSpeed = 11;
float d1CajaStartX = -490;

//VARIABLES TEXTO "¿Que es deep rock galactic?":
float d1TituloY;
float d1TituloTargetY = 30;
float d1TituloSpeed = 5;
float d1TituloStartY = -60;


String linea1 = "Deep Rock Galactic es un juego cooperativo";
String linea2 = "en primera persona donde un equipo de";
String linea3 = "enanos espaciales explora cuevas peligrosas";
String linea4 = "para recolectar minerales y sobrevivir a";
String linea5 = "criaturas alienígenas.";

// ----------------------------
// VARIABLES DIAPOSITIVA 2:
// ----------------------------

boolean d2Inicializada = false;
boolean d2Saliendo = false;

int d2InicioMillis = 0;
int d2SalidaMillis = 0;

int d2Duracion = 12000;        // tiempo visible antes de salir (12 segundos)
int d2SalidaDuracion = 1000;   // tiempo de salida (1 segundo)

// VARIABLES FONDO:
float d2FondoAlpha = 0;
float d2FondoSpeed = 6;

// VARIABLES TITULO:
float d2TituloY;
float d2TituloTargetY = 30;
float d2TituloSpeed = 5;
float d2TituloStartY = -60;

// TIEMPOS DE APARICION DE CLASES:
int d2ScoutInicio = 1000;
int d2DrillerInicio = 2200;
int d2EngineerInicio = 3400;
int d2GunnerInicio = 4800;

int d2DelayLineaTexto = 450;

// SCOUT:
float d2ScoutX;
float d2ScoutY = -45;
float d2ScoutTargetX = -60;
float d2ScoutSpeed = 15;
float d2ScoutStartX = -620;
boolean d2ScoutTextoListo = false;
int d2ScoutTextoMillis = 0;
float d2ScoutTextoX = 125;
float d2ScoutTextoY = 70;
String d2ScoutNombre = "SCOUT";
String d2ScoutDescripcion = "movilidad e iluminación.";

// DRILLER:
float d2DrillerX;
float d2DrillerY = 40;
float d2DrillerTargetX = 95;
float d2DrillerSpeed = 15;
float d2DrillerStartX = 640;
boolean d2DrillerTextoListo = false;
int d2DrillerTextoMillis = 0;
float d2DrillerTextoX = 125;
float d2DrillerTextoY = 178;
String d2DrillerNombre = "DRILLER";
String d2DrillerDescripcion = "perforación y control del terreno.";

// ENGINEER:
float d2EngineerX;
float d2EngineerY = 152;
float d2EngineerTargetX = -60;
float d2EngineerSpeed = 15;
float d2EngineerStartX = -620;
boolean d2EngineerTextoListo = false;
int d2EngineerTextoMillis = 0;
float d2EngineerTextoX = 125;
float d2EngineerTextoY = 292;
String d2EngineerNombre = "ENGINEER";
String d2EngineerDescripcion = "plataformas y torretas.";

// GUNNER:
float d2GunnerX;
float d2GunnerY = 247;
float d2GunnerTargetX = 95;
float d2GunnerSpeed = 15;
float d2GunnerStartX = 640;
boolean d2GunnerTextoListo = false;
int d2GunnerTextoMillis = 0;
float d2GunnerTextoX = 125;
float d2GunnerTextoY = 405;
String d2GunnerNombre = "GUNNER";
String d2GunnerDescripcion = "defensa y potencia de fuego.";

// ----------------------------
// VARIABLES DIAPOSITIVA 3:
// ----------------------------

boolean d3Inicializada = false;
boolean d3Saliendo = false;

int d3InicioMillis = 0;
int d3SalidaMillis = 0;

int d3Duracion = 10000;         // tiempo visible antes de salir (10 segundos)
int d3SalidaDuracion = 2500;    // tiempo de salida (2.5 segundos)

int d3CompartidosInicio = 1000;
int d3DelayLineaTexto = 450;

// VARIABLES FONDOS:
float d3FondoIzquierdaX;
float d3FondoIzquierdaY = -40;
float d3FondoIzquierdaTargetX = -20;
float d3FondoIzquierdaSpeed = 10;
float d3FondoIzquierdaStartX = -400;

float d3FondoDerechaX;
float d3FondoDerechaY = 50;
float d3FondoDerechaTargetX = 345;
float d3FondoDerechaSpeed = 10;
float d3FondoDerechaStartX = 640;

float d3FondoCelesteX = 130;
float d3FondoCelesteY;
float d3FondoCelesteTargetY = 180;
float d3FondoCelesteSpeed = 10;
float d3FondoCelesteStartY = 480;

// VARIABLES TITULO:
float d3TituloY;
float d3TituloTargetY = 30;
float d3TituloSpeed = 5;
float d3TituloStartY = -60;

// VARIABLES COMPARTIDAS CON DIAPOSITIVA 1:
float d3ManX;
float d3CajaX;

// TEXTO DE LA DIAPOSITIVA 3:
boolean d3CajaTextoListo = false;
int d3CajaTextoMillis = 0;

String d3Linea1 = "Cada misión ocurre en cuevas generadas";
String d3Linea2 = "aleatoriamente. Los jugadores deben";
String d3Linea3 = "explorar, iluminar el entorno y";
String d3Linea4 = "recolectar recursos mientras administran";
String d3Linea5 = "munición y herramientas.";

// ----------------------------
// VARIABLES DIAPOSITIVA 4:
// ----------------------------

boolean d4Inicializada = false;
boolean d4Saliendo = false;

int d4InicioMillis = 0;
int d4SalidaMillis = 0;

int d4Duracion = 10000;         // tiempo visible antes de salir (10 segundos)
int d4SalidaDuracion = 2000;    // tiempo de salida (2 segundos)

// VARIABLES FONDO:
float d4FondoOpacidad = 0;
float d4FondoEscala = 0.95;
float d4PersonajesAlpha = 255;

// VARIABLES TITULO:
float d4TituloY;
float d4TituloTargetY = 30;
float d4TituloSpeed = 5;
float d4TituloStartY = -60;

// TEXTO:
int d4DelayLineaTexto = 450;
boolean d4TextoListo = false;
int d4TextoMillis = 0;

String d4Linea1 = "Combate y trabajo en equipo";
String d4Linea2 = "Durante las misiones, los jugadores deben";
String d4Linea3 = "defenderse de hordas alienígenas.";
String d4Linea4 = "La cooperación es fundamental";
String d4Linea5 = "para sobrevivir y completar los objetivos.";

// ----------------------------
// VARIABLES DIAPOSITIVA 5:
// ----------------------------

boolean d5Inicializada = false;
boolean d5Saliendo = false;

int d5InicioMillis = 0;
int d5SalidaMillis = 0;

int d5BotonDelay = 2000;
int d5SalidaDuracion = 1200;

// VARIABLES FONDO:
float d5FondoOpacidad = 0;
float d5FondoEscala = 0.95;

// VARIABLES BOTON:
float d5BotonAlpha = 0;

int d5BotonX = 470;
int d5BotonY = 417;

int d5BotonAncho = 135;
int d5BotonAlto = 28;

// HITBOX DEL BOTON (MÁS GRANDE):
int d5HitboxX = 450;
int d5HitboxY = 404;

int d5HitboxAncho = 170;
int d5HitboxAlto = 55;

void setup() {

  size(640, 480);
  
// PANTALLA DE INICIO
  fondo = loadImage("diapositiva1.jpg");
  ghostShip = loadImage("Ghost Ship.png");
  logo = loadImage("logo.png");
  
// DIAPOSITIVA 1
  fondoD1 = loadImage("diapositiva2.jpg");
  man1 = loadImage("man1.png");
  globodetexto1 = loadImage("globodetexto1.png");
  
// DIAPOSITIVA 2
  fondoD2 = loadImage("diapositiva3.jpg");
  scout = loadImage("scout.png");
  gunner = loadImage("gunner.png");
  engineer = loadImage("engineer.png");
  driller = loadImage("driller.png");
  
// DIAPOSITIVA 3
  fondoD3Roja = loadImage("diapositiva4.png");
  fondoD3Celeste = loadImage("diapositiva4-1.png");
  fondoD3Izquierda = loadImage("diapositiva4-2.png");
  
// DIAPOSITIVA 4  
  fondoD4 = loadImage("diapositiva5.jpg");
  
// DIAPOSITIVA 5  
  fondoFinal = loadImage("diapositiva6.jpg");
  botonReiniciar = loadImage("reiniciar.png");
  
// FUENTE
  fuente = loadFont("YuGothicUI-Regular-48.vlw");
  textFont(fuente);
  textAlign(CENTER, CENTER);

  estado = 0;

  logoY = -120;
}


void draw() {

// MÁQUINA DE ESTADOS:
  switch(estado) {

  case 0:
    pantallaInicio();
    break;

  case 1:
    diapositiva1();
    break;

  case 2:
    diapositiva2();
    break;

  case 3:
    diapositiva3();
    break;

  case 4:
    diapositiva4();
    break;

  case 5:
    diapositivaFinal();
    break;
  }

  // GHOST SHIP (SIEMPRE VISIBLE)
  image(ghostShip, 10, 404.5);
}
