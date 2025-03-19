Guide to Activating and Using the Weather and Time Script

![withcell](https://github.com/user-attachments/assets/eb09d848-b06c-48ed-8a88-ad0a372ae609)

1.	Introduction to the System

o	The "time_sector" variable is used to interact with an ACE menu that allows modifying the weather and time in the game.
o	Currently, the system is in an immature version, so some features may require further development.

2.	Function of the OBJ_weather_set.sqf File

o	The OBJ_weather_set.sqf file manages the "time_sector" variable and all settings related to weather and time.
o	This script allows users to dynamically modify atmospheric conditions during the mission via the ACE menu.

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
 
![monitor](https://github.com/user-attachments/assets/4037fb79-3d5d-4bd1-b86e-855fef5ea8c9)

Device

![device](https://github.com/user-attachments/assets/9ccbecc9-168f-4fe4-a4c0-59a137490c6d)

without ACE_Callphone

![withoutcell](https://github.com/user-attachments/assets/ecc9f1d4-f546-4397-9cfe-31f3f6b6794b)

with ACE_Callphoone

![withcell](https://github.com/user-attachments/assets/af47a3bb-c0eb-4146-ab7d-dbc1fcfcc0fb)


  
