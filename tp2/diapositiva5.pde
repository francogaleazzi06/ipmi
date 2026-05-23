void diapositivaFinal() {

  if (!d5Inicializada) {
    iniciarDiapositivaFinal();
  }

  background(0);

  // FONDO:
  if (!d5Saliendo) {

    if (d5FondoOpacidad < 255) {
      d5FondoOpacidad += 2;
    }

    if (d5FondoEscala < 1.0) {
      d5FondoEscala += 0.0005;
    }
  }
  else {

    if (d5FondoOpacidad > 0) {
      d5FondoOpacidad -= 5;
    }

    if (d5FondoEscala > 0.95) {
      d5FondoEscala -= 0.0010;
    }
  }

  float d5FondoAncho = width * d5FondoEscala;
  float d5FondoAlto = height * d5FondoEscala;

  float d5FondoX = (width - d5FondoAncho) / 2;
  float d5FondoY = (height - d5FondoAlto) / 2;

  tint(255, d5FondoOpacidad);
  image(fondoFinal, d5FondoX, d5FondoY, d5FondoAncho, d5FondoAlto);
  noTint();


  // BOTON CON DELAY:
  if (millis() - d5InicioMillis > d5BotonDelay) {

    if (!d5Saliendo) {

      if (d5BotonAlpha < 255) {
        d5BotonAlpha += 8;
      }
    }
    else {

      if (d5BotonAlpha > 0) {
        d5BotonAlpha -= 12;
      }
    }

    tint(255, d5BotonAlpha);
    image(botonReiniciar, d5BotonX, d5BotonY, d5BotonAncho, d5BotonAlto);
    noTint();
  }


  // REINICIO:
  if (d5Saliendo) {

    if (millis() - d5SalidaMillis > d5SalidaDuracion) {

      // RESETEO GENERAL:
      estado = 0;

      d5Inicializada = false;

      // PANTALLA INICIO:
      fondoOpacidad = 0;
      fondoEscala = 0.95;

      logoY = -120;
      logoV = 15;

      alphaTexto = 255;

      saliendoInicio = false;

      // DIAPOSITIVAS:
      d1Inicializada = false;
      d2Inicializada = false;
      d3Inicializada = false;
      d4Inicializada = false;
    }
  }
}

void iniciarDiapositivaFinal() {

  d5Inicializada = true;
  d5Saliendo = false;

  d5InicioMillis = millis();
  d5SalidaMillis = 0;

  d5FondoOpacidad = 0;
  d5FondoEscala = 0.95;

  d5BotonAlpha = 0;
}

//BOTON
void mousePressed() {
  if (estado == 5 && !d5Saliendo) {
    if (mouseX > d5HitboxX && mouseX < d5HitboxX + d5HitboxAncho && 
        mouseY > d5HitboxY && mouseY < d5HitboxY + d5HitboxAlto) {
      
      d5Saliendo = true;
      d5SalidaMillis = millis();
    }
  }
}
