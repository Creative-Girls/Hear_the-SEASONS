class Button{
    String onlabel;
    intxcolor;
    float x;
    float y;
    float w;
    float h;
    boolean click = false;
    
    
    Button(String label, int x_color, float xpos, float ypos, float width, float height) {
        onlabel = label;
        xcolor = x_color;
       x = xpos;
       y = ypos;
       w = width;
       h = height;
}
    
    void Draw() {
        fill(255);
        stroke(255);
        rect(x,y, w, h, 10);
        textAlign(CENTER, CENTER);
        fill(0);
        textSize(40);
        text("START", 363, 770);
}
    
    boolean MouseIsOverOn() {
       if (mousePressed && (mouseX > x && mouseX < (x + w)) && (mouseY > y && mouseY < (y + h))) {
            click = true;
        }
        if (click == true) {
            background(255);
        }
        return true;
}
}
