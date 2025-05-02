import ddf.minim.*;

Minim minim;
AudioPlayer clip;
String filename = "quran_clip.mp3"; // Replace with your audio file name

float topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight;
float muteX, muteY, muteWidth, muteHeight;
float quitX, quitY, quitWidth, quitHeight;
float playX, playY, playWidth, playHeight;
float pauseX, pauseY, pauseWidth, pauseHeight;
float stopX, stopY, stopWidth, stopHeight;
float fastforwardX, fastforwardY, fastforwardWidth, fastforwardHeight;
float fastreverseX, fastreverseY, fastreverseWidth, fastreverseHeight;
float loopOnceX, loopOnceY, loopOnceWidth, loopOnceHeight;
float loopInfiniteX, loopInfiniteY, loopInfiniteWidth, loopInfiniteHeight;
float shuffleX, shuffleY, shuffleWidth, shuffleHeight;
float nextX, nextY, nextWidth, nextHeight;
float previousX, previousY, previousWidth, previousHeight;

boolean isPlaying = false;

void setup() {
  fullScreen();
  int appWidth = displayWidth;
  int appHeight = displayHeight;
  minim = new Minim(this);

  // Load the audio file
  try {
    clip = minim.loadFile(filename);
  } catch (Exception e) {
    println("Error loading audio file: " + filename);
    e.printStackTrace();
    clip = null;
  }

  // Dynamic button positioning based on screen size
  float buttonWidth = appWidth * 0.08;
  float buttonHeight = appHeight * 0.08;
  float buttonY = appHeight * 0.70;
  float spacing = appWidth * 0.01;

  topDisplayX = appWidth * 0.02;
  topDisplayY = appHeight * 0.02;
  topDisplayWidth = appWidth * 0.20;
  topdispayHeight = appHeight * 0.10;

  loopOnceX = appWidth * 0.05;
  loopOnceY = buttonY;
  loopOnceWidth = buttonWidth;
  loopOnceHeight = buttonHeight;

  loopInfiniteX = loopOnceX + buttonWidth + spacing;
  loopInfiniteY = buttonY;
  loopInfiniteWidth = buttonWidth;
  loopInfiniteHeight = buttonHeight;

  shuffleX = loopInfiniteX + buttonWidth + spacing;
  shuffleY = buttonY;
  shuffleWidth = buttonWidth;
  shuffleHeight = buttonHeight;

  previousX = shuffleX + buttonWidth + spacing * 2;
  previousY = buttonY;
  previousWidth = buttonWidth;
  previousHeight = buttonHeight;

  fastreverseX = previousX + buttonWidth + spacing;
  fastreverseY = buttonY;
  fastreverseWidth = buttonWidth;
  fastreverseHeight = buttonHeight;

  stopX = fastreverseX + buttonWidth + spacing;
  stopY = buttonY;
  stopWidth = buttonWidth;
  stopHeight = buttonHeight;

  playX = stopX + buttonWidth + spacing * 2;
  playY = buttonY;
  playWidth = buttonWidth;
  playHeight = buttonHeight;

  pauseX = playX + buttonWidth + spacing;
  pauseY = buttonY;
  pauseWidth = buttonWidth;
  pauseHeight = buttonHeight;

  fastforwardX = pauseX + buttonWidth + spacing;
  fastforwardY = buttonY;
  fastforwardWidth = buttonWidth;
  fastforwardHeight = buttonHeight;

  nextX = fastforwardX + buttonWidth + spacing * 2;
  nextY = buttonY;
  nextWidth = buttonWidth;
  nextHeight = buttonHeight;

  muteX = nextX + buttonWidth + spacing;
  muteY = buttonY;
  muteWidth = buttonWidth;
  muteHeight = buttonHeight;

  quitX = muteX + buttonWidth + spacing * 2;
  quitY = buttonY;
  quitWidth = buttonWidth;
  quitHeight = buttonHeight;
}

void draw() {
  background(200);

  // Top display area
  fill(220);
  rect(topDisplayX, topDisplayY, topDisplayWidth, topdispayHeight, 10);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Now Playing", topDisplayX + topDisplayWidth / 2, topDisplayY + topdispayHeight / 3);

  // Control buttons
  drawButton(muteX, muteY, muteWidth, muteHeight, "Mute");
  drawButton(quitX, quitY, quitWidth, quitHeight, "Quit");
  drawButton(playX, playY, playWidth, playHeight, isPlaying ? "Pause" : "Play");
  drawButton(pauseX, pauseY, pauseWidth, pauseHeight, "Pause");
  drawButton(stopX, stopY, stopWidth, stopHeight, "Stop");
  drawButton(fastforwardX, fastforwardY, fastforwardWidth, fastforwardHeight, ">>");
  drawButton(fastreverseX, fastreverseY, fastreverseWidth, fastreverseHeight, "<<");
  drawButton(loopOnceX, loopOnceY, loopOnceWidth, loopOnceHeight, "Loop Once");
  drawButton(loopInfiniteX, loopInfiniteY, loopInfiniteWidth, loopInfiniteHeight, "Loop ∞");
  drawButton(shuffleX, shuffleY, shuffleWidth, shuffleHeight, "Shuffle");
  drawButton(nextX, nextY, nextWidth, nextHeight, "Next");
  drawButton(previousX, previousY, previousWidth, previousHeight, "Prev");
}

void drawButton(float x, float y, float w, float h, String label) {
  fill(150);
  rect(x, y, w, h, 5);
  fill(0);
  textAlign(CENTER, CENTER);
  text(label, x + w / 2, y + h / 2);
}

void mousePressed() {
  if (clip != null) {
    if (isPointInside(mouseX, mouseY, playX, playY, playWidth, playHeight)) {
      if (isPlaying) {
        clip.pause();
        isPlaying = false;
      } else {
        clip.play();
        isPlaying = true;
      }
    } else if (isPointInside(mouseX, mouseY, stopX, stopY, stopWidth, stopHeight)) {
      clip.rewind();
      clip.pause();
      isPlaying = false;
    }
    // Add functionality for other buttons here
  }
}

boolean isPointInside(float px, float py, float rx, float ry, float rw, float rh) {
  return px > rx && px < rx + rw && py > ry && py < ry + rh;
}

void stop() {
  if (clip != null) {
    clip.close();
  }
  minim.stop();
  super.stop();
}
