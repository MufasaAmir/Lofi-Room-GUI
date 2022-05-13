# Lofi-Room-GUI
The GUI for the LOFI Room coded in Processing that interfaces with Arduino-Based Lighting system.
Controls the Lighting system, Background theme, and Music of the project all at the press of the button. When a theme is chosen, the Background animation is played on the Big TV screen (acting as the window) along with the music being played from the Bluetooth speaker system, as well as change the appropriate lighting theme of the Arduino system.
Press the following keys to turn on their respective theme:
- "1": Midday
- "2": Evening
- "3": Night

LIBRARIES: I used several free libraries to connect the LEDs, Arduino, and Processing together, this is mentioned in each code file.

Arduino Libraries:

- FastLED, which allows makes coding palettes & effects much easier with addressesable LEDs https://github.com/FastLED/FastLED

Processing Libraries:

- ControlIP5, which creates controllers easier in a separate window & render graphics https://github.com/sojamo/controlp5
- Processing. Serial, which reads & write data from devices & other programs (like Arduino in our case) https://processing.org/reference/libraries/serial/index.html
- Minim, an audio library used for playing the Music.
https://github.com/ddf/Minim
- GifAnimation, used to render gifs instead of videos of the background animations because Processing's video player buffers too much for this project.
https://github.com/akiljohnson1/GifAnimation

# Animations
I had created background animations for all three themes using Adobe Photoshop and Premiere Pro.
- Art assets such as the Mount Fuji pixel art, plane, and clouds where created in Photoshop.
- Animating and splicing the art assets together were done and rendered into gifs using Premiere Pro.

# Hardware Contributions
In addition to the software and animations, I had provided a large portion of the crucial hardware and furniture to the physical space. 
- TV
- Japanese Room Divider 
- Pipe and Drape
- HDMI Cords
- HDMI Extender
- FLashDrive (Used to load the code) 
- 2 Extension cords
- Command Strips/Hooks (Used for mounting the TV to the wall)


