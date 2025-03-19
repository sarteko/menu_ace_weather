// Debug: Verifica che lo script sia eseguito
diag_log "weather_set.sqf caricato correttamente.";

// Funzione per impostare l'ora esatta
BTC_fnc_setTime = {
    params ["_hour", "_minute"];
    
    private _date = date;
    _date set [3, _hour]; 
    _date set [4, _minute]; 
    setDate _date;
    
    hint format ["Time set at: %1:%2", _hour, _minute];
    diag_log format ["DEBUG - Ora modificata: %1", _date];
};

// Funzione per impostare il meteo con transizione graduale
BTC_fnc_setWeather = {
    params ["_weatherType"];
    
    switch (_weatherType) do {
        case "Sunny": {
            15 setOvercast 0;
            15 setRain 0;
            15 setFog 0;
        };
        case "Few Clouds": {
            15 setOvercast 0.5;
            15 setRain 0;
            15 setFog 0;
        };
        case "Cloudy": {
            15 setOvercast 1;
            15 setRain 0;
            15 setFog 0;
        };
        case "Rain": {
            15 setOvercast 0.7;
            15 setRain 0.6;
            15 setFog 0.05;
        };
        case "Storm": {
            15 setOvercast 1;
            15 setRain 0.8;
            15 setLightnings 1;
            15 setFog 0.1;
        };
        case "Strong Storm": {
            15 setOvercast 1;
            15 setRain 1;
            15 setLightnings 1;
            15 setFog 0.4;
        };
    };
    
    // Mostra il messaggio meteo per 5 secondi con testo bianco e bordo nero
    titleText [format ["Weather set at: %1", _weatherType], "PLAIN DOWN", 2];
	forceWeatherChange;
};

// Sottomenu fasce orarie (versione corretta)
BTC_fnc_createTimeSubMenu = {
    private _timeOptions = [
        ["Sunset", [5, 0], "weather\ico\sunset.paa"],
        ["Morning", [11, 0], "weather\ico\morning.paa"],
        ["After Noon", [14, 0], "weather\ico\afternoon.paa"],
        ["Sunrise", [18, 0], "weather\ico\sunrise.paa"],
        ["Evening", [22, 0], "weather\ico\evening.paa"],
        ["Night", [1, 0], "weather\ico\night.paa"]
    ];

    {
        _x params ["_label", "_time", "_icon"];
        
        private _action = [
            format ["BTC_setTime_%1_%2", _time select 0, _time select 1],
            _label,
            _icon,
            {
                params ["_time"];
                [_time select 0, _time select 1] call BTC_fnc_setTime;
            },
            { true },
            {},
            [_time]
        ] call ace_interact_menu_fnc_createAction;

        [time_sector, 0, ["ACE_MainActions", "BTC_setTime"], _action] call ace_interact_menu_fnc_addActionToObject;
    } forEach _timeOptions;
};

// Sottomenu meteo (versione corretta)
BTC_fnc_createWeatherSubMenu = {
    private _weatherOptions = [
        ["Sunny", "Sunny", "weather\ico\sun.paa"],
        ["Few Clouds", "Few Clouds", "weather\ico\fclouds.paa"],
        ["Cloudy", "Cloudy", "weather\ico\clouds.paa"],
        ["Rain", "Rain", "weather\ico\rain.paa"],
        ["Storm", "Storm", "weather\ico\rain2.paa"],
        ["Strong Storm", "Strong Storm", "weather\ico\storm.paa"]
    ];

    {
        _x params ["_label", "_weatherType", "_icon"];
        
        private _action = [
            format ["BTC_setWeather_%1", _weatherType],
            _label,
            _icon,
            { [_this select 2] call BTC_fnc_setWeather },
            { true },
            {},
            _weatherType
        ] call ace_interact_menu_fnc_createAction;

        [time_sector, 0, ["ACE_MainActions", "BTC_setWeather"], _action] call ace_interact_menu_fnc_addActionToObject;
    } forEach _weatherOptions;
};

// Aggiunta delle azioni principali
[time_sector, 0, ["ACE_MainActions"], [
    "BTC_setTime", 
    "Set Time", 
    "weather\ico\clock.paa", 
    {}, 
    { true }
] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;

[time_sector, 0, ["ACE_MainActions"], [
    "BTC_setWeather", 
    "Set Weather", 
    "weather\ico\weather.paa", 
    {}, 
    { true }
] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;

// Creazione dei sottomenu
[] call BTC_fnc_createTimeSubMenu;
[] call BTC_fnc_createWeatherSubMenu;