class Animation{
  
  PVector location;
  PVector velocity;
  PVector acceration;
  
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix,int count){
   location = new PVector(width/2, height-100);
   velocity = new PVector(0, -2);
   
   imageCount = count;
   images = new PImage[imageCount];
   
   //insert file inorder in the array
   for(int i=0; i<imageCount; i++){
    String filename = imagePrefix + nf(i,2) + ".png";
    images[i] = loadImage(filename);
   }
  }
  
  void update(){
    location.add(velocity);
    
    //if the bird fly to the end, it shows in the start point
    if(location.x < 0-animation1.getWidth()) {
      location.y = random(animation1.getHeight(), height - animation1.getHeight());
      location.x = width;
    }
  }
  
  //display image inorder
  void display(){
    frame = (frame+1)% imageCount;
    image(images[frame], location.x, location.y);
  }
  
  int getWidth(){
    return images[0].width;
  }
  
  int getHeight(){
    return images[0].height;
  }
}
