import processing.sound.*;

SoundFile rain;
SoundFile Butterfly;
SoundFile bird;
SoundFile frog;
SoundFile bgm;
Spring spring;


void setup() {
    size(708, 979);
    
    //load the doorbell sound
    rain = new SoundFile(this, "rain.wav");
    Butterfly = new SoundFile(this, "butterfly.mp3");
    bird = new SoundFile(this, "bird.wav");
    frog = new SoundFile(this, "frog.mp3");
    bgm = new SoundFile(this, "birdbgm.wav");
    bgm.amp(0.5);
    bgm.loop();
    //doorbell to be clicked
    spring = new Spring(width / 2, height / 2);
}

void draw() {
    spring.draw();
    if(spring.mousecursor1(mouseX, mouseY))
        cursor(HAND);
    else if (spring.mousecursor2(mouseX, mouseY))
        cursor(HAND);
    else if (spring.mousecursor3(mouseX, mouseY))
        cursor(HAND);
}

void mousePressed() {
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
