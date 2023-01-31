//*Isabelle Rieken*//

import processing.video.*;
int R, G, B, A;
Capture myVideo;//capture is a new form of data like floats/integers
int FPS;
PImage stitch;

void setup() {
  size(1280, 720);
  FPS = 30;
  String[] cameras = Capture.list();
  myVideo = new Capture( this, width, height, cameras[0], FPS);
  myVideo.start();
  
  stitch = loadImage("single_stitch.png");
}

void draw() {
  background(0);
  if (myVideo.available() == true)myVideo.read();
  //image(myVideo,0,0);
  myVideo.loadPixels();                     // load the pixels array of the movie
  loadPixels();
  for (int x = 0; x < width; x = x+20) {
    for (int y = 0; y < height; y = y+20) {

      color ourColor = myVideo.get(x, y); //myVideo.get clarifies pixels from video and not just window
      float ourRed = red(ourColor); //the red is a function of ourColor -> to retrieve just the R value from "color"
      float ourGreen = green(ourColor);
      float ourBlue = blue(ourColor);


      float newR, newG, newB;

      //float distanceToMouse= dist(width/2, height/2, x, y);
      map (mouseX, 0, 640, 0, 100);

      newR = ourRed;
      newG = ourGreen;
      newB = ourBlue;

      //float newAlpha;

      //newAlpha = distanceToMouse;
      //Done getting RGB

      //Messing with RGB
      //setting the new RGB
      //set(x, y, color( newR, newG,newB));
      //fill( newR, newG, newB);

      float distanceToMouse = dist(x, y, mouseX, mouseY);
      float smallerValue = map (distanceToMouse, 0, 640, 2, 30);

      //circle(x,y,6);
      //circle (x, y, -smallerValue);
      tint(newR, newG,newB);
      image(stitch, x,y,20,20);
    }
  }
}
