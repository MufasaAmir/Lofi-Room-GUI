boolean Midday;
boolean Evening;
boolean Night;

import ddf.minim.*;
Minim minim;
AudioPlayer playerDay;
AudioPlayer playerEvening;
AudioPlayer playerNight;

import gifAnimation.*;    // import the gifAnimation library

Gif middayGif; 
Gif eveningGif;
Gif nightGif;


//import processing.video.*;
//Movie myMovie;


void setup() {
  
  minim = new Minim(this);
  playerDay = minim.loadFile("Day 1.wav");
  playerEvening = minim.loadFile("Evening 1.wav");
  playerNight = minim.loadFile("Night 1.wav");
  //fullScreen();
  size(1920,1080);
  Midday = true;
  Evening = false;
  Night = false; 
  
  //myMovie = new Movie(this, "._Midday.mp4");
  //myMovie.play();
  
  middayGif = new Gif(this, "Midday_HD.gif");
  middayGif.play();
  
  eveningGif = new Gif(this, "Evening_HD.gif");
  eveningGif.play();
  
  nightGif = new Gif(this, "Night_HD.gif");
  nightGif.play();
}

void draw() {
  if (Midday == true) {
    background(0, 128, 0);
    //image(myMovie, 0, 0);
    image(middayGif,0,0,1920,1080);
    playerDay.loop();
    stopEvening();
    stopNight();
    
  } 
  if (Evening == true) {
    background(128, 0, 0);
    image(eveningGif,0,0,1920,1080);
    playerEvening.loop();
    stopDay();
    stopNight();
    
  } 
  if (Night == true) {
    background(0, 0, 128);
    image(nightGif,0,0,1920,1080);
    playerNight.loop();
    stopEvening();
    stopDay();
    
  } 
  
}

void keyPressed(){
  switch(key){
    case '1': Midday = true;
              Evening = false;
              Night = false;
              break;
    case '2': Evening = true;
              Midday = false;
              Night = false;
              break;
    case '3': Night = true;
              Evening = false;
              Midday = false;
              break;              
  }
}

void stopDay() {
  playerDay.close();
  minim.stop();
  super.stop();
}

void stopEvening() {
  playerEvening.close();
  minim.stop();
  super.stop();
}

void stopNight() {
  playerNight.close();
  minim.stop();
  super.stop();
}
