import processing.sound.*;

class Summer {
   Season season;
   
   //sound
   AudioPlayer rain;
   AudioPlayer rain_under_parasol;
   SoundFile airplane;
   SoundFile cicada; 
   AudioPlayer palm;
   AudioPlayer leaf;
   SoundFile sea;
   AudioPlayer seaBg;
   AudioPlayer seagulls;
  
    PImage iSummerBg, iSummerBg_night;
    PImage iground, iground_night;
    PImage iseagull1, iseagull2, iseagull3, iseagull4;
    PImage isea, isea_night;
    PImage ipalm1, ipalm2;
    PImage ileaf1, ileaf2, ileaf3, ileaf4, ileaf5, ileaf6;
    PImage ilighthouse, ilighthouse_night;
    PImage icicada;
    PImage iboat, iboat_night;
    PImage iairplane;
    PImage iparasol;
    PImage iRain;
    
    String weather;
    float w,h; // w:width, h:height
    int month, day;
    
    boolean seagullsHitYN = false;
    boolean seaHitYN= false;
    boolean palmHitYN = false;
    boolean leafHitYN = false;
    boolean lighthouseHitYN = false;
    boolean cicadaHitYN = false;
    boolean boatHitYN = false;
    boolean airplaneHitYN = false;
    boolean parasolHitYN = false;
    
    int hour;
    int imgX, imgY;
    int cloudX, cloudY;
    int n = 0;
    
    Summer(Season season, float w, float h, String weather, int month, int day) {
        this.season = season;
        this.w = w;
        this.h = h;   
        this.weather = weather;
        this.month = month;
        this.day = day;
        
        rain_under_parasol =  minim.loadFile("/summer/sound/rain-under-parasol.mp3");
        cicada = new SoundFile(season, "/summer/sound/cicada.wav");
        seagulls =  minim.loadFile( "/summer/sound/seagulls.wav");
        sea = new SoundFile(season, "/summer/sound/sea.wav");
        palm =  minim.loadFile( "/summer/sound/leaf.wav");
        leaf =  minim.loadFile( "/summer/sound/leaf.wav");
        airplane = new SoundFile(season, "/summer/sound/airplane.wav");
        
        iSummerBg= loadImage("/summer/img/SummerBg.png");
        iSummerBg_night = loadImage("/summer/img/SummerBg_night.png");

        ipalm1 = loadImage("/summer/img/palm1.png");
        ipalm2 = loadImage("/summer/img/palm2.png");
        isea = loadImage("/summer/img/sea.png");
        isea_night = loadImage("/summer/img/sea_night.png");
        iground = loadImage("/summer/img/ground_night.png");
        iground_night = loadImage("/summer/img/ground_night.png");
        iseagull1 = loadImage("/summer/img/seagull1.png");
        iseagull2 = loadImage("/summer/img/seagull2.png");
        iseagull3 = loadImage("/summer/img/seagull3.png");
        iseagull4 = loadImage("/summer/img/seagull4.png");
        ileaf1 = loadImage("/summer/img/leaf1.png");
        ileaf2 = loadImage("/summer/img/leaf2.png");
        ileaf3 = loadImage("/summer/img/leaf3.png");
        ileaf4 = loadImage("/summer/img/leaf4.png");
        ileaf5 = loadImage("/summer/img/leaf5.png");
        ileaf6 = loadImage("/summer/img/leaf6.png"); 
        ilighthouse= loadImage("/summer/img/lighthouse.png");
        ilighthouse_night= loadImage("/summer/img/lighthouse_night.png");
        iparasol = loadImage("/summer/img/parasol.png");
        icicada = loadImage("/summer/img/cicada.png");
        iairplane = loadImage("/summer/img/airplane.png");
        iboat_night = loadImage("/summer/img/boat_night.png");
        iboat = loadImage("/summer/img/boat.png");
     }

     void draw() {
        backimage();
        
        //day
        if(hour() >= 6 && hour() < 18){
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
        else if(hour() >= 18 && hour() < 6){
          sea_night_display();
          ground_night_display();
          palm_display();
          parasol_display();
          leaf_display();
          lighthouse_night_display();
          boat_night_display();
          airplane_display();
        }
        but.draw();
    }
      
    
    //seagull hit detection
    boolean seagullsHit(float mx, float my) {
        if (dist(mx, my, w, h - 100) < 100) {
            seagullsHitYN = true;
            return true;
        } else {
            seagullsHitYN = false;
            return false;
        }
     }

     boolean mousecursor1(float mx, float my) {
        if (dist(mx, my, w, h - 100) < 100) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    //sea hit
    boolean seaHit(float mx, float my) {
        if (dist(mx, my, w, h + 280) < 50) {
            seaHitYN = true;
            return true;
        } else {
            seaHitYN = false;
            return false;
        }
    }

    boolean mousecursor2(float mx, float my) {
        if (dist(mx, my, w, h + 280) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    //palm hit
    boolean palmHit(float mx, float my) {
        if (dist(mx, my, w - 250, h - 300) < 80 || dist(mx, my, w + 250, h - 180) < 80) {
            palmHitYN = true;
            return true;
        } else {
            palmHitYN = false;
            return false;
        }
    }

    boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, w - 250, h - 300) < 80 || dist(mx, my, w + 250, h - 180) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    //leaf hit
    boolean leafHit(float mx, float my) {
        if (dist(mx, my, w - 250, h + 330) < 80 || dist(mx, my, w + 250, h + 330) < 80) {
            leafHitYN = true;
            return true;
        } else {
            leafHitYN = false;
            return false;
        }
    }

    boolean mousecursor4(float mx, float my) {
        if (dist(mx, my, w - 250, h + 330) < 80 || dist(mx, my, w + 250, h + 330) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    //cicada hit
    boolean cicadaHit(float mx, float my) {
        if (dist(mx, my, w + 340, h - 100) < 30) {
            cicadaHitYN = true;
            return true;
        } else {
            cicadaHitYN = false;
            return false;
        }
    }

    boolean mousecursor5(float mx, float my) {
        if (dist(mx, my, w + 340, h - 100) < 30) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    //boat hit
    boolean boatHit(float mx, float my) {
        if (dist(mx, my, w, h + 279) < 30) {
            boatHitYN = true;
            return true;
        } else {
            boatHitYN = false;
            return false;
        }
    }

    boolean mousecursor6(float mx, float my) {
        if (dist(mx, my, w, h + 279) < 30) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    //airplane hit
    boolean airplaneHit(float mx, float my) {
        if (dist(mx, my, w, h - 400) < 80) {
            airplaneHitYN = true;
            return true;
        } else {
            airplaneHitYN = false;
            return false;
        }
    }

    boolean mousecursor7(float mx, float my) {
        if (dist(mx, my, w, h - 400) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    //parasol hit
    boolean parasolHit(float mx, float my) {
        if (dist(mx, my, w - 180, h + 250) < 50) {
            parasolHitYN = true;
            return true;
        } else {
            parasolHitYN = false;
            return false;
        }
    }

    boolean mousecursor8(float mx, float my) {
        if (dist(mx, my, w - 180, h + 250) < 50) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }

    void backimage() {     
      if(hour() < 18 && hour() >= 6 ){
            image(iSummerBg, w, h, 708, 979);
            // if raing now, it's rainy & parasol sound appear
            if ( weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
               || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true)
               background(iSummerBg);
            else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
               || weather.equals("thunderstorm") == true) {
               tint(180);
               image(iRain, w, h);
               image(iSummerBg, w, h);
            }
       }else if(hour() >= 18 && hour() < 6){
            image(iSummerBg_night, w, h, 708, 979);
            // if raing now, it's rainy & parasol sound appear
            if ( weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
               || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true)
               background(iSummerBg_night);
            else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
               || weather.equals("thunderstorm") == true) {
               tint(180);
               image(iRain, w, h);
               image(iSummerBg_night, w, h);
            }
       }
    }
    
    void palm_display() {

        imageMode(CENTER);
        
        if (palmHitYN)
        {
            image(ipalm1, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ipalm2, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
         
            imgX += 1;
            imgY += 1;
        } else {
            image(ipalm1, w, h);
            image(ipalm2, w, h);
        }
    }

    void sea_display(){
      
      imageMode(CENTER);
      
      if(seaHitYN){
        image(isea, w, h);
      }else{
        image(isea, w, h);
      }
    }
    
    void sea_night_display(){
      
      imageMode(CENTER);
      
      if(seaHitYN){
        image(isea_night, w, h);
      }else{
        image(isea_night, w, h);
      }
    }
    
     void ground_display(){
       
       imageMode(CENTER);
       
       image(iground, w, h);
    }
    
    void ground_night_display(){
       
       imageMode(CENTER);
       
       image(iground_night, w, h);
    }
    
    void seagull_display() {
        
       imageMode(CENTER);
        
       if (seagullsHitYN) {
           n += 1;
       if (n >= 14) {
           n -= 14;
        }
       if(n%2==0)
           image(iseagull1, w, h - n);
           image(iseagull2, w, h - n);
           image(iseagull3, w, h - n);
           image(iseagull4, w, h - n);
        if(n%2==1)
           image(iseagull1, w, h - n);
           image(iseagull2, w, h - n);
           image(iseagull3, w, h - n);
           image(iseagull4, w, h - n);
        } else {
           image(iseagull1, w, h - n);
           image(iseagull2, w, h - n);
           image(iseagull3, w, h - n);
           image(iseagull4, w, h - n);
        }
    }

    void leaf_display() {

        imageMode(CENTER);
        
        if (leafHitYN)
        {
            image(ileaf1, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ileaf2, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ileaf3, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ileaf4, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ileaf5, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
            image(ileaf6, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
         
            imgX += 1;
            imgY += 1;
        } else {
            image(ileaf1, w, h);
            image(ileaf2, w, h);
            image(ileaf3, w, h);
            image(ileaf4, w, h);
            image(ileaf5, w, h);
            image(ileaf6, w, h);
        }
    }
    
    void lighthouse_display() {
        
        imageMode(CENTER);
        
        if(lighthouseHitYN){
            image(ilighthouse, w, h);
        }else{
            image(ilighthouse, w, h);
        }
    }
    
    void lighthouse_night_display(){
       
       imageMode(CENTER);
       
       if(lighthouseHitYN){
          image(ilighthouse_night, w, h);
      }else{
         image(ilighthouse_night, w, h);
      }
    }

    void boat_display() {
        
        imageMode(CENTER);
        
        if (boatHitYN) {
            n += 1;
            image(iboat, w + n, h);
        } else {
            image(iboat, w, h);
        }
    }

    void boat_night_display() {

        imageMode(CENTER);
        
        if (boatHitYN) {
            n += 1;
            image(iboat_night, w + n, h);
        } else {
            image(iboat_night, w, h);
        }
    }

    void airplane_display() {
       
        imageMode(CENTER);
        
        if(airplaneHitYN){
            n += 1;
            image(iairplane, w + n, h - n);
        } else {
            image(iairplane, w, h);        
        }
    }

    void cicada_display(){
       
       imageMode(CENTER);
       
       image(icicada, w, h);
    }
    
    void parasol_display(){
      
       imageMode(CENTER);
       
       image(iparasol, w, h);
    }

void mousePressed() {
    if(seagullsHit(mouseX, mouseY) && !seagulls.isPlaying()) {
        seagulls.loop();
        sea.pause();
        palm.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        rain_under_parasol.pause();
} else if (seagullsHit(mouseX, mouseY) && seagulls.isPlaying()) {
        seagullsHitYN = false;
        seagulls.pause();
}
    
    if(seaHit(mouseX, mouseY) && !sea.isPlaying()) {
        sea.loop();
        seagulls.pause();
        palm.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        rain_under_parasol.pause();
} else if (seaHit(mouseX, mouseY) && sea.isPlaying()) {
        seaHitYN = false;
        sea.pause();
}
    
    if(palmHit(mouseX, mouseY) && !palm.isPlaying()) {
        palm.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        rain_under_parasol.pause();
} else if (palmHit(mouseX, mouseY) && palm.isPlaying()) {
        palmHitYN = false;
        palm.pause();
}

    if(leafHit(mouseX, mouseY) && !leaf.isPlaying()) {
        leaf.loop();
        seagulls.pause();
        sea.pause();
        palm.pause();
        cicada.pause();
        airplane.pause();
        rain_under_parasol.pause();
} else if (leafHit(mouseX, mouseY) && leaf.isPlaying()) {
        leafHitYN = false;
        leaf.pause();
}

    if(cicadaHit(mouseX, mouseY) && !cicada.isPlaying()) {
        cicada.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        palm.pause();
        airplane.pause();
        rain_under_parasol.pause();
} else if (cicadaHit(mouseX, mouseY) && cicada.isPlaying()) {
        cicadaHitYN = false;
        cicada.pause();
}

    if(airplaneHit(mouseX, mouseY) && !airplane.isPlaying()) {
        airplane.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        cicada.pause();
        palm.pause();
        rain_under_parasol.pause();
} else if (airplaneHit(mouseX, mouseY) && airplane.isPlaying()) {
        airplaneHitYN = false;
        airplane.pause();
}

    if(parasolHit(mouseX, mouseY) && !rain_under_parasol.isPlaying() && 
      (weather.equals("shower rain") == true|| weather.equals("rain") == true
       || weather.equals("thunderstorm") == true)   ) {
        rain_under_parasol.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        palm.pause();
} else if (parasolHit(mouseX, mouseY) && rain_under_parasol.isPlaying()) {
        parasolHitYN = false;
        rain_under_parasol.pause();
}
}
}  
