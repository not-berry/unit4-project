color black = #000000;
color white = #ffffff;
color red   = #FF4646;

int housex,housey, treex,treey;
 
void setup() {
  size(800,800);
  background(255);
  fill(white);
  stroke(black);
  strokeWeight(5);
  
  housex = 0;
  housey = 200;
  treex = 400;
  treey = 400;
  
  for (int i = 0; i < 12; i += 1) {
    housex += 140;
    if(housex == 700) {
      housex = 140;
      housey += 200;
    }
    //house(housex,housey,1,radians(0));
  }
  tree(treex,treey,1,radians(0));
}

void house(float x, float y, float s, float r) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  chimney();
  outline(random(0,20));
  window();
  roof();
  door(random(5,10));
  popMatrix();
}

void outline(float am) {
  fill(white);
  rect(0,0, 100,80, 0,0,am,am);
}

void window() {
  fill(white);
  rect(50,40, 40,20);
  fill(black);
  rect(50,40, 40,random(5,20));
}

void roof() {
  fill(black);
  triangle(-10,0, 110,0, 50, random(-100,-50));
}

void door(float knob) {
  fill(black);
  rect(20,30, 20,50);
  fill(white);
  ellipse(25,60, knob,knob); 
}

void chimney() {
  fill(white);
  rect(70,0, 20,random(-80,-40));
}




void tree(float x, float y, float s, float r) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  trunk();
  branch(30,20);
  foliage(15,-35, 0.9);
  foliage(-10,-10, 0.8);
  foliage(40,-10, 0.8);
  foliage(15,0, 0.6);
  fruit();
  popMatrix();
}

void trunk() {
  stroke(black);
  fill(white);
  rect(0,0, 30,150, 5);
}

void branch(int x, int y) {
  stroke(black);
  noFill();
  arc(x,y, 20,100, radians(30),radians(90));
  arc(x,y, 35,120, radians(25),radians(90));
  stroke(white);
  fill(black);
  ellipse(0,0, 40,40);
}

void foliage(int x, int y, float s) {
  pushMatrix();
  translate(x, y);
  stroke(white);
  fill(black);
  scale(s);
  ellipse(0,0, 100,100);
  popMatrix();
}

void fruit() {
  
}
