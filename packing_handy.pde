import org.gicentre.handy.*;
import java.util.Arrays;
 
HandyRenderer h;

PImage pal;
int pal_num;
int boarder = 50;
int max_r = 300;
int min_r = 100;
Layer l1;
Layer l2;
float sw = 1.5;
float space = 2*sw+2;
color bg = 255;
int save;
boolean running;

 
void setup(){
  background(bg);
  size(900,900);
  pal = loadImage("D:\\Documents\\animation\\creative coding\\colorPalette\\cp.bmp");
  save = int(random(1000000000));
  h = new HandyRenderer(this);
  h.setBackgroundColour(bg);
  l1 = new Layer(true, TRIANGLE);
  reset();
}

void reset(){
 
  
  background(bg);
  int r1 = round(random(2));
  int r2 = round(random(2));

  if(r1 == 0){
    l1 = new Layer(false, SQUARE);
  }else if(r1 == 1){
    l1 = new Layer(false, CIRCLE);
  }else{
    l1 = new Layer(false, TRIANGLE);
  }  
  
   if(r2 == 0){
    l2 = new Layer(true, SQUARE);
  }else if(r2 == 1){
    l2 = new Layer(true, CIRCLE);
  }else{
    l2 = new Layer(true, TRIANGLE);
  }
}


void draw(){
  if(l1.type == TRIANGLE || l2.type == TRIANGLE){
    for(int i = 0; i< 500; i++){
      l1.newShape();
      l2.newShape(); 
    }
  }else{
    for(int i = 0; i< 1000; i++){
      l1.newShape();
      l2.newShape(); 
    } 
  }
 
  
  background(bg);
  l2.display();
  l1.display();
 
}

void keyPressed(){
  
  if(key=='s'){
    save("out/pack_"+ save +".png");
  }else if(key == 'n'){
   save = int(random(1000000000));
   reset(); 
  }else if(key == 'i'){
    h.setIsHandy(true);
  }else if(key == 'o'){
    h.setIsHandy(false);
  }else if(key == 'b'){
    bg = 0;
  }else if(key == 'v'){
    bg = 255;
  }else if (key == 'm'){
    for(int frame = 0; frame < 300; frame++){
       if(frame > 99){
         save("output/"+ save + "/" +frame+".png");
       }else if(frame >9){
         save("output/"+ save + "/0"+frame+".png");
       }else{
         save("output/"+ save + "/00"+frame+".png");  
       }
       background(bg);
       l2.display();
       l1.display();
       println(frame);
    }
  }
    
  
}
