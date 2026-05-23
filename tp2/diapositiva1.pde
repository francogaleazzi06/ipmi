void iniciarDiapositiva1() {

  d1Inicializada = true;
  d1Saliendo = false;

  d1InicioMillis = millis();
  d1SalidaMillis = 0;

  d1FondoX = width;

  d1ManX = d1ManStartX;
  d1CajaX = d1CajaStartX;


  d1TituloY = d1TituloStartY;
}

void diapositiva1() {

  if (!d1Inicializada) {
    iniciarDiapositiva1();
  }

  background(0);


  // EMPIEZA EL RETIRO DE DIAPOSITIVA:
  // Transición automática basada en tiempo (Timer)
  if (!d1Saliendo && millis() - d1InicioMillis > d1Duracion) {
    d1Saliendo = true;
    d1SalidaMillis = millis();
  }


  // FONDO: ENTRA POR DERECHA / SALE POR IZQUIERDA:
  if (!d1Saliendo) {

    if (d1FondoX > 0) {
      d1FondoX -= d1FondoSpeed;
      if (d1FondoX < 0) {
        d1FondoX = 0;
      }
    }
  }
  else {

    d1FondoX -= d1FondoSpeed;
  }

  image(fondoD1, d1FondoX, 0, width, height);


  // TITULO DE ARRIBA:
  if (!d1Saliendo) {

    if (d1TituloY < d1TituloTargetY) {
      d1TituloY += d1TituloSpeed;
      if (d1TituloY > d1TituloTargetY) {
        d1TituloY = d1TituloTargetY;
      }
    }
  }
  else {

    d1TituloY -= d1TituloSpeed;
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("¿Qué es Deep Rock Galactic?", width/2, d1TituloY);


  // CAJA VERDE DE TEXTO:
  if (!d1Saliendo) {

    if (d1CajaX < d1CajaTargetX) {
      d1CajaX += d1CajaSpeed;
      if (d1CajaX > d1CajaTargetX) {
        d1CajaX = d1CajaTargetX;
      }
    }
  }
  else {

    d1CajaX -= d1CajaSpeed;
  }

  image(globodetexto1, d1CajaX, d1CajaY);
  
  // TEXTO POR LINEAS:
  textAlign(LEFT, TOP);
  textSize(20);
  fill(255);

  int lineasVisibles;

  lineasVisibles = (millis() - d1InicioMillis - 500) / 450;

  if (!d1Saliendo) {

    if (lineasVisibles >= 1) {
      text(linea1, d1CajaTargetX + 70, d1CajaY + 18);
    }

    if (lineasVisibles >= 2) {
      text(linea2, d1CajaTargetX + 70, d1CajaY + 44);
    }

    if (lineasVisibles >= 3) {
      text(linea3, d1CajaTargetX + 70, d1CajaY + 70);
    }

    if (lineasVisibles >= 4) {
      text(linea4, d1CajaTargetX + 70, d1CajaY + 96);
    }

    if (lineasVisibles >= 5) {
      text(linea5, d1CajaTargetX + 70, d1CajaY + 122);
    }
  }
  else {

    if (lineasVisibles >= 1) {
      text(linea1, d1CajaX + 70, d1CajaY + 18);
    }

    if (lineasVisibles >= 2) {
      text(linea2, d1CajaX + 70, d1CajaY + 44);
    }

    if (lineasVisibles >= 3) {
      text(linea3, d1CajaX + 70, d1CajaY + 70);
    }

    if (lineasVisibles >= 4) {
      text(linea4, d1CajaX + 70, d1CajaY + 96);
    }

    if (lineasVisibles >= 5) {
      text(linea5, d1CajaX + 70, d1CajaY + 122);
    }
  }


  // HOMBRE QUE HABLA:
  if (!d1Saliendo) {

    if (d1ManX < d1ManTargetX) {
      d1ManX += d1ManSpeed;
      if (d1ManX > d1ManTargetX) {
        d1ManX = d1ManTargetX;
      }
    }
  }
  else {

    d1ManX -= d1ManSpeed;
  }

  image(man1, d1ManX, d1ManY);


  // FIN DE LA DIAPOSITIVA:
  if (d1Saliendo) {
    if (millis() - d1SalidaMillis > d1SalidaDuracion) {
      estado = 2;
    }
  }
}
