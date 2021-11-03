import processing.sound.*;

class Spring {
  Season season;

  //sound
  AudioPlayer sRain;
  AudioPlayer sButterfly;
  SoundFile   sBird;
  AudioPlayer sFrog;

  //image
  PImage iBbutterfly;
  PImage iBbird1, iBbird2;
  PImage iFrog;
  PImage iRock;
  PImage iBack;
  PImage iSun;
  PImage iCloud1;
  PImage iCloud2;
  PImage iRain;
  PImage iSpringbg;
  PImage inSpringbg;

  String weather;
  float w, h; // w:width, h:height
  int month, day, time;

  boolean butterflyHitYN = false;
  boolean BbirdHitYN = false;
  boolean frogHitYN = false;

  int hour;
  int imgX, imgY;
  int cloudX, cloudY;
  int n = 0;

  Spring(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;

    
     sRain = minim.loadFile("/spring/sound/rain.wav");
     sButterfly = minim.loadFile("/spring/sound/butterfly.mp3");
     sBird = new SoundFile(season,"/spring/sound/bird.wav");
     sFrog = minim.loadFile("/spring/sound/frog.mp3");
     
     iSpringbg = loadImage("/spring/img/SpringBg.png");
     inSpringbg = loadImage("/spring/img/SpringBgnight.png");
     iBbutterfly = loadImage("/spring/img/BlueButterfly.png");
     iBbird1 = loadImage("/spring/img/BlueBird1.png");
     iBbird2 = loadImage("/spring/img/BlueBird2.png");
     iFrog = loadImage("/spring/img/Frog.png");
     iRock = loadImage("/spring/img/rock.png");
     iSun = loadImage("/spring/img/sun.png");
     iCloud1 = loadImage("/spring/img/cloud1.png");
     iCloud2 = loadImage("/spring/img/cloud2.png");
     iRain = loadImage("/common/img/rain.png");
     

    // gaeun computer code
    /*sRain = minim.loadFile("/Users/uga-eun/Desktop/Season/data/spring/sound/rain.wav");
    sButterfly = minim.loadFile("/Users/uga-eun/Desktop/Season/data/spring/sound/butterfly.mp3");
    sBird = new SoundFile(season, "/Users/uga-eun/Desktop/Season/data/spring/sound/bird.wav");
    sFrog = minim.loadFile("/Users/uga-eun/Desktop/Season/data/spring/sound/frog.mp3");

    iSpringbg = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/SpringBg.png");
    inSpringbg = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/SpringBgnight.png");
    iBbutterfly = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/BlueButterfly.png");
    iBbird1 = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/BlueBird1.png");
    iBbird2 = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/BlueBird2.png");
    iFrog = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/Frog.png");
    iRock = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/rock.png");
    iSun = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/sun.png");
    iCloud1 = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/cloud1.png");
    iCloud2 = loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/cloud2.png");
    iRain = loadImage("//Users/uga-eun/Desktop/Season/data/common/img/rain.png");*/
  }

  void draw() {
    backimage();

    if (time >= 18 || time <6) { // night
      butterflyDisplay();
      BbirdDisplay();
      sunDisplay();
      cloudDisplay();
    } else if (time < 18 || time >= 6) { // day
      //day
      butterflyDisplay();
      BbirdDisplay();
      sunDisplay();
      cloudDisplay();
    }
    but.draw();
  }

  //butterfly hit detection
  boolean butterflyHit(float mx, float my) {
    if (dist(mx, my, w, h) < 50) {
      butterflyHitYN = true;
      return true;
    } else {
      butterflyHitYN = false;
      return false;
    }
  }

  //BlueBird hit
  boolean birdHit(float mx, float my) {
    if (dist(mx, my, w - 40, h - 400) < 50) {
      BbirdHitYN = true;
      return true;
    } else {
      BbirdHitYN = false;
      return false;
    }
  }

  //frog hit
  boolean frogHit(float mx, float my) {
    if (dist(mx, my, w - 180, h + 180) < 50) {
      frogHitYN = true;
      return true;
    } else {
      frogHitYN = false;
      return false;
    }
  }

  boolean mousecursor1(float mx, float my) {
    if (dist(mx, my, w, h) < 80) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  boolean mousecursor2(float mx, float my) {
    if (dist(mx, my, w - 40, h - 400) < 80) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  boolean mousecursor3(float mx, float my) {
    if (dist(mx, my, w - 180, h + 180) < 80) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  void backimage() {
    time = 20;
    image(iSpringbg, w, h, 708, 979);

    // if raing now, it's rainy & frog appear
    if ( weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
      || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true ||weather.equals("overcast clouds") == true)
    {
      background(iSpringbg);
      if (time >= 18 || time <6)
        background(inSpringbg);
    } else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
      image(iSpringbg, w, h);
      if (time >= 18 || time <6)
        background(inSpringbg);
      image(iRain, w, h, 708, 979);
      frogDisplay();
    }
  }

  void butterflyDisplay() {
    imageMode(CENTER);

    if (butterflyHitYN)
    {
      image(iBbutterfly, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
      imgX += 1;
      imgY += 1;
    } else {
      image(iBbutterfly, w, h);
    }
  }

  void BbirdDisplay() {
    imageMode(CENTER);
    if (BbirdHitYN) {
      n += 1;
      if (n >= 14) {
        n -= 14;
      }
      if (n%2==0)
        image(iBbird1, w, h-n);
      if (n%2==1)
        image(iBbird2, w, h-n);
    } else {
      image(iBbird2, w, h);
    }
  }

  void frogDisplay() {
    imageMode(CENTER);
    image(iRock, w - 180, h + 250, 180, 200);

    if (frogHitYN) {
      n += 2;
      if (n >= 15) {
        n -= 4;
      }
      image(iFrog, w - 180, h + 180 - n, 150, 150);
    } else {
      image(iFrog, w - 180, h + 180, 150, 150);
    }
  }

  void sunDisplay() {
    imageMode(CENTER);
    image(iSun, w - 250, h - 390, random(100, 150), random(100, 150));
  }

  void cloudDisplay() {
    imageMode(CENTER);

    image(iCloud1, w - 150 - floor(cos(cloudX)), h - 350 - floor(sin(cloudY)), 100, 100);
    image(iCloud2, w + 150 + floor(cos(cloudX)), h - 400 + floor(sin(cloudY)), 100, 100);
    cloudX += 1;
    cloudY += 1;
  }
  void mousePressed() {
    //spring
    if (butterflyHit(mouseX, mouseY) && !sButterfly.isPlaying()) {
      sButterfly.loop();
      sFrog.pause();
      sBird.pause();
    } else if (butterflyHit(mouseX, mouseY) && sButterfly.isPlaying()) {
      butterflyHitYN = false;
      sButterfly.pause();
    }

    if (birdHit(mouseX, mouseY) && !sBird.isPlaying()) {
      ;
      sBird.play();
      sFrog.pause();
      sButterfly.pause();
    } else if (birdHit(mouseX, mouseY) && sBird.isPlaying()) {
      BbirdHitYN = false;
      sBird.pause();
    }

    if (frogHit(mouseX, mouseY) && !sFrog.isPlaying()) {
      sFrog.loop();
      sButterfly.pause();
      sBird.pause();
    } else if (frogHit(mouseX, mouseY) && sFrog.isPlaying()) {
      frogHitYN = false;
      sFrog.pause();
    }

    // day & night change
    if (timeMenuOn) {
      // day&night change
      if (dist(mouseX, mouseY, 70, 140)<50) {
        if (time >= 18 || time <6) { // if night -> day
          time = 0;
          time += 7;
          print(time);
        } else if (time < 18 || time >= 6)
        { // if day -> night
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
        if (weather.equals("clear sky") == true ||weather.equals("few clouds clouds") == true
          || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true || weather.equals("overcast clouds") == true)
          weather = "rain";
        println(weather);
      }
    }
  }
}
