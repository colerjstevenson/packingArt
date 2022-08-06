color B = color(0, 0, 0);

class Triangle extends Shape{
  float px1;
  float py1;
  float px2;
  float py2;
  float px3;
  float py3;
  
  
  
  Triangle(float tx, float ty, float tr, boolean tfilled, color tc){
    super(tx, ty, tr/2, tfilled, tc);
    float p = floor(random(4))*(PI/2);
    px1 = x + sin(p)*r;
    py1 = y + cos(p)*r;
    p += TWO_PI/3;
    px2 = x + sin(p)*r;
    py2 = y + cos(p)*r;
    p += TWO_PI/3;
    px3 = x + sin(p)*r;
    py3 = y + cos(p)*r; 
  }
  
  void display(){
    super.display();
    h.triangle(px1, py1, px2, py2, px3, py3);
  }
  
  
  boolean isInside(){
    boolean p1 = px1 > boarder && py1 > boarder && px1 < width-boarder && py1 < height-boarder;
    boolean p2 = px2 > boarder && py2 > boarder && px2 < width-boarder && py2 < height-boarder;
    boolean p3 = px3 > boarder && py3 > boarder && px3 < width-boarder && py3 < height-boarder;
    
    return p1 && p2 && p3;
  }
  
  boolean isValid(PImage test){
    if(!isInside()){
      return false;  
    }
    
    background(255);
    fill(0);
    stroke(0);
    triangle(px1, py1, px2, py2, px3, py3);
    loadPixels();
    
    for(int i = 0; i < test.pixels.length; i++){
      if(pixels[i] == B && test.pixels[i] == B){
        
        return false;
        
      }
    }
    
    return true;
  }
  
  void check(){
    triangle(px1, py1, px2, py2, px3, py3);
  }
  
  
}
