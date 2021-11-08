class Button {
  /*
  2021.11.02 - Sieun Song
  Unification of several button classes into one
  */
    Season season;
    float w, h;
    
    //seaseon selection button
    PImage startBut;
    PImage menu;
    PImage springBut;
    PImage summerBut;
    PImage fallBut;
    PImage winterBut;
    
    //weather / day&night selection button
    PImage sunbut;
    PImage rainbut;
    PImage wheelmenu;
    PImage daynightbut;
    
    Button(Season season, float w, float h, int time) {
        this.season = season;
        this.w = w;
        this.h = h;
        
        
        startBut = loadImage("/common/img/startBut.png");
        menu = loadImage("/common/img/menu.png");
        springBut = loadImage("/common/img/springBut.png");
        summerBut = loadImage("/common/img/summerBut.png");
        fallBut = loadImage("/common/img/fallBut.png");
        winterBut = loadImage("/common/img/winterBut.png");
        wheelmenu = loadImage("/common/img/wheel.png");
        daynightbut = loadImage("/common/img/daynightbut.png");
        sunbut = loadImage("/common/img/sunbut.png");
        rainbut = loadImage("/common/img/rainbut.png");
        
        
       
    }
    void draw() {
        
        // season selection
        if (!menuOn) {
            if (type.equals("start")) {
                image(startBut, w / 2 - 70, h - 300, 160, 80);
            }
        } else {
            image(menu, w - 40, 40, 50, 50);
            image(wheelmenu, 40, 40, 50, 50);
            if (seasonMenuOn)
                {
                image(springBut, w - 40, 120, 50, 50);
                image(summerBut, w - 40, 190, 50, 50);
                image(fallBut, w - 40, 260, 50, 50);
                image(winterBut, w - 40, 330, 50, 50);
            }
            if (timeMenuOn)
                {
                image(daynightbut, 40, 120, 50, 50);
                image(sunbut, 40, 190, 50, 50);
                image(rainbut, 40, 260, 50, 50);
            }
        }
    }
    void mousePressed() {
        //버튼범위 확인 필요
        /*
          2021.11.02 - Sieun Song
          Check on Sesaon Menu on/off - Sieun Song
          
          menuOn = false : event about start button
          menuOn = true : event about season button
          
          seasonMenuOn = true : open the sub menu
          seasonMenuOn = false : close the sub menu
        */
        if (!menuOn) {
            if (dist(mouseX, mouseY,w/2-70,(h - 300)) <160) {
                type = "spring";
                spring = new Spring(season, w / 2, h / 2, weather, month, day, time);
            }
        } else {
            if (!seasonMenuOn &&  dist(mouseX, mouseY, w - 40, 40)<50) {
                seasonMenuOn = true;
            } else if (seasonMenuOn &&  dist(mouseX, mouseY, w - 40, 40)<50) {
                seasonMenuOn = false;
            }
            /*
            Gaeun You
            
            timeMenuon true -> open the sub menu
            tumeMenuon false -> close the sub menu
            */
            if (!timeMenuOn &&  dist(mouseX, mouseY, 40, 40)<50)
                timeMenuOn = true;
            else if (timeMenuOn &&  dist(mouseX, mouseY, 40, 40)<50)
                timeMenuOn = false;
            
           /*
           2021.11.02 - Sieun Song
           When the season screen is moved, the corresponding seasonal class object is created and another seasonal class object is null
           */
            if (seasonMenuOn) {
                if (dist(mouseX, mouseY, w - 40, 120)<50) {
                  minim.stop();   
                  if(fall != null)
                    fall.tree.stop();
                  if(summer != null)    
                  {
                    summer.sea.stop();
                    summer.airplane.stop();
                    summer.cicada.stop();
                  }
                    type = "spring";
                    spring = new Spring(season, w / 2, h / 2, weather, month, day, time);
                    fall = null;
                    winter = null;
                    summer = null;
                } else if (dist(mouseX, mouseY, w - 40, 190)<50) {
                    minim.stop();

                    if(spring != null)
                      spring.sBird.stop();
                    if(fall != null)
                      fall.tree.stop();
                    type = "summer";
                    summer = new Summer(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    winter = null;
                    fall = null;
                }  else if (dist(mouseX, mouseY, w -40 , 260)<50) {
                    minim.stop();
                    if(spring != null)
                      spring.sBird.stop();  
                    if(summer != null)    
                    {
                      summer.sea.stop();
                      summer.airplane.stop();
                      summer.cicada.stop();
                    }
                    type = "fall";
                    fall = new Fall(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    winter = null;
                    summer = null;         
                } else if (dist(mouseX, mouseY, w - 40, 330)<50) {
                    minim.stop();       
                    if(spring != null)
                      spring.sBird.stop();                 
                  if(fall != null)
                    fall.tree.stop();
                  if(summer != null)    
                  {
                    summer.sea.stop();
                    summer.airplane.stop();
                    summer.cicada.stop();
                  }
                    type = "winter";
                    winter = new Winter(season, w / 2, h / 2, weather,month,day, time);
                    spring = null;
                    fall = null;
                    summer = null;
                }
            }
        }
    }
}
