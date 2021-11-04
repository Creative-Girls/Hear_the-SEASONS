import processing.sound.*;

class Summer {
  Season season;

  //sound
  AudioPlayer sRain;
  AudioPlayer rain_under_parasol;
  SoundFile airplane;
  SoundFile cicada;
  AudioPlayer palm;
  SoundFile sea;
  AudioPlayer seaBg;
  AudioPlayer seagull;

  PImage iSummerBg, iSummerBg_night;
  PImage iground, iground_night;
  PImage iseagull, iseagull1;
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
  int rainY=0;

  boolean seagullHitYN = false;
  boolean seaHitYN = false;
  boolean palmHitYN = false;
  boolean lighthouseHitYN = false;
  boolean cicadaHitYN = false;
  boolean boatHitYN = false;
  boolean airplaneHitYN = false;
  boolean parasolHitYN = false;
  boolean rainYN=false;
  boolean dayNight = true; //true:day, false:night

  int hour;
  int imgX, imgY;
  int boatX, boatY;
  int n = 0;

  Summer(Season season, float w, float h, String weather, int month, int day, int time) {
    this.season = season;
    this.w = w;
    this.h = h;
    this.weather = weather;
    this.month = month;
    this.day = day;
    this.time = time;

    sRain = minim.loadFile("/spring/sound/rain.wav");
    rain_under_parasol =  minim.loadFile("/summer/sound/rain-under-parasol.mp3");
    cicada = new SoundFile(season, "/summer/sound/cicada.wav");
    seagull =  minim.loadFile("/summer/sound/seagull.wav");
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
    iseagull = loadImage("/summer/img/seagull.png");
    iseagull1 = loadImage("/summer/img/seagull1.png");
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

    if (time >= 18 || time <6)
      dayNight = false;
    if (time < 18 && time >=6)
      dayNight = true;
      
      
    if (dayNight) {
      sea_display();
      ground_display();
      lighthouse_display();
      boat_display();      
      palm_display();
      parasol_display();
      cicada_display();
      airplane_display();
      seagull_display();
    }
    //night
    else if (!dayNight) {
      sea_night_display();
      ground_night_display();
      lighthouse_night_display();
      boat_night_display();
      palm_display();
      parasol_display();
      stars_display();
      airplane_display();
    }
    but.draw();
    
    if(rainYN)
      sRain.play();
    if(!rainYN)
      sRain.pause();
      
    if (dist(mouseX, mouseY, w + 180, h + 250) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 250, h + 100) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w - 150, h - 60) < 80)
      cursor(HAND);
    else if (dist(mouseX, mouseY, w, h) < 50 || dist(mouseX, mouseY, w + 150, h - 200) < 50)
      cursor(HAND);
    else
      cursor(ARROW);
  }


  //seagull hit detection
  boolean seagullHit(float mx, float my) {
    if (dist(mx, my, w - 180, h + 140) < 80) {
      seagullHitYN = true;
      return true;
    } else {
      seagullHitYN = false;
      return false;
    }
  }

  boolean mousecursor1(float mx, float my) {
    if (dist(mx, my, w - 180, h + 140) < 50) {
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
    if (dist(mx, my, w - 180, h + 40) < 30) {
      lighthouseHitYN = true;
      return true;
    } else {
      lighthouseHitYN = false;
      return false;
    }
  }

  boolean mousecursor4(float mx, float my) {
    if (dist(mx, my, w - 180, h + 40) < 30) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }  

  //cicada hit
  boolean cicadaHit(float mx, float my) {
    if (dist(mx, my, w + 290, h + 250) < 30) {
      cicadaHitYN = true;
      return true;
    } else {
      cicadaHitYN = false;
      return false;
    }
  }

  boolean mousecursor5(float mx, float my) {
    if (dist(mx, my, w + 290, h + 250) < 30) {
      return true;
    } else {
      cursor(ARROW);
      return false;
    }
  }

  //boat hit
  boolean boatHit(float mx, float my) {
    if (dist(mx, my, w, h + 150) < 30) {
      boatHitYN = true;
      return true;
    } else {
      boatHitYN = false;
      return false;
    }
  }

  boolean mousecursor6(float mx, float my) {
    if (dist(mx, my, w, h + 150) < 30) {
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
          rainDisplay();
          rainYN = true;
      } else
      {
        image(iSummerBg, w, h, 708, 979);
        rainYN = false;
        if (time >= 18 || time <6)
          image(iSummerBg_night, w, h);
      }
    }
    
  void rainDisplay() {
    imageMode(CORNER);
    image(iRain, 0, rainY, 900, 979);
    image(iRain, 0, rainY-(h*4));
    rainY+=2;
    if (rainY>=(h*2))
      rainY = 0;
    // rain.start();
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

    if (seagullHitYN) {
      n+= 1;
      if (n>= 14) {
        n -= 14;
      }
      if (n % 2 ==  0)
        image(iseagull, w, h - (n + 20));
      if (n % 2 ==  1)
      image(iseagull1, w, h - (n ));
    } else {
      image(iseagull, w, h);
    }
  }

  void lighthouse_display() {

    imageMode(CENTER);

    image(ilighthouse, w, h);
  }

  void lighthouse_night_display() {

    imageMode(CENTER);
    image(ilighthouse_night2, w, h);
        
      n += 1;
      if (n >= 15)
        n -= 15;
     
      if (n%30==0)
        image(ilighthouse_night, w, h);
      if (n/3==1)
        image(ilighthouse_night2, w, h);
  }

  void boat_display() {

    imageMode(CENTER);

    image(iboat, boatX, h);
    image(iboat, boatX-(w*2), h);

    boatX += 2;

    if (boatX >= (w*3))
      boatX = 0;
  }

  void boat_night_display() {

    imageMode(CENTER);

    image(iboat_night, boatX, h);
    image(iboat_night, boatX-(w*2), h);

    boatX += 2;

    if (boatX >= (w*3))
      boatX = 0;
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
    if (seagullHit(mouseX, mouseY) && !seagull.isPlaying()) {
      seagull.loop();
      sea.pause();
      palm.pause();
      cicada.pause();
      airplane.pause();
      rain_under_parasol.pause();
    } else if (seagullHit(mouseX, mouseY) && seagull.isPlaying()) {
      seagullHitYN = false;
      seagull.pause();
    }

    if (seaHit(mouseX, mouseY) && !sea.isPlaying()) {
      sea.loop();
      seagull.pause();
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
      seagull.pause();
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
      seagull.pause();
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
      seagull.pause();
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
          || weather.equals("thunderstorm") == true ||weather.equals("thunderstorm") == true)  ) {
      rain_under_parasol.loop();
      seagull.pause();
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
          weather = "clear sky";
        println(weather);
      } else if (dist(mouseX, mouseY, 40, 260)<50) {
        // if sun -> rain
          weather = "rain";
        println(weather);
      }
    }
  }
}
