class Grib {

  int cellSize;
  int complexity;
  int x;
  int y;
  int[][] c;
  color col;

  Grib(int gribSize, int complexity, int x, int y) {
    this.complexity = complexity;
    this.cellSize = gribSize/complexity;
    this.x = x;
    this.y = y;
    refresh();
  }

  void draw() {
    for(int i=0;i<complexity;i++) {
      for(int j=0;j<complexity;j++) {
        if(c[i][j] > 0) {
          fill(col);
        } 
        else {
          fill(255);
        }
        rect(i*cellSize+x,j*cellSize+y,cellSize,cellSize);
      }
    }
  }

  void update(){
   if(random(1)<gribRate){
     refresh();
   }
    
  }

  void refresh() {
    col = color(random(255),random(255),random(255));
    c = new int [complexity][complexity];

    for(int i=0;i<complexity;i++) {
      for(int j=0;j<complexity;j++) {

          if(i < complexity/2) { //if in first vertical half
            c[i][j] = round(random(0,1));
          } else if(complexity%2 == 1 && i == complexity/2){ //odd number of cells
            c[i][j] = round(random(0,1));
          }
          else { //mirror vertically
            c[i][j] = c[complexity-1-i][j];
          }
      }
    }
  }
}

