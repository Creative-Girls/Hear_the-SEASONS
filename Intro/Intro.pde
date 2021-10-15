PImage bg;
PImage bg_title;
Button btnStart;
int w_color = 255;
import processing.sound.*;

SoundFile rain;
SoundFile Butterfly;
SoundFile bird;
SoundFile frog;
SoundFile bgm;
Spring spring;
int page = 0;//page num
/*
  봄 : 1
  여름 : 2
  가을 : 3
  겨울 : 4
*/

void setup() {
    size(708, 979);
    background(255);
    bg = loadImage("Intro-bg.png");
    bg.resize(708, 979);
    bg_title = loadImage("Intro-title.png");
    bg_title.resize(708, 979);
    
    //Button
    btnStart = new Button("START", w_color, 290, 750, 150, 50);
    
     //load the doorbell sound
    rain = new SoundFile(this, "rain.wav");
    Butterfly = new SoundFile(this, "butterfly.mp3");
    bird = new SoundFile(this, "bird.wav");
    frog = new SoundFile(this, "frog.mp3");
   // bgm = new SoundFile(this, "birdbgm.wav");
   // bgm.amp(0.5);
   // bgm.loop();
    //doorbell to be clicked
    spring = new Spring(width / 2, height / 2);
}

void draw() {
    if(page == 0)
    {
      frameRate(60);
      background(255);
      image(bg, 0, 0);
      image(bg_title, 0, 0);
      
      
    //button
    btnStart.Draw();
    textAlign(CENTER, CENTER);
    textSize(16);
    }else if(page == 1)
    {
      spring.draw();
    if(spring.mousecursor1(mouseX, mouseY))
        cursor(HAND);
    else if (spring.mousecursor2(mouseX, mouseY))
        cursor(HAND);
    else if (spring.mousecursor3(mouseX, mouseY))
        cursor(HAND);
    }
    

}

void mousePressed() {
    if (btnStart.MouseIsOverOn()) {
       page= 1;
    }
    if(spring.isHit1(mouseX, mouseY) && !Butterfly.isPlaying()) {
        Butterfly.loop();
        frog.pause();
        bird.pause();
} else if (spring.isHit1(mouseX, mouseY) && Butterfly.isPlaying()) {
        spring.butterfly_hit = false;
        Butterfly.pause();
}
    
    if(spring.isHit2(mouseX, mouseY) && !bird.isPlaying()) {
        bird.loop();
        frog.pause();
        Butterfly.pause();
} else if (spring.isHit2(mouseX, mouseY) && bird.isPlaying()) {
        spring.bluebird_hit = false;
        bird.pause();
}
    
    if(spring.isHit3(mouseX, mouseY) && !frog.isPlaying()) {
        frog.loop();
        Butterfly.pause();
        bird.pause();
} else if (spring.isHit3(mouseX, mouseY) && frog.isPlaying()) {
        spring.frog_hit = false;
        frog.pause();
}
}
        
