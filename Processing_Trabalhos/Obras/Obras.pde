/* //<>//

Obra 1 - Sistema Solar: Aperte espaço de 3 em 3 segundos para fazer surgir um planeta.

Obra 2 - Carinha: Aperte e segure o botão do mouse para cima e para baixo ou para a esquerda e para
a direita para mudar o humor do carinha.

Obra 3 - Visual novel: Aperte espaço para ler os diálogos e depois clique no bartender
em seguida faça a escolha final.

*/

boolean menu = false;
boolean obr1, obr2, obr3;


//variaveis obra 1
float r = 0;
int criacao = 0;
int delay = 0;
int opacidadetxt = 0;
int opacidade0 = 0;
int opacidade1 = 0; 
int opacidade2 = 0; 
int opacidade3 = 0; 
int opacidade4 = 0; 
int opacidade5 = 0; 
int opacidade6 = 0; 
int opacidade7 = 0; 
int opacidade8 = 0; 

//variaveis obra 2
int infelicidade = 300;
int varback = 0;
boolean txt = false;
int opacidadetxt2 = 255;

//variaveis obra 3
PImage fundo, aguasprite, cervejasprite, coquetelsprite;
int ntexto = 0;
boolean bartender = false;
boolean escolha;
boolean agua = false;
boolean cerveja = false;
boolean suco = false;
boolean fim = false;

void setup() {
  size(800, 600);
  menu = true;
  obr1 = false;
  obr2 = false;
  obr3 = false;
  fundo = loadImage("bar.png");
  aguasprite = loadImage("agua.png");
  cervejasprite = loadImage("cerveja.png");
  coquetelsprite = loadImage("coquetel.png");
}

void draw() {  
  if (menu) {
    background(50);

    rectMode(CENTER);
    strokeWeight(5);
    stroke(0);
    textAlign(CENTER);
    textSize(30);

    //Botão - Obra 1
    fill(255);
    rect(150, 300, 200, 100);
    fill(0);
    text("Obra 1", 150, 310);

    if (mouseX >= 50 && mouseX <= 250 && mouseY >= 250 && mouseY <= 350) {
      fill(180);
      rect(150, 300, 200, 100);
      fill(0);
      text("Obra 1", 150, 310);
    }

    //Botão - Obra 2
    fill(255);
    rect(400, 300, 200, 100);
    fill(0);
    text("Obra 2", 400, 310);

    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 250 && mouseY <= 350) {
      fill(180);
      rect(400, 300, 200, 100);
      fill(0);
      text("Obra 2", 400, 310);
    }

    //Botão - Obra 3
    fill(255);
    rect(650, 300, 200, 100);
    fill(0);
    text("Obra 3", 650, 310);

    if (mouseX >= 550 && mouseX <= 750 && mouseY >= 250 && mouseY <= 350) {
      fill(180);
      rect(650, 300, 200, 100);
      fill(0);
      text("Obra 3", 650, 310);
    }

    //Créditos
    fill(255);
    text("Avaliação 1 - MAMI", 400, 100);
    text("Levi Ferreira de Morais", 400, 540);
  }

  if (obr1 == true) {
    background(29, 17, 53);
    delay++;

    //Estrelas
    strokeWeight(5);
    stroke(0, 255);
    fill(255);
    //posicionando as estrelas
    for (int e = 0; e < 3; e++) {
      for (int f = 0; f < 6; f++) {
        if ( f % 2 == 0 ) {
          pushMatrix();
          translate(e*220, f*120);
          rotate(frameCount / -100.0);
          star(0, 0, 5, 5, 5); 
          popMatrix();
        } else {
          pushMatrix();
          translate((e+1)*350, f*120);
          rotate(frameCount / -100.0);
          star(0, 0, 5, 5, 5); 
          popMatrix();
        }
      }
    }
    //fazer o texto do tutorial aparecer e sumir
    if (criacao == 0) {
      textoTutorial1();
      opacidadetxt++;
    }

    if (criacao >= 1) {
      textoTutorial1();
      opacidadetxt--;
    }



    //Começo da rotação do sistema
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(r));



    if (criacao >= 1) {

      opacidade0++;



      //calor do sol

      noStroke();
      for ( int c = 0; c < width; c+=180) {
        for (int o = 0; o < 5; o++) {
          fill(252, 212, 64, o);
          circle(0, 0, c);
        }
      }
      //sol

      fill(252, 212, 64, opacidade0);
      stroke(0, opacidade0);
      strokeWeight(5);
      circle(0, 0, 180);
    }
    //Planetas 
    strokeWeight(3);
    stroke(0, 255);

    //netuno 
    if (criacao >= 9) {
      opacidade8++;
      stroke(0, opacidade8); 
      rotate(radians(r));
      fill(62, 84, 232, opacidade8);
      circle(270, 270, 14);
    }
    //urano
    if (criacao >= 8) {
      opacidade7++;
      stroke(0, opacidade7); 
      rotate(radians(r));
      fill(213, 251, 252, opacidade7);
      circle(250, 250, 15);
    }

    //saturno
    if (criacao >= 7) {
      opacidade6++;
      stroke(0, opacidade6); 
      rotate(radians(r));
      fill(197, 171, 110, opacidade6);
      circle(220, 220, 22);
      line(210, 210, 230, 230);
    }
    //júpiter
    if (criacao >= 6) {
      opacidade5++;
      stroke(0, opacidade5); 
      rotate(radians(r));
      fill(211, 156, 126, opacidade5);
      circle(190, 190, 25);
    }
    //marte
    if (criacao >= 5) {
      opacidade4++;
      stroke(0, opacidade4); 
      rotate(radians(r));
      fill(193, 68, 14, opacidade4);
      circle(160, 160, 13);
    }
    if (criacao >= 4) {
      opacidade3++;
      stroke(0, opacidade3); 
      //terra
      rotate(radians(r));
      fill(50, 150, 255, opacidade3);
      circle(140, 140, 16);

      pushMatrix();

      //lua
      translate(140, 140);
      rotate(-r*0.2);
      fill(244, 246, 240, opacidade3);
      circle(10, 10, 5);

      popMatrix();
    }


    //vênus
    if (criacao >= 3) {
      opacidade2++;
      stroke(0, opacidade2); 
      rotate(radians(r));
      fill(238, 203, 139, opacidade2);
      circle(120, 120, 15);
    }
    //mercúrio
    if (criacao >= 2) {
      opacidade1++;  
      stroke(0, opacidade1); 
      rotate(radians(r));
      fill(181, 167, 167, opacidade1);
      circle(90, 90, 10);
    }


    popMatrix();
    r -= 0.2;

    if (criacao >= 9) {
      textAlign(CENTER);
      fill(0);
      text("Voltar", 400, 300);
    }
  }

  if (obr2 == true) {

    background(varback-30, varback-30, varback-100);

    txt = true;
    opacidadetxt2--;
    if (txt) {
      fill(255, 255, 255, opacidadetxt2);
      text("Clique com um dos botões do mouse e arraste...", 400, 500);
      stroke(255, 255, 255, -opacidadetxt2);
      strokeWeight(2);
      fill(0, 0, 0, -opacidadetxt2);
      rect(700, 540, 120, 50);
      fill(255, 255, 255, -opacidadetxt2);
      text("Voltar", 700, 550);
    }

    choro(200, 350);
    choro(600, 350);
    fill(255);
    stroke(255);
    circle(200, 100, 50);
    circle(600, 100, 50);
    stroke(255);
    strokeWeight(15);
    noFill();   
    curve(200, infelicidade, 200, 300, 600, 300, 600, infelicidade);

    timidez(150, 200);
    timidez(100, 200);
    timidez(650, 200);
    timidez(700, 200);
  }

  if (obr3 == true) {
    background(255);
    //Imagem cedida por 2DPIXX na licença CC-BY 4.0 e alterada para os fins necessários.
    image(fundo, 0, 0);
    //conversas
    if (ntexto == 0)
      novel("Acabei de sair de um duelo, esse foi osso duro \nde roer, preciso comemorar minha vitória...");
    if (ntexto == 1)
      novel("Vou perguntar para esse garçom.");
    if (ntexto == 3)
      novel("Garçom: Bem-vindo ao bar, o que você vai querer?");
    if (ntexto == 4) {
      //escolhas
      escolha = true;
      fill(255);
      rect(400, 100, 250, 80);
      fill(0);
      text("ÁGUA", 400, 110);
      fill(255);
      rect(400, 200, 250, 80);
      fill(0);
      text("CERVEJA", 400, 210);
      fill(255);
      rect(400, 300, 250, 80);
      fill(0);
      text("COQUETEL", 400, 310);
      novel("(Hm... vou querer...)");

      //mouse mostrando qual escolha está em cima
      if (mouseX >= 275 && mouseX <= 525 && mouseY >= 60 && mouseY <= 140) {
        fill(180);
        rect(400, 100, 250, 80);
        fill(0);
        text("ÁGUA", 400, 110);
      }
      if (mouseX >= 275 && mouseX <= 525 && mouseY >= 160 && mouseY <= 240) {
        fill(180);
        rect(400, 200, 250, 80);
        fill(0);
        text("CERVEJA", 400, 210);
      }
      if (mouseX >= 275 && mouseX <= 525 && mouseY >= 260 && mouseY <= 340) {
        fill(180);
        rect(400, 300, 250, 80);
        fill(0);
        text("COQUETEL", 400, 310);
      }
    }
    if (ntexto == 5 && agua)
      novel("Me dê uma água.");
    if (ntexto == 6 && agua) {
      image(aguasprite, 300, 100);
      aguasprite.resize(200, 200);
      novel("Garçom: Você parece exausto, tome.");
    }


    if (ntexto == 5 && cerveja)
      novel("Me dê uma cerveja.");
    if (ntexto == 6 && cerveja) {
      image(cervejasprite, 300, 100);
      cervejasprite.resize(200, 200);
      novel("Essa é das boas.");
    }

    if (ntexto == 5 && suco)
      novel("Me dê um Coquetel.");
    if (ntexto == 6 && suco) {
      image(coquetelsprite, 350, 100);
      coquetelsprite.resize(100, 200);
      novel("Garçom: Esse é bem refrescante.");
    }

    if (ntexto == 7 && agua) {
      background(0);
      novel("Às vezes tudo o que um pistoleiro precisa\n é se hidratar.");
    }
    if (ntexto == 7 && cerveja) {
      background(0);
      novel("Uma cerveja nunca faz mal\ndepois de um dia conturbado.");
    }
    if (ntexto == 7 && suco) {
      background(0);
      novel("Nada melhor que um pouco\n de luxo de vez em quando.");
    }
    if (ntexto == 8) {
      fim = true;
      background(0);
      stroke(255);
      fill(0);
      rect(400, 290, 150, 50);
      stroke(0);
      fill(255);
      text("Voltar", 400, 300);
    }
  }
}



//função do tutorial da obra 1, e faz o texto desaparecer após o primeiro corpo celeste ser invocado
void textoTutorial1() {

  fill(255, 255, 255, opacidadetxt);
  textAlign(CENTER);
  textSize(25);
  text("Aperte ESPAÇO para construir o sistema solar!", 400, 100);
  text("De 3 em 3 segundos você pode formar um novo corpo celeste.", 400, 200);
}

/*
Formando estrelas
 (Código adquirido da referência do processing : https://processing.org/examples/star.html)
 */
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mouseClicked() {
  //clique obra 1
  if (mouseX >= 50 && mouseX <= 250 && mouseY >= 250 && mouseY <= 350 && menu == true) {
    menu = false;
    obr1 = true;
  }
  //clique obra 2
  if (mouseX >= 300 && mouseX <= 500 && mouseY >= 250 && mouseY <= 350 && menu == true) {
    menu = false;
    obr2 = true;
  }
  // clique obra 3
  if (mouseX >= 550 && mouseX <= 750 && mouseY >= 250 && mouseY <= 350 && menu == true) {        
    menu = false;
    obr3 = true;
  }

  //voltar obra1
  if (mouseX>300 && mouseX < 500 && mouseY > 200 && mouseY < 400 && obr1 == true && criacao >= 9 && menu == false) {
    obr1 = false;
    obr2 = false;
    obr3 = false;
    menu = true;

    criacao = 0;
    delay = 0;
    opacidadetxt = 0;
  }

  //voltar obra2
  if ( mouseX >= 640 && mouseX <= 760 && mouseY >= 515 && mouseY <= 565 && menu == false) {
    obr1 = false;
    obr2 = false;
    obr3 = false;
    menu = true;

    infelicidade = 300;
    varback = 0;
    txt = false;
    opacidadetxt2 = 255;
  }

  //voltar obra3
  if (mouseX >= 325 && mouseX <= 475 && mouseY >= 265 && mouseY <= 315 && menu == false && fim == true) {
    obr1 = false;

    obr3 = false;
    menu = true;

    ntexto = 0;
    bartender = false;
    escolha= false;
    agua = false;
    cerveja = false;
    suco = false;
    fim = false;
  }


  //point and click obra3
  if ( mouseX >= 210 && mouseX <= 310 && mouseY >= 105 && mouseY <= 255 && menu == false) {
    bartender = true;
    ntexto = 3;
  }
  //escolha obra3
  if (mouseX >= 275 && mouseX <= 525 && mouseY >= 60 && mouseY <= 140 && cerveja == false && suco == false && escolha == true) {
    agua = true;
    ntexto = 5;
  }
  if (mouseX >= 275 && mouseX <= 525 && mouseY >= 160 && mouseY <= 240 && agua == false && suco == false && escolha == true) {
    cerveja = true;
    ntexto = 5;
  }
  if (mouseX >= 275 && mouseX <= 525 && mouseY >= 260 && mouseY <= 340 && cerveja == false && agua == false && escolha == true) {
    suco = true;
    ntexto = 5;
  }
}

void mouseDragged() {
  //Mecânica Obra 2

  if (obr2 == true && infelicidade <= 1200 && mouseButton == RIGHT) {
    infelicidade+=50;
    varback-=10;
  }
  if (obr2 == true && infelicidade >= -900 && mouseButton == LEFT) {
    infelicidade-=50; 
    varback+=10;
  }
}

//função dos ricos da timidez
void timidez(int posX, int posY) {
  int x1, y1, x2, y2;
  x1 = posX - 25;
  y1 = posY - 25;
  x2 = posX + 25;
  y2 = posY + 25;
  stroke(255, 105, 180, -infelicidade);
  noFill();
  line(x1, y1, x2, y2);
}

//função do choro
void choro(int posX, int posY) {
  int x = posX;
  int y = posY;
  rectMode(CENTER);
  noStroke();
  fill(72, 124, 182, infelicidade-500);
  rect(x, y, 30, 500);
}

void keyPressed() {
  //Cria o planeta e reseta o delay.
  if ( key == ' ' && key == 32 && obr1 == true && delay >= 180 ) {
    criacao++;
    delay = 0;
  }

  //Coloca o espaço para pular para a próxima fala
  if ( key == ' ' && key == 32 && obr3 == true) {
    if (ntexto <= 1 && bartender == false)
      ntexto++;
    if (ntexto <= 3 && bartender == true)   
      ntexto++;
    if (ntexto >= 5)   
      ntexto++;
  }
}

//Função que cria as caixas de textos
void novel(String texto) {
  fill(255);
  rect(400, 500, 800, 200);
  fill(0);
  text(texto, 400, 460);
}
