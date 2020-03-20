PFont font;
PImage logo;
PImage level1;
PImage level2;
PImage level3;

ImageButton imageButton1;
ImageButton imageButton2;
ImageButton imageButton3;

Button button1;
Button button2;
Button button3;
Button button0;

int stage = 0;
void setup(){
  size(1200,800);

  font = loadFont("ArialMT-20.vlw");
  textFont(font, 60);
  
  logo = loadImage("unpaint-logo@2x.png");
  
  level1 = loadImage("level-1@2x.png");
  level2 = loadImage("level-2@2x.png");
  level3 = loadImage("level-3@2x.png");
  
  imageButton1 = new ImageButton(480, 380, level1);
  imageButton2 = new ImageButton(480, 500, level2);
  imageButton3 = new ImageButton(480, 620, level3);

  button1 = new Button(50, 600, "Level 1");
  button2 = new Button(50, 500, "Level 2");
  button3 = new Button(50, 400, "Level 3");
  button0 = new Button(50, 700, " < ");
}
void draw(){
  noStroke();
  background(255);
 //button1.draw();
 // button2.draw();
 // button3.draw();
 
  button0.draw();
  
  stageSelector();
}

void stageSelector() {
  switch(stage){
  case 0:
    home();
    break;
    
  case 1:
    level1();
    break;
    
  case 2:
    level2();
    break;
    
  case 3:
    level3();
    break;
  }
}

void home(){
  image(logo, 200, 100);
    
  imageButton1.draw();
  imageButton2.draw();
  imageButton3.draw();
}

void level1(){
  text("Level 1", 500, 80);
}

void level2(){
    text("Level 2", 500, 80);
}

void level3(){
    text("Level 3", 500, 80);
}

void mousePressed(){
  println("Mouse: " + mouseX + ", "+ mouseY);
  if(imageButton1.pressed()){
    stage = 1;
    println("level1 pressed!");
  }
  if(imageButton2.pressed()){
    println("level2 pressed!");
    stage = 2;
  }
  if(imageButton3.pressed()){
    println("level3 pressed!");
    stage = 3;
  }
  if(button0.pressed()){
    println("button0 pressed!");
    stage = 0;
  }
  
  if(button1.pressed()){
    println("button1 pressed!");
  }
  if(button1.pressed()){
    println("button1 pressed!");
  }
  if(button2.pressed()){
    println("button2 pressed!");
  }
  if(button3.pressed()){
    println("button3 pressed!");
  }

}

class ImageButton {
  int x, y;
  PImage label;
  
  ImageButton(int x, int y, PImage label){
    this.x = x;
    this.y = y;
    this.label = label;
  }
  
  void draw(){
    fill(255);
    if(pressed()){
      fill(0);
    }
    rect(x, y, 240, 100);
    image(label, x, y);
  }
  
  boolean pressed(){
    return (mouseX >= x && mouseY >= y && mouseX <= x + 240 && mouseY <= y + 100);
  }
}

class Button{
  int x,y;
  String label;
  
  Button(int x, int y, String label){
    this.x = x;
    this.y = y;
    this.label = label;
  }
  void draw(){
    fill(200);
    if(pressed()){
      fill(255);
     // println(label + "is hovered");
    }
    rect(x, y, textWidth(label), 65);
    fill(0);
    text(label, x, y + 60);
  }
  boolean pressed(){
    return (mouseX >= x && mouseY >= y && mouseX <= x + textWidth(label) && mouseY <= y + 62);
  }
}
 
