void setup() {
  size(800, 600);

  fill(255);
  circle(400, 300, 200);
}

void pmouse ( int mouse) {
  background(12*(0.02*mouse), 20, 69);
  fill(255);
  triangle(50, 20, 70, 20, 60, 10);
  triangle(50, 20, 70, 20, 60, 30);
  
  triangle(50, 500, 70, 500, 60, 490);
  triangle(50, 500, 70, 500, 60, 510);
  
  triangle(20, 200, 40, 200, 30, 190);
  triangle(20, 200, 40, 200, 30, 210);
  
  triangle(100, 350, 120, 350, 110, 340);
  triangle(100, 350, 120, 350, 110, 360);
  
  triangle(700, 500, 720, 500, 710, 490);
  triangle(700, 500, 720, 500, 710, 510);
  
  triangle(600, 300, 620, 300, 610, 290);
  triangle(600, 300, 620, 300, 610, 310);

  triangle(300, 20, 320, 20, 310, 10);
  triangle(300, 20, 320, 20, 310, 30);
  
  triangle(500, 70, 520, 70, 510, 60);
  triangle(500, 70, 520, 70, 510, 80);
  
  noStroke();
  fill(255, 234, 0);
  circle(400, 300, mouse+25);
  fill(251, 227, 95);
  circle(400, 300, mouse+15);
  fill(249, 215, 28);
  circle(400, 300, mouse);


  fill(mouse, 255-mouse/3, 0);
  circle((mouse-50)*1.2, 350, 50);
}
void draw() {
  
  pmouse(mouseX);
  
}
