# 🌦️ Weather & Time Management Script  
**Credit:** ArTeK & Cruiser  

---

## 🔍 Guide to Activating and Using the Weather and Time Script

![withcell](https://github.com/user-attachments/assets/eb09d848-b06c-48ed-8a88-ad0a372ae609)

---

### 1. Introduction to the System

- The **"time_sector"** variable is used to interact with an **ACE menu** that allows modifying the weather and time in the game.
- Currently, the system is in an **immature version**, so some features may require further development.

---

### 2. Function of the OBJ_weather_set.sqf File

- The **OBJ_weather_set.sqf** file manages the **"time_sector"** variable and all settings related to weather and time.
- This script allows users to dynamically modify atmospheric conditions during the mission via the **ACE menu**.

---

### 3. How to Enable the Script in the Mission

- To properly activate the script, add the following commands to the **init.sqf** file of the mission:

```sqf
[] execVM "weather\weather_set.sqf";
[] execVM "weather\OBJ_weather_set.sqf";

# 🎛️ Interacting with the Menu
Once the script is active, players can interact with the ACE menu to modify weather conditions during the mission.
Changes to the weather and time will occur in real-time, ensuring flexible and immediate control.
# 🔮 Future Developments
The current version is still under development, and new features may be added to improve the weather and time management experience.
Variable Name: time_sector

# 📺 Visual Previews
Live Monitor

![monitor](https://github.com/user-attachments/assets/9b99f9ee-826a-428f-8cdc-345066214034)

Device Overview

![device](https://github.com/user-attachments/assets/160648c6-46d1-4c28-a7b7-ffcb3d91878d)

Without ACE_Callphone

![withoutcell](https://github.com/user-attachments/assets/b88586fa-a217-4653-a6fd-5925ec4e48be)

With ACE_Callphone

![withcell](https://github.com/user-attachments/assets/a1d2c22b-08f9-4b91-98b2-007b02fc5310)
