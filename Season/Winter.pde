import processing.sound.*;

/*
    season : Winter
      name : Sieun Song
  
  function
  -. Can hear the bonfire sound
  -. On Christmas Day, Can hear carols 
  -. it snows
*/

class Winter {
  Season season;

  //sound
  AudioPlayer fire;
  AudioPlayer christmas;
  AudioPlayer sRain;

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
  
  PImage snowbut;

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
    sRain = minim.loadFile("/spring/sound/rain.wav");
    fire = minim.loadFile("/winter/sound/fire.mp3");
    christmas = minim.loadFile("/winter/sound/christmas.mp3");
    christmas.setGain(-20);

     //Check the Christmas date
    if (month==12&&day==25)
    {
      christmasYN = true;
      christmas.loop();
    }

    //Check the rain weather
    if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true|| weather.equals("moderate rain")) {
      rainYN = true;
    }

    //Check the time zone(day or night)
    if (time >= 18 || time <6) //night
      dayNight = false;
    if (time < 18 && time >=6) //day
      dayNight = true;

    //If the date is Christmas, load images visible on Christmas
    if (christmasYN)
    {
      cTree = loadImage("/winter/img/christmas/tree.png");
      cSanta = loadImage("/winter/img/christmas/santa.png");
      cLight = loadImage("/winter/img/christmas/light.png");
    }

    //Load daytime viewable images
    if (dayNight)
    {
      iWinterbg = loadImage("/winter/img/winterBG.png");
      iSun = loadImage("/winter/img/sun.png");
    } else
    {
      iWinterbg = loadImage("/winter/img/winterBGnight.png");
      iSun = loadImage("/winter/img/moon.png");
    }

    //Change the cloud image according to the weather and time of day
    if (dayNight)
      iCloud = loadImage("/winter/img/cloud.png");
    else if (!dayNight || rainYN)
      iCloud = loadImage("/winter/img/darkCloud.png");

    iFire = loadImage("/winter/img/fire.png");
    iFirewood = loadImage("/winter/img/firewood.png");
    iSnow = loadImage("/winter/img/snow.png");
    iSmoke = loadImage("/winter/img/smoke.png");
    iRain = loadImage("/winter/img/rain.png");
    snowbut = loadImage("/winter/img/snowbut.png");
  }

  void draw() {
    imageMode(CORNER);
    backimage();
    fireDisplay();
    sunDisplay();
    
    if(snowYN)
      snowDisplay();
    
    if(timeMenuOn)
    {
      imageMode(CENTER);
        image(snowbut, 40, 330, 50, 50);
    }
    imageMode(CORNER);
    if (christmasYN&&!dayNight)
      santaDisplay();

    cloudDisplay();
    if (christmasYN)
      lightDisplay();
      
    if (rainYN)
    {
      rainDisplay();
      sRain.play();
      if(christmasYN)
        christmas.pause();
    }
    if (!rainYN)
    {
      sRain.pause();
      if(christmasYN)
        christmas.play();
    }

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

  //Change mouse cursor image
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

    //apply the animate when the bonfire is clicked
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
  
  //Apply snow motion
  void snowDisplay() {
    imageMode(CORNER);
    image(iSnow, 0, snowY);
    image(iSnow, 0, snowY-(h*2));
    snowY+=2;
    if (snowY>=(h*2))
      snowY = 0;
  }

  //Apply rain motion
  void rainDisplay() {
    imageMode(CORNER);
    image(iRain, 0, rainY);
    image(iRain, 0, rainY-(h*2));
    rainY+=2;
    if (rainY>=(h*2))
      rainY = 0;
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
          snowYN = false;
      } else if (dist(mouseX, mouseY, 40, 260)<50) {
            rainYN = true;
            snowYN = false;
      } else if (dist(mouseX, mouseY, 40, 330)<50) { // weather change
          snowYN = true;
          rainYN = false;
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
