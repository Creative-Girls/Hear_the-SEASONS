import processing.sound.*;

class Winter{
  Season season;
  
   //sound
  AudioPlayer fire;
  
  //image
  PImage iWinterbg;
  PImage iFire;

  String weather;
  float w,h; // w:width, h:height
  int month, day, time;

  boolean fireHitYN = false;

  int hour;
  int imgX, imgY;
  int cloudX, cloudY;
  int n = 0;
  
   Winter(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;
    
    fire = minim.loadFile("/winter/sound/fire.mp3");
    iWinterbg = loadImage("/winter/img/winterBG.png");
    iFire = loadImage("/winter/img/fire.png");
  }
  
  void draw() {
    backimage();
    fireDisplay();
    but.draw();
  }
  
  //fire hit detection
  boolean fireHit(float mx, float my) {
    if (dist(mx, my, w, h + 200) < 150) {
      fireHitYN = true;
      return true;
    } else {
      fireHitYN = false;
      return false;
    }
  }

  boolean mousecursor1(float mx, float my) {
    if (dist(mx, my, w, h + 200) < 150) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }
  
  void backimage() {
    image(iWinterbg, w, h, 708, 979);

    // if raing now, it's rainy & frog appear
    if ( weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
      || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true|| weather.equals("overcast clouds") == true)
      background(iWinterbg);
    else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
      tint(180);
      image(iWinterbg, w, h);
     // image(iRain, w, h, 708, 979);
    }
  }

  void fireDisplay() {
    imageMode(CENTER);
    iFire.resize(150,150);
    if (fireHitYN)
    {
      image(iFire, w + floor(cos(imgX) * 4), h +200+ floor(sin(imgY) * 4));
      imgX += 1;
      imgY += 1;
    } else {
       image(iFire, w, h+200 , 150,150);
    }
  }
  
  void mousePressed() {
    //winter
    if (fireHit(mouseX, mouseY) && !fire.isPlaying()) {
        fire.loop();
    } else if (fireHit(mouseX, mouseY) && fire.isPlaying()) {
        fireHitYN = false;
        fire.pause();
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
