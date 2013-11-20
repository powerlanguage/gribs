class Grib {

  int cellSize;
  int numCells;
  int x;
  int y;
  int[][] c;
  color col;

  Grib(int gribSize, int numCells, int x, int y) {
    this.numCells = numCells;
    this.cellSize = gribSize/numCells;
    this.x = x;
    this.y = y;
    refresh();
  }

  void draw() {
    for(int i=0;i<numCells;i++) {
      for(int j=0;j<numCells;j++) {
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
    c = new int [numCells][numCells];

    for(int i=0;i<numCells;i++) {
      for(int j=0;j<numCells;j++) {

          if(i < numCells/2) { //if in first vertical half
            c[i][j] = round(random(0,1));
          } else if(numCells%2 == 1 && i == numCells/2){ //odd number of cells
            c[i][j] = round(random(0,1));
          }
          else { //mirror vertically
            c[i][j] = c[numCells-1-i][j];
          }
      }
    }
  }
}

