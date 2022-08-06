int CIRCLE = 1;
int SQUARE = 2;

class Layer{
  PImage test;
  
  float total_space;
  float filled_space;
  int type;
  boolean filled;
  ArrayList<Shape> shapes;
  int pal_num;
  float max;
  
  Layer(boolean tfilled, int ttype){
    background(255);
    save("test.png");
    test = loadImage("test.png");
    
    max = max_r;
    pal_num = int(random(pal.height));
    type = ttype;
    filled = tfilled;
    shapes = new ArrayList();
    
    total_space = (width-2*boarder)*(height-2*boarder);
    filled_space = 0;
  }
  
  color getColor(){
    return pal.get(int(random(5)), pal_num);
  }
  
  void newShape(){
    float max = constrain(max_r - 2*(filled_space / total_space * 100), 10, max_r);
    float min = constrain(min_r - 2*(filled_space / total_space * 100), 10, min_r);
    float new_r = random(min,max); 
    float new_x = random(boarder, width-boarder);
    float new_y = random(boarder, height-boarder);
    if(type == CIRCLE){
      Circle new_shape = new Circle(new_x, new_y, new_r, filled, getColor());
      if(new_shape.isValid(shapes)){
        shapes.add(new_shape);
        filled_space += PI * (new_shape.r/2) * (new_shape.r/2);
      }    
    }
    
    if(type == SQUARE){
      Square new_shape = new Square(new_x, new_y, new_r, filled, getColor());
      if(new_shape.isValid(shapes)){
        shapes.add(new_shape);
        filled_space += new_shape.r*new_shape.r;
      }    
    }
    
    if(type == TRIANGLE){
      Triangle new_shape = new Triangle(new_x, new_y, new_r, filled, getColor());
      if(new_shape.isValid(test)){
        shapes.add(new_shape);
        filled_space += new_shape.r*new_shape.r;
        updateTest();
        
      }    
    }
  }
  
  void display(){
    for(int i = 0; i < shapes.size(); i++){
      shapes.get(i).display();  
    }
    println(filled_space / total_space * 100); 
  }
  
 
  
  void updateTest(){
    background(255);
    fill(0);
    stroke(0);
    
    for(int i = 0; i < shapes.size(); i++){
      shapes.get(i).check();  
    }
    save("test.png");
    test = loadImage("test.png");
    test.loadPixels();
     
  }
}
