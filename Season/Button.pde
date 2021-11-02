lass Button {
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
        
        
        // don't remove please ~ gaeun is sad ~~
        /*
        startBut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/startBut.png");
        menu = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/menu.png");
        springBut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/springBut.png");
        summerBut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/summerBut.png");
        fallBut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/fallBut.png");
        winterBut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/winterBut.png");
        
        wheelmenu = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/wheel.png");
        daynightbut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/daynightbut.png");
        sunbut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/sunbut.png");
        rainbut = loadImage("/Users/uga-eun/Desktop/Season/data/common/img/rainbut.png");
        */
    }
    voiddraw() {
        
        // season selection
        if (!menuOn) {
            if (type.equals("start")) {
                image(startBut, w / 2 - 50, h - 300, 130, 80);
            }
        } else {
            image(menu, w - 70, 70, 50, 50);
            image(wheelmenu, 70, 70, 50, 50);
            if (seasonMenuOn)
                {
                image(springBut, w - 70, 140, 50, 50);
                image(summerBut, w - 70, 210, 50, 50);
                image(fallBut, w - 70, 280, 50, 50);
                image(winterBut, w - 70, 350, 50, 50);
            }
            
            if (timeMenuOn)
                {
                image(daynightbut, 70, 140, 50, 50);
                image(sunbut, 70, 210, 50, 50);
                image(rainbut, 70, 280, 50, 50);
                //image(winterBut,  w-70, 350, 50, 50);
            }
        }
        
        // day&night selection
    }
    void mousePressed() {
        //버튼범위 확인 필요
        if (!menuOn) {
            if (dist(mouseX, mouseY,(w / 2 - 50),(h - 300)) <130) {
                type = "spring";
                spring = new Spring(season, w / 2, h / 2, weather, month, day, time);
            }
        } else {
            if (!seasonMenuOn &&  dist(mouseX, mouseY, w - 70, 70)<50) {
                seasonMenuOn = true;
            } else if (seasonMenuOn &&  dist(mouseX, mouseY, w - 70, 70)<50) {
                seasonMenuOn = false;
            }
            
            if (!timeMenuOn &&  dist(mouseX, mouseY, 70, 70)<50)
                timeMenuOn = true;
            else if (timeMenuOn &&  dist(mouseX, mouseY, 70, 70)<50)
                timeMenuOn = false;
            
            if (seasonMenuOn) {
                if (dist(mouseX, mouseY, w - 70, 140)<50) {
                    type = "spring";
                    spring = new Spring(season, w / 2, h / 2, weather, month, day, time);
                    fall = null;
                    winter = null;
                } else if (dist(mouseX, mouseY, w - 70, 280)<50) {
                    type = "fall";
                    fall = newFall(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    winter = null;
                } else if (dist(mouseX, mouseY, w - 70, 350)<50) {
                    type = "winter";
                    winter = new Winter(season, w / 2, h / 2, weather, month, day, time);
                    spring = null;
                    fall = null;
                }
            }
        }
    }
    