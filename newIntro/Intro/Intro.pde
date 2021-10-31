import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
PImage bg;
PImage bg_title;
MenuButton btnStart;
/*summerButton btnSummer;
autumnButton btnAutumn;
winterButton btnWinter;*/
int w_color = 255;
import processing.sound.*;


AudioPlayer rain_under_parasol;
SoundFile rain;
SoundFile Butterfly;
SoundFile bird;
SoundFile frog;
AudioPlayer bgm;
AudioPlayer airplane;
AudioPlayer cicada;
AudioPlayer palm;
AudioPlayer leaf;
SoundFile sea;
AudioPlayer seaBg;
AudioPlayer seagulls;
Spring spring;
Summer summer;

Fall fall;
SoundFile leaves;
SoundFile crow;
AudioPlayer fallbgm;
SoundFile tree;
SoundFile bug;

//Winter
SoundFile fire;
Winter winter;

// literally weather rain
String wrain = "rain";
String wclear = "clear";

//get weather API
XML xml;
private String key;
XML latElement;
String weather;


//get Date
int month;
int day;

int page = 0;//page num
/*
봄 : 1
여름 : 2
가을 : 3
겨울 : 4
*/

void setup() {
    minim = new Minim(this);
    size(708, 979);
    background(255);
    bg = loadImage("/intro/Intro-bg.png");
    bg.resize(708, 979);
    bg_title = loadImage("/intro/Intro-title.png");
    bg_title.resize(708, 979);
    
    //get weatherAPI
    key = "d296134b27215cc728104f660752f821";
    xml = loadXML("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=" + key + "&mode=xml");    
    latElement = xml.getChild("weather");
    println("weather ::::: " + latElement.getString("value"));
    weather = latElement.getString("value");
    
    //get Date
    month = month();
    day = day();
    println("오늘은" + month + "월" + day + "일");
    
    //Button
    btnStart = new springButton("START", w_color, 290, 750, 150, 50);
    /*btnSummer = new summerButton("SUMMER", w_color, 290, 750, 150, 50);
    btnAutumn = new autumnButton("AUTUMN", w_color, 290, 750, 150, 50);
    btnWinter = new winterButton("WINTER", w_color, 290, 750, 150, 50);*/
    
    
    //load the doorbell sound
    //spring
    rain = minim.loadFile("/spring/sound/rain.wav");
    Butterfly = minim.loadFile("/spring/sound/butterfly.mp3");
    bird = new SoundFile(this,"bird.wav");
    frog = minim.loadFile("/spring/sound/frog.mp3");
    // bgm = minim.loadFile( "birdbgm.wav");
    // bgm.amp(0.5);
    // bgm.loop();
    
    //summer
    rain_under_parasol =  minim.loadFile("/summer/sound/rain-under-parasol.mp3");
    cicada =  minim.loadFile("/summer/sound/cicada.wav");
    seagulls =  minim.loadFile("/summer/sound/seagulls.wav");
    sea = new SoundFile(this,"/summer/sound/sea.wav");
    leaf =  minim.loadFile("/summer/sound/leaf.wav");
    airplane = minim.loadFile("/summer/sound/airplane.wav");
    
    //winter
    fire = new SoundFile(this,"/winter/sound/fire.flac");
    
    // fall
    leaves = new SoundFile(this, "leaves.wav");
    crow = new SoundFile(this, "hooded_crow.wav");
    //fallbgm = minim.loadFile("fallbg.wav");
    tree = new SoundFile(this, "tree.wav");
    bug = new SoundFile(this, "cricket.wav");
    //fallbgm.amp(0.5);
    //fallbgm.loop();
    
    //doorbell to be clicked
    spring = new Spring(width / 2, height / 2,weather,month,day);
    fall = new Fall(width / 2, height / 2, weather, month, day);
    
}

void draw() {
    if (page == 0)
    {
        frameRate(60);
        background(255);
        image(bg, 0, 0);
        image(bg_title, 0, 0);
        
        
        //button
        btnStart.Draw();
        textAlign(CENTER, CENTER);
        textSize(16);
    }
    
    else if (page == 1)
    {
        spring.draw();
        if (spring.mousecursor1(mouseX, mouseY))
            cursor(HAND);
        else if (spring.mousecursor2(mouseX, mouseY))
            cursor(HAND);
        else if (spring.mousecursor3(mouseX, mouseY))
            cursor(HAND);
        
        //button
        btnStart = new summerButton("SUMMER", w_color, 290, 750, 150, 50);
        btnStart.Draw();
        textAlign(CENTER, CENTER);
        textSize(16);
    }
    
    else if (page == 2)
    {
        summer.draw();
        if (summer.mousecursor1(mouseX, mouseY))
            cursor(HAND);
        else if (summer.mousecursor2(mouseX, mouseY))
            cursor(HAND);
        else if (summer.mousecursor3(mouseX, mouseY))
            cursor(HAND);
        
        //button
        btnStart = new autumnButton("AUTUMN", w_color, 290, 750, 150, 50);
        btnStart.Draw();
        textAlign(CENTER, CENTER);
        textSize(16);
    } else if (page ==  3) {
        fall.draw();
        if (fall.mousecursor1(mouseX, mouseY))
            cursor(HAND);
        else if (fall.mousecursor2(mouseX, mouseY))
            cursor(HAND);
        else if (fall.mousecursor3(mouseX, mouseY))
            cursor(HAND);
        else if (fall.mousecursor4(mouseX, mouseY))
            cursor(HAND);
        
        /* if(weather.equals(wclear) == true && !rain.isPlaying()){
        rain.play();
    }else if (rain.isPlaying())
        rain.pause(); */
    }
    elseif (page == 4)
        {
        winter.draw();
        if (winter.mousecursor1(mouseX, mouseY))
            cursor(HAND);
        
    }
    
}

void mousePressed() {
    println("page is" + page);
    if (page == 0 &&  btnStart.MouseIsOverOn()) {
        page = 1;
        
    } else if (page == 1 &&  btnStart.MouseIsOverOn()) {
        page = 2;
    }
    //spring
    if (page == 1 && spring.isHit1(mouseX, mouseY) && !Butterfly.isPlaying()) {
        Butterfly.loop();
        frog.pause();
        bird.pause();
    } else if (page == 1 && spring.isHit1(mouseX, mouseY) && Butterfly.isPlaying()) {
        spring.butterfly_hit = false;
        Butterfly.pause();
    }
    
    if (page == 1 && spring.isHit2(mouseX, mouseY) && !bird.isPlaying()) {
        bird.loop();
        frog.pause();
        Butterfly.pause();
    } else if (page == 1 && spring.isHit2(mouseX, mouseY) && bird.isPlaying()) {
        spring.bluebird_hit = false;
        bird.pause();
    }
    
    if (page == 1 && spring.isHit3(mouseX, mouseY) && !frog.isPlaying()) {
        frog.loop();
        Butterfly.pause();
        bird.pause();
    } else if (page == 1 && spring.isHit3(mouseX, mouseY) && frog.isPlaying()) {
        spring.frog_hit = false;
        frog.pause();
    }
    
    //summer
    if (page == 2 &&  summer.isHit1(mouseX,mouseY) && !seagulls.isPlaying()) {
        seagulls.loop();
        sea.pause();
        palm.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        //rain_under_parasol.pause();
    } else if (page == 2 &&  spring.isHit1(mouseX, mouseY) && seagulls.isPlaying()) {
        summer.seagulls_hit = false;
        seagulls.pause();
    }
    
    if (page == 2 &&  summer.isHit2(mouseX, mouseY) && !sea.isPlaying()) {
        sea.loop();
        seagulls.pause();
        palm.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        // rain_under_parasol.pause();
    } else if (page == 2 && summer.isHit2(mouseX, mouseY) && sea.isPlaying()) {
        summer.sea_hit = false;
        sea.pause();
    }
    
    if (page == 2 && summer.isHit3(mouseX, mouseY) && !palm.isPlaying()) {
        palm.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        cicada.pause();
        airplane.pause();
        //rain_under_parasol.pause();
    } else if (page == 2 && summer.isHit3(mouseX, mouseY) && palm.isPlaying()) {
        summer.palm_hit = false;
        palm.pause();
    }
    
    if (page == 2 && summer.isHit4(mouseX, mouseY) && !leaf.isPlaying()) {
        leaf.loop();
        seagulls.pause();
        sea.pause();
        palm.pause();
        cicada.pause();
        airplane.pause();
        //rain_under_parasol.pause();
    } else if (page == 2 && summer.isHit4(mouseX, mouseY) && leaf.isPlaying()) {
        summer.leaf_hit = false;
        leaf.pause();
    }
    
    if (page == 2 && summer.isHit7(mouseX, mouseY) && !cicada.isPlaying()) {
        cicada.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        palm.pause();
        airplane.pause();
        //rain_under_parasol.pause();
    } else if (page == 2 && summer.isHit7(mouseX, mouseY) && cicada.isPlaying()) {
        summer.cicada_hit = false;
        cicada.pause();
    }
    
    if (page == 2 && summer.isHit9(mouseX, mouseY) && !airplane.isPlaying()) {
        airplane.loop();
        seagulls.pause();
        sea.pause();
        leaf.pause();
        cicada.pause();
        palm.pause();
        //rain_under_parasol.pause();
    } else if (page == 2 && summer.isHit9(mouseX, mouseY) && airplane.isPlaying()) {
        summer.airplane_hit = false;
        airplane.pause();
    }
    /* if(page == 2 && summer.isHit10(mouseX, mouseY) && !rain_under_parasol.isPlaying()) {
    rain_under_parasol.loop();
    seagulls.pause();
    sea.pause();
    leaf.pause();
    cicada.pause();
    airplane.pause();
    palm.pause();
} else if (page == 2 && summer.isHit10(mouseX, mouseY) && rain_under_parasol.isPlaying()){
    summer.parasol_hit = false;
    rain_under_parasol.pause();
}*/
    if (page == 3 && fall.isHit1(mouseX, mouseY) && !leaves.isPlaying()) {
        leaves.loop();
        crow.pause();
        tree.pause();
        bug.pause();
    } else if (page == 3 && fall.isHit1(mouseX, mouseY) && leaves.isPlaying()) {
        fall.scarecrow_hit = false;
        leaves.pause();
    }
    
    if (page == 3 && fall.isHit2(mouseX, mouseY) && !leaves.isPlaying()) {
        tree.loop();
        crow.pause();
        leaves.pause();
        bug.pause();
    } else if (page == 3 && fall.isHit2(mouseX, mouseY) && leaves.isPlaying()) {
        fall.tree_hit = false;
        tree.pause();
    }
    
    if (page == 3 && fall.isHit3(mouseX, mouseY) && !crow.isPlaying()) {
        crow.loop();
        tree.pause();
        leaves.pause();
        bug.pause();
    } else if (page == 3 && fall.isHit3(mouseX, mouseY) && crow.isPlaying()) {
        fall.crow_hit = false;
        crow.pause();
    }
    
    if (page == 3 && fall.isHit4(mouseX, mouseY) && !bug.isPlaying()) {
        bug.loop();
        tree.pause();
        leaves.pause();
        crow.pause();
    } else if (page == 3 && fall.isHit4(mouseX, mouseY) && bug.isPlaying()) {
        fall.bug_hit = false;
        bug.pause();
    }
    
    
    //winter
    if (page == 4 && winter.isHit1(mouseX, mouseY) && !fire.isPlaying()) {
        fire.loop();
    } else if (page == 4 && spring.isHit1(mouseX, mouseY) && Butterfly.isPlaying()) {
        winter.fire_hit = false;
        fire.pause();
    }
}
