import processing.sound.*;

class Fall {
  // You_Ga_Eun making

  Season season;

  //fall sound
  AudioPlayer sRain;
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
  int rainY=0;

  boolean scarecrowHitYN = false;
  boolean treeHitYN = false;
  boolean crowHitYN = false;
  boolean bugHitYN = false;
  boolean rainYN=false;

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
    sRain = minim.loadFile("/spring/sound/rain.wav");
    leaves = minim.loadFile("/fall/sound/leaves.wav");
    crow = minim.loadFile("/fall/sound/hooded_crow.wav");
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
    } else if (time < 18 && time >= 6) {
      //day time
      scarecrow_display();
      tree_display();
      crow_display();
    }

    // if rainy day -> rain sound playing
    if (rainYN)
      sRain.play();
    if (!rainYN)
      sRain.pause();

   // season & weather button draw
    but.draw();
    
    // what has sound chnages the mouse curor to the hand
    if (dist(mouseX, mouseY, w + 180, h + 250) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 250, h + 100) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 150, h - 60) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w, h) < 50 || dist(mouseX, mouseY, w + 150, h - 200) < 50 && time >= 18 || time <6 )
      cursor(HAND);
    else
      cursor(ARROW);
  }

  //scarecrow_hit detection
  boolean scarecrowHit(float mx, float my) {
    if (dist(mx, my, w + 180, h + 250) < 80) {
      scarecrowHitYN = true;
      return true;
    } else {
      scarecrowHitYN = false;
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

  //bug_hit detection
  boolean bugHit(float mx, float my) {
    if (dist(mx, my, w, h) < 50 || dist(mx, my, w + 150, h - 200) < 50) {
      bugHitYN = true;
      return true;
    } else {
      bugHitYN = false;
      return false;
    }
  }

  void backimage() {

    // if raing now, it's rainy & frog appear
    if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
      image(iFallbg, w, h);
      if (time >= 18 || time <6)
        background(inFallbg);
      rainDisplay();
      rainYN = true;
    } else
    {
      background(iFallbg);
      rainYN=false;
      if (time >= 18 || time <6)
        background(inFallbg);
    }
  }

  void rainDisplay() {
    imageMode(CORNER);

    // rain display
    // rain appear only rainy day

    image(iRain, 0, rainY, 900, 979);
    image(iRain, 0, rainY-(h*4));
    rainY+=2;
    if (rainY>=(h*2))
      rainY = 0;
  }

  void scarecrow_display() {

    imageMode(CENTER);

    // scarecrow display
    // if scarecrow click -> it moves in a circle
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

    // maple tree display
    // if maple tree click -> tree shakes and leaves fall
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

    // crow display
    // crow on the mapletree
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

    // bugs display
    // bugs appear only night
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
    // moon displays
    // moon appears only night
    imageMode(CENTER);
    image(iMoon, w, 85, 200, 200);
  }
  void mousePressed() {

    // if scarecrow click -> sound start
    if (scarecrowHit(mouseX, mouseY) && !leaves.isPlaying()) {
      leaves.loop();
      crow.pause();
      tree.pause();
      bug.pause();
    } else if (scarecrowHit(mouseX, mouseY) && leaves.isPlaying()) {
      // if scarecrow click again -> sound stop
      scarecrowHitYN = false;
      leaves.pause();
    }

    // if tree click -> sound start
    if (treeHit(mouseX, mouseY) && !tree.isPlaying()) {
      tree.loop();
      crow.pause();
      leaves.pause();
      bug.pause();
    } else if (treeHit(mouseX, mouseY) && tree.isPlaying()) {
      // if tree click again -> sound stop
      treeHitYN = false;
      tree.pause();
    }

    // if crow click -> sound start
    if (crowHit(mouseX, mouseY) && !crow.isPlaying()) {
      crow.loop();
      tree.pause();
      leaves.pause();
      bug.pause();
    } else if (crowHit(mouseX, mouseY) && crow.isPlaying()) {
      // if crow click again -> sound stop
      crowHitYN = false;
      crow.pause();
    }

    // if bug click -> sound start
    if (bugHit(mouseX, mouseY) && !bug.isPlaying()) {
      bug.loop();
      tree.pause();
      leaves.pause();
      crow.pause();
    } else if (bugHit(mouseX, mouseY) && bug.isPlaying()) {
      // if bug click again -> sound stop
      bugHitYN = false;
      bug.pause();
    }


    // day & night change button
    if (timeMenuOn) {
      // day&night change
      if (dist(mouseX, mouseY, 70, 140)<50) {
        if (time >= 18 || time < 6) {
          // if night -> day
          time = 0;
          time += 7;
          print(time);
        } else if (time < 18 && time >= 6)
        {// if day -> night
          time = 0;
          time += 20;
          print(time);
        }
      } else if (dist(mouseX, mouseY, 70, 210)<50) { // weather change
        // if rain -> sun
        weather = "clear sky";
        println(weather);
      } else if (dist(mouseX, mouseY, 70, 280)<50) {
        // if sun -> rain
        weather = "rain";
        rainYN=true;
        println(weather);
      }
    }
  }
}
