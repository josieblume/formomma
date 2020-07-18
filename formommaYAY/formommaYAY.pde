/*
Nonlinear experience of a mother's day card and tribute to the most special lady in my life, my mom<3.

CREATED: MAY 11th
Because the week ended with mothers day, I wanted to express my love for 
the fantastic woman! I am very lucky to have her in my life, as she um gave me life...

for all the mothers out there, the strongkest people on this planet. */

//ALSO P.S: For those who do not have mothers, lost mothers, or dont
//have mothers present, love u<3

int nPics = 6;
PImage[] mommatest = new PImage[nPics];
PImage[] mommalite = new PImage[nPics];
PImage[] ending = new PImage[10];
PImage[] cute = new PImage[7];
PImage purp;
int w = 792;
int h = 736;
int imageIndex = 0; // Initial image to be displayed is the first
int cols;
int rows;
PShape hart;
int diameter = 150;
int blue = 0;
int screen = 1;
String love = "love you momma thank you for everything <33";

void setup() {
  fullScreen();
  for (int i = 0; i < mommatest.length; i++) {
    mommatest[i]= loadImage((i+1)+".png");
    frameRate(10);
  }
  
   for (int i = 0; i < mommalite.length; i++) {
    mommalite[i]= loadImage("two"+(i+1)+".png");
    frameRate(10);
  }
  
  for (int i = 0; i < ending.length; i++) {
    ending[i]= loadImage("end"+(i+1)+".png");
    frameRate(10);
  }
  
  for (int i = 0; i < cute.length; i++) {
    cute[i]= loadImage("cute"+(i+1)+".png");
    frameRate(10);
  }

  purp = loadImage("purp.png");
  cols = width/purp.width;
  rows = height/purp.height;
  if ( width%purp.width> 0) {
    cols++;
  }
  if ( height%purp.height > 0) {
    rows++;
  }
  
  hart = loadShape("hart.svg");
  hart.disableStyle();
}

void draw() {
   if (screen == 1) {
    drawScreen1();
   } else if (screen == 2) {
    drawScreen2();
  }
  else if (screen == 3) {
    drawScreen3();
  }
  else if (screen == 4) {
    drawScreen4();
  }
  else if (screen == 5) {
    drawScreen5();
  }
  else if (screen == 6) {
    drawScreen6();
  }
}

void drawScreen1() {
  background(255);
  image(mommatest[imageIndex], width/4, height/6);
  imageIndex = (imageIndex + 1) % mommatest.length;

  if (overImage(width/4, height/6, w, h) == true) {
    cursor(HAND);
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        image(purp, x*purp.width, y*purp.height);
      }
    } 
    text("auntie ina", width-mouseX, height-mouseY);
    text("heather<3", mouseX, mouseY);
  }
  else{
    cursor(ARROW);
  }
}

void drawScreen2() {
  cursor(ARROW);
  image(mommalite[imageIndex], mouseX, mouseY);
  imageIndex = (imageIndex + 1) % mommalite.length;
}

void drawScreen3() {
  cursor(ARROW);
  fill(255,0,blue);
  stroke(0);
  shapeMode(CENTER);
  shape(hart,mouseX,mouseY,diameter, diameter);
  diameter= diameter+5;
  blue = blue += 4;
  if(blue > 255){
    screen = 4;
  }
}

void drawScreen4() {
 
  background(0,255,0);
  
  imageMode(CORNER);
  image(cute[imageIndex], 0, 0, width, height);
  if(mouseX < width/8){
    imageIndex = 0;
  }  
  else if(mouseX < 2*width/8){
      imageIndex = 1;
  }
    
  else if(mouseX < 3*width/8){
      imageIndex = 2;
  }
    
  else if(mouseX < 4*width/8){
      imageIndex = 3;
  }
    
  else if(mouseX < 5*width/8){
      imageIndex = 4;
  }
    
  else if(mouseX < 6*width/8){
      imageIndex = 5;
  }
    
  else if(mouseX < 7*width/8){
      imageIndex = 6;
  }
  else{
     imageIndex = 1;
  }
  
  noStroke();
  fill(255,255,0,150);
  rect(width-50, height-50, 50,50);
  if(overRect(width-50, height-50, 50,50) == true){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
}

void drawScreen5() {
  imageMode(CENTER);
  image(ending[imageIndex], mouseX, mouseY, width, ending[0].height);
  imageIndex = (imageIndex + 1) % ending.length;
  
  if(overRect(width/2, height/2, 100,100) == true){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
}
void drawScreen6() {
  cursor(ARROW);
  if(overRect(width/2, height/2, 100,100) == true){
    
    imageMode(CENTER);
    image(ending[9], width/2,height/2, width, ending[0].height);
  }
  fill(0,255,0,100);
  textSize(16);
  text(love, 3*width/4, height-40);
}
  
boolean overImage(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overRect(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

void mousePressed(){
  
  if(screen == 1 && overImage(width/4, height/6, w, h) == true){
    screen = 2;
  }
  if(screen == 5 && overRect(width/2, height/2, 100,100) == true){
    screen = 6;
  }
  if(screen == 4 && overRect(width-50, height-50, 50, 50) == true){
    screen = 5;
  }
}

void keyPressed(){
  if(screen == 2 && key == '5'){
    screen = 3;
  }
  
}
