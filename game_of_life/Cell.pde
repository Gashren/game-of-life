class Cell {
  int x, y, col, row, size, aliveNearby;
  boolean alive;
  
  Cell(int x, int y, int size, boolean alive) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.alive = alive;
    col = x / size;
    row = y / size;
  }
  
  void checkAlive(Cell[][] cells) {
    aliveNearby = 0;
    if (col > 0 && col < cells.length - 1 && row > 0 && row < cells[0].length - 1) {
      for (int i = col - 1; i <= col + 1; i++) {
        for (int j = row - 1; j <= row + 1; j++) {
          if (cells[i][j].alive && !cells[i][j].equals(this)) {
            aliveNearby++;
          }
        }
      }
    }
  }
  
  void update() {
    if (aliveNearby < 2) {
      alive = false; 
    } else if (aliveNearby > 3) {
      alive = false;
    } else if (aliveNearby == 3) {
      alive = true;
    }
  }
  
  void show() {
    noStroke();
    
    if (alive) {
      fill(255); 
    } else {
      fill(0); 
    }
    rect(x + 1, y + 1, size - 1, size - 1); 
  }
  
  void switchState() {
    alive = !alive; 
  }
}