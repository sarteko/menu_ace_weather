# 🌦️ Weather & Time Management Script  
**Credit:** *ArTeK & Cruiser*  

---

## 📌 Introduction  

The **Weather & Time Management Script** allows players to dynamically control in-game weather and time through the **ACE menu**.  

### ⚙️ System Overview  
- The **"time_sector"** variable is used to interact with the **ACE menu**, enabling weather and time adjustments.  
- Currently, the system is in an **early development stage**, and some features may require further improvements.  

---

## 📂 Script Functionality  

### 🔹 Function of `OBJ_weather_set.sqf`  
- The `OBJ_weather_set.sqf` file manages the **"time_sector"** variable and all related weather and time settings.  
- The script allows **real-time** changes to atmospheric conditions via the **ACE menu**.  
- Additionally, `weather_set.sqf` **manages the activation of the ACE_Callphone**, ensuring that only players with the device can access the **weather control menu**.  

---

## 🚀 How to Enable the Script  

To properly activate the script, add the following lines to your **`init.sqf`** file:  

```sqf
[] execVM "weather\weather_set.sqf";
[] execVM "weather\OBJ_weather_set.sqf";
