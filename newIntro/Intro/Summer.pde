class Summer {
    PImage SummerBg, SummerBg_night;
    PImage back;
    PImage ground, ground_night;
    PImage seagull1, seagull2, seagull3, seagull4;
    PImage sea, sea_night;
    PImage palm1, palm2;
    PImage leaf1, leaf2, leaf3, leaf4, leaf5, leaf6;
    PImage lighthouse, lighthouse_night;
    PImage cicada;
    PImage boat, boat_night;
    PImage airplane;
    PImage parasol;
    
    float x;
    float y;

    float n = 0;
    float k;
    int cx, cy;
    int cx1,cy1;
    
    boolean seagulls_hit = false;
    boolean sea_hit = false;
    boolean palm_hit = false;
    boolean leaf_hit = false;
    boolean lighthouse_hit = false;
    boolean cicada_hit = false;
    boolean boat_hit = false;
    boolean airplane_hit = false;
    boolean parasol_hit = false;
    
    
    Summer(float x_, float y_, String weather, int month, int day) {
        x = x_;
        y = y_;   
}
    
    //seagull hit detection
    boolean isHit1(float mx, float my) {
        if (dist(mx, my, x, y-100) < 100) {
            seagulls_hit = true;
            return true;
        } else {
            seagulls_hit = false;
            return false;
        }
}

boolean mousecursor1(float mx, float my) {
        if (dist(mx, my, x, y-100) < 100) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}
    
    //sea hit
    boolean isHit2(float mx, float my) {
        if (dist(mx, my, x , y - 200) < 80) {
            sea_hit = true;
            return true;
        } else {
            sea_hit = false;
            return false;
        }
}

boolean mousecursor2(float mx, float my) {
        if (dist(mx, my, x , y - 200) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}
    
    //palm hit
    boolean isHit3(float mx, float my) {
        if (dist(mx, my, x - 180, y) < 50 || dist(mx, my, x + 180, y) < 50) {
            palm_hit = true;
            return true;
        } else {
            palm_hit = false;
            return false;
        }
}

boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, x - 180, y) < 50 || dist(mx, my, x + 180, y) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //leaf hit
    boolean isHit4(float mx, float my) {
        if (dist(mx, my, x - 300, y + 400) < 80 || dist(mx, my, x + 300, y + 400) < 80) {
            leaf_hit = true;
            return true;
        } else {
            leaf_hit = false;
            return false;
        }
}

boolean mousecursor4(float mx, float my) {
        if (dist(mx, my, x - 300, y + 400) < 80 || dist(mx, my, x + 300, y + 400) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //lighthouse hit
    boolean isHit5(float mx, float my) {
        if (dist(mx, my, x - 200, y) < 50 || dist(mx, my, x + 200, y) < 50) {
            lighthouse_hit = true;
            return true;
        } else {
            lighthouse_hit = false;
            return false;
        }
}

boolean mousecursor5(float mx, float my) {
        if (dist(mx, my, x - 200, y) < 50 || dist(mx, my, x + 200, y) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //cicada hit
    boolean isHit7(float mx, float my) {
        if (dist(mx, my, x + 300, y - 100) < 50) {
            cicada_hit = true;
            return true;
        } else {
            cicada_hit = false;
            return false;
        }
}

boolean mousecursor7(float mx, float my) {
        if (dist(mx, my, x + 300, y - 100) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //boat hit
    boolean isHit8(float mx, float my) {
        if (dist(mx, my, x, y + 150) < 50) {
            boat_hit = true;
            return true;
        } else {
            boat_hit = false;
            return false;
        }
}

boolean mousecursor8(float mx, float my) {
        if (dist(mx, my, x, y + 150) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //airplane hit
    boolean isHit9(float mx, float my) {
        if (dist(mx, my, x, y - 400) < 50) {
            airplane_hit = true;
            return true;
        } else {
            airplane_hit = false;
            return false;
        }
}

boolean mousecursor9(float mx, float my) {
        if (dist(mx, my, x, y - 400) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

    //parasol hit
    boolean isHit10(float mx, float my) {
        if (dist(mx, my, x - 200, y + 500) < 50) {
            parasol_hit = true;
            return true;
        } else {
            parasol_hit = false;
            return false;
        }
}

boolean mousecursor10(float mx, float my) {
        if (dist(mx, my, x - 200, y + 500) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
}

void setup(){
}
    
    void draw() {
        backimage();
        
        //day
        if(hour() < 18){
          seagull_display();
          sea_display();
          ground_display();
          palm_display();
          parasol_display();
          leaf_display();
          cicada_display();
          lighthouse_display();
          boat_display();
          airplane_display();
        }
        //night
        else if(hour() >= 18){
          sea_night_display();
          ground_night_display();
          palm_display();
          parasol_display();
          leaf_display();
          lighthouse_night_display();
          boat_night_display();
          airplane_display();
        }
}
    
    void backimage() {
        if(hour() < 18){
          back= loadImage("/summer/img/SummerBg.png");
        }else if(hour() >= 18){
          back = loadImage("/summer/img/SummerBg_night.png");
        }
        background(back);
}
    
    void palm_display() {
        palm1 = loadImage("/summer/img/palm1.png");
        palm2 = loadImage("/summer/img/palm2.png");

        imageMode(CENTER);
        
        if (palm_hit)
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
      sea = loadImage("/summer/img/sea.png");
      
      imageMode(CENTER);
      
      if(sea_hit){
        image(sea, x, y);
      }else{
        image(sea, x, y);
      }
    }
    
    void sea_night_display(){
      sea_night = loadImage("/summer/img/sea_night.png");
      
      imageMode(CENTER);
      
      if(sea_hit){
        image(sea_night, x, y);
      }else{
        image(sea_night, x, y);
      }
    }
    
     void ground_display(){
       ground = loadImage("/summer/img/ground.jpg");
       
       imageMode(CENTER);
       
       image(ground, x, y);
    }
    
    void ground_night_display(){
       ground_night = loadImage("/summer/img/ground_night.png");
       
       imageMode(CENTER);
       
       image(ground_night, x, y);
    }
    
    void seagull_display() {
        seagull1 = loadImage("/summer/img/seagull1.png");
        seagull2 = loadImage("/summer/img/seagull2.png");
        seagull3 = loadImage("/summer/img/seagull3.png");
        seagull4 = loadImage("/summer/img/seagull4.png");
        
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
        leaf1 = loadImage("/summer/img/leaf1.png");
        leaf2 = loadImage("/summer/img/leaf2.png");
        leaf3 = loadImage("/summer/img/leaf3.png");
        leaf4 = loadImage("/summer/img/leaf4.png");
        leaf5 = loadImage("/summer/img/leaf5.png");
        leaf6 = loadImage("/summer/img/leaf6.png");

        imageMode(CENTER);
        
        if (leaf_hit)
        {
            image(leaf1, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf2, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf3, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf4, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf5, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
            image(leaf6, x + floor(cos(cx) * 4), y + floor(sin(cy) * 4));
         
            cx += 1;
            cy += 1;
        } else {
            image(leaf1, x, y);
            image(leaf2, x, y);
            image(leaf3, x, y);
            image(leaf4, x, y);
            image(leaf5, x, y);
            image(leaf6, x, y);
        }
}
    
    void lighthouse_display() {
        lighthouse= loadImage("/summer/img/lighthouse.png");
        
        imageMode(CENTER);
        
        if(lighthouse_hit){
            image(lighthouse, x, y);
        }else{
            image(lighthouse, x, y);
        }
    }
    
    void lighthouse_night_display(){
       lighthouse_night= loadImage("/summer/img/lighthouse_night.png");
       
       imageMode(CENTER);
       
       if(lighthouse_hit){
          image(lighthouse_night, x, y);
      }else{
         image(lighthouse_night, x, y);
      }
    }
        
   

    void boat_display() {
         boat = loadImage("/summer/img/boat.png");
        
        imageMode(CENTER);
        
        if (boat_hit) {
            n += 2;
            if (n >= 15) {
                n -= 5;
            }
            image(boat, x - n, y - n);
        } else {
            image(boat, x, y);
        }
}

    void boat_night_display() {
         boat_night = loadImage("/summer/img/boat_night.png");
        
        imageMode(CENTER);
        
        if (boat_hit) {
            n += 2;
            if (n >= 15) {
                n -= 5;
            }
            image(boat_night, x - n, y - n);
        } else {
            image(boat_night, x, y);
        }
}

    void airplane_display() {
        airplane = loadImage("/summer/img/airplane.png");
        
        imageMode(CENTER);
        
        if(airplane_hit){
        image(airplane, x - 150 - floor(cos(cx1)), y - 350 - floor(sin(cy1)),100,100);
        cx1 += 1;
        cy1 += 1; 
        }else{
          image(airplane, x, y);
        }
}

    void cicada_display(){
       cicada = loadImage("/summer/img/cicada.png");
       
       imageMode(CENTER);
       
       image(cicada, x, y);
    }
    
    void parasol_display(){
       parasol = loadImage("/summer/img/parasol.png");
       
       imageMode(CENTER);
       
       image(parasol, x, y);
    }
    
   

}
