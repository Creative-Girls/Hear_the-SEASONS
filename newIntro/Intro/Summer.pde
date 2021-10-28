class Summer {
    springButton btnStart;
    autumnButton btnAutumn;
    winterButton btnWinter;

    PImage SummerBg;
    PImage back;
    PImage seagull1, seagull2, seagull3, seagull4;
    PImage sea;
    PImage palm1, palm2;
    PImage leaf1, leaf2, leaf3, leaf4, leaf5;
    PImage lighthouse_bottom, lighthouse_top;
    PImage cloud;
    PImage cicada;
    PImage boat;
    PImage airplane;
    PImage parasol;
    float x;
    float y;
    float z;
    float n = 0;
    float k;
    int cx, cy;
    int cx1,cy1;
    
    boolean seagulls_hit = false;
    boolean sea_hit = false;
    boolean palm_hit = false;
    boolean leaf_hit = false;
    boolean lighthouse_hit = false;
    boolean cloud_hit = false;
    boolean cicada_hit = false;
    boolean boat_hit = false;
    boolean airplane_hit = false;
    boolean parasol_hit = false;
    
    
    Summer(float x_, float y_, String weather) {
        x = x_;
        y = y_;
}
    
    //seagull hit detection
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x, y) < 50) {
            seagulls_hit = true;
            return true;
        } else {
            seagulls_hit = false;
            return false;
        }
}
    
    //sea hit
    boolean isHit2(float mx, float my) {
        if (dist(mx, my, x - 40, y - 400) < 50) {
            sea_hit = true;
            return true;
        } else {
            sea_hit = false;
            return false;
        }
}
    
    //palm hit
    boolean isHit3(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            palm_hit = true;
            return true;
        } else {
            palm_hit = false;
            return false;
        }
}

    //leaf hit
    boolean isHit4(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            leaf_hit = true;
            return true;
        } else {
            leaf_hit = false;
            return false;
        }
}

    //lighthouse hit
    boolean isHit5(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            lighthouse_hit = true;
            return true;
        } else {
            lighthouse_hit = false;
            return false;
        }
}

    //cloud hit
    boolean isHit6(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            cloud_hit = true;
            return true;
        } else {
            cloud_hit = false;
            return false;
        }
}

    //cicada hit
    boolean isHit7(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            cicada_hit = true;
            return true;
        } else {
            cicada_hit = false;
            return false;
        }
}

    //boat hit
    boolean isHit8(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            boat_hit = true;
            return true;
        } else {
            boat_hit = false;
            return false;
        }
}

    //airplane hit
    boolean isHit9(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            airplane_hit = true;
            return true;
        } else {
            airplane_hit = false;
            return false;
        }
}

    //parasol hit
    boolean isHit10(float mx, float my) {
        if (dist(mx, my, x - 180, y + 180) < 50) {
            parasol_hit = true;
            return true;
        } else {
            parasol_hit = false;
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
        seagull_display();
        sea_display();
        palm_display();
        leaf_display();
        lighthouse_display();
        cloud_display();
        cicada_display();
        boat_display();
        airplane_display();
        parasol_display();
}
    
    void backimage() {
        back= loadImage("SummerBg.png");
        background(back);
}
    
    void palm_display() {
        
        palm1 = loadImage("palm1.png");
        palm2 = loadImage("palm2.png");

        imageMode(CENTER);
        
        if (seagulls_hit)
        {
            image(palm1, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(palm2, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
         
            cx += 1;
            cy += 1;
        } else {
            image(palm1, x, y);
            image(palm2, x, y);
        }
}

    void sea_display(){
      sea = loadImage("sea.png");
    }
    
    void seagull_display() {
        
        seagull1 = loadImage("seagull1.png");
        seagull2 = loadImage("seagull2.png");
        seagull3 = loadImage("seagull3.png");
        seagull4 = loadImage("seagull4.png");
        
        imageMode(CENTER);
        
        if (seagulls_hit) {
            n += 2;
           if (n >= 15) {
               n -= 15;
        }
            image(seagull1, x, y - n);
            image(seagull2, x, y - n);
            image(seagull3, x, y - n);
            image(seagull4, x, y - n);
        } else {
            image(seagull1, x, y);
            image(seagull2, x, y);
            image(seagull3, x, y);
            image(seagull4, x, y);
        }
}

void leaf_display() {
        
        leaf1 = loadImage("leaf1.png");
        leaf2 = loadImage("leaf2.png");
        leaf3 = loadImage("leaf3.png");
        leaf4 = loadImage("leaf4.png");
        leaf5 = loadImage("leaf5.png");

        imageMode(CENTER);
        
        if (leaf_hit)
        {
            image(leaf1, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf2, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf3, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf4, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf5, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
         
            cx += 1;
            cy += 1;
        } else {
            image(leaf1, x, y);
            image(leaf2, x, y);
            image(leaf3, x, y);
            image(leaf4, x, y);
            image(leaf5, x, y);
        }
}
    
    void lighthouse_display() {
        
        lighthouse_bottom= loadImage("lighthouse_bottom.png");
        lighthouse_top= loadImage("lighthouse_top.png");
        
        imageMode(CENTER);
        
        if (lighthouse_hit) {
            
        }
        
}
    
    
    void cloud_display() {
        
        cloud = loadImage("cloud.png");
        
        imageMode(CENTER);
        
        image(cloud, x - 150 - floor(cos(cx1)), y - 350 - floor(sin(cy1)),100,100);
        cx1 += 1;
        cy1 += 1; 
}

    void boat_display() {
        
        boat = loadImage("boat.png");
        
        imageMode(CENTER);
        
        image(boat, x - 150 - floor(cos(cx1)), y - 350 - floor(sin(cy1)),100,100);
        cx1 += 1;
        cy1 += 1; 
}

    void airplane_display() {
        
        airplane = loadImage("airplane.jpg");
        
        imageMode(CENTER);
        
        image(airplane, x - 150 - floor(cos(cx1)), y - 350 - floor(sin(cy1)),100,100);
        cx1 += 1;
        cy1 += 1; 
}

    void cicada_display(){
      cicada = loadImage("cicada.png");
    }
    
    void parasol_display(){
      parasol = loadImage("parasol.png");
    }

}
