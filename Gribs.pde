/*

Gribs: Generatin' Gribs
Created: March 2011
Updated: Nov 2013 

Space takes a screenshot

*/

//size of grib in pixels
int gribSize = 200;
//width, in cells, of a grib
int gribComplexity = 6;
int rows, cols;
float gribRate = 0.001;
Grib[][] gribs;

void setup(){
  size(954,700);
  noStroke();
  
  int vertRemainder = height%gribSize;
  int horzRemainder = width%gribSize;
  int horzSpacer = horzRemainder/2;
  int vertSpacer = vertRemainder/2;
  
  cols = width/gribSize;
  rows = height/gribSize;
  
  gribs = new Grib[cols][rows];
  
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      gribs[i][j] = new Grib(gribSize, gribComplexity, gribSize*i+horzSpacer, gribSize*j+vertSpacer);
    }
  }
}

void draw(){
background(255);
 for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      gribs[i][j].update();
      gribs[i][j].draw();
    }
 }
}

void keyPressed(){
 if(key == 32){ //space
    saveFrame("gribs-####.png");      
 } 
}

