int [][] m = new int [21][20];
int a, b;
boolean pacman;

int x = 340;
int y = 300;
int d = 35;

void setup() {
  size(800, 600); 
  criaMapa();

  
}

void draw() {
  background(255);
  desenhaMapa();


  if (pacman == true) {
    colisao();
    
    pac(x, y, d);
  }

  
}



void criaMapa() {
  for (int i=0; i<20; i++)
    for (int j=0; j<20; j++)

      m[i][j] = 0;
}


void desenhaMapa() {
  noStroke();
  for (int i=0; i<20; i++)
    for (int j=0; j<20; j++) {
      a = i;
      b = j;
      if (m[i][j] == 0) {
        fill(39,245,196);
        square(i*40, j*40, 39);
      }

      if (m[i][j] == 1) {
        fill(132,245,39);
        square(i*40, j*40, 39);
      }
      if (m[i][j] == 2) {
        fill(39,245,196);
        square(i*40, j*40, 39);
        fill(225,2,245);
        circle(i*40+20, j*40+20, 10);
      }
      if (key == ENTER && m[i][j] == 0) {
        m[i][j] = 2;
        pacman = true;
      }
    }
}

void mouseDragged() {
  println(mouseX/40, mouseY/40);
  if ( m[mouseX/40][mouseY/40] == 0 && mouseButton == LEFT) {
    m[mouseX/40][mouseY/40] = 1;
  }
  if ( m[mouseX/40][mouseY/40] == 1 && mouseButton == RIGHT) {
    m[mouseX/40][mouseY/40] = 0;
  }
}

void keyPressed() {

  if (keyCode == UP) {
    y= y-40;
  } else if (keyCode == DOWN) {
    y= y+40;
  } else if (keyCode == LEFT) {
    x= x-40;
  } else if (keyCode == RIGHT) {
    x= x+40;
  }
}


int pac(int x, int y, int z) {
  fill(245,15,49);
  circle(x, y, z);
  
  if(keyCode == ENTER){
   //olho
  fill(255);
  circle(x-10,y+10,15);
 
  circle(x+10,y+10,15);
  //pupila
  fill(0);
  circle(x-10,y+10,5);
 
  circle(x+10,y+10,5); 
  
  
  }
  

  if(keyCode == UP){
    
    fill(255);
  circle(x+10,y-10,15);
 
  circle(x-10,y-10,15);
  
  fill(0);
  circle(x+10,y-10,5);
 
  circle(x-10,y-10,5);

  }
  if(keyCode == RIGHT){
    
  //olho
  fill(255);
  circle(x+10,y-10,15);
 
  circle(x+10,y+10,15);
  //pupila
  fill(0);
  circle(x+10,y-10,5);
 
  circle(x+10,y+10,5);

  }
   if(keyCode == LEFT){
    
  //olho
  fill(255);
  circle(x-10,y-10,15);
 
  circle(x-10,y+10,15);
  //pupila
  fill(0);
  circle(x-10,y-10,5);
 
  circle(x-10,y+10,5);

  }
  if(keyCode == DOWN){
    
  //olho
  fill(255);
  circle(x-10,y+10,15);
 
  circle(x+10,y+10,15);
  //pupila
  fill(0);
  circle(x-10,y+10,5);
 
  circle(x+10,y+10,5);

  }
  
  
  return 0;
}

void colisao () {
  if ( y > height)
    y = y - 40;

  if (y < 0)
    y = y + 40;

  if ( m[x/40][y/40] == 1 && keyCode == UP)
    y = y + 40;

  if ( m[x/40][y/40] == 1 && keyCode == DOWN)
    y = y - 40;


  if (x > width)
    x = x - 40;

  if (x < 0 )
    x = x + 40;

  if ( m[x/40][y/40] == 1 && keyCode == LEFT)
    x = x + 40;

  if ( m[x/40][y/40] == 1 && keyCode == RIGHT)
    x = x - 40;
    
    //frutas
    if ( m[x/40][y/40] == 2)
    m[x/40][y/40] = 0;
    
    
    
    
    
}
