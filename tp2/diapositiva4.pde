void iniciarDiapositiva4() {
  d4Inicializada = true;
  d4Saliendo = false;

  d4InicioMillis = millis();
  d4SalidaMillis = 0;

  d4FondoOpacidad = 0;
  d4FondoEscala = 0.95;
  d4PersonajesAlpha = 255;
  
  d4TituloY = d4TituloStartY;

  d4TextoListo = false;
  d4TextoMillis = 0;
  
  d3ManX = d1ManTargetX;
  d3CajaX = d1CajaTargetX;

}

void diapositiva4() {

  if (!d4Inicializada) {
    iniciarDiapositiva4();
  }

  background(0);

  int d4Tiempo = millis() - d4InicioMillis;

  if (!d4Saliendo && d4Tiempo > d4Duracion) {
    d4Saliendo = true;
    d4SalidaMillis = millis();
  }

  // FONDO igual que la pantalla de  inicio
  if (!d4Saliendo) {
    if (d4FondoOpacidad < 255) {
      d4FondoOpacidad += 3;
    }

    if (d4FondoEscala < 1.0) {
      d4FondoEscala += 0.0015;
    }
  }
  else {
    if (d4FondoOpacidad > 0) {
      d4FondoOpacidad -= 2.85;
    }

    if (d4FondoEscala > 0.95) {
      d4FondoEscala -= 0.0006;
    }  
    if (d4PersonajesAlpha > 0) {
      d4PersonajesAlpha -= 5;
    }
  }

  float d4FondoAncho = width * d4FondoEscala;
  float d4FondoAlto = height * d4FondoEscala;
  float d4FondoX = (width - d4FondoAncho) / 2;
  float d4FondoY = (height - d4FondoAlto) / 2;

  tint(255, d4FondoOpacidad);
  image(fondoD4, d4FondoX, d4FondoY, d4FondoAncho, d4FondoAlto);
  noTint();

  tint(255, d4PersonajesAlpha);
  image(globodetexto1, d3CajaX, d1CajaY);
  image(man1, d3ManX, d1ManY);
  noTint();

  // TITULO
  if (!d4Saliendo) {
    if (d4TituloY < d4TituloTargetY) {
      d4TituloY += d4TituloSpeed;
      if (d4TituloY > d4TituloTargetY) {
        d4TituloY = d4TituloTargetY;
      }
    }
  }
  else {
    d4TituloY -= d4TituloSpeed;
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text(d4Linea1, width/2, d4TituloY);

  // TEXTO POR LINEAS
  if (!d4TextoListo && d4FondoOpacidad >= 255) {
    d4TextoListo = true;
    d4TextoMillis = millis();
  }

  int d4LineasVisibles = 0;
  int d4LineasOcultas = 0;

  if (d4TextoListo && !d4Saliendo) {
    d4LineasVisibles = (millis() - d4TextoMillis) / d4DelayLineaTexto;
  }

  if (d4Saliendo) {
    d4LineasOcultas = (millis() - d4SalidaMillis) / d4DelayLineaTexto;
  }

  textAlign(LEFT, TOP);
  textSize(20);
  fill(255);

  if (!d4Saliendo) {

    if (d4LineasVisibles >= 1) {
      text(d4Linea2, d1CajaTargetX + 70, d1CajaY + 18);
    }

    if (d4LineasVisibles >= 2) {
      text(d4Linea3, d1CajaTargetX + 70, d1CajaY + 44);
    }

    if (d4LineasVisibles >= 3) {
      text(d4Linea4, d1CajaTargetX + 70, d1CajaY + 70);
    }

    if (d4LineasVisibles >= 4) {
      text(d4Linea5, d1CajaTargetX + 70, d1CajaY + 96);
    }

  }
  else {

  fill(255, d4PersonajesAlpha);

  text(d4Linea2, d1CajaTargetX + 70, d1CajaY + 18);
  text(d4Linea3, d1CajaTargetX + 70, d1CajaY + 44);
  text(d4Linea4, d1CajaTargetX + 70, d1CajaY + 70);
  text(d4Linea5, d1CajaTargetX + 70, d1CajaY + 96);

}

  if (d4Saliendo) {
    if (millis() - d4SalidaMillis > d4SalidaDuracion) {
      estado = 5;
      d4Inicializada = false;
    }
  }

  textAlign(CENTER, CENTER);
}
