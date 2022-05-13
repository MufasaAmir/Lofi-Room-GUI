//import Control P5 library
import controlP5.*;
//import 
import processing.serial.*;

Serial port;

//create Control object 
ControlP5 cp5;
PFont font;
  //-----------------------------------------------------------------
boolean Midday;
boolean Evening;
boolean Night;

import gifAnimation.*;    // import the gifAnimation library

Gif middayGif; // animations variables
Gif eveningGif;
Gif nightGif;

  //-----------------------------------------------------------------
  
 import Minim; //variables for playing audio
 Minim minim;
 AudioPlayer playerDay;
 AudioPlayer playerEvening;
 AudioPlayer player Night;
 

//similar setup/code style to that in arduino 
void setup(){
  //window size 
  //size(1800, 1000);
    //-----------------------------------------------------------------
  fullScreen();
  Midday = true; // setsday time to play by default
  Evening = false;
  Night = false; 
  
  minim = new Minim(this);
  
  playerDay = loadFile("Day 1.wav"); // initialize audio tracks
  playerEvening = loadFile("Evening 1.wav");
  playerNight = loadFile("Night 1.wav");
  
  //myMovie = new Movie(this, "._Midday.mp4"); //initialize gif animations
  //myMovie.play();
  
  middayGif = new Gif(this, "Midday_HD.gif");
  middayGif.play();
  
  eveningGif = new Gif(this, "Evening_HD.gif");
  eveningGif.play();
  
  nightGif = new Gif(this, "Night_HD.gif");
  nightGif.play();
  //-----------------------------------------------------------------
  
  //prints all available serial ports //communicate with the arduino board
  printArray(Serial.list());
  
  //actual port that the ARDUINO is using/connected to  
  //Will change between Mac & Windows bc life 
  port = new Serial(this, "COM7", 9600);
  
  //buttons 
  cp5 = new ControlP5(this);
  
  //custom fonts for the buttons & title 
  //can be altered in the future
  font = createFont("Calibri", 20);
  
  //night
  //cp5.addButton("night")
  //.setPosition(width/2,50)
  //.setSize(100,80)
  //.setFont(font)
  //; 
  
   // sunset 
  //cp5.addButton("sunset")
  //.setPosition(width/2,150)
  //.setSize(100,80)
  //.setFont(font)
  //; 
  
   // midday 
  //cp5.addButton("midday")
  //.setPosition(width/2,250)
  //.setSize(100,80)
  //.setFont(font)
  //; 
  
   //all leds off = does not work yet 
  //cp5.addButton("off")
  //.setPosition(width/2,350)
  //.setSize(100,80)
  //.setFont(font)
  //; 
  
  
}

//similar loop to that in arduino 
void draw() {
  
  ///color of window  in rgb - light blueish 
  background (95, 178, 205);
  
  //title   
  //title color 
  fill(255, 255, 255);
  //tile font change 
  textFont(font);
  //title to window & location 
  text("lofi room", width/2, 30);
  //-------------------------------------
  if (Midday == true) { //display Day theme animation
    background(0, 128, 0);
    //image(myMovie, 0, 0);
    image(middayGif,0,0,1920,1080);
    
  } 
  if (Evening == true) { //display evening theme animation
    background(128, 0, 0);
    image(eveningGif,0,0,1920,1080);
    
  } 
  if (Night == true) { // display night theme animation
    background(0, 0, 128);
    image(nightGif,0,0,1920,1080);
    
  } 
  
  
}

//functions added functions to buttons & connects char to to the particular serial port 
void night(){
  port.write('3');
}


void sunset(){
  port.write('2');
}


void midday(){
  port.write('1');
}

//does not work yet 
void off(){
  port.write('0');
}

void keyPressed(){
  switch(key){
    case '1': // play/pause audio tracks when respective themes are turned off/on
      midday();
      Midday = true;
      Evening = false;
      Night = false;
      playerDay.loop();
      playerDay.rewind();
      playerEvening.pause();
      playerNight.pause();
      break;
    case '2': 
      sunset();
      Evening = true;
      Midday = false;
      Night = false;
      playerEvening.loop();
      playerEvening.rewind();
      playerDay.pause();
      playerNight.pause();
      break;
    case '3':
      night();
      Night = true;
      Evening = false;
      Midday = false;
      playerNight.loop();
      playerNight.rewind();
      playerEvening.pause();
      playerDay.pause();
      break;              
  }
}
