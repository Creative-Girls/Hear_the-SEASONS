import processing.sound.*;

class Summer {
  Season season;

  //sound
  AudioPlayer rain;
  AudioPlayer rain_under_parasol;
  SoundFile airplane;
  SoundFile cicada;
  AudioPlayer palm;
  SoundFile sea;
  AudioPlayer seaBg;
  AudioPlayer seagulls;

  PImage iSummerBg, iSummerBg_night;
  PImage iground, iground_night;
  PImage iseagull1, iseagull2, iseagull3, iseagull4;
  PImage isea, isea_night;
  PImage ipalm1, ipalm2;
  PImage ilighthouse, ilighthouse_night, ilighthouse_night2;
  PImage icicada;
  PImage iboat, iboat_night;
  PImage iairplane;
  PImage iparasol;
  PImage iRain;
  PImage istars;

  String weather;
  float w, h; // w:width, h:height
  int month, day, time;

  boolean seagullsHitYN = false;
  boolean seaHitYN = false;
  boolean palmHitYN = false;
  boolean lighthouseHitYN = false;
  boolean cicadaHitYN = false;
  boolean boatHitYN = false;
  boolean airplaneHitYN = false;
  boolean parasolHitYN = false;

  int hour;
  int imgX, imgY;
  int cloudX, cloudY;
  int n = 0;

  Summer(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;

    rain_under_parasol =  minim.loadFile("/summer/sound/rain-under-parasol.mp3");
    cicada = new SoundFile(season, "/summer/sound/cicada.wav");
    seagulls =  minim.loadFile("/summer/sound/seagulls.wav");
    sea = new SoundFile(season, "/summer/sound/sea.wav");
    palm =  minim.loadFile("/summer/sound/leaf.wav");
    airplane = new SoundFile(season, "/summer/sound/airplane.wav");

    iSummerBg = loadImage("/summer/img/SummerBg.png");
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
    ilighthouse = loadImage("/summer/img/lighthouse.png");
    ilighthouse_night = loadImage("/summer/img/lighthouse_night.png");
    ilighthouse_night2 = loadImage("/summer/img/lighthouse_night2.png");
    iparasol = loadImage("/summer/img/parasol.png");
    icicada = loadImage("/summer/img/cicada.png");
    iairplane = loadImage("/summer/img/airplane.png");
    iboat_night = loadImage("/summer/img/boat_night.png");
    iboat = loadImage("/summer/img/boat.png");
    iRain = loadImage("/common/img/rain.png");
    istars = loadImage("/summer/img/stars.png");

    // do not remove ~~ gaeun is sad ~
    /*
        rain_under_parasol =  minim.loadFile("/Users/uga-eun/Desktop/Season/data/summer/sound/rain-under-parasol.mp3");
     cicada = new SoundFile(season, "/Users/uga-eun/Desktop/Season/data/summer/sound/cicada.wav");
     seagulls =  minim.loadFile( "/Users/uga-eun/Desktop/Season/data/summer/sound/seagulls.wav");
     sea = new SoundFile(season, "/Users/uga-eun/Desktop/Season/data/summer/sound/sea.wav");
     palm=  minim.loadFile( "/Users/uga-eun/Desktop/Season/data/summer/sound/leaf.wav");
     leaf=  minim.loadFile( "/Users/uga-eun/Desktop/Season/data/summer/sound/leaf.wav");
     airplane = new SoundFile(season, "/Users/uga-eun/Desktop/Season/data/summer/sound/airplane.wav");
     
     iSummerBg= loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/SummerBg.png");
     iSummerBg_night = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/SummerBg_night.png");
     
     ipalm1 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/palm1.png");
     ipalm2 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/palm2.png");
     isea= loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/sea.png");
     isea_night = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/sea_night.png");
     iground = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/ground_night.png");
     iground_night = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/ground_night.png");
     iseagull1 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/seagull1.png");
     iseagull2 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/seagull2.png");
     iseagull3 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/seagull3.png");
     iseagull4 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/seagull4.png");
     ileaf1 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf1.png");
     ileaf2 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf2.png");
     ileaf3 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf3.png");
     ileaf4 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf4.png");
     ileaf5 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf5.png");
     ileaf6 = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/leaf6.png");
     ilighthouse= loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/lighthouse.png");
     ilighthouse_night= loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/lighthouse_night.png");
     iparasol = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/parasol.png");
     icicada = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/cicada.png");
     iairplane = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/airplane.png");
     iboat_night = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/boat_night.png");
     iboat = loadImage("/Users/uga-eun/Desktop/Season/data/summer/img/boat.png");*/
  }

  void draw() {
    backimage();

    if (time >= 6 || time < 18) {
      seagull_display();
      sea_display();
      ground_display();
      palm_display();
      parasol_display();
      cicada_display();
      lighthouse_display();
      boat_display();
      airplane_display();
    }
    //night
    else if (time >= 18 || time < 6) {
      sea_night_display();
      ground_night_display();
      palm_display();
      parasol_display();
      lighthouse_night_display();
      boat_night_display();
      airplane_display();
      stars_display();
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
    if (dist(mx, my, w + 300, h + 150) < 80) {
      palmHitYN = true;
      return true;
    } else {
      palmHitYN = false;
      return false;
    }
  }

  boolean mousecursor3(float mx, float my) {
    if (dist(mx, my, w + 300, h + 150) < 80) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }
  
  //lighthouse hit
  boolean lighthouseHit(float mx, float my) {
    if (dist(mx, my, w - 180, h + 250) < 30) {
      lighthouseHitYN = true;
      return true;
    } else {
      lighthouseHitYN = false;
      return false;
    }
  }

  boolean mousecursor4(float mx, float my) {
    if (dist(mx, my, w - 180, h + 250) < 30) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }  

  //cicada hit
  boolean cicadaHit(float mx, float my) {
    if (dist(mx, my, w + 300, h + 250) < 30) {
      cicadaHitYN = true;
      return true;
    } else {
      cicadaHitYN = false;
      return false;
    }
  }

  boolean mousecursor5(float mx, float my) {
    if (dist(mx, my, w + 300, h + 250) < 30) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  //boat hit
  boolean boatHit(float mx, float my) {
    if (dist(mx, my, w + 100, h + 150) < 30) {
      boatHitYN = true;
      return true;
    } else {
      boatHitYN = false;
      return false;
    }
  }

  boolean mousecursor6(float mx, float my) {
    if (dist(mx, my, w + 100, h + 150) < 30) {
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
      // if raing now, it's rainy & frog appear
      if (weather.equals("shower rain") == true|| weather.equals("rain") == true
        || weather.equals("thunderstorm") == true) {
        image(iSummerBg, w, h);
        if (time >= 18 || time <6)
          image(iSummerBg_night, w, h);
        image(iRain, w, h, 708, 979);
      } else
      {
        image(iSummerBg, w, h, 708, 979);
        if (time >= 18 || time <6)
          image(iSummerBg_night, w, h);
      }
    }

  void palm_display() {

    imageMode(CENTER);
    
    if (palmHitYN) {
        n += 1;
      if (n >= 14) {
        n -= 14;
      }
      if (n%2==0)
        image(ipalm1, w, h);
      if (n%2==1)
        image(ipalm2, w, h);
    } else {
      image(ipalm1, w, h);
    }
  }

  void sea_display() {

    imageMode(CENTER);

    if (seaHitYN) {
      image(isea, w, h);
    } else {
      image(isea, w, h);
    }
  }

  void sea_night_display() {

    imageMode(CENTER);

    if (seaHitYN) {
      image(isea_night, w, h);
    } else {
      image(isea_night, w, h);
    }
  }

  void ground_display() {

    imageMode(CENTER);

    image(iground, w, h);
  }

  void ground_night_display() {

    imageMode(CENTER);

    image(iground_night, w, h);
  }

  void seagull_display() {

    imageMode(CENTER);

    if (seagullsHitYN) {
      n+= 1;
      if (n>= 14) {
        n -= 14;
      }
      if (n % 2 ==  0)
        image(iseagull1, w, h - n);
      image(iseagull2, w, h - n-1);
      image(iseagull3, w, h - n-2);
      image(iseagull4, w, h - n-1);
      if (n % 2 ==  1)
        image(iseagull1, w, h - n);
      image(iseagull2, w, h - n-1);
      image(iseagull3, w, h - n-2);
      image(iseagull4, w, h - n-1);
    } else {
      image(iseagull1, w, h - n);
      image(iseagull2, w, h - n-1);
      image(iseagull3, w, h - n-2);
      image(iseagull4, w, h - n-1);
    }
  }

  void lighthouse_display() {

    imageMode(CENTER);

    if (lighthouseHitYN) {
      image(ilighthouse, w, h);
    } else {
      image(ilighthouse, w, h);
    }
  }

  void lighthouse_night_display() {

    imageMode(CENTER);

    if (lighthouseHitYN) {
        n += 1;
      if (n >= 14) {
        n -= 14;
      }
      if (n%2==0)
        image(ilighthouse_night, w, h);
      if (n%2==1)
        image(ilighthouse_night2, w, h);
    } else {
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

    if (airplaneHitYN) {
      n += 1;
      image(iairplane, w + n, h - n);
    } else {
      image(iairplane, w, h);
    }
  }

  void cicada_display() {

    imageMode(CENTER);

    image(icicada, w, h);
  }

  void parasol_display() {

    imageMode(CENTER);

    image(iparasol, w, h);
  }
  
    void stars_display() {

    imageMode(CENTER);

    image(istars, w, h);
  }

  void mousePressed() {
    if (seagullsHit(mouseX, mouseY) && !seagulls.isPlaying()) {
      seagulls.loop();
      sea.pause();
      palm.pause();
      cicada.pause();
      airplane.pause();
      rain_under_parasol.pause();
    } else if (seagullsHit(mouseX, mouseY) && seagulls.isPlaying()) {
      seagullsHitYN = false;
      seagulls.pause();
    }

    if (seaHit(mouseX, mouseY) && !sea.isPlaying()) {
      sea.loop();
      seagulls.pause();
      palm.pause();
      cicada.pause();
      airplane.pause();
      rain_under_parasol.pause();
    } else if (seaHit(mouseX, mouseY) && sea.isPlaying()) {
      seaHitYN = false;
      sea.pause();
    }

    if (palmHit(mouseX, mouseY) && !palm.isPlaying()) {
      palm.loop();
      seagulls.pause();
      sea.pause();
      cicada.pause();
      airplane.pause();
      rain_under_parasol.pause();
    } else if (palmHit(mouseX, mouseY) && palm.isPlaying()) {
      palmHitYN = false;
      palm.pause();
    }

    if (cicadaHit(mouseX, mouseY) && !cicada.isPlaying()) {
      cicada.loop();
      seagulls.pause();
      sea.pause();
      palm.pause();
      airplane.pause();
      rain_under_parasol.pause();
    } else if (cicadaHit(mouseX, mouseY) && cicada.isPlaying()) {
      cicadaHitYN = false;
      cicada.pause();
    }

    if (airplaneHit(mouseX, mouseY) && !airplane.isPlaying()) {
      airplane.loop();
      seagulls.pause();
      sea.pause();
      cicada.pause();
      palm.pause();
      rain_under_parasol.pause();
    } else if (airplaneHit(mouseX, mouseY) && airplane.isPlaying()) {
      airplaneHitYN = false;
      airplane.pause();
    }

    if (parasolHit(mouseX, mouseY) && !rain_under_parasol.isPlaying() &&
      (weather.equals("shower rain") == true || weather.equals("rain") == true
      || weather.equals("thunderstorm") == true)  ) {
      rain_under_parasol.loop();
      seagulls.pause();
      sea.pause();
      cicada.pause();
      airplane.pause();
      palm.pause();
    } else if (parasolHit(mouseX, mouseY) && rain_under_parasol.isPlaying()) {
      parasolHitYN = false;
      rain_under_parasol.pause();
    }

    // day & night change
    if (timeMenuOn) {
      // day&night change
      if (dist(mouseX, mouseY, 40, 120)<50) {
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
      } else if (dist(mouseX, mouseY, 40, 190)<50) { // weather change
        // if rain -> sun
        if (weather.equals("shower rain") == true || weather.equals("rain") == true
          || weather.equals("thunderstorm") == true ||weather.equals("thunderstorm") == true)
          weather = "clear sky";
        println(weather);
      } else if (dist(mouseX, mouseY, 40, 260)<50) {
        // if sun -> rain
        if (weather.equals("mist") == true || weather.equals("haze") == true || weather.equals("clear sky") == true ||  weather.equals("few clouds clouds") == true
          || weather.equals("scattered clouds") == true || weather.equals("broken clouds") == true || weather.equals("overcast clouds") == true)
          weather = "rain";
        println(weather);
      }
    }
  }
}
