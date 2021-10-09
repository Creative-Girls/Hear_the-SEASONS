PImage bg;
PImage bg_title;
Button btnStart;
int w_color = 255;

void setup(){
    size(708, 979);
    background(255);
    bg = loadImage("Intro-bg.png");
    bg.resize(708, 979);
    bg_title = loadImage("Intro-title.png");
    bg_title.resize(708, 979);
    
    //Button
    btnStart = new Button("START", w_color, 290, 750, 150, 50);
}

void draw(){
  frameRate(60);
  background(255);
  image(bg, 0, 0);
  image(bg_title, 0, 0);
  
  //button
  btnStart.Draw();
  textAlign(CENTER, CENTER);
  textSize(16);
}

void mousePressed(){
  if(btnStart.MouseIsOverOn()){
    background(255);
  }
}
