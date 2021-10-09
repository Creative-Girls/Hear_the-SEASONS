class Spring {
    PImage Bbutterfly;
    PImage Bbird;
    PImage Frog;
    PImage back;
    float x;
    float y;
    
    Spring(float x_, float y_) {
        x = x_;
        y = y_;
}
    
    //butterfly hit detection
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x, y) < 50) {
            returntrue;
        } else {
            returnfalse;
        }
}
    
    //BlueBird hit
    boolean isHit2(float mx, float my) {
        if (dist(mx, my, x - 40, y - 400) < 50) {
            returntrue;
        } else {
            returnfalse;
        }
}
    
    //frog hit
    boolean isHit3(float mx, float my) {
        if (dist(mx, my, x - 180, y + 250) < 50) {
            returntrue;
        } else {
            returnfalse;
        }
}
    
    
    void setup() {
        
}
    void BlueButterfly_display(float mx, float my) {
        
        back= loadImage("SpringBg.png");
        background(back);
        
        Bbutterfly = loadImage("BlueButterfly.png");
        Bbird = loadImage("BlueBird.png");
        Rbird = loadImage("RedBird.png");
        Frog= loadImage("Frog.png");
        
        imageMode(CENTER);
        image(Bbutterfly,x,y);
        
        imageMode(CENTER);
        image(Bbird,x - 40,y - 400,80,80);
        
        
        imageMode(CENTER);
        image(Frog,x - 180,y + 250,150,150);
}
}