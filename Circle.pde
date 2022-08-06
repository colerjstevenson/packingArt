class Circle extends Shape{

  Circle(float tx, float ty, float tr, boolean tfilled, color tc){
    super(tx, ty, tr, tfilled, tc);
    
  }
  
  void display(){
    super.display();
    h.ellipse(x, y, r, r);
  }
  
  
  boolean overlaps(Shape c){
    float d = dist(x, y, c.x, c.y);
    float r_sum = r/2 + c.r/2 + space;
    //if(d < r_sum){
    //  print("\n\ndistance: " + d);
    //  print("\nr sum: " + r + " + " + c.r + " = " + r_sum);
    //}
    return d < r_sum;   
  }
  
  boolean isInside(){
    boolean top = y - r > boarder;
    boolean left = x - r > boarder;
    boolean bottom = y + r < height - boarder;
    boolean right = x + r < width - boarder;
    
    return top && left && bottom && right;
  }
  
}
