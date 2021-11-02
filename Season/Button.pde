class Button{
  Season season;
  /*
  0:Menu
  1:Spring
  2:Summer
  3:Fall
  4:Winter
  */
  float w,h;
  
  PImage startBut;
  PImage menu;
  PImage springBut;
  PImage summerBut;
  PImage fallBut;
  PImage winterBut;
  
  Button(Season season, float w, float h){
    this.season = season;
    this.w = w;
    this.h = h;
    
    startBut = loadImage("/common/img/startBut.png");
    menu = loadImage("/common/img/menu.png");
    springBut = loadImage("/common/img/springBut.png");
    summerBut = loadImage("/common/img/summerBut.png");
    fallBut = loadImage("/common/img/fallBut.png");
    winterBut = loadImage("/common/img/winterBut.png");   
  }
  void draw(){
    if(!menuOn){
      if(type.equals("start")){
        image(startBut,w/2-50, h-300,130,80);
      }
    }else{
      image(menu,  w-70, 70, 50, 50);
      if(seasonMenuOn)
      {
         image(springBut,  w-70, 140, 50, 50);
         image(summerBut,  w-70, 210, 50, 50);
         image(fallBut,  w-70, 280, 50, 50);
         image(winterBut,  w-70, 350, 50, 50);
      }
    }
  }
  void mousePressed(){
    //버튼 범위 확인 필요
    if(!menuOn){
      if (dist(mouseX,mouseY, (w/2-50), (h-300)) <130) {
        type = "spring";
        spring = new Spring(season,w/2,h/2,weather,month,day);
      }
    }else{
      if (!seasonMenuOn&&dist(mouseX,mouseY, w-70, 70)<50) {
         seasonMenuOn = true;  
      }else if (seasonMenuOn&&dist(mouseX,mouseY, w-70, 70)<50) {
         seasonMenuOn = false;
      }
      
      if(seasonMenuOn){
        if(dist(mouseX,mouseY,w-70,140)<50) {
          type = "spring";
          spring = new Spring(season,w/2,h/2,weather,month,day);
          minim = new Minim(season);
          fall = null;
          winter = null;
        }else if(dist(mouseX,mouseY,w-70, 280)<50) {
          type="fall";
          fall = new Fall(season,w/2,h/2,weather,month,day);
          minim = new Minim(season);
          spring = null;
          winter = null;
        }else if(dist(mouseX,mouseY,w-70, 350)<50) {
          type="winter";
          winter = new Winter(season,w/2,h/2,weather,month,day);
          minim = new Minim(season);
          spring = null;
          fall = null;
        }
      }
    }
  }
}
