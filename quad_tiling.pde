//todo

int rows = 30;
int columns = 30;
float cellWidth;
float cellHeight;
float cellPadding;
float margin;

int[][] grid = new int[rows][columns];

void setup() {
  size(600, 600);
  margin = 20;
  cellWidth = (width/columns) - (margin*2/columns);
  cellHeight = (height/rows) - (margin*2/rows);
  cellPadding = 2;
  
  //populate grid with 1s
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      grid[i][j] = 1;
    }
  }
  
  //populate grid with quad odds
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float r = random(1); 
      if(r < 0.3 && grid[i][j] != 0 && i < (columns-1) && grid[i+1][j] == 1) { // sideways rect
        grid[i][j] = 2;
        grid[i+1][j] = 0;
      } else if (r < 0.6 && grid[i][j] != 0 && j < (rows-1) && grid[i][j+1] == 1) { // standing rect
        grid[i][j] = 3; 
        grid[i][j + 1] = 0;
      } else if (r < 0.8 && grid[i][j] != 0 && i < (columns-1) && j < (rows-1) && grid[i+1][j] == 1 && grid[i][j+1] == 1 && grid[i + 1][j + 1] == 1) { // big square
         grid[i][j] = 4;
         grid[i+1][j] = 0;
         grid[i][j + 1] = 0;
         grid[i + 1][j + 1] = 0;
      } else { // small square
        // noop
      }
    }
  }
  
  //draw quads
  translate(margin, margin);
  noStroke();
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float x = (i * cellWidth);
      float y = (j * cellHeight);
      if(grid[i][j] == 1) {
        fill(66, 135, 245);
        rect(x + cellPadding, y + cellPadding, cellWidth - cellPadding * 2, cellHeight - cellPadding * 2);
      } else if(grid[i][j] == 2) {  
        fill(235, 64, 52);
        rect(x + cellPadding, y + cellPadding, cellWidth * 2 - cellPadding * 2, cellHeight - cellPadding * 2);  
      } else if (grid[i][j] == 3) {
        fill(252, 186, 3);
        rect(x + cellPadding, y + cellPadding, cellWidth - cellPadding * 2, cellHeight * 2 - cellPadding * 2);
      } else if (grid[i][j] == 4) {
        fill(3, 252, 61);
        rect(x + cellPadding, y + cellPadding, cellWidth * 2 - cellPadding * 2, cellHeight * 2 - cellPadding * 2);
      }
    }
  }

  // draw borders
  stroke(0);
  noFill();
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float x = (i * cellWidth);
      float y = (j * cellHeight);
      if(grid[i][j] == 1) {
        rect(x + cellPadding, y + cellPadding, cellWidth - cellPadding * 2, cellHeight - cellPadding * 2);
      } else if(grid[i][j] == 2) {  
        rect(x + cellPadding, y + cellPadding, cellWidth * 2 - cellPadding * 2, cellHeight - cellPadding * 2);  
      } else if (grid[i][j] == 3) {
        rect(x + cellPadding, y + cellPadding, cellWidth - cellPadding * 2, cellHeight * 2 - cellPadding * 2);
      } else if (grid[i][j] == 4) {
        rect(x + cellPadding, y + cellPadding, cellWidth * 2 - cellPadding * 2, cellHeight * 2 - cellPadding * 2);
      }
    }
  }

  noLoop();
 //
}
