# Running Text LCD using Visual Basic

![Project Status](https://img.shields.io/badge/status-completed-brightgreen) [![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)

This tutorial explains how to create a running text display on an LCD using Visual Basic. The application allows users to input text, which will scroll continuously across the screen.

## Technologies Used
- **Visual Basic**: Used to develop the user interface and control logic.
- **MSComm Control**: Enables serial communication between the PC and the LCD display.
- **LCD Module**: Displays the scrolling text.

## Features
- **Dynamic Text Input**: Users can enter custom messages to be displayed.
- **Start/Stop Control**: Buttons to start and pause the scrolling text.
- **Serial Communication**: Sends text data from Visual Basic to the LCD via serial communication.
- **Reset Function**: Clears the display and stops the scrolling text.

## Demo

### **System Overview**
The system consists of a Visual Basic application that sends text to the LCD module via serial communication. The text scrolls from right to left continuously.

### **Visual Basic Form Interface**
Below is an example of the Visual Basic user interface for the running text application:

<div align="left">
  <img src="https://github.com/user-attachments/assets/53d1692d-13cf-43bf-bbe6-081b14986215" alt="Running Text" width="600">
</div>

<div align="left">
  <img src="https://github.com/user-attachments/assets/1699ca86-340d-4dbb-b304-5916aa4c40c9" alt="Running Text Interface" width="600">
</div>

### **Functionality Explanation**
- **Connect Button**: Establishes the serial communication link.
- **Disconnect Button**: Closes the connection.
- **Start Button**: Initiates text scrolling on the LCD.
- **Pause Button**: Stops the scrolling temporarily.
- **Reset Button**: Clears the LCD display and stops scrolling.
- **Exit Button**: Closes the application.

## MSComm Setup in Visual Basic
To configure MSComm for serial communication:
1. Click **Project**, select **Components** (or press **Ctrl + T**).
2. Check **Microsoft Comm Control 6.0 (SP6)** and click **OK**.
3. Configure the `CommPort` and serial settings:
   - Baudrate = 9600
   - Data = 8 bits
   - Parity = None
   - Stop bit = 1

## Installation and Usage
1. **Connect the LCD module** to the PC via serial communication.
2. **Set up MSComm** in Visual Basic.
3. **Run the application**, enter text, and control the scrolling display.

## Project Status
This project is **completed** and will not be further developed.

## Contributions
Feel free to submit an **issue** or create a **pull request** if you wish to contribute.

## License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

![WhatsApp Image 2025-03-19 at 11 27 44_0684da46]()
