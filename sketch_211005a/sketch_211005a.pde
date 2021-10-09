import processing.sound.*;

SoundFile rain;
SoundFile Butterfly;
SoundFile bird;
SoundFile frog;
Spring spring;


void setup() {
    size(708, 979);
    
    //load the doorbell sound
    rain = new SoundFile(this, "rain.wav");
    Butterfly = new SoundFile(this,"butterfly.mp3");
    bird = new SoundFile(this,"bird.wav");
    frog = new SoundFile(this,"frog.mp3");
    //doorbell to be clicked
    spring = new Spring(width / 2, height / 2);
    
}

void draw() {
    spring.BlueButterfly_display(mouseX, mouseY);
}

// play the sound effect if the user clicks on the doorbell
// and if the doorbell is not playing already.
void mousePressed() {
    if (spring.isHit1(mouseX, mouseY) && !Butterfly.isPlaying()) { 
        Butterfly.loop();
         frog.pause();
         bird.pause();
    } else if (spring.isHit1(mouseX, mouseY) && Butterfly.isPlaying()) {
        Butterfly.pause();
    }
    
    if (spring.isHit2(mouseX, mouseY) && !bird.isPlaying()) { 
        bird.loop();
        frog.pause();
         Butterfly.pause();
    } else if (spring.isHit2(mouseX, mouseY) && bird.isPlaying()) {
        bird.pause();
    }
    
    if (spring.isHit3(mouseX, mouseY) && !frog.isPlaying()) { 
        frog.loop();
         Butterfly.pause();
         bird.pause();
    } else if (spring.isHit3(mouseX, mouseY) && frog.isPlaying()) {
        frog.pause();
    }
    
}
