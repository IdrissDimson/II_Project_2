PImage maze;

void setup(){
  size(340, 340);
  maze = loadImage("/Users/idrissdimson/Documents/GitHub/II_Project_2/KidsMaze18.gif");
}

void draw() {
  maze.resize(width, height);
  loadPixels();
  maze.loadPixels();
  
  for (int x = 0; x < maze.width; x++ ) {
    for (int y = 0; y < maze.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*maze.width;

      // Get the R,G,B values from image
      float r = red  (maze.pixels[loc]);
      float g = green(maze.pixels[loc]);
      float b = blue (maze.pixels[loc]);

      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, the lower the value of "distance" 
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = map(distance, 0, 50, 8, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }
  updatePixels();
  
  //when the mouse is at the end of the maze, tell the players that they have won
  if((mouseX > 5 && mouseX < 30) && (mouseY > 330 && mouseY < 360)){
    fill(255, 0, 0);
    textSize(25);
    text("YOU WON!!", width/2, height/2);
  }
}