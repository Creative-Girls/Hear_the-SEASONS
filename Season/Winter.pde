import processing.sound.*;

class Winter {
  Season season;

  //sound
  AudioPlayer fire;
  AudioPlayer christmas;

  //image
  PImage iWinterbg;
  PImage iWinterbgnight;
  PImage iFire;
  PImage iFirewood;
  PImage iCloud;
  PImage iSnow;
  PImage iSmoke;
  PImage iSun;
  PImage iRain;

  PImage cTree;
  PImage cSanta;
  PImage cLight;

  String weather;
  float w, h; // w:width, h:height
  int month, day, time;

  boolean fireHitYN = false;

  int hour;
  int imgX, imgY;
  int fireS=0;
  int scale = 1;
  int cloudX;
  int cloudY=0;
  int snowY=0;
  int rainY=0;
  int n = 0;

  boolean dayNight = true; //true:day, false:night
  boolean snowYN=false;
  boolean rainYN=false;
  boolean christmasYN = false;


  Winter(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;

    //sound setting
    fire = minim.loadFile("/winter/sound/fire.mp3");
    christmas = minim.loadFile("/winter/sound/christmas.mp3");
    christmas.setGain(-20);

    if (month==12&&day==25)
    {
      christmasYN = true;
      christmas.loop();
    }

    if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
      rainYN = true;
    }

    if (time >= 18 || time <6)
      dayNight = false;
    if (time < 18 && time >=6)
      dayNight = true;

    if (christmasYN)
    {
      cTree = loadImage("/winter/img/christmas/tree.png");
      cSanta = loadImage("/winter/img/christmas/santa.png");
      cLight = loadImage("/winter/img/christmas/light.png");
    }

    if (dayNight)
    {
      iWinterbg = loadImage("/winter/img/winterBG.png");
      iSun = loadImage("/winter/img/sun.png");
    } else
    {
      iWinterbg = loadImage("/winter/img/winterBGnight.png");
      iSun = loadImage("/winter/img/moon.png");
    }

    if (dayNight)
      iCloud = loadImage("/winter/img/cloud.png");
    else if (!dayNight || rainYN)
      iCloud = loadImage("/winter/img/darkCloud.png");

    iFire = loadImage("/winter/img/fire.png");
    iFirewood = loadImage("/winter/img/firewood.png");
    iSnow = loadImage("/winter/img/snow.png");
    iSmoke = loadImage("/winter/img/smoke.png");
    iRain = loadImage("/winter/img/rain.png");
  }

  void draw() {
    imageMode(CORNER);
    backimage();
    fireDisplay();
    sunDisplay();
    snowDisplay();

    if (rainYN)
      rainDisplay();

    if (christmasYN&&!dayNight)
      santaDisplay();

    cloudDisplay();
    if (christmasYN)
      lightDisplay();

    imageMode(CENTER);
    but.draw();

    fireMouseCursor(mouseX, mouseY);
  }

  //fire hit detection
  boolean fireHit(float mx, float my) {
    if (dist(mx, my, w-250, h+300) < 120) {
      fireHitYN = true;
      return true;
    } else {
      fireHitYN = false;
      return false;
    }
  }

  void fireMouseCursor(float mx, float my) {
    if (dist(mouseX, mouseY, w-250, h+300) < 120) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }

  void backimage() {
    image(iWinterbg, 0, 0);
  }

  void santaDisplay() {
    image(cSanta, w+70, h-300);
  }

  void lightDisplay() {
    image(cLight, 0, 0);
  }

  void fireDisplay() {
    imageMode(CORNER);
    image(iFirewood, w-220, h+370);

    if (fireHitYN)
    {
      image(iFire, w-210, h+300, iFire.width+fireS, iFire.height+fireS);
      fireS += scale;

      if (fireS>=4 || fireS<=0)
        scale*=-1;
    } else {
      image(iFire, w-210, h+300);
    }
  }
  void cloudDisplay() {
    imageMode(CORNER);
    iCloud.resize((int)w*2, 200);

    image(iCloud, cloudX, 100);
    image(iCloud, cloudX-(w*2), 100);

    cloudX += 2;

    if (cloudX >= (w*2))
      cloudX = 0;
  }
  void snowDisplay() {
    imageMode(CORNER);
    image(iSnow, 0, snowY);
    image(iSnow, 0, snowY-(h*2));
    snowY+=2;
    if (snowY>=(h*2))
      snowY = 0;
  }

  void rainDisplay() {
    imageMode(CORNER);
    image(iRain, 0, rainY);
    image(iRain, 0, rainY-(h*2));
    rainY+=2;
    if (rainY>=(h*2))
      rainY = 0;
  }
  void smokeDisplay() {
    imageMode(CORNER);
    image(iSmoke, w-160, h+120);
  }
  void sunDisplay() {
    imageMode(CORNER);

    image(iSun, w+100, h-350, 150, 150);
  }

  void mousePressed() {
    //winter
    if (fireHit(mouseX, mouseY) && !fire.isPlaying()) {
      fire.loop();
      christmas.pause();
    } else if (fireHit(mouseX, mouseY) && fire.isPlaying()) {
      fireHitYN = false;
      fire.pause();
      if (christmasYN)
        christmas.loop();
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
        if (weather.equals("mist") == true || weather.equals("haze") == true || weather.equals("clear sky") == true ||  weather.equals("few clouds clouds") == true
          || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true || weather.equals("overcast clouds") == true)
          weather = "rain";
        println(weather);
      }
      // day & night change
      if (timeMenuOn) {
      // day&night change
        if (dist(mouseX, mouseY, 40, 120)<50) {
          if (time >= 18 || time < 6) { // if night -> day
            dayNight = false;
          } else if (time < 18 && time >= 6)
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
        iWinterbg = loadImage("/winter/img/winterBG.png");
        iSun = loadImage("/winter/img/sun.png");
      } else
      {
        iWinterbg = loadImage("/winter/img/winterBGnight.png");
        iSun = loadImage("/winter/img/moon.png");
      }
  
      if (dayNight)
        iCloud = loadImage("/winter/img/cloud.png");
      else if (!dayNight || rainYN)
        iCloud = loadImage("/winter/img/darkCloud.png");
      }
    }
  }
}
