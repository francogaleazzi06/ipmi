void pantallaInicio() {

  background(0);

  float fondoAncho = width * fondoEscala;
  float fondoAlto = height * fondoEscala;

  float fondoX = (width - fondoAncho) / 2;
  float fondoY = (height - fondoAlto) / 2;

  // FONDO:
  if (!saliendoInicio) {

    if (fondoOpacidad < 255) {
      fondoOpacidad += 2;
    }

    if (fondoEscala < 1.0) {
      fondoEscala += 0.0015;
    }
  }
  else {

    if (fondoOpacidad > 0) {
      fondoOpacidad -= 3;
    }
  }

  tint(255, fondoOpacidad);
  image(fondo, fondoX, fondoY, fondoAncho, fondoAlto);
  noTint();


  // LOGO:
  if (!saliendoInicio) {

    logoY += logoV;
    logoV *= 0.87;

    if (logoY >= logoTargetY) {
      logoY = logoTargetY;
      logoV = 0;
    }
  }
  else {

    logoY -= logoSalidaSpeed;

    if (logoY <= logoSalidaTargetY) {
      logoY = logoSalidaTargetY;
    }
  }

  image(logo, logoX, logoY);


  // TEXTO PARPADEANTE:
  if (!saliendoInicio) {

    if (bajando) {
      alphaTexto -= 7;
    }
    else {
      alphaTexto += 4;
    }

    if (alphaTexto <= 70) {
      bajando = false;
    }

    if (alphaTexto >= 255) {
      bajando = true;
    }
  }
  else {

    if (alphaTexto > 0) {
      alphaTexto -= 15;
    }

    if (alphaTexto < 0) {
      alphaTexto = 0;
    }
  }

  fill(255, alphaTexto);
  textSize(38);
  text("Presione ENTER para Empezar", width/2, 355);


  // CAMBIO A LA SIGUIENTE DIAPOSITIVA:
  if (saliendoInicio) {
    if (fondoOpacidad <= 0 && alphaTexto <= 0 && logoY <= logoSalidaTargetY) {
      saliendoInicio = false;
      estado = 1;
      iniciarDiapositiva1();
    }
  }
}

// TECLADO:
void keyPressed() {

  if (estado == 0 && keyCode == ENTER && !saliendoInicio) {
    saliendoInicio = true;
    alphaTexto = 255;
    bajando = false;
  }
}
