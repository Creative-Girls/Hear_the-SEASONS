class Spring {
    summerButton btnSummer;
    autumnButton btnAutumn;
    winterButton btnWinter;
    
    PImage Bbutterfly;
    PImage Bbird1, Bbird2;
    PImage Frog;
    PImage Rock;
    PImage back;
    PImage Sun;
    PImage cloud1;
    PImage cloud2;
    float x;
    float y;
    float n = 0;
    float k;
    int cx, cy;
    int cx1,cy1;
    
    boolean butterfly_hit = false;
    boolean bluebird_hit = false;
    boolean frog_hit = false;
    
    
    Spring(float x_, float y_, String weather) {
        x = x_;
        y = y_;
        
        Bbird1 = loadImage("/spring/img/BlueBird1.png");
        Bbird2 = loadImage("/spring/img/BlueBird2.png");
        Frog = loadImage("/spring/img/Frog.png");
        Rock = loadImage("/spring/img/rock.png");
        Sun = loadImage("/spring/img/sun.png");
        cloud1 = loadImage("/spring/img/cloud1.png");
        cloud2 = loadImage("/spring/img/cloud2.png");
    }
    
    //butterfly hit detection
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x, y) < 50) {
            butterfly_hit = true;
            return true;
        } else {
            butterfly_hit = false;
            return false;
        }
    }
    
    //BlueBird hit
    boolean isHit2(float mx, float my) {
        if (dist(mx, my, x - 40, y - 400) < 50) {
            bluebird_hit = true;
            return true;
        } else {
            bluebird_hit = false;
            return false;
        }
    }
    
    //frog hit
    boolean isHit3(float mx, float my) {
        if (dist(mx,my, x - 180, y + 180) < 50) {
            frog_hit = true;
            return true;
        } else {
            frog_hit = false;
            return false;
        }
    }
    
    boolean mousecursor1(float mx, float my) {
        if (dist(mx, my,x, y) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    boolean mousecursor2(float mx, float my) {
        if (dist(mx, my, x - 40, y - 400) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    
    void draw() {
        backimage();
        butterfly_display();
        
        Bbird_display();
        frog_display();
        sun_display();
        cloud_display();
    }
    
    void backimage() {
        background(back);
    }
    
    void butterfly_display() {
        imageMode(CENTER);
        
        if (butterfly_hit)
            {
            image(Bbutterfly, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            cx += 1;
            cy += 1;
        } else {
            image(Bbutterfly, x, y);
        }
    }
    
    void Bbird_display() {
        imageMode(CENTER);
        
        if (bluebird_hit) {
            n += 2;
            if (n >= 15) {
                n -= 15;
            }
            image(Bbird1, x, y - n);
        } else {
            image(Bbird2, x, y);
        }
    }
    
    void frog_display() {
        imageMode(CENTER);
        image(Rock, x - 180, y + 250, 180, 200);
        
        if (frog_hit) {
            n += 2;
            if (n >= 15) {
                n -= 4;
            }
            image(Frog, x - 180, y + 180 - n, 150, 150);
        } else{
            image(Frog, x - 180, y + 180, 150, 150);
        }
        
    }
    
    void sun_display() {
        imageMode(CENTER);
        image(Sun, x - 250, y - 390, random(100, 150), random(100, 150));
    }
    
    void cloud_display() {
        
        imageMode(CENTER);
        
        image(cloud1, x - 150 - floor(cos(cx1)), y - 350 - floor(sin(cy1)),100,100);
        image(cloud2, x + 150 + floor(cos(cx1)), y - 400 + floor(sin(cy1)), 100, 100);
        cx1 += 1;
        cy1 += 1; 
    }
}
