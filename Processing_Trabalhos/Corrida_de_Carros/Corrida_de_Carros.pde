
boolean GO;

boolean START;
boolean CHEGADA;

boolean ESCOLHA;
String E0 = "Clique em um carro para escolhê-lo!";
String EE = "Aperte ENTER para iniciar.";

boolean ESCOLHA1;
String E1 = "Você escolheu o carro 1!";


boolean ESCOLHA2;
String E2 = "Você escolheu o carro 2!";


boolean ESCOLHA3;
String E3 = "Você escolheu o carro 3!";

String EN = "Você não escolheu nenhum carro...";
String DN = "Você perdeu.";


String V1 = "Parabéns, o carro 1 venceu!";
String D12 = "Que pena, o carro 1 perdeu...e o 2 ganhou.";
String D13 = "Que pena, o carro 1 perdeu...e o 3 ganhou.";

String V2 = "Parabéns, o carro 2 venceu!";
String D21 = "Que pena, o carro 2 perdeu...e o 1 ganhou.";
String D23 = "Que pena, o carro 2 perdeu...e o 3 ganhou.";

String V3 = "Parabéns, o carro 3 venceu!";
String D31 = "Que pena, o carro 3 perdeu...e o 1 ganhou.";
String D32 = "Que pena, o carro 3 perdeu...e o 2 ganhou.";


float carx1 = 0.0;
float carx2 = 0.0;
float carx3 = 0.0;

float velt1 = 0.11*width;
float velt2 = 0.11*width;
float velt3 = 0.11*width;


int tempo = 0;
int segundo = 0;





void setup() {
  size(600, 300);
  GO = false;
  ESCOLHA = true;
  ESCOLHA1=false;
  ESCOLHA2=false;
  ESCOLHA3=false;
  CHEGADA = false;
  START = false;
}

void draw() {  
  colorMode(HSB, 360, 100, 100);
  fill(0, 0, 100);
float vel1 = random(0, 5);
float vel2 = random(0, 5);
float vel3 = random(0, 5);





  //retângulo cima
  fill(66,34,98);
  stroke(0,0,100);
  rect(0, 0, width, 0.3*height);
  
  //retângulo baixo
  fill(30,5,80);
  rect(0, 0.7*height, width, 0.3*height);

  
  //mar
  stroke(187,95,80);
  fill(187,95,80);
  rect(0,0,width,0.1*height);

  


  //estrada
  strokeWeight(2);
  stroke(0,0,100);
  fill(274,4,62);
  rect(0, 0.3*height, width, 0.13*height);
  rect(0, 0.4333333333333333*height, width, 0.13*height);
  rect(0, 0.5666666666666667*height, width, 0.13*height);

  strokeWeight(1);
  //linhas de largada e chegada
  stroke(0);
  fill(0,0,100);
  rect(0.0625*width, 0.3*height, 0.025*width, 0.4*height);


  rect(0.9166666666666667*width, 0.3*height, 0.025*width, 0.4*height);

  //semáforo
  fill(274,4,62);
  rect(0.0833333333333333*width, 0.05*height, 0.2333333333333333*width, 0.20*height);
  line(0.0833333333333333*width,0.15*height,0.31666*width,0.15*height);
  fill(0, 100, 100);
  //vermelhos
  circle(0.1333333333333333*width, 0.20*height, 0.08*height);
  circle(0.2*width, 0.20*height, 0.08*height);
  circle(0.2666666666666667*width, 0.20*height, 0.08*height);
  //verdes
  fill(0);
  circle(0.1333333333333333*width, 0.10*height, 0.08*height);
  circle(0.2*width, 0.10*height, 0.08*height);
  circle(0.2666666666666667*width, 0.10*height, 0.08*height);

  if (tempo >= 60) {
    fill(0);
    circle(0.1333333333333333*width, 0.20*height, 0.08*height);
  }
  if (tempo >= 120) {
    fill(0);
    circle(0.2*width, 0.20*height, 0.08*height);
  }
  if (tempo >= 180) {
    fill(0);
    circle(0.2666666666666667*width, 0.20*height, 0.08*height);
  }
  if (CHEGADA) {
    fill(0, 100, 100);
    circle(0.1333333333333333*width, 0.20*height, 0.08*height);
    circle(0.2*width, 0.20*height, 0.08*height);
    circle(0.2666666666666667*width, 0.20*height, 0.08*height);
  }



  //circulos 
  //sombra1
  fill(0, 0, 0);
  circle(0.4333333333333333*width, 0.22*height, 0.0666666666666667*width);  


  //1
  fill(230, 60, 90);
  circle(0.4166666666666667*width, 0.20*height, 0.0666666666666667*width);

  
  line(0.384*width,0.20*height,0.46*width, 0.20*height);
  line(0.4166666666666667*width,0.139*height,0.4166666666666667*width, 0.27*height);

  //sombra2
  fill(0, 0, 0);
  circle(0.6*width, 0.22*height, 0.0666666666666667*width);

  //2
  fill(230, 60, 90);
  circle(0.5833333333333333*width, 0.20*height, 0.0666666666666667*width);
  
  line(0.55*width,0.20*height,0.62*width, 0.20*height);
  line(0.5833333333333333*width,0.139*height,0.5833333333333333*width, 0.27*height);
  
  
  //carros
  textSize(0.05*height);

  fill(0);
  text(E0, 0.5*width, 0.8333333333333333*height);
  text(EE, 0.5*width, 0.92*height);
  //1
  fill(6, 21, 90);
  rect(carx1, 0.3333333333333333*height, 0.0666666666666667*width, 0.0666666666666667*height);
  fill(0);
  text(1, velt1, 0.3833333333333333*height);
  //2
  fill(214, 31, 90);
  rect(carx2, 0.4666666666666667*height, 0.0666666666666667*width, 0.0666666666666667*height);
  fill(0);
  text(2, velt2, 0.5166666666666667*height);

  //3
  fill(72, 40, 90);
  rect(carx3, 0.6*height, 0.0666666666666667*width, 0.0666666666666667*height);
  fill(0);
  text(3, velt3, 0.65*height);

  //ESCOLHA DE CARRO
  textAlign(CENTER);


  if (!START) {
    if (ESCOLHA1) {
      text(E1, 0.5*width, 0.8333333333333333*height);
      E0 = " ";
    }
    if (ESCOLHA2) {
      text(E2, 0.5*width, 0.8333333333333333*height);
      E0 = " ";
    }
    if (ESCOLHA3) {
      text(E3, 0.5*width, 0.8333333333333333*height);
      E0 = " ";
    }
  }

  if (GO && !ESCOLHA1 && !ESCOLHA2 && !ESCOLHA3) {
    text(EN, 0.5*width, 0.8333333333333333*height);
    E0 = " ";
    EE = " ";
  }


  if (GO && ESCOLHA1 && !ESCOLHA2 && !ESCOLHA3) {
    text(E1, 0.5*width, 0.8333333333333333*height);
    E0 = " ";
    EE = " ";
  }
  if (GO && !ESCOLHA1 && ESCOLHA2 && !ESCOLHA3) {
    text(E2, 0.5*width, 0.8333333333333333*height);
    E0 = " ";
    EE = " ";
  }
  if (GO && !ESCOLHA1 && !ESCOLHA2 && ESCOLHA3) {
    text(E3, 0.5*width, 0.8333333333333333*height);
    E0 = " ";
    EE = " ";
  }






  if (ESCOLHA) {



    //Seleção Carro 1
    if (mouseX>=carx1 &&  mouseX <=carx1+0.0666666666666667*width   && mouseY >= 0.3333333333333333*height && mouseY <= 0.3333333333333333*height + 0.0666666666666667*height) {
      fill(6, 21, 70);
      rect(carx1, 0.3333333333333333*height, 0.0666666666666667*width, 0.0666666666666667*height);
      fill(0);
      text(1, velt1, 0.3833333333333333*height);
      
      if (mouseX>=carx1 &&  mouseX <=carx1+0.0666666666666667*width   && mouseY >= 0.3333333333333333*height && mouseY <= 0.3333333333333333*height + 0.0666666666666667*height && mousePressed) {

        ESCOLHA1 = true;
        ESCOLHA2 = false;
        ESCOLHA3 = false;
        ESCOLHA= false;
      }
    }

    //Seleção Carro 2
    if (mouseX>=carx2 &&  mouseX <=carx2+0.0666666666666667*width   && mouseY >= 0.4666666666666667*height && mouseY <= 0.4666666666666667*height + 0.0666666666666667*height) {
      fill(214, 31, 70);
      rect(carx2, 0.4666666666666667*height, 0.0666666666666667*width, 0.0666666666666667*height);
      fill(0);
      text(2, velt2, 0.5166666666666667*height);
      
      
      if (mouseX>=carx2 &&  mouseX <=carx2+0.0666666666666667*width   && mouseY >= 0.4666666666666667*height && mouseY <= 0.4666666666666667*height + 0.0666666666666667*height && mousePressed) { 
        ESCOLHA2 = true; 
        ESCOLHA1 = false;
        ESCOLHA3 = false;
        ESCOLHA= false;
      }
    }

    //Seleção Carro 3
    if (mouseX>=carx3 &&  mouseX <=carx3+0.0666666666666667*width   && mouseY >= 0.6*height && mouseY <= 0.6*height + 0.0666666666666667*height) {
      fill(72, 40, 70);
      rect(carx3, 0.6*height, 0.0666666666666667*width, 0.0666666666666667*height);
      fill(0);
      text(3, velt3, 0.65*height);
      
      if (mouseX>=carx3 &&  mouseX <=carx3+0.0666666666666667*width   && mouseY >= 0.6*height && mouseY <= 0.6*height + 0.0666666666666667*height && mousePressed) {
        ESCOLHA3 = true; 
        ESCOLHA2 = false;
        ESCOLHA1 = false;
        ESCOLHA= false;
      }
    }
  }
  //ALGORITMO CHEGADA

  //CHEGADA CARRO 1
  if (carx1 >= carx2
    && carx1 >= carx3 && ESCOLHA1 && CHEGADA) {
    text(V1, 0.5*width, 0.92*height);
    text(E1, 0.5*width, 0.8333333333333333*height);
  } else if (  carx2 >= carx1
    && carx2 >= carx3 && ESCOLHA1 && CHEGADA) {
    text(D12, 0.5*width, 0.92*height);
    text(E1, 0.5*width, 0.8333333333333333*height);
  } else if (  carx3 >= carx1
    && carx3 >= carx2 && ESCOLHA1 && CHEGADA) {
    text(D13, 0.5*width, 0.92*height);
    text(E1, 0.5*width, 0.8333333333333333*height);
  }
  //CHEGADA CARRO 2
  if (carx2 >= carx1
    && carx2 >= carx3 && ESCOLHA2 && CHEGADA) {
    text(V2, 0.5*width, 0.92*height);
    text(E2, 0.5*width, 0.8333333333333333*height);
  } else if (  carx1 >= carx2
    && carx1 >= carx3 && ESCOLHA2 && CHEGADA) {
    text(D21, 0.5*width, 0.92*height);
    text(E2, 0.5*width, 0.8333333333333333*height);
  } else if (  carx3 >= carx2
    && carx3 >= carx1 && ESCOLHA2 && CHEGADA) {
    text(D23, 0.5*width, 0.92*height);
    text(E2, 0.5*width, 0.8333333333333333*height);
  }
  //CHEGADA CARRO 3
  if (carx3 >= carx1
    && carx3 >= carx2 && ESCOLHA3 && CHEGADA) {
    text(V3, 0.5*width, 0.92*height);
    text(E3, 0.5*width, 0.8333333333333333*height);
  } else if (  carx1 >= carx3
    && carx1 >= carx2 && ESCOLHA3 && CHEGADA) {
    text(D31, 0.5*width, 0.92*height);
    text(E3, 0.5*width, 0.8333333333333333*height);
  } else if (  carx2 >= carx3
    && carx2 >= carx1 && ESCOLHA3 && CHEGADA) {
    text(D32, 0.5*width, 0.92*height);
    text(E3, 0.5*width, 0.8333333333333333*height);
  }
  //CHEGADA NENHUM CARRO
  if (!ESCOLHA1 && !ESCOLHA2 && !ESCOLHA3 && CHEGADA) {
    text(EN, 0.5*width, 0.8333333333333333*height);
    text(DN, 0.5*width, 0.92*height);
    E0 = " ";
    EE = " ";
  }



  if (GO) {
    tempo++;
    if (tempo>=180) {

      fill(120, 100, 100);
      circle(0.1333333333333333*width, 0.10*height, 0.08*height);
      circle(0.2*width, 0.10*height, 0.08*height);
      circle(0.2666666666666667*width, 0.10*height, 0.08*height);


      carx1= carx1+vel1;
      carx2= carx2+vel2;
      carx3= carx3+vel3;

      velt1= velt1 + vel1;
      velt2= velt2 + vel2;
      velt3= velt3 + vel3;
      ESCOLHA = false;
    }


    if (carx1 >= 0.85*width  || carx2 >= 0.85*width 
      || carx3 >= 0.85*width ) {

      GO = !GO;
    }
  }
  if (carx1 >= 0.84*width  || carx2 >= 0.84*width 
    || carx3 >= 0.84*width ) {

    CHEGADA = true;
  }
}
void keyPressed() {
  if (!CHEGADA) {
    if (keyCode == ENTER) {

      START = true;
      GO = true;
    }
  }
}


void mousePressed() {
  if (!ESCOLHA && !START) {
    //Seleção qualquer lugar fora os carros
    if (mouseX>=0 && mouseX <= width && mouseY>=0 && mouseY<= height  && mousePressed ) {

      ESCOLHA=true;
      ESCOLHA1=false;
      ESCOLHA2=false;
      ESCOLHA3=false;


      E0 = "Clique em um carro para escolhê-lo!";
      text(E0, 0.5*width, 0.8333333333333333*height);
      EE = "Aperte ENTER para iniciar.";
      text(EE, 0.5*width, 0.92*height);
    }
  }
}
