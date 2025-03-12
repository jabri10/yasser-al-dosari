import ddf.minim.*;
 minim;
AudioPlayer player;

float x;
float y;

void setup() {
  x = 0;
  y = 1;
  print(x + y);
  fullScreen();
  int appWidth = displayWidth;
  int appHeight = displayHeight;

  minim = new Minim(this);
  player = minim.loadFile("your-music-file.mp3"); // Replace with your music file

  // Draw a button for play/pause
  fill(255);
  rect(appWidth / 2 - 50, appHeight - 100, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Play/Pause", appWidth / 2, appHeight - 75);
}

void draw() {
  background(0);
  fill(255);
  rect(displayWidth / 2 - 50, displayHeight - 100, 100, 50); // Draw button
  fill(0);
  textAlign(CENTER, CENTER);
  text("Play/Pause", displayWidth / 2, displayHeight - 75);
}

void mousePressed() {
  if (mouseX > displayWidth / 2 - 50 && mouseX < displayWidth / 2 + 50 && mouseY > displayHeight - 100 && mouseY < displayHeight - 50) {
    if (player.isPlaying()) {
      player.pause();
    } else {
      player.play();
    }
  }
}

void keyPressed() {
  if (key == ' ') { // Space key for play/pause
    if (player.isPlaying()) {
      player.pause();
    } else {
      player.play();
    }
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
