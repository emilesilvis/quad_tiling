int rows = 30;
int columns = 30;
float cellWidth;
float cellHeight;
float cellPadding = 6;
float margin = 20;
float deformOffset = 1.5;
int[][] grid = new int[rows][columns];

void setup() {
  size(600, 600);
  pixelDensity(2);
  background(255);
  cellWidth = (width/columns) - (margin*2/columns);
  cellHeight = (height/rows) - (margin*2/rows);
  
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

  translate(margin, margin);
  //draw quads
  for(int i = 0; i < columns; i++) {
    for(int j = 0; j < rows; j++) {
      float x = (i * cellWidth);
      float y = (j * cellHeight);
 
      float startX = x + cellPadding;
      float startY = y + cellPadding;
      float shortWidth = x + cellWidth;
      float shortHeight = y + cellHeight;
      float longWidth = x + cellWidth * 2;
      float longHeight = y + cellHeight * 2;

      fill(randomColour());
      
      if(grid[i][j] == 1) {
        // fill(3, 252, 61);
        filledQuad(startX, startY, shortWidth, startY, shortWidth, shortHeight, startX, shortHeight);
        emptyQuad(startX, startY, shortWidth, startY, shortWidth, shortHeight, startX, shortHeight);
      } else if(grid[i][j] == 2) {
        // fill(252, 186, 3);
        filledQuad(startX, startY, longWidth, startY, longWidth, shortHeight, startX, shortHeight);
        emptyQuad(startX, startY, longWidth, startY, longWidth, shortHeight, startX, shortHeight);
      } else if (grid[i][j] == 3) {
        // fill(3, 86, 252);
        filledQuad(startX, startY, shortWidth, startY, shortWidth, longHeight, startX, longHeight);
        emptyQuad(startX, startY, shortWidth, startY, shortWidth, longHeight, startX, longHeight);
      } else if (grid[i][j] == 4) {
        // fill(252, 3, 69);
        filledQuad(startX, startY, longWidth, startY, longWidth, longHeight, startX, longHeight);
        emptyQuad(startX, startY, longWidth, startY, longWidth, longHeight, startX, longHeight);
      }
    }
  }

  noLoop();
}

void filledQuad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  noStroke();
  quad(x1 + random(-deformOffset, deformOffset), y1 + random(-deformOffset, deformOffset), x2 + random(-deformOffset, deformOffset), y2 + random(-deformOffset, deformOffset), x3 + random(-deformOffset, deformOffset), y3 + random(-deformOffset, deformOffset), x4 + random(-deformOffset, deformOffset), y4 + random(-deformOffset, deformOffset));
}

void emptyQuad(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  stroke(80);
  strokeWeight(1.25);
  strokeJoin(ROUND);
  noFill();
  quad(x1 + random(-deformOffset, deformOffset), y1 + random(-deformOffset, deformOffset), x2 + random(-deformOffset, deformOffset), y2 + random(-deformOffset, deformOffset), x3 + random(-deformOffset, deformOffset), y3 + random(-deformOffset, deformOffset), x4 + random(-deformOffset, deformOffset), y4 + random(-deformOffset, deformOffset));
}

color randomColour() {
  color[] colours = {
    color(36, 123, 160),
    color(112, 193, 179),
    color(178, 219, 191),
    color(243, 255, 189),
    color(255, 22, 84)
    };

  return colours[int(random(colours.length))];
}
