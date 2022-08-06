class Square extends Shape{
  
  Square(float tx, float ty, float tr, boolean tfilled, color tc){
    super(tx, ty, tr, tfilled, tc);
  }
  
  void display(){
    super.display();
    h.rect(x, y, r, r);
  }
  
  boolean overlaps(Shape c){
    boolean tl = c.x > x && c.y > y && c.x < x+r+space && c.y < y+r+space;
    boolean tr = c.x+c.r > x && c.y > y && c.x+c.r < x+r+space && c.y < y+r+space;
    boolean bl = c.x > x && c.y+c.r > y && c.x < x+r && c.y+c.r < y+r;
    boolean br = c.x+c.r > x && c.y+c.r > y && c.x+c.r < x+r && c.y+c.r < y+r;
    
    boolean tl2 = x >c.x && y > c.y && x < c.x+c.r+space && y < c.y+c.r+space;
    boolean tr2 = x+r > c.x && y > c.y && x+r < c.x+c.r+space && y < c.y+c.r+space;
    boolean bl2 = x >c.x && y+r > c.y && x < c.x+c.r+space && y+r < c.y+c.r+space;
    boolean br2 = x+r >c.x && y+r > c.y && x+r < c.x+c.r+space && y+r < c.y+c.r+space;
    
    return tl || tr || bl || br || tl2 || tr2 || bl2 || br2;
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
  
}
