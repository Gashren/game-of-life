int rows = 60;
int cols = 60;
int scl = 10;
boolean play;

Cell[][] cells = new Cell[cols][rows];

void setup() {
  size(600, 600);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j] = new Cell(i * scl, j * scl, scl, false); 
    }
  }   
}

void mousePressed() {
  int thisCol = mouseX / scl;
  int thisRow = mouseY / scl;
  cells[thisCol][thisRow].switchState();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    step();
  } else if (keyCode == UP) {
    play = true; 
  } else if (keyCode == DOWN) {
    play = false; 
  }
}

void draw() {
  background(0);
  stroke(255, 75);
  frameRate(10);
  
  for (int i = 0; i < cols; i++) {
    line(i * scl, 0, i * scl, height);
  }
  
  for (int i = 1; i < rows; i++) {
    line(0, i * scl, width, i * scl);
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j].show();
    }
  }
  
  if (play) {
    step(); 
  } 
}

void step() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j].checkAlive(cells); 
    }
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j].update(); 
    }
  }
}