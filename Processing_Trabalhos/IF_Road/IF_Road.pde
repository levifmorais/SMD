boolean bp;
boolean win;


float x = 400;
float y = 550;
float w = 40;
float h = 40;

float x2 = 0;
float y2 = 460;
float w2 = 120;
float h2 = 30;

float x3 = 800;
float y3 = 410;
float w3 = 120;
float h3 = 30;

float x4 = 300;
float y4 = 205;
float w4 = 120;
float h4 = 30;

float x5 = 700;
float y5 = 170;
float w5 = 120;
float h5 = 30;

String s = "INICIAR";
String v = "PARABÉNS, VOCÊ VENCEU!";
String t = "IF Road";
String i = "IF";
String r = "Road";










boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;




void setup() {
  size(800, 600);

  bp = false;
  win = false;

  background(0);
  rectMode(CENTER);
  fill(255);
  textSize(150);
  text(t,160,230);
  fill(0,0,230);
  text(i,150,230);
  fill(230,0,0);
  text(r,320,230);
  fill(0);
  stroke(255);
  rect(400, 400, 300, 100);
  fill(255);
  textSize(80);
  text(s, 255, 430);
}




void draw() {
  //START
  if (bp) { 
    frameRate(120);

    rectMode(CENTER);


    background(0, 154, 23);



    //estrada
    stroke(220);
    fill(70, 61, 57);
    rect(0, 200, 2000, 100);


    rect(0, 450, 2000, 100);
    stroke(255);
    fill(255);
    rect(0, 200, 100, 20, 20);
    rect(150, 200, 100, 20, 20);
    rect(300, 200, 100, 20, 20);
    rect(450, 200, 100, 20, 20);
    rect(600, 200, 100, 20, 20);
    rect(750, 200, 100, 20, 20);
    rect(0, 450, 100, 20, 20);
    rect(150, 450, 100, 20, 20);
    rect(300, 450, 100, 20, 20);
    rect(450, 450, 100, 20, 20);
    rect(600, 450, 100, 20, 20);
    rect(750, 450, 100, 20, 20);

    //player + movimento
    if (upPressed) {
      y = y - 2;
    }

    if (downPressed) {
      y = y + 2;
    }

    if (leftPressed) {
      x = x - 2;
    }

    if (rightPressed) {
      x = x + 2;
    }

    fill(50, 50, 255);
    stroke(0, 0, 255);
    rectMode(CORNER);
    rect(x, y, h, w);
    if ( x > 800 || x < 0 || y > 600 || y < 0) {
      x = 400;
      y = 550;
    }
    //carros  
    stroke(0);
    fill(220, 0, 0);

    rect(x2, y2, w2, h2);
    x2 = x2 + (int)random(10);

    if ( x2 >= 800) {
      x2 = -400;
    }
    rect(x3, y3, w3, h3);
    x3 = x3 + (int)random(20);
    if ( x3 >= 800) {
      x3 = -400;
    }
    rect(x4, y4, w4, h4);
    x4 = x4 + (int)random(30);
    if ( x4 >= 800) {
      x4 = -400;
    }
    rect(x5, y5, w5, h5);
    x5 = x5 + (int)random(40);
    if ( x5 >= 800) {
      x5 = -400;
    }
    //vitória


    fill (164, 116, 73);
    rect(400, 10, 10, 60, 7);
    fill(255);
    rect(405, 10, 60, 30);


    if ( x >= 370 && x <= 450 && y >= 10 && y<= 120) {
      win = true;
      bp = false;
      if (win) {
        
        background (255);
        
        fill( 255, 204, 0);
        textMode(CENTER);
        
        textSize(30);
        text(v,200,300);
      }
    }

    boolean hit = rectRect(x, y, w, h, x2, y2, w2, h2, x3, y3, w3, h3, x4, y4, w4, h4, x5, y5, w5, h5);
    if (hit) {
      x = 400;
      y = 550;
    }
  }
}

boolean rectRect(float x, float y, float w, float h, float x2, float y2, float w2, float h2, float x3, float y3, float w3, float h3, float x4, float y4, float w4, float h4, float x5, float y5, float w5, float h5) {
  if (x + w >= x2 &&    
    x <= x2 + w2 &&    
    y + h >= y2 &&    
    y <= y2 + h2) {    
    return true;
  }
  if (x + w >= x3 &&    
    x <= x3 + w3 &&   
    y + h >= y3 &&    
    y <= y3 + h3) {   
    return true;
  }
  if (x + w >= x4 &&    
    x <= x4 + w4 &&   
    y + h >= y4 &&    
    y <= y4 + h4) {   
    return true;
  }
  if (x + w >= x5 &&    
    x <= x5 + w5 &&   
    y + h >= y5 &&    
    y <= y5 + h5) {   
    return true;
  }
  return false;
}

//botão
void mousePressed() { 
  if (mouseX >=250 && mouseX <=550  && mouseY >350   && mouseY <=450 && mousePressed && mouseButton == LEFT) {
    bp = true;
  }
}
//lógica movimento FUNÇÃO
void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  } else if (keyCode == DOWN) {
    downPressed = true;
  } else if (keyCode == LEFT) {
    leftPressed = true;
  } else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  } else if (keyCode == DOWN) {
    downPressed = false;
  } else if (keyCode == LEFT) {
    leftPressed = false;
  } else if (keyCode == RIGHT) {
    rightPressed = false;
  }
}
