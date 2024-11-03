# BC3930_Module2

## Blog: [Module 2 Project - Snake]([https://spotted-cayenne-502.notion.site/Module-2-Project-Sanrio-Space-Invaders-12b28a677bce809c89b8e704d8e946c2](https://incongruous-literature-ab3.notion.site/Module-2-Project-Documentation-121b01346aae80409711c275d86a3efa?pvs=4))

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

`/jotstickAndButton` - arduino file called lab2.ino is located here and has the code that is for establishing serial communication for ESP32 board 

- `lab2.ino` - arduino file with code for serial communication with ESP32

`/enclosure` - has files for enclosure design that were used to laser cut

`/snake` - folder with file to Processing file with the snake game

- `sushsnake.pde` - processing file with space invaders code
  
### Fritzing Diagram

<img width="607" alt="fritzdiagram" src="https://github.com/user-attachments/assets/df4b17f3-2255-42ab-8668-069a451cace2">


### Setup
1. Follow the Fritzing diagram and add your button, joystick, wires, and ESP32 board to the breadboard
2. Connect your ESP32 board to your computer via a USB-C cord
3. Download the `/arduinoButtonAndJoystick` and `/sanrioinvaders` folders
4. Open these folders in the Arduino IDE application and Processing application, respectively
5. Confirm that your ESP32 board connects to the Arduino application by running the arduino code file `buttonjoystick.ino` (you should see printed values read from the serial communication)
6. Open the `sanrioinvaders.pde` from the `/sanrioinvaders` folder in the Processing application and ensure that it runs and complies
8. Once a screen pops up from the Processing application go ahead and press "s" on the keyboard to start!
   
~ *Feel free to make any edits to the code after downloading and experiment on your own!* ~
### Media

# Game Play video: 
https://github.com/user-attachments/assets/5a80bb89-0fcb-4d04-890f-efea8de33748

# Enclosure photos (front and back view)
![frontview](https://github.com/user-attachments/assets/899dbb50-a129-451f-877d-eb01a37186f3)
![backview](https://github.com/user-attachments/assets/cfbe3006-bb35-4f8d-9fd6-0162aacc48eb)
