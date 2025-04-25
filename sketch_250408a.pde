color black = #000000;
color white = #ffffff;
color red   = #FF4646;

int housex,housey, treex,treey;
 
void setup() {
  size(800,800);
  background(black);
  
  moon(random(50,150),random(50,150), 1);
  for(int i = 0; i < 30; i += 1) {
    star(random(800),random(0,400), random(0.1,0.5), random(radians(360)));
  }
  
  
  
  fill(white);
  stroke(black);
  strokeWeight(3);
  
  
  ellipse(400,600, 2000,500);
  
  housex = -140;
  housey = 450;
  treex = 400;
  treey = 400;
  
  for (int i = 0; i < 12; i += 1) {
    housex += 140;
    if(housex == 840) {
      housex = 0;
      housey += 200;
    }
    house(random(housex-20,housex+20),random(housey-30,housey+30),1,radians(0));
    if (int(random(2)) == 0) {
      tree(housex - random(-30,30),random(housey-10,housey+30),0.9,radians(0));
    }
  }
  for(int i = 0; i < 5; i += 1) {
    cloud(i * 200,random(50, 300), 1);
  }
}





void house(float x, float y, float s, float r) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  fill(white);
  stroke(black);
  chimney(random(-80,-40));
  outline(random(0,20));
  window();
  roof();
  door(random(7,10));
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
  rect(50,40, 40,random(5,14));
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

void chimney(float h) {
  fill(white);
  if (int(random(3)) == 0) {
    for(int i=0; i<3; i+=1) {
      circle(random(75,85),h-i*15-5, 15);
    }
  }
  rect(70,0, 20,h);
}




void tree(float x, float y, float s, float r) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  trunk();
  branch(30,random(20,60), 1);
  branch(30,random(20,60), -1);
  foliage(15,-35, random(.6,.9));
  foliage(-10,-10, random(.6,.9));
  foliage(40,-10, random(.6,.9));
  foliage(15,0, random(.6,.9));
  popMatrix();
}

void trunk() {
  stroke(black);
  fill(white);
  rect(0,0, 30,150, 5);
}

void branch(int x, float y, float flip) {
  if (!(int(random(3))==0)) {
    if (flip == -1) {
      x += -30;
    }
    pushMatrix();
    stroke(black);
    noFill();
    scale(flip,1);
    arc(x,y, 20,100, radians(30),radians(90));
    arc(x,y, 35,120, radians(25),radians(90));
    popMatrix();
    pushMatrix();
    translate(15, 0);
    stroke(white);
    fill(black);
    scale(.6);
    ellipse(45*flip,y+70, 40,40);
    popMatrix();
  }
}

void foliage(int x, int y, float s) {
  pushMatrix();
  translate(x, y);
  stroke(white);
  fill(black);
  scale(s);
  ellipse(0,0, 100,100);
  fruit();
  popMatrix();
}

void fruit() {
  scale(1);
  float frtx = 0, frty = 0;
  stroke(white);
  fill(white);
  for (int i = 0; i < 5; i += 1) {
    while (dist(frtx = random(-50,50), frty = random(-50,50), 0,0) >= 45) {}
    circle(frtx,frty, 10);
  }
}

void cloud(float x, float y, float s) {
  stroke(white);
  fill(white);
  for(int i = 0; i < 15; i += 1) {
    ellipse(x,y+random(-15,15), 50,50);
    x += 10;
  }
}

void moon(float x, float y, float s) {
  pushMatrix();
  scale(s);
  translate(x,y);
  rotate(radians(15));
  stroke(white);
  fill(white);
  circle(0,0,60);
  stroke(black);
  fill(black);
  circle(10,0, 50);
  popMatrix();
}

void star(float x, float y, float s, float r) {
  pushMatrix();
  translate(x,y);
  scale(s);
  rotate(r);
  strokeWeight(0);
  stroke(white);
  fill(white);
  for(int i = 0; i < 5; i += 1) {
    triangle(-10,0, 10,0, 0,-40);
    rotate(radians(72));
  }
  rotate(radians(36));
  for(int i = 0; i < 5; i += 1) {
    triangle(-10,0, 10,0, 0,-30);
    rotate(radians(72));
  }
  popMatrix();
}
