import processing.sound.*;

class Fall {
  Season season;

  //sound
  AudioPlayer leaves;
  AudioPlayer crow;
  AudioPlayer fallbgm;
  SoundFile tree;
  AudioPlayer bug;

  //image
  PImage iFallbg;
  PImage inFallbg; // night fall bg
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
  float w, h; // w:width, h:height
  int month, day;

  boolean scarecrowHitYN = false;
  boolean treeHitYN = false;
  boolean crowHitYN = false;
  boolean bugHitYN = false;

  int hour;
  int imgX, imgY;
  int cloudX, cloudY;
  int n = 0;
  int time;

  Fall(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;

    leaves = minim.loadFile("/fall/sound/leaves.wav");
    crow = minim.loadFile("/fall/sound/hooded_crow.wav");
    //fallbgm = minim.loadFile("fallbg.wav");
    tree = new SoundFile(season, "/fall/sound/tree.wav");
    bug = minim.loadFile("/fall/sound/cricket.wav");

    iFallbg = loadImage("/fall/img/Fallbg.png");
    inFallbg = loadImage("/fall/img/Fallbgnight.png");
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

    // don'tremove ~ gaeun is sad ~~
    /*
    leaves = minim.loadFile("/Users/uga-eun/Desktop/Season/data/fall/sound/leaves.wav");
     crow= minim.loadFile("/Users/uga-eun/Desktop/Season/data/fall/sound/hooded_crow.wav");
     //fallbgm = minim.loadFile("/Users/uga-eun/Desktop/Season/data/fall/sound/fallbg.wav");
     tree= new SoundFile(season, "/Users/uga-eun/Desktop/Season/data/fall/sound/tree.wav");
     bug = minim.loadFile("/Users/uga-eun/Desktop/Season/data/fall/sound/cricket.wav");
     
     iFallbg = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/Fallbg.png");
     inFallbg = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/Fallbgnight.png");
     iScarecrow = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/scarecrow.png");
     
     iCrow1 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/crow1.png");
     iCrow2 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/crow2.png");
     iCrow3 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/crow3.png");
     
     iTree = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/mapletree.png");
     iLeaves1 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/leaves1.png");
     iLeaves2 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/leaves2.png");
     
     iMoon = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/moon.png");
     iBug1 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/bug1.png");
     iBug2 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/bug2.png");
     iBug3 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/bug3.png");
     iBug4 = loadImage("/Users/uga-eun/Desktop/Season/data/fall/img/bug4.png");
     iRain = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/rain.png");*/
  }

  void draw() {
    backimage();

    // at night moon and lightbugs are appear
    if (time >= 18 || time <6) {
      scarecrow_display();
      moon_display();
      tree_display();
      crow_display();
      bug_display();
    } else if (time < 18 || time >= 6) {
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
    if (dist(mx, my, w - 250, h + 100) < 80) {
      treeHitYN = true;
      return true;
    } else {
      treeHitYN = false;
      return false;
    }
  }


  boolean mousecursor2(float mx, float my) {
    if (dist(mx, my, w - 250, h + 100) < 80) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  //crow_hit detection
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

    // if raing now, it's rainy & frog appear
    if ( weather.equals("haze") == true || weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
      || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true ||weather.equals("overcast clouds") == true)
    {
      background(iFallbg);
      if (time >= 18 || time <6)
        background(inFallbg);
    } else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
      image(iFallbg, w, h);
      if (time >= 18 || time <6)
        background(inFallbg);
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
    if (treeHit(mouseX, mouseY) && !tree.isPlaying()) {
      ;
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
    // day & night change
    if (timeMenuOn) {
      // day&night change
      if (dist(mouseX, mouseY, 70, 140)<50) {
        if (time >= 18 || time < 6) { // if night -> day
          time = 0;
          time += 7;
          print(time);
        } else if (time < 18 || time >= 6)
        {// if day -> night
          time = 0;
          time += 20;
          print(time);
        }
      } else if (dist(mouseX, mouseY, 70, 210)<50) { // weather change
        // if rain -> sun
        if (weather.equals("shower rain") == true || weather.equals("rain") == true
          || weather.equals("thunderstorm") == true)
          weather = "clear sky";
        println(weather);
      } else if (dist(mouseX, mouseY, 70, 280)<50) {
        // if sun -> rain
        if (weather.equals("haze") == true || weather.equals("clear sky") == true ||  weather.equals("few clouds clouds") == true
          || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true || weather.equals("overcast clouds") == true)
          weather = "rain";
        println(weather);
      }
    }
  }
}
