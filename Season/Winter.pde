import processing.sound.*;

class Winter{
  Season season;
  
   //sound
  AudioPlayer fire;
  
  //image
  PImage iWinterbg;
  PImage iWinterbgnight;
  PImage iFire;
  PImage iFirewood;
  PImage iCloud;
  PImage iSnow;
  PImage iSmoke;
  PImage iSun;

  String weather;
  float w,h; // w:width, h:height
  int month, day, time;

  boolean fireHitYN = false;

  int hour;
  int imgX, imgY;
  int fireS=0;
  int scale = 1;
  int cloudX, cloudY;
  int snowY;
  int n = 0;
  
  boolean snowYN;
  boolean sunYN;
  
  
   Winter(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;
    
    cloudX = 0;
    snowY = 50;
    
    fire = minim.loadFile("/winter/sound/fire.mp3");
    iWinterbg = loadImage("/winter/img/winterBG.png");
    iWinterbgnight = loadImage("/winter/img/winterBGnight.png");
    iFire = loadImage("/winter/img/fire.png");
    iFirewood = loadImage("/winter/img/firewood.png");
    iCloud = loadImage("/winter/img/cloud.png");
    iSnow = loadImage("/winter/img/snow.png");
    iSmoke = loadImage("/winter/img/smoke.png");
    iSun = loadImage("/winter/img/sun.png");
  }
  
  void draw() {
    imageMode(CORNER);
    backimage();
    fireDisplay();
    sunDisplay();
    cloudDisplay();
    snowDisplay();
    smokeDisplay();

    imageMode(CENTER);
    but.draw();
    
    fireMouseCursor(mouseX,mouseY);
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
    if (time >= 18 || time <6)
        image(iWinterbgnight,0,0);
    if (time < 18 && time >=6)
        image(iWinterbg,0,0);
    // if raing now, it's rainy & frog appear
    if ( weather.equals("clear sky") == true || weather.equals("few clouds clouds") == true
      || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true|| weather.equals("overcast clouds") == true ||  weather.equals("mist") == true){
    //  image(iWinterbg,0,0);
      }
    else if (weather.equals("shower rain") == true|| weather.equals("rain") == true
      || weather.equals("thunderstorm") == true) {
     // image(iWinterbg, 0,0);
     // image(iRain, w, h, 708, 979);
    }
  }

  void fireDisplay() {
    imageMode(CORNER);
    image(iFirewood, w-220, h+370);
   
    if (fireHitYN)
    {
      image(iFire, w-210, h+300, iFire.width+fireS, iFire.height+fireS);
      fireS += scale;

      if(fireS>=4 || fireS<=0)
         scale*=-1;
    } else {
       image(iFire, w-210, h+300);
    }
  }
  void cloudDisplay() {
    imageMode(CORNER);
    iCloud.resize((int)w*2,200);

    image(iCloud,cloudX, 100);
    image(iCloud,cloudX-(w*2), 100);
    
    cloudX += 2;
    
    if(cloudX >= (w*2))
      cloudX = 0;
  }
  void snowDisplay() {
    imageMode(CORNER);
    image(iSnow,0,snowY);
    image(iSnow,0,snowY-(h*2));
    snowY+=2;
    if(snowY>=(h*2))
      snowY = 0;
  }
  void smokeDisplay() {
    imageMode(CORNER);
    image(iSmoke,w-160, h+120);
  }
  void sunDisplay() {
    imageMode(CORNER);
    
    image(iSun,w+100,h-350, 150,150);
  }
  
  void mousePressed() {
    //winter
    if (fireHit(mouseX, mouseY) && !fire.isPlaying()) {
        fire.loop();
    } else if (fireHit(mouseX, mouseY) && fire.isPlaying()) {
        fireHitYN = false;
        fire.pause();
    }
  }
}
