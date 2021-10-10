class Spring {
    PImage Bbutterfly;
    PImage Bbird;
    PImage Frog;
    PImage Rock;
    PImage back;
    PImage Sun;
    PImage cloud1;
    PImage cloud2;
    float x;
    float y;
    float n = 0;
    
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
        if (dist(mx,my, x - 180, y + 180) < 50) {
            returntrue;
        } else {
            returnfalse;
        }
    }
    
    boolean mousecursor1(float mx, float my) {
        if (dist(mx, my,x, y) < 80) {
            returntrue;
        } else {
            cursor(ARROW);
            returnfalse;
        }
    }
    
    boolean mousecursor2(float mx, float my) {
        if (dist(mx, my, x - 40, y - 400) < 80) {
            returntrue;
        } else {
            cursor(ARROW);
            returnfalse;
        }
    }
    
    boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 80) {
            returntrue;
        } else {
            cursor(ARROW);
            returnfalse;
        }
    }
    
    
    voiddraw() {
        backimage();
        butterfly_display();
        Bbird_display();
        frog_display();
        sun_display();
        cloud_display();
    }
    
    void backimage() {
        back = loadImage("SpringBg.png");
        background(back);
    }
    
    void butterfly_display() {
        
        Bbutterfly = loadImage("BlueButterfly.png");
        imageMode(CENTER);
        image(Bbutterfly, x, y);
    }
    
    void Bbird_display() {
        
        Bbird = loadImage("BlueBird.png");
        imageMode(CENTER);
        image(Bbird, x - 40, y - 400, 80, 80);
    }
    
    void frog_display() {
        
        n += 2;
        if (n >= 15)
            n -= 15;
        
        Frog = loadImage("Frog.png");
        Rock = loadImage("rock.png");
        
        imageMode(CENTER);
        image(Rock, x - 180, y + 250,180,200);
        image(Frog, x - 180, y + 180 - n, 150, 150);
        
    }
    
    void sun_display() {
        Sun = loadImage("sun.png");
        imageMode(CENTER);
        image(Sun, x - 250, y - 390, random(100,150), random(100,150));
    }
    
    void cloud_display() {
        
        cloud1 = loadImage("cloud1.png");
        cloud2 = loadImage("cloud2.png");
        
        imageMode(CENTER);
        image(cloud1, x - 300 , y - 350, 100, 100);
        image(cloud2, x + 300, y - 400, 100, 100);
    }
    
    
}