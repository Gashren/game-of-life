int scl = 10;
int playSpeed = 5;
int rows, cols, step;
boolean play;

Cell[][] cells;

void setup() {
  size(1000, 1000);
  cols = width / scl;
  rows = height / scl;
  cells = new Cell[cols][rows];
  step = 0;
  
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
    play = true;
  } else if (keyCode == LEFT) {
    play = false; 
  } else if (keyCode == UP) {
    playSpeed += 5; 
  } else if (keyCode == DOWN) {
    if (playSpeed > 5) {
      playSpeed -= 5;
    }
  }
}

void draw() {
  background(0);
  stroke(255, 75);
  frameRate(playSpeed);
  
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
   
  fill(255,0,0);
  stroke(0);
  text("Step: " + step, 20, 20);
  text("Speed: " + playSpeed, 20, 40);
  text("Playing: " + play, 20, 60);
  
  if (play) {
    step(); 
  } 
}

void step() {
  step++;
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