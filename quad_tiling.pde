//todo: spacing between quads
//todo: border around?

int rows = 24;
int columns = 24;
float cellWidth;
float cellHeight;
float cellPadding;

int[][] grid = new int[rows][columns];

void setup() {
  size(700, 700);
  cellWidth = width/columns;
  cellHeight = height/rows;
    
  //populate grid with 1s
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      grid[i][j] = 1;
    }
  }
      
  //populate grid with quad odds
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float r = random(1); //<>//
      if(r < 0.3 && grid[i][j] != 0 && i < (columns-1) && grid[i+1][j] == 1) { // sideways rect
        grid[i][j] = 2;
        grid[i+1][j] = 0;
      } else if (r < 0.6 && grid[i][j] != 0 && j < (rows-1) && grid[i][j+1] == 1) { // standing rect
        grid[i][j] = 3; //<>//
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
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float x = (i * cellWidth);
      float y = (j * cellHeight);
      if(grid[i][j] == 1) {
        fill(66, 135, 245);
        rect(x, y, cellWidth, cellHeight);
      } else if(grid[i][j] == 2) {  
        fill(235, 64, 52);
        rect(x, y, cellWidth * 2, cellHeight);  
      } else if (grid[i][j] == 3) {
        fill(252, 186, 3);
        rect(x, y, cellWidth, cellHeight * 2);
      } else if (grid[i][j] == 4) {
        fill(3, 252, 61);
        rect(x, y, cellWidth * 2, cellHeight * 2);
      }
    }
  }
 
  //visualise grid
  //fill(0);
  //for(int i = 0; i < columns; i++) {
  //  line((i + 1) * cellWidth, 0, (i + 1) * cellWidth, height);
  //  for(int j = 0; j < rows; j++) {
  //    line(0, (j + 1) * cellHeight, width, (j + 1) * cellHeight);
      
  //    // visiluase cell coordinates
  //    text((i + 1) + ":" + (j + 1), i * cellWidth , j * cellHeight + 10);
      
  //    // visiluase cell contents
  //    text(grid[i][j], i * cellWidth , j * cellHeight + 25);
  //  }
  //}
  
  noLoop();
 //
}
