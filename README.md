Guide to Activating and Using the Weather and Time Script
1.	Introduction to the System
o	The "time_sector" variable is used to interact with an ACE menu that allows modifying the weather and time in the game.
o	Currently, the system is in an immature version, so some features may require further development.
2.	Function of the OBJ_weather_set.sqf File
o	The OBJ_weather_set.sqf file manages the "time_sector" variable and all settings related to weather and time.
o	This script allows users to dynamically modify atmospheric conditions during the mission via the ACE menu.
o	Additionally, the menu can be activated through a specific device, namely the ACE_Callphone, available through the Arsenal.
3.	How to Enable the Script in the Mission
o	To properly activate the script, the following command must be added to the init.sqf file of the mission:

[] execVM "weather\weather_set.sqf";
[] execVM "weather\OBJ_weather_set.sqf";

o	This command ensures that the script is executed at mission startup, enabling dynamic weather and time management.

4.	Interacting with the Menu
o	Once the script is active, players can interact with the ACE menu to modify weather conditions during the mission.
o	Changes to the weather and time will occur in real-time, ensuring flexible and immediate control.

5.	Future Developments
o	The current version is still under development, and new features may be added to improve the weather and time management experience.
Nome Variabile: time_sector
 

![monitor](https://github.com/user-attachments/assets/aa329b25-1909-44fd-bc0e-dabbdea5862b)

 

Device
![device](https://github.com/user-attachments/assets/9ccbecc9-168f-4fe4-a4c0-59a137490c6d)








with ACE_Callphoone/without ACE_Callphone

  
