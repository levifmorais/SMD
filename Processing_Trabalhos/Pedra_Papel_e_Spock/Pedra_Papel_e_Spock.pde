
int escolha;

int computador = (int)random(1, 6);

int spock = 1;
int tesoura = 2;
int papel = 3;
int pedra = 4;
int lagarto = 5;

boolean win;

String st = "O Spock quebra a tesoura. Você ganhou!";
String sp = "O Spock vaporiza a pedra. Você ganhou!";
String se = "EMPATE";
String spp = "O papel refuta o Spock. Você perdeu.";
String sl = "O lagarto envenena o Spock. Você perdeu.";

String tl = "A tesoura mata o lagarto. Você ganhou!";
String tpp = "A tesoura corta papel. Você ganhou!";
String te = "EMPATE";
String ts = "O Spock quebra a tesoura. Você perdeu.";
String tp = "A pedra quebra a tesoura. Você perdeu.";

String ppp = "O papel cobre a pedra. Você ganhou!";
String pps = "O papel refuta o Spock. Você ganhou!";
String ppe = "EMPATE";
String ppt = "A tesoura corta papel. Você perdeu.";
String ppl = "O lagarto come o papel. Você perdeu.";

String pt = "A pedra quebra a tesoura. Você ganhou!";
String pl = "A pedra esmaga o lagarto. Você ganhou!";
String pe = "EMPATE";
String pp = "O papel cobre a pedra. Você perdeu.";
String ps = "O Spock vaporiza a pedra. Você perdeu.";

String ls = "O lagarto envenena o Spock. Você ganhou!";
String lpp = "O lagarto come o papel. Você ganhou!";
String le = "EMPATE";
String lt = "A tesoura mata o lagarto. Você perdeu.";
String lp = "A pedra esmaga o lagarto. Você perdeu.";






void setup() {
  size(800, 600);
  background(0);
}


void draw() {
  background(255);
  rectMode(CENTER);
  
  textAlign(CENTER);
      textSize(20); 
      
  text("Spock = 1",400,40);    
  text("Tesoura = 2",400,80);
  text("Papel = 3",400,120);
  text("Pedra = 4",400,160);
  text("Lagarto = 5",400,200);
      
  //1
  fill(255);
  rect(150, 300, 200, 50);
  fill(0);
  text("Spock",150,305);
  //2
  fill(255);
  rect(400, 300, 200, 50);
  fill(0);
  text("Tesoura",400,305);
  //3
  fill(255);
  rect(650, 300, 200, 50);
  fill(0);
  text("Papel",650,305);
  //4
  fill(255);
  rect(250, 400, 200, 50);
  fill(0);
  text("Pedra",250,405);
  //5
  fill(255);
  rect(550, 400, 200, 50);
  fill(0);
  text("Lagarto",550,405);
  
  
  
  
  //ESCOLHA 1
  
  if(escolha == 1 && computador == 2){
    fill(0,250,0);
    background(255);
    
    text(st,400,300);
    text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 1 && computador == 4){
    background(255);
    fill(0,250,0);
    text(sp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 1 && computador == 1){
    background(255);
    
    fill(0);
    text(se,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 1 && computador == 3){
    background(255);
    fill(250,0,0);
    text(spp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 1 && computador == 5){
    background(255);
    fill(250,0,0);
    text(sl,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  
   //ESCOLHA 2
  
  if(escolha == 2 && computador == 5){
    fill(0,250,0);
    background(255);
    
    text(tl,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 2 && computador == 3){
    background(255);
    fill(0,250,0);
    text(tpp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 2 && computador == 2){
    background(255);
    
    fill(0);
    text(te,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 2 && computador == 1){
    background(255);
    fill(250,0,0);
    text(ts,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 2 && computador == 4){
    background(255);
    fill(250,0,0);
    text(tp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  
  //ESCOLHA 3
  
  if(escolha == 3 && computador == 4){
    fill(0,250,0);
    background(255);
    
    text(ppp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 3 && computador == 1){
    background(255);
    fill(0,250,0);
    text(pps,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 3 && computador == 3){
    background(255);
    
    fill(0);
    text(ppe,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 3 && computador == 2){
    background(255);
    fill(250,0,0);
    text(ppt,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 3 && computador == 5){
    background(255);
    fill(250,0,0);
    text(ppl,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  
   //ESCOLHA 4
  
  if(escolha == 4 && computador == 2){
    fill(0,250,0);
    background(255);
    
    text(pt,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 4 && computador == 5){
    background(255);
    fill(0,250,0);
    text(pl,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 4 && computador == 4){
    background(255);
    
    fill(0);
    text(pe,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 4 && computador == 3){
    background(255);
    fill(250,0,0);
    text(pp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 4 && computador == 1){
    background(255);
    fill(250,0,0);
    text(ps,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  
   //ESCOLHA 5
  
  if(escolha == 5 && computador == 1){
    fill(0,250,0);
    background(255);
    
    text(ls,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 5 && computador == 3){
    background(255);
    fill(0,250,0);
    text(lpp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 5 && computador == 5){
    background(255);
    
    fill(0);
    text(le,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 5 && computador == 2){
    background(255);
    fill(250,0,0);
    text(lt,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  if(escolha == 5 && computador == 4){
    background(255);
    fill(250,0,0);
    text(lp,400,300);
  text(escolha,200,100);
    text("X",400,100);
    text(computador,600,100);
  }
  
 
}

void mousePressed() {
  //1
  if (mouseX >= 50 && mouseX <= 250 && mouseY >=275 && mouseY<=325 && mouseButton == LEFT) {
    escolha = 1;
    fill(0);
    rect(150, 300, 200, 50);
  }
  //2
  if (mouseX >= 300 && mouseX <= 500 && mouseY >=275 && mouseY<=325 && mouseButton == LEFT) {
    escolha = 2;
  }
  //3
  if (mouseX >= 600 && mouseX <= 700 && mouseY >=275 && mouseY<=325 && mouseButton == LEFT) {
    escolha = 3;
  }
  //4
  if (mouseX >= 150 && mouseX <= 350 && mouseY >=375 && mouseY <= 425 && mouseButton == LEFT) {
    escolha = 4;
  }
  //5
  if (mouseX >= 450 && mouseX <= 650 && mouseY >=375 && mouseY <= 425 && mouseButton == LEFT) {
    escolha = 5;
    
  }
}
