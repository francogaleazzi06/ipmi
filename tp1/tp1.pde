PImage miImagen;

void setup(){
  size(800,400);
  miImagen = loadImage("tenerife.jpg");
}

void draw(){
  background(108, 136, 186);
  image(miImagen,0,0,400,400);
  
  strokeWeight(3.1);
  
  // NUBES:
  
  noStroke();
  
  fill(129, 148, 192);
  beginShape();
   vertex(400, 50);
   vertex(800, 28);
   vertex(800,110);
   vertex(800,400);
   vertex(400,400);
  endShape();
  
  fill(163, 169, 200);
  beginShape();
   vertex(400, 84);
   vertex(549, 94);
   vertex(800,110);
   vertex(800,400);
   vertex(400,400);
  endShape();
  
  
  // ESTRUCTURA ARQUEADA:
  
  stroke(123, 95, 73);
  fill(123, 95, 73);
  ellipse(610,321,400,500);
  
  fill(90, 70, 45);
  ellipse(579,321,330,470);
  
  stroke(123, 95, 73);
  
  fill(58, 43, 22);
  triangle(470,148,531,119,511,107);
  
  fill(30, 19, 14);
  rect(684,283,57,40);
  
  // CIELO:
  
  fill(163, 169, 200);
  noStroke();
  ellipse(548, 337, 298, 437);
  
  
  
  // ESTRUCTURA PRINCIPAL:
  
  stroke(53, 44, 35);
  
  fill(233, 226, 218);
  beginShape();
   vertex(625, 182);
   vertex(612, 146);
   vertex(598, 151);
   vertex(565, 167);
   vertex(532, 189);
   vertex(500, 217);
   vertex(455, 262);
  endShape();
   
   
  beginShape();
   vertex(400, 285);
   vertex(429, 285);
   vertex(479, 243);
   vertex(513, 220);
   vertex(544, 203);
   vertex(569, 192);
   vertex(603, 181);
   vertex(636, 173);
   vertex(671, 168);
   vertex(667, 313);
   vertex(609, 321);
   vertex(400, 325);
   vertex(400, 285);
  endShape();
  
  // ENTRADA: 
  
  fill(80, 53, 42);
  ellipse(544, 321, 210, 110); 
  
  noStroke();
  fill(8, 2, 2);
  ellipse(544, 321, 180, 100); 
 
  fill(83, 42, 22);
  ellipse(544, 321, 160, 75); 
  
  // PIEDRAS:
  
  stroke(123, 95, 73);
  fill(183, 160, 142);
  beginShape();
   vertex(800, 317);
   vertex(701, 312);
   vertex(667, 313);
   vertex(609, 321);
   vertex(400, 325);
   vertex(400, 366);
   vertex(800, 367);
  endShape();
  
  stroke(31, 12, 7);
  fill(83, 60, 54);
  arc(643,366,300,50,0,TWO_PI);
  
  // AGUA:
   
  stroke(27, 52, 66);
  fill(62, 118, 160);
  beginShape();
   vertex(400, 366);
   vertex(800, 367);
   vertex(800, 400);
   vertex(400, 400);
  endShape();
  
}
