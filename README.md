# 🌦️ Weather & Time Management Script  
**Credit:** *ArTeK & Cruiser*  

---

## 📌 Introduction  

The **Weather & Time Management Script** allows players to dynamically control in-game **weather and time** through the **ACE menu**.  

### ⚙️ System Overview  
- The **"time_sector"** variable is used to interact with the **ACE menu**, enabling weather and time adjustments.  
- Currently, the system is in an **early development stage**, and some features may require further improvements.  

📷 **In-game Menu Preview:**  
![Weather Menu](https://github.com/user-attachments/assets/eb09d848-b06c-48ed-8a88-ad0a372ae609)  

---

## 📂 Script Functionality  

### 🔹 Function of `OBJ_weather_set.sqf`  
- The `OBJ_weather_set.sqf` file manages the **"time_sector"** variable and all related **weather and time settings**.  
- This script allows **real-time** atmospheric changes via the **ACE menu**.  

📷 **Live Weather Control Preview:**  
![monitor](https://github.com/user-attachments/assets/4037fb79-3d5d-4bd1-b86e-855fef5ea8c9)  

---

## 🚀 How to Enable the Script  

To properly activate the script, add the following lines to your **`init.sqf`** file:  

```sqf
[] execVM "weather\weather_set.sqf";
[] execVM "weather\OBJ_weather_set.sqf";
