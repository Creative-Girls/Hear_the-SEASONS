import processing.sound.*; //sound library

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
  PImage iCloud;
  PImage iRain;
  PImage iSpringbg;

  String weather;
  float w, h; // w:width, h:height
  int month, day, time;

  //wheter hit or not function
  boolean butterflyHitYN = false;
  boolean BbirdHitYN = false;
  boolean frogHitYN = false;

  int cloudX; //cloud width
  int cloudY=0; //cloud height
  int rainY=0; //rain height

  int hour;
  int imgX, imgY; //image width & height
  int n = 0; //a constant

  boolean dayNight = true; //true:day, false:night
  boolean rainYN=false; //rain or not

  Spring(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;
   
    /*
      Sieun Song
     -.  if it is rain
     */
    if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true|| weather.equals("moderate rain")) {
      rainYN = true;
    }

    /*
      Sieun Song
     -. Check whether it is day or night
     */
    if (time >= 18 || time <6) //at night
      dayNight = false;
    if (time < 18 && time >=6) //at daytime
      dayNight = true;

    println(dayNight);

    /*
      Sieun Song
     -. Image change according to day and night
     */
    if (dayNight) //at daytime
    {
      iSpringbg = loadImage("/spring/img/SpringBg.png");
      iSun = loadImage("/winter/img/sun.png");
    } else
    {
      iSpringbg = loadImage("/spring/img/SpringBgnight.png");
      iSun = loadImage("/winter/img/moon.png");
    }
    if (dayNight) //at night
      iCloud = loadImage("/winter/img/cloud.png");
    else if (!dayNight || rainYN)
      iCloud = loadImage("/winter/img/darkCloud.png");

    //sound
    sRain = minim.loadFile("/spring/sound/rain.wav");
    sButterfly = minim.loadFile("/spring/sound/butterfly.mp3");
    sBird = new SoundFile(season, "/spring/sound/bird.wav");
    sFrog = minim.loadFile("/spring/sound/frog.mp3");

    //image
    iBbutterfly = loadImage("/spring/img/BlueButterfly.png");
    iBbird1 = loadImage("/spring/img/BlueBird1.png");
    iBbird2 = loadImage("/spring/img/BlueBird2.png");
    iFrog = loadImage("/spring/img/Frog.png");
    iRock = loadImage("/spring/img/rock.png");
    iRain = loadImage("/spring/img/rain.png");
  }

  void draw() {
    backimage();

    /*
      Sieun Song
     -. Image change according to day and night
     */
    if (!dayNight) {
      // nighttime _ gaeun
      sunDisplay();
      cloudDisplay();
    } else {
      // daytime_gaeun
      butterflyDisplay();
      BbirdDisplay();
      sunDisplay();
      cloudDisplay();
    }

    /*
     Sieun Song
     -. Change the display when it rains
     */
    if (rainYN) //rain
    {
      sRain.play();
      frogDisplay();
      rainDisplay();
    }
    if (!rainYN)
      sRain.pause();

    imageMode(CENTER);
    but.draw();

    /*
     Gaeun You
     -. what has sound chnages the mouse curor to the hand
     */
    if (dist(mouseX, mouseY, w, h) < 50)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 80, h - 400) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 180, h + 180) < 50)
      cursor(HAND);
    else
      cursor(ARROW);
  }


  /*
  Gaeun You
   -. butterfly hit detection
   */
  boolean butterflyHit(float mx, float my) {
    if (dist(mx, my, w, h) < 50) {
      butterflyHitYN = true;
      return true;
    } else {
      butterflyHitYN = false;
      return false;
    }
  }

  /*
  Gaeun You
   -. BlueBird hit detection
   */
  boolean birdHit(float mx, float my) {
    if (dist(mx, my, w - 80, h - 400) < 50) {
      BbirdHitYN = true;
      return true;
    } else {
      BbirdHitYN = false;
      return false;
    }
  }

  /*
  Gaeun You
   -. frog hit detection
   */
  boolean frogHit(float mx, float my) {
    if (dist(mx, my, w - 180, h + 180) < 50) {
      frogHitYN = true;
      return true;
    } else {
      frogHitYN = false;
      return false;
    }
  }


  /*
    Gaeun You
   -. load back image
   */
  void backimage() {

    imageMode(CENTER);
    image(iSpringbg, w, h);
  }

  /*
    Sieun Song
   -. butterfly animation
   */
  void butterflyDisplay() {
    imageMode(CENTER);

    if (butterflyHitYN)  //if hit the butterfly, it fly.
    {
      image(iBbutterfly, w + floor(cos(imgX) * 4), h + floor(sin(imgY) * 4));
      imgX += 1;
      imgY += 1;
    } else {
      image(iBbutterfly, w, h);
    }
  }

  /*
    Subin Han, Sieun Song
   -. Bird Animation
   */
  void BbirdDisplay() {  //if hit the bird, it fly.
    imageMode(CENTER);
    if (BbirdHitYN) {
      n += 1;
      if (n >= 14) {
        n -= 14;
      }
      if (n%2==0)
        image(iBbird1, w-80, h-n); //change the position of the new wing - Sieun Song
      if (n%2==1)
        image(iBbird2, w-80, h-n);
    } else {
      image(iBbird2, w-80, h);
    }
  }

  /*
    Gaeun You
   - Frog animation
   */
  void frogDisplay() {  //if hit frog, it moves up & down.
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

  /*
    Sieun Song
   -. Cloud animaiton
   */
  void cloudDisplay() {  //it flows automatically.
    imageMode(CORNER);
    iCloud.resize((int)w*2, 200);

    image(iCloud, cloudX, 100);
    image(iCloud, cloudX-(w*2), 100);

    cloudX += 2;

    if (cloudX >= (w*2))
      cloudX = 0;
  }

  /*
    Sieun Song
   -. Rain Animaiton
   */
  void rainDisplay() { //if the weather is rain, rain image appears.
    imageMode(CORNER);
    image(iRain, 0, rainY);
    image(iRain, 0, rainY-(h*2));
    rainY+=2;
    if (rainY>=(h*2))
      rainY = 0;
  }

  /*
   Gaeun You
   -. if it isn't rain at daytime, the sun image appear
   */
  void sunDisplay() {
    imageMode(CORNER);

    image(iSun, w+100, h-350, 150, 150);
  }

  /*
  Gaeun You
   -. if you click something, that sound is looping and other sound is stopped.
   */
  void mousePressed() {

    if (butterflyHit(mouseX, mouseY) && !sButterfly.isPlaying()) {
      sButterfly.loop();
      sFrog.pause();
      sBird.pause();
    } else if (butterflyHit(mouseX, mouseY) && sButterfly.isPlaying()) {
      butterflyHitYN = false;
      sButterfly.pause();
    }

    if (birdHit(mouseX, mouseY) && !sBird.isPlaying()) {
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

    /*
    Gaeun You
     -. day & night change
     */
    if (timeMenuOn) {
      // day&night change
      if (dist(mouseX, mouseY, 40, 120)<50) {
        if (dayNight) { // if night -> day
          dayNight = false;
        } else if (!dayNight)
        {// if day -> night
          dayNight = true;
        }
      } else if (dist(mouseX, mouseY, 40, 190)<50) { // weather change
        rainYN = false;
      } else if (dist(mouseX, mouseY, 40, 260)<50) {
        rainYN = true;
      }
      if (dayNight)
      {
        iSpringbg = loadImage("/spring/img/SpringBg.png");
        iSun = loadImage("/winter/img/sun.png");
      } else
      {
        iSpringbg = loadImage("/spring/img/SpringBgnight.png");
        iSun = loadImage("/winter/img/moon.png");
      }
      if (dayNight)
        iCloud = loadImage("/winter/img/cloud.png");
      else if (!dayNight || rainYN)
        iCloud = loadImage("/winter/img/darkCloud.png");
    }
  }
}
