class Shape{
  float x;
  float y;
  float r;
  boolean filled;
  color col;
  
  Shape(float tx, float ty, float tr, boolean tfilled, color tc){
    x = tx;
    y = ty;
    r = tr;
    filled = tfilled;
    col = tc;
  }
  
  void display(){
    if(filled){
      fill(col);
      strokeWeight(0.5);
      stroke(col);
    }else{
      noFill();
      stroke(col);
      strokeWeight(sw);
    }
  }
  
  boolean overlaps(Shape c){
    float d = dist(x, y, c.x, c.y);
    return d < r + c.r;   
  }
  
  boolean isInside(){
    boolean top = y - r > boarder;
    boolean left = x - r > boarder;
    boolean bottom = y + r < height - boarder;
    boolean right = x + r < width - boarder;
    
    return top && left && bottom && right;
  }
  
  boolean isValid(ArrayList<Shape> shapes){
    if(!isInside()){
      return false;  
    }
    
    for(int i = 0; i < shapes.size(); i++){
        if(overlaps(shapes.get(i))){
            return false;
        }
    }
    
    return true;
  }
  
  void check(){
    ellipse(x, y, r, r);  
  }
}
