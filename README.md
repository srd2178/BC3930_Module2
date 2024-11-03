# BC3930_Module2

## Blog: [Module 2 Project - Snake](https://incongruous-literature-ab3.notion.site/Module-2-Project-Documentation-121b01346aae80409711c275d86a3efa?pvs=4)

### Tools Needed:
1. LILYGO ESP32 Board
2. [Processing](https://processing.org/download)
3. [Arduino IDE](https://www.arduino.cc/en/software)
4. USB-c cord
5. 6 female/male wires (for breadboard)
6. 5 m/f jumper wires (for joystick)
7. Joystick
8. Button
9. Breadboard
10. TFT Espi Library [(Downloadable)](https://github.com/Xinyuan-LilyGO/TTGO-T-Display)  - [Documentation](https://github.com/Bodmer/TFT_eSPI/tree/5793878d24161c1ed23ccb136f8564f332506d53)
 
### Files and Descriptions

`/joystickAndButtonArduino` - arduino file called lab2.ino is located here and has the code that is for establishing serial communication for ESP32 board 

- `lab2.ino` - arduino file with code for serial communication with ESP32

`/enclosureDesign` - has files for enclosure design project STL and SVG that were used to laser cut

`/snake` - folder with file to Processing file with the snake game

- `sushsnake.pde` - processing file with space invaders code
  
### Fritzing Diagram

<img width="607" alt="fritzdiagram" src="https://github.com/srd2178/BC3930_Module2/blob/main/media/fritzingdiagram.png">


### Instructions
1. Use the Fritzing diagram to properly connect wires and parts to breadboard
2. Download SVG files from `/enclosureDesign` and use them to laser cut each layer (2 of the middle layer)
3. Compile the joystick, button, and screw them in place in the enclosure with 4 M3 screws
4. Plug in USB-C cord to ESP32 and download + open `lab2.ino` on Arduino and upload to the ESP32
5. Download and open `sushsnake.pde` from `/snake` in Processing
6. Ensure ports are correctly correlated and joystick + button are connected
7. Run the game on Processing and enjoy! Use mouse to click game options
   
### Media

# Gameplay!: 
<img width="607" alt="fritzdiagram" src="https://github.com/srd2178/BC3930_Module2/blob/main/media/ScreenRecording2024-11-03at4.17.00PM-ezgif.com-video-to-gif-converter.gif">
View the joystick and button in action here: https://youtu.be/ILMgdqFTuaA


# Enclosure photos (front and back view)
![frontview](https://github.com/user-attachments/assets/899dbb50-a129-451f-877d-eb01a37186f3)
![backview](https://github.com/user-attachments/assets/cfbe3006-bb35-4f8d-9fd6-0162aacc48eb)
