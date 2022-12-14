/*

 Jogo estilo space invaders
 Instruções: Seta esquerda e direita do teclado (ou A e D) para mover-se horizontalmente, clique no mouse para disparar;
 O objetivo é derrotar todas as naves no tempo limite.
 
 
 Créditos de Assets:
 https://opengameart.org/content/assets-for-a-space-invader-like-game
 https://opengameart.org/content/space-boss-battle-theme
 https://opengameart.org/content/space-background-1
 https://opengameart.org/content/pixel-space-invaders
 
 Todas em CC 3.0 CC 4.0 ou domínio público.
 
 */
 
 //Biblioteca de som e alocação de imagens
import processing.sound.*;

PImage background, pl, i1, i2, i3;

SoundFile musica;

//Estados do jogo
boolean menu = true;
boolean dificuldade,easy,normal,hard,free;
boolean jogo = false;
boolean over= false;
boolean vitoria = false;

//Variável que controla o tempo restante do jogo
int tempo = 30;
int contagem= 1;


//Variáveis inimigos

  //Mude esta variável para controloar a quantidade de inimigos que quer enfrentar
int nInimigos = 40;


int k = 0;
inimigo[] inimigos = new inimigo[nInimigos];

float tiroInimigoX;
float tiroInimigoY;

int sorteio;




//Variáveis player
player one;

float tiroX;
float tiroY;

float raioTiro = width*0.1;

boolean reset;


void setup() {

  size(400, 400);

  //assets
  background = loadImage("back.png");

  pl = loadImage("player.png");

  i1 = loadImage("yellow.png");
  i2 = loadImage("green.png");
  i3 = loadImage("red.png");

  musica = new SoundFile(this, "OrbitalColossus.wav");
  musica.amp(0.1);
  musica.play();

  //setup player
  one = new player(width/2, height*9/10);
  
  //setup inimigos
  
  int fileira = 0;
  int coluna = 0;
  int inicioColuna = 0;
  
  for (int i = 0; i < nInimigos; i++) { //<>//
    coluna = i;
    inicioColuna++;
    if (coluna % 7 == 0){
    coluna = 0;
    inicioColuna = 0;
    fileira++;
    }
      inimigos[i] = new inimigo((inicioColuna+1)*50, fileira*50);
  }



}

void draw() {
  background(0);
  background.resize(width, height);
  image(background, 0, 0);
 
 //Menu de título e botão de start
  if (menu == true) {
    textAlign(CENTER); 
    textSize(50);
    fill(255);
    text("SPACE BATTLE", width/2, height/4); 



    strokeWeight(5);
    stroke(0);
    fill(255);
    rect(50, 150, 300, 70);
    noStroke();

    if (mouseX > 50 && mouseX < 350 && mouseY > 150 && mouseY < 220) {

      strokeWeight(5);
      stroke(0);
      fill(200);
      rect(50, 150, 300, 70);
      noStroke();
      if (mousePressed == true) {
        menu = false;
        dificuldade = true;
        mousePressed = false;
        
      }
    }



    textAlign(CENTER); 
    textSize(50);
    fill(0);
    text("START", width/2, 205);
  }
  
  //Regras das dificuldades
if(easy){
 nInimigos = 14;
 tempo = 60;
 jogo = true;
}
if(normal){
  nInimigos = 28;
 tempo = 30;
 jogo = true;
}
if(hard){
  nInimigos = 35;
 tempo = 30;
 jogo = true;
}
if(free){
 jogo = true;
}
  if (dificuldade){
    
    //Seleção de dificuldade
    
     
    fill(255);
    text("DIFICULDADE", width/2, 80); 

    
    stroke(0);
    rectMode(CENTER);
    

//EASY MODE

 
    fill(0,255,0); 
    rect(200, 150, 250, 50);
  


    if (mouseX > 60 && mouseX < 340 && mouseY > 120 && mouseY < 180) {

      strokeWeight(5);
      stroke(0);
      fill(200);
      rect(200, 150, 250, 50);
      noStroke();
      if (mousePressed == true) {
        dificuldade = false;
        easy = true;
      }
    }



    
    fill(0);
    text("EASY", width/2, 170);
    
//NORMAL MODE

 
    fill(255,255,153);
    stroke(0);
    rect(200, 220, 250, 50);
  

if (mouseX > 60 && mouseX < 340 && mouseY > 195 && mouseY < 245) {

    
      
      fill(200);
      rect(200, 220, 250, 50);
      
      if (mousePressed == true) {
        dificuldade = false;
        normal = true;
      }
    }



    
    fill(0);
    text("NORMAL", width/2, 240);
    
    //HARD MODE

 
    fill(255,0,0);
    stroke(0);
    rect(200, 290, 250, 50);
  

if (mouseX > 60 && mouseX < 340 && mouseY > 265 && mouseY < 315) {

    
      
      fill(200);
      rect(200, 290, 250, 50);
      
      if (mousePressed == true) {
        dificuldade = false;
        hard = true;
      }
    }



    
    fill(0);
    text("HARD", width/2, 310);
    
     //FREE MODE

 
    fill(0);
    stroke(0);
    rect(200, 360, 250, 50);
  

if (mouseX > 60 && mouseX < 340 && mouseY > 335 && mouseY < 385) {

    
      
      fill(50);
      rect(200, 360, 250, 50);
      
      if (mousePressed == true) {
        dificuldade = false;
        free = true;
      }
    }



    
    fill(255);
    text("LIVRE", width/2, 380);
  }
  

  if (over == true) {
    jogo = false;

    textAlign(CENTER); 
    textSize(50);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/4); 
    noStroke();
  }

  if ( vitoria == true) {
    jogo = false; 
    textAlign(CENTER); 
    textSize(50);
    fill(0, 255, 0);
    text("VITÓRIA!", width/2, height/4); 
    noStroke();
  }

  if ( jogo == true) {

    background.resize(width, height);
    image(background, 0, 0);

    //timer


    textSize(20);
    fill(255);

    text(tempo-(contagem/60), 375, 395);
    if (tempo-(contagem/60) > 0) {
      contagem++;
    } else if (tempo-(contagem/60) == 0) {
      jogo = false;
      over = true;
    }




    //player

    if (tempo-(contagem/60) <= tempo-1) {
      if (reset == true) {
        tiroY = -10;
      }
      if (one.mouseClick == true) {
        tiro();
        tiroY-= 5;

        if (tiroY <= 0 ) {
          one.mouseClick = false;
          reset = false;
        }
      }
    }

    one.spawn();
    one.velx *= 0.9;

    valorVel();
    mudarPos();

    if (one.x > width) {
      one.x = 5;
    } else if (one.x < 0 ) {
      one.x = (width - 5);
    }
    
    if(one.colisao())
    over = true;



    //inimigo
    

    for (int i = 0; i < nInimigos; i++) {
      inimigos[i].desenha();
      inimigos[i].colisao();
      
      //Tiro dos inimigos       
      inimigos[sorteio].tiroInimigo();
      inimigos[sorteio].tiy += 0.1;

      if (inimigos[i].colisao() == true) {

        inimigos[i].acerto();
        if (k == nInimigos) {
          vitoria = true;
        }


        reset = true;
      }
    }
  }
}

//Código Player
class player {
  float x;
  float y;
  float velx;
  float r = width*0.07;
  boolean keyLeft, keyRight, mouseClick;


  player(float nx, float ny) {
    x = nx;
    y = ny;
  }
  void spawn() {
    //noStroke();
    //ellipse(x, y, width*0.07, height*0.07);
    pl.resize((int)width*1/10, (int)height*1/10);
    image(pl, x-20, y-20);
  }

  boolean colisao() {
    float distX = x - tiroInimigoX;
    float distY = y - tiroInimigoY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= r+raioTiro) {
      return true;
    }
    return false;
  }
}

void valorVel() {
  if (one.keyLeft) one.velx-= 0.5;
  if (one.keyRight) one.velx+= 0.5;
}

void mudarPos() {
  one.x+=one.velx;
}

void tiro () {
  fill(255, 255, 0);
  strokeWeight(2);
  stroke(255, 150, 0);
  circle(tiroX, tiroY, raioTiro);
}



void keyPressed() {

  if (keyCode == LEFT || keyCode == 'A') {
    one.keyLeft = true;
  }
  if (keyCode == RIGHT || keyCode == 'D') {
    one.keyRight = true;
  }
}
void keyReleased() {

  if (keyCode == LEFT || keyCode == 'A' ) {
    one.keyLeft = false;
  }
  if (keyCode == RIGHT || keyCode == 'D') {
    one.keyRight = false;
  }
}

void mouseClicked() {
  if (one.mouseClick == false) {
    one.mouseClick = true;
    reset = false;
    tiroX = one.x;
    tiroY = one.y;
  }
}

//Código Inimigos
class inimigo {
  float xi;
  float yi;
  float tix;
  float tiy;
  float r = width*0.08;
  float xbase;
  float dir = 1.0;


  inimigo(float nx, float ny) { 
    xi = nx;
    yi = ny;
    tix = xi;
    tiy = yi;
    xbase = nx;
  }

  boolean colisao() {
    float distX = xi - tiroX;
    float distY = yi - tiroY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= r+raioTiro) {
      return true;
    }
    return false;
  }

  void tiroInimigo () {
    fill(150, 0, 0);
    strokeWeight(2);
    stroke(255, 0, 0);   
    circle(tix, tiy, raioTiro);
    tiroInimigoX = tix;
    tiroInimigoY = tiy;

    if ( tiy > height || yi > height) {
      tix = xi;
      tiy = yi;
      sorteio = (int)random(nInimigos);
    }
  }

  void acerto() {
    xi= width + 200;
    yi= height + 200;
    k+= 1;
  }

  void desenha() {

    //hitbox
    //circle(xi, yi, r);

    if (yi <= 50)
      image(i1, xi-20, yi-20);
    if (yi > 50 && yi < 150)
      image(i2, xi-20, yi-20);
    if (yi >= 150)
      image(i3, xi-20, yi-20);

    xi = xi + 0.5 * dir;
    if (xi >= xbase+20) {
      dir = -(dir);
    }
    if (xi <= xbase-20) {
      dir = -(dir);
    }
  }
}
