import ddf.minim.*; //minim library
import ddf.minim.analysis.*;

//public variable
Button but; //button variable
Minim minim; 
String type = "start";
boolean menuOn = false;
boolean seasonMenuOn = false;
boolean timeMenuOn = false;

private PImage bg;
private PImage bg_title;

//get weather API
private XML xml;
private String key;
private XML latElement;
String weather;

// literally weather rain
String wrain = "rain";
String wclear = "clear";

//get Date
int month;
int day;
int time;

Spring spring = null;
Summer summer = null;
Fall fall = null;
Winter winter = null;


void setup() {
    
    size(708, 979); //background size
    background(255); //background color
    bg = loadImage("/spring/img/SpringBg.png"); //background image
    bg= loadImage("/Users/uga-eun/Desktop/Season/data/intro/img/Intro-bg.png");
    bg.resize(708, 979);
    bg_title = loadImage("/intro/img/Intro-title.png"); //background image(title)
    //bg_title = loadImage("/Users/uga-eun/Desktop/Season/data/intro/img/Intro-title.png");
    bg_title.resize(708, 979);
    
    //get weatherAPI
    key = "d296134b27215cc728104f660752f821";
    xml = loadXML("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=" + key + "&mode=xml");
    latElement = xml.getChild("weather");
    weather = latElement.getString("value");
    println(weather);
    
    //get Date
    month = month();
    day = day();
    time = hour();
    
    minim = new Minim(this);
    
    //Button
    but = new Button(this, width, height,time);
}

void draw() {  
    if (type.equals("start")) //intro page
    {
        frameRate(1000);
        background(255);
        image(bg, 0, 0);
        image(bg_title, 0, 0);
        but.draw();
    }
    else if (type.equals("spring") &&  spring!= null) //spring page
    {
        menuOn = true;
        background(255);
        frameRate(5);
        spring.draw();
    }
    else if (type.equals("summer") &&  summer!= null)  //summer page
    {
        menuOn = true;
        frameRate(5);
        summer.draw();
    }
    else if (type.equals("fall") &&  fall!= null)  //fall page
    {
        menuOn = true;
        frameRate(5);
        fall.draw();
    }
    else if (type.equals("winter") &&  winter!= null)  //winter page
    {
        menuOn = true;
        frameRate(5);
        winter.draw();
    }
}

void mousePressed() {
    if (type.equals("start")) //if press start button, it is pressed.
        {
        but.mousePressed();
    } else if (type.equals("spring") &&  spring!= null) { //if press spring button, it is pressed.
        spring.mousePressed();
        but.mousePressed();
    } else if (type.equals("summer") &&  summer!= null) { //if press summer button, it is pressed.
        summer.mousePressed();
        but.mousePressed();
    } else if (type.equals("fall") &&  fall!= null) { //if press fall button, it is pressed.
        fall.mousePressed();
        but.mousePressed();
    } else if (type.equals("winter") &&  winter!= null) { //if press winter button, it is pressed.
        winter.mousePressed();
        but.mousePressed();
    }
}
