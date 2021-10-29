class Fall {
    PImage fallbg;
    PImage crow1;
    PImage crow2;
    PImage crow3;
    PImage scarecrow;
    PImage tree;
    PImage leaves1;
    PImage leaves2;
    PImage bug1;
    PImage bug2;
    PImage bug3;
    PImage bug4;
    PImage moon;
    
    float x, y;
    float cx, cy;
    
    boolean scarecrow_hit = false;
    boolean tree_hit = false;
    boolean crow_hit = false;
    boolean bug_hit = false;
    
    Fall(float x_, float y_, String weather, int month, int day) {
        x = x_;
        y = y_;
        
        fallbg = loadImage("/fall/img/Fallbg.png");
        scarecrow = loadImage("/fall/img/scarecrow.png");
        
        crow1 = loadImage("/fall/img/crow1.png");
        crow2 = loadImage("/fall/img/crow2.png");
        crow3 = loadImage("/fall/img/crow3.png");
        
        tree = loadImage("/fall/img/mapletree.png");
        leaves1 = loadImage("/fall/img/leaves1.png");
        leaves2 = loadImage("/fall/img/leaves2.png");
        
        moon = loadImage("/data/fall/img/moon.png");
        bug1 = loadImage("/data/fall/img/bug1.png");
        bug2 = loadImage("/data/fall/img/bug2.png");
        bug3 = loadImage("/fall/img/bug3.png");
        bug4 = loadImage("/fall/img/bug4.png");
    }
    
    //scarecrow_hit detection
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x + 180, y + 250) < 50) {
            scarecrow_hit = true;
            return true;
        } else {
            scarecrow_hit = false;
            return false;
        }
    }
    
    boolean mousecursor1(float mx, float my) {
        if (dist(mx, my, x + 180, y + 250) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    //tree_hit detection
    boolean isHit2(float mx, float my) {
        if (dist(mx,my, x - 250, y + 100) < 80) {
            tree_hit = true;
            return true;
        } else {
            tree_hit = false;
            return false;
        }
    }
    
    
    boolean mousecursor2(float mx, float my) {
        if (dist(mx, my,x - 250, y + 100) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    // crow_hit detection
    boolean isHit3(float mx, float my) {
        if (dist(mx, my, x - 150, y - 60) < 80) {
            crow_hit = true;
            return true;
        } else {
            crow_hit = false;
            return false;
        }
    }
    
    boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, x - 150, y - 60) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    //bug_hit detection
    boolean isHit4(float mx, float my) {
        if (dist(mx, my, x, y) < 60 || dist(mx, my, x + 150, y - 200) < 60) {
            bug_hit = true;
            return true;
        } else {
            bug_hit = false;
            return false;
        }
    }
    
    boolean mousecursor4(float mx, float my, String weather) {
        if (dist(mx, my, x, y) < 60 || dist(mx, my, x + 150, y - 200) < 60) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    void setup() {
    }
    
    void draw() {
        backimage();
        // night 
        if (hour() >= 18) {
            scarecrow_display();
            moon_display();
            tree_display();
            crow_display();
            bug_display();
        } else if (hour() < 18) {
            //day
            scarecrow_display();
            tree_display();
            crow_display();
            
        }
    }
    
    void backimage() {
        background(fallbg);
    }
    
    void scarecrow_display() {
        
        imageMode(CENTER);
        
        if (scarecrow_hit)
            {
            image(scarecrow, x + 180 + floor(cos(cx) * 7), y + 250 + floor(sin(cy) * 7), 300, 300);
            cx += 1;
            cy += 1;
        } else {
            image(scarecrow, x + 180, y + 250, 300, 300);
        }
    }
    
    void tree_display() {
        
        imageMode(CENTER);
        image(tree, x - 250, y + 100, 800, 800);
        
        if (tree_hit) {
            image(leaves1, x - 250 + floor(cos(cx) * 2), y + 100 + floor(sin(cy) * 2), 800, 800);
            cx += 1;
            cy += 1;
            image(leaves2, x - 250, y + 100 + 5 * cy, 800, 800);
        } else {
            image(leaves1, x - 250, y + 100, 800, 800);
            image(leaves2, x - 250, y + 100, 800, 800);
        }
    }
    
    void crow_display() {
        
        imageMode(CENTER);
        
        if (crow_hit) {
            image(crow2, x - 150 + floor(cos(cx) * 2), y - 60 - cy * 2, 50, 50);
            cx += 1;
            cy += 1;
        } else {
            image(crow1, x - 150, y - 60, 50, 50);
        }
    }
    
    void bug_display() {
        
        imageMode(CENTER);
        
        if (bug_hit) {
            image(bug1, x + floor(cos(cx) * 2), y - cy * 2, 60, 60);
            image(bug2, x + 150 - cy * 2, y - 200 - cy * 2, 60, 60);
            image(bug3, x + 350 - cy * 2, y + 200 - floor(cos(cx) * 2), 60, 60);
            image(bug4, x - 350 + cy * 2, y - 150 + floor(cos(cx) * 2), 60, 60);
            cx += 1;
            cy += 1;
        } else {
            image(bug1, x, y, 60, 60);
            image(bug2, x + 150, y - 200, 60, 60);
        }
    }
    
    void moon_display() {
        imageMode(CENTER);
        image(moon, x, 85, 200, 200);
    }
    }
        