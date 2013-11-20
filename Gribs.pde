/*

Gribs: Generatin' Gribs
Created: March 2011
Updated: Nov 2013 

Space takes a screenshot

*/

int gribSize = 200;
int gribCells = 6;
int rows, cols;
float gribRate = 0.001;
Grib[][] gribs;

void setup(){
  size(displayWidth,displayHeight);
  noStroke();
  
  cols = width/gribSize+1;
  rows = height/gribSize+1;
  
  gribs = new Grib[cols][rows];
  
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      gribs[i][j] = new Grib(gribSize, gribCells, gribSize*i, gribSize*j);
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

