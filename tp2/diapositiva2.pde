void iniciarDiapositiva2() {

  d2Inicializada = true;
  d2Saliendo = false;

  d2InicioMillis = millis();
  d2SalidaMillis = 0;

  d2FondoAlpha = 0;

  d2TituloY = d2TituloStartY;

  d2ScoutX = d2ScoutStartX;
  d2DrillerX = d2DrillerStartX;
  d2EngineerX = d2EngineerStartX;
  d2GunnerX = d2GunnerStartX;

  d2ScoutTextoListo = false;
  d2DrillerTextoListo = false;
  d2EngineerTextoListo = false;
  d2GunnerTextoListo = false;

  d2ScoutTextoMillis = 0;
  d2DrillerTextoMillis = 0;
  d2EngineerTextoMillis = 0;
  d2GunnerTextoMillis = 0;
}

void diapositiva2() {

  if (!d2Inicializada) {
    iniciarDiapositiva2();
  }

  background(0);

  int d2Tiempo = millis() - d2InicioMillis;


  // EMPIEZA EL RETIRO DE DIAPOSITIVA:
  if (!d2Saliendo && d2Tiempo > d2Duracion) {
    d2Saliendo = true;
    d2SalidaMillis = millis();
  }


  // FONDO:
  if (!d2Saliendo) {

    if (d2FondoAlpha < 255) {
      d2FondoAlpha += d2FondoSpeed;
      if (d2FondoAlpha > 255) {
        d2FondoAlpha = 255;
      }
    }
  }
  else {

    if (d2FondoAlpha > 0) {
      d2FondoAlpha -= d2FondoSpeed;
      if (d2FondoAlpha < 0) {
        d2FondoAlpha = 0;
      }
    }
  }

  tint(255, d2FondoAlpha);
  image(fondoD2, 0, 0, width, height);
  noTint();


  // TITULO:
  if (!d2Saliendo) {

    if (d2TituloY < d2TituloTargetY) {
      d2TituloY += d2TituloSpeed;
      if (d2TituloY > d2TituloTargetY) {
        d2TituloY = d2TituloTargetY;
      }
    }
  }
  else {

    d2TituloY -= d2TituloSpeed;
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Las Clases", width/2, d2TituloY);


  // SCOUT:
  if (!d2Saliendo) {

    if (d2Tiempo >= d2ScoutInicio) {
      if (d2ScoutX < d2ScoutTargetX) {
        d2ScoutX += d2ScoutSpeed;
        if (d2ScoutX >= d2ScoutTargetX) {
          d2ScoutX = d2ScoutTargetX;
          if (!d2ScoutTextoListo) {
            d2ScoutTextoListo = true;
            d2ScoutTextoMillis = millis();
          }
        }
      }
    }
  }
  else {

    d2ScoutX -= d2ScoutSpeed;
  }

  image(scout, d2ScoutX, d2ScoutY);

  if (d2ScoutTextoListo) {

    int d2ScoutLineas = (millis() - d2ScoutTextoMillis) / d2DelayLineaTexto;
    float d2ScoutTextoXActual = d2ScoutTextoX;

    if (d2Saliendo) {
      d2ScoutTextoXActual += (d2ScoutX - d2ScoutTargetX);
    }

    textAlign(LEFT, TOP);

    if (d2ScoutLineas >= 1) {
      textSize(24);
      text(d2ScoutNombre, d2ScoutTextoXActual, d2ScoutTextoY);
    }

    if (d2ScoutLineas >= 2) {
      textSize(20);
      text(d2ScoutDescripcion, d2ScoutTextoXActual, d2ScoutTextoY + 30);
    }
  }


  // DRILLER:
  if (!d2Saliendo) {

    if (d2Tiempo >= d2DrillerInicio) {
      if (d2DrillerX > d2DrillerTargetX) {
        d2DrillerX -= d2DrillerSpeed;
        if (d2DrillerX <= d2DrillerTargetX) {
          d2DrillerX = d2DrillerTargetX;
          if (!d2DrillerTextoListo) {
            d2DrillerTextoListo = true;
            d2DrillerTextoMillis = millis();
          }
        }
      }
    }
  }
  else {

    d2DrillerX += d2DrillerSpeed;
  }

  image(driller, d2DrillerX, d2DrillerY);

  if (d2DrillerTextoListo) {

    int d2DrillerLineas = (millis() - d2DrillerTextoMillis) / d2DelayLineaTexto;
    float d2DrillerTextoXActual = d2DrillerTextoX;

    if (d2Saliendo) {
      d2DrillerTextoXActual += (d2DrillerX - d2DrillerTargetX);
    }

    textAlign(LEFT, TOP);

    if (d2DrillerLineas >= 1) {
      textSize(24);
      text(d2DrillerNombre, d2DrillerTextoXActual, d2DrillerTextoY);
    }

    if (d2DrillerLineas >= 2) {
      textSize(20);
      text(d2DrillerDescripcion, d2DrillerTextoXActual, d2DrillerTextoY + 30);
    }
  }


  // ENGINEER:
  if (!d2Saliendo) {

    if (d2Tiempo >= d2EngineerInicio) {
      if (d2EngineerX < d2EngineerTargetX) {
        d2EngineerX += d2EngineerSpeed;
        if (d2EngineerX >= d2EngineerTargetX) {
          d2EngineerX = d2EngineerTargetX;
          if (!d2EngineerTextoListo) {
            d2EngineerTextoListo = true;
            d2EngineerTextoMillis = millis();
          }
        }
      }
    }
  }
  else {

    d2EngineerX -= d2EngineerSpeed;
  }

  image(engineer, d2EngineerX, d2EngineerY);

  if (d2EngineerTextoListo) {

    int d2EngineerLineas = (millis() - d2EngineerTextoMillis) / d2DelayLineaTexto;
    float d2EngineerTextoXActual = d2EngineerTextoX;

    if (d2Saliendo) {
      d2EngineerTextoXActual += (d2EngineerX - d2EngineerTargetX);
    }

    textAlign(LEFT, TOP);

    if (d2EngineerLineas >= 1) {
      textSize(24);
      text(d2EngineerNombre, d2EngineerTextoXActual, d2EngineerTextoY);
    }

    if (d2EngineerLineas >= 2) {
      textSize(20);
      text(d2EngineerDescripcion, d2EngineerTextoXActual, d2EngineerTextoY + 30);
    }
  }


  // GUNNER:
  if (!d2Saliendo) {

    if (d2Tiempo >= d2GunnerInicio) {
      if (d2GunnerX > d2GunnerTargetX) {
        d2GunnerX -= d2GunnerSpeed;
        if (d2GunnerX <= d2GunnerTargetX) {
          d2GunnerX = d2GunnerTargetX;
          if (!d2GunnerTextoListo) {
            d2GunnerTextoListo = true;
            d2GunnerTextoMillis = millis();
          }
        }
      }
    }
  }
  else {

    d2GunnerX += d2GunnerSpeed;
  }

  image(gunner, d2GunnerX, d2GunnerY);

  if (d2GunnerTextoListo) {

    int d2GunnerLineas = (millis() - d2GunnerTextoMillis) / d2DelayLineaTexto;
    float d2GunnerTextoXActual = d2GunnerTextoX;

    if (d2Saliendo) {
      d2GunnerTextoXActual += (d2GunnerX - d2GunnerTargetX);
    }

    textAlign(LEFT, TOP);

    if (d2GunnerLineas >= 1) {
      textSize(24);
      text(d2GunnerNombre, d2GunnerTextoXActual, d2GunnerTextoY);
    }

    if (d2GunnerLineas >= 2) {
      textSize(20);
      text(d2GunnerDescripcion, d2GunnerTextoXActual, d2GunnerTextoY + 30);
    }
  }


  // FIN DE LA DIAPOSITIVA:
  if (d2Saliendo) {
    if (millis() - d2SalidaMillis > d2SalidaDuracion) {
      estado = 3;
      d2Inicializada = false;
    }
  }

  textAlign(CENTER, CENTER);
}
