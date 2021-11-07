class Button {
    Season season;
    /*
    0:Menu
    1:Spring
    2:Summer
    3:Fall
    4:Winter
    */
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
        
        // day&night selection
    }
    void mousePressed() {
        //버튼범위 확인 필요
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
            
            if (!timeMenuOn &&  dist(mouseX, mouseY, 40, 40)<50)
                timeMenuOn = true;
            else if (timeMenuOn &&  dist(mouseX, mouseY, 40, 40)<50)
                timeMenuOn = false;
            
            if (seasonMenuOn) {
                if (dist(mouseX, mouseY, w - 40, 120)<50) {
                    type = "spring";
                    spring = new Spring(season, w / 2, h / 2, weather, month, day, time);
                    fall = null;
                    winter = null;
                    summer = null;
                } else if (dist(mouseX, mouseY, w - 40, 190)<50) {
                    type = "summer";
                    summer = new Summer(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    winter = null;
                    fall = null;
                }  else if (dist(mouseX, mouseY, w -40 , 260)<50) {
                    type = "fall";
                    fall = new Fall(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    winter = null;
                    summer = null;         
                } else if (dist(mouseX, mouseY, w - 40, 330)<50) {
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
