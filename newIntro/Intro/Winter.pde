class Winter {
    PImage background;
    PImage fire;
    float x;
    float y;
    float n = 0;
    float k;
    int cx, cy;
    int cx1,cy1;
    
    boolean fire_hit = false;
    
    Winter(float x_, float y_, String weather) {
        x = x_;
        y = y_;
    }
    
    //fire hit
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            fire_hit = true;
            return true;
        } else {
            fire_hit = false;
            return false;
        }
    }
    
    boolean mousecursor1(float mx, float my) {
        if (dist(mx, my, x, y) < 80) {
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
    
    void draw() {
        backimage();
        fire_display();
    }
    
    void backimage() {
        background= loadImage("/winter/winter_background708.png");
        background(background);
  }
    
    void fire_display() {
        
        fire = loadImage("/winter/fire.png");
        imageMode(CENTER);
        fire.resize(700, 700);
        if (fire_hit)
        {
            image(fire, x + floor(cos(cx) * 4)-20, y + floor(sin(cy) * 4));
            cx += 1;
            cy += 1;
        } else {
            image(fire, x, y);
        }
  }
}  
