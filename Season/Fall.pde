import processing.sound.*;

class Fall{
  Season season;
  
   //sound
  AudioPlayer leaves;
  AudioPlayer crow;
  AudioPlayer fallbgm;
  SoundFile tree;
  AudioPlayer bug;
  
  //image
  PImage iFallbg;
  PImage iCrow1;
  PImage iCrow2;
  PImage iCrow3;
  PImage iScarecrow;
  PImage iTree;
  PImage iLeaves1;
  PImage iLeaves2;
  PImage iBug1;
  PImage iBug2;
  PImage iBug3;
  PImage iBug4;
  PImage iMoon;
  PImage iRain; 

  String weather;
  float w,h; // w:width, h:height
  int month, day;

  boolean scarecrowHitYN = false;
  boolean treeHitYN = false;
  boolean crowHitYN = false;
  boolean bugHitYN = false;

  int hour;
  int imgX, imgY;
  int cloudX, cloudY;
  int n = 0;
  
  Fall(Season season,float w, float h, String weather, int month, int day) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    
   /*leaves = new SoundFile(season, "/fall/sound/leaves.wav");
    crow = new SoundFile(season, "/fall/sound/hooded_crow.wav");
    //fallbgm = minim.loadFile("fallbg.wav");
    tree = new SoundFile(season, "/fall/sound/tree.wav");
    bug = new SoundFile(season, "/fall/sound/cricket.wav");*/
    
    leaves = minim.loadFile("/fall/sound/leaves.wav");
    crow = minim.loadFile("/fall/sound/hooded_crow.wav");
    //fallbgm = minim.loadFile("fallbg.wav");
    tree = new SoundFile(season,"/fall/sound/tree.wav");
    bug = minim.loadFile("/fall/sound/cricket.wav");

    iFallbg = loadImage("/fall/img/Fallbg.png");
    iScarecrow = loadImage("/fall/img/scarecrow.png");
        
    iCrow1 = loadImage("/fall/img/crow1.png");
    iCrow2 = loadImage("/fall/img/crow2.png");
    iCrow3 = loadImage("/fall/img/crow3.png");
        
    iTree = loadImage("/fall/img/mapletree.png");
    iLeaves1 = loadImage("/fall/img/leaves1.png");
    iLeaves2 = loadImage("/fall/img/leaves2.png");
        
    iMoon = loadImage("/fall/img/moon.png");
    iBug1 = loadImage("/fall/img/bug1.png");
    iBug2 = loadImage("/fall/img/bug2.png");
    iBug3 = loadImage("/fall/img/bug3.png");
    iBug4 = loadImage("/fall/img/bug4.png");
    iRain = loadImage("/common/img/rain.png");
  }
  
  void draw() {                                                                                    
    backimage();                                                                                   
                                                                                                   
    // at night moon and lightbugs are appear                                                      
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
    but.draw();
 }
  
  //scarecrow_hit detection
  boolean scarecrowHit(float mx, float my) {
        if (dist(mx, my, w + 180, h + 250) < 50) {
            scarecrowHitYN = true;
            return true;
        } else {
            scarecrowHitYN = false;
            return false;
        }
    }
    
  boolean mousecursor1(float mx, float my) {
        if (dist(mx, my, w + 180, h + 250) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    //tree_hit detection
  boolean treeHit(float mx, float my) {
        if (dist(mx,my, w - 250, h + 100) < 80) {
            treeHitYN = true;
            return true;
        } else {
            treeHitYN = false;
            return false;
        }
    }
    
    
  boolean mousecursor2(float mx, float my) {
        if (dist(mx, my,w - 250, h + 100) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
  // crow_hit detection
  boolean crowHit(float mx, float my) {
        if (dist(mx, my, w - 150, h - 60) < 80) {
            crowHitYN = true;
            return true;
        } else {
            crowHitYN = false;
            return false;
        }
    }
    
  boolean mousecursor3(float mx, float my) {
        if (dist(mx, my, w - 150, h - 60) < 80) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
  //bug_hit detection
  boolean bugHit(float mx, float my) {
        if (dist(mx, my, w, h) < 60 || dist(mx, my, w + 150, h - 200) < 60) {
            bugHitYN = true;
            return true;
        } else {
            bugHitYN = false;
            return false;
        }
    }
    
  boolean mousecursor4(float mx, float my) {
        if (dist(mx, my, w, h) < 60 || dist(mx, my, w + 150, h - 200) < 60) {
            return true;
        } else {
            cursor(ARROW);
            return false;
        }
    }
    
    void backimage() {
       background(iFallbg); //가을 배경이 안 나와서 임시로 추가했음 가은이 확인 바람
        // weather equal true or not
        // if raing now, it's rainy
        if (weather.equals("clear sky") == true ||weather.equals("few clouds clouds") == true
            || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true)
            background(iFallbg);
        else if (weather.equals("shower rain") == true || weather.equals("rain") == true
            || weather.equals("thunderstorm") == true) {
            tint(180);
            image(iFallbg, w, h);
            image(iRain, w, h, 708, 979);
        }
    }
    
    void scarecrow_display() {
        
        imageMode(CENTER);
        
        if (scarecrowHitYN)
            {
            image(iScarecrow, w + 180 + floor(cos(imgX) * 7), h + 250 + floor(sin(imgY) * 7), 300, 300);
            imgX += 1;
            imgY += 1;
        } else {
            image(iScarecrow, w + 180, h + 250, 300, 300);
        }
    }
    
    void tree_display() {
        
        imageMode(CENTER);
        image(iTree, w - 250, h + 100, 800, 800);
        
        if (treeHitYN) {
            image(iLeaves1, w - 250 + floor(cos(imgX) * 2), h + 100 + floor(sin(imgY) * 2), 800, 800);
            imgX += 1;
            imgY += 1;
            image(iLeaves2, w - 250, h + 100 + 5 * imgY, 800, 800);
        } else {
            image(iLeaves1, w - 250, h + 100, 800, 800);
            image(iLeaves2, w - 250, h + 100, 800, 800);
        }
    }
    
    void crow_display() {
        
        imageMode(CENTER);
        
        if (crowHitYN) {
            image(iCrow2, w - 150 + floor(cos(imgX) * 2), h - 60 - imgY * 2, 50, 50);
            imgX += 1;
            imgY += 1;
        } else {
            image(iCrow1, w - 150, h - 60, 50, 50);
        }
    }
    
    void bug_display() {
        
        imageMode(CENTER);
        
        if (bugHitYN) {
            image(iBug1, w + floor(cos(imgX) * 2), h - imgY * 2, 60, 60);
            image(iBug2, w + 150 - imgY * 2, h - 200 - imgY * 2, 60, 60);
            image(iBug3, w + 350 - imgY * 2, h + 200 - floor(cos(imgX) * 2), 60, 60);
            image(iBug4, w - 350 + imgY * 2, h - 150 + floor(cos(imgX) * 2), 60, 60);
            imgX += 1;
            imgY += 1;
        } else {
            image(iBug1, w, h, 60, 60);
            image(iBug2, w + 150, h - 200, 60, 60);
        }
    }
    
    void moon_display() {
        imageMode(CENTER);
        image(iMoon, w, 85, 200, 200);
    }
      void mousePressed() {
    //spring
    if (scarecrowHit(mouseX, mouseY) && !leaves.isPlaying()) {
        leaves.loop();
        crow.pause();
        tree.pause();
        bug.pause();
    } else if (scarecrowHit(mouseX, mouseY) && leaves.isPlaying()) {
        scarecrowHitYN = false;
        leaves.pause();
    }
    if (treeHit(mouseX, mouseY) && !tree.isPlaying()) {;
        tree.loop();
        crow.pause();
        leaves.pause();
        bug.pause();
    } else if (treeHit(mouseX, mouseY) && tree.isPlaying()) {
        treeHitYN = false;
        tree.pause();
    }
    if (crowHit(mouseX, mouseY) && !crow.isPlaying()) {
        crow.loop();
        tree.pause();
        leaves.pause();
        bug.pause();
    } else if (crowHit(mouseX, mouseY) && crow.isPlaying()) {
        crowHitYN = false;
        crow.pause();
    }
    if (bugHit(mouseX, mouseY) && !bug.isPlaying()) {
        bug.loop();
        tree.pause();
        leaves.pause();
        crow.pause();
    } else if (bugHit(mouseX, mouseY) && bug.isPlaying()) {
        bugHitYN = false;
        bug.pause();
    }
  }
}