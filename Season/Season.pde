import ddf.minim.*; //minim library
import ddf.minim.analysis.*;

/*
2021.11.02 - Sieun Song
Modify all class code as a whole
-. Modified so that audio files loaded at once from the Season class are loaded from each class
-. Move code for object hit to each class
*/

//public variable
Button but; //button variable
Minim minim; 
String type = "start";
boolean menuOn = false;
boolean seasonMenuOn = false;
boolean timeMenuOn = false;

private PImage bg;
private PImage bg_title;

//get weather API - Sieun Song
private XML xml;
private String key;
private XML latElement;
String weather;

// literally weather rain
String wrain = "rain";
String wclear = "clear";

//get Date - Sieun Song
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
    //bg= loadImage("/Users/uga-eun/Desktop/Season/data/spring/img/SpringBg.png");
    bg.resize(708, 979);
    bg_title = loadImage("/intro/img/Intro-title.png"); //background image(title)
    //bg_title = loadImage("/Users/uga-eun/Desktop/Season/data/intro/img/Intro-title.png");
    bg_title.resize(708, 979);
    
    /*
      Sieun Song
      -. get and set weaterAPI information
    */
    key = "d296134b27215cc728104f660752f821";
    xml = loadXML("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=" + key + "&mode=xml");
    latElement = xml.getChild("weather");
    weather = latElement.getString("value");
    println(weather);
   
    /*
      Sieun Song
      -. get Date
    */
    month = month();
    day = day();
    time = hour();
    
    minim = new Minim(this);
    
    //Button
    but = new Button(this, width, height,time);
}

/*
  Sieun Song
  -. Call draw function according to season
*/
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

/*
  Sieun Song
  -. Call mousePressed function according to season
*/
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
