void iniciarDiapositiva3() {

  d3Inicializada = true;
  d3Saliendo = false;

  d3InicioMillis = millis();
  d3SalidaMillis = 0;

  d3FondoIzquierdaX = d3FondoIzquierdaStartX;
  d3FondoDerechaX = d3FondoDerechaStartX;
  d3FondoCelesteY = d3FondoCelesteStartY;

  d3TituloY = d3TituloStartY;

  d3ManX = d1ManStartX;
  d3CajaX = d1CajaStartX;

  d3CajaTextoListo = false;
  d3CajaTextoMillis = 0;
}

void dibujarCompartidosD3() {

  // HOMBRE Y CAJA QUE SE REUSAN
  if (!d3Saliendo) {

    if (millis() - d3InicioMillis >= d3CompartidosInicio) {

      if (d3ManX < d1ManTargetX) {
        d3ManX += d1ManSpeed;
        if (d3ManX > d1ManTargetX) {
          d3ManX = d1ManTargetX;
        }
      }

      if (d3CajaX < d1CajaTargetX) {
        d3CajaX += d1CajaSpeed;
        if (d3CajaX > d1CajaTargetX) {
          d3CajaX = d1CajaTargetX;
        }
      }

      if (d3ManX >= d1ManTargetX && d3CajaX >= d1CajaTargetX && !d3CajaTextoListo) {
        d3CajaTextoListo = true;
        d3CajaTextoMillis = millis();
      }
    }
  }

  image(globodetexto1, d3CajaX, d1CajaY);
  image(man1, d3ManX, d1ManY);

  // TEXTO POR LINEAS
  textAlign(LEFT, TOP);
  textSize(20);
  fill(255);

  int d3LineasVisibles = 0;
  int d3LineasOcultas = 0;

  if (d3CajaTextoListo) {
    d3LineasVisibles = (millis() - d3CajaTextoMillis) / d3DelayLineaTexto;
  }

  if (d3Saliendo) {
    d3LineasOcultas = (millis() - d3SalidaMillis) / d3DelayLineaTexto;
  }

  if (!d3Saliendo) {

    if (d3LineasVisibles >= 1) {
      text(d3Linea1, d1CajaTargetX + 70, d1CajaY + 18);
    }

    if (d3LineasVisibles >= 2) {
      text(d3Linea2, d1CajaTargetX + 70, d1CajaY + 44);
    }

    if (d3LineasVisibles >= 3) {
      text(d3Linea3, d1CajaTargetX + 70, d1CajaY + 70);
    }

    if (d3LineasVisibles >= 4) {
      text(d3Linea4, d1CajaTargetX + 70, d1CajaY + 96);
    }

    if (d3LineasVisibles >= 5) {
      text(d3Linea5, d1CajaTargetX + 70, d1CajaY + 122);
    }
  }
  else {

    if (d3LineasOcultas < 1) {
      text(d3Linea1, d1CajaTargetX + 70, d1CajaY + 18);
    }

    if (d3LineasOcultas < 2) {
      text(d3Linea2, d1CajaTargetX + 70, d1CajaY + 44);
    }

    if (d3LineasOcultas < 3) {
      text(d3Linea3, d1CajaTargetX + 70, d1CajaY + 70);
    }

    if (d3LineasOcultas < 4) {
      text(d3Linea4, d1CajaTargetX + 70, d1CajaY + 96);
    }

    if (d3LineasOcultas < 5) {
      text(d3Linea5, d1CajaTargetX + 70, d1CajaY + 122);
    }
  }

}

void diapositiva3() {

  if (!d3Inicializada) {
    iniciarDiapositiva3();
  }

  background(0);

  int d3Tiempo = millis() - d3InicioMillis;


  // EMPIEZA EL RETIRO DE DIAPOSITIVA:
  if (!d3Saliendo && d3Tiempo > d3Duracion) {
    d3Saliendo = true;
    d3SalidaMillis = millis();
  }


  // FONDO IZQUIERDA: ENTRA POR IZQUIERDA / SALE POR IZQUIERDA
  if (!d3Saliendo) {

    if (d3FondoIzquierdaX < d3FondoIzquierdaTargetX) {
      d3FondoIzquierdaX += d3FondoIzquierdaSpeed;
      if (d3FondoIzquierdaX > d3FondoIzquierdaTargetX) {
        d3FondoIzquierdaX = d3FondoIzquierdaTargetX;
      }
    }
  }
  else {

    d3FondoIzquierdaX -= d3FondoIzquierdaSpeed;
  }


  // FONDO DERECHA: ENTRA POR DERECHA / SALE POR DERECHA
  if (!d3Saliendo) {

    if (d3FondoDerechaX > d3FondoDerechaTargetX) {
      d3FondoDerechaX -= d3FondoDerechaSpeed;
      if (d3FondoDerechaX < d3FondoDerechaTargetX) {
        d3FondoDerechaX = d3FondoDerechaTargetX;
      }
    }
  }
  else {

    d3FondoDerechaX += d3FondoDerechaSpeed;
  }


  // FONDO CELESTE: ENTRA DESDE ABAJO / SALE HACIA ABAJO
  if (!d3Saliendo) {

    if (d3FondoCelesteY > d3FondoCelesteTargetY) {
      d3FondoCelesteY -= d3FondoCelesteSpeed;
      if (d3FondoCelesteY < d3FondoCelesteTargetY) {
        d3FondoCelesteY = d3FondoCelesteTargetY;
      }
    }
  }
  else {

    d3FondoCelesteY += d3FondoCelesteSpeed;
  }

  image(fondoD3Izquierda, d3FondoIzquierdaX, d3FondoIzquierdaY);
  image(fondoD3Celeste, d3FondoCelesteX, d3FondoCelesteY);
  image(fondoD3Roja, d3FondoDerechaX, d3FondoDerechaY);


  // TITULO DE ARRIBA
  if (!d3Saliendo) {

    if (d3TituloY < d3TituloTargetY) {
      d3TituloY += d3TituloSpeed;
      if (d3TituloY > d3TituloTargetY) {
        d3TituloY = d3TituloTargetY;
      }
    }
  }
  else {

    d3TituloY -= d3TituloSpeed;
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Exploración y Minería", width/2, d3TituloY);


  // ELEMENTOS COMPARTIDOS
  dibujarCompartidosD3();


  // FIN DE LA DIAPOSITIVA:
  if (d3Saliendo) {
    if (millis() - d3SalidaMillis > d3SalidaDuracion) {
      estado = 4;
      d3Inicializada = false;
    }
  }

  textAlign(CENTER, CENTER);
}
