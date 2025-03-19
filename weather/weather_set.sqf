// Weather Control Script - Simplified Version
diag_log "weather_control.sqf caricato correttamente.";

// Classname dell'oggetto che serve per controllare il meteo
BTC_weatherControlItem = "ACE_Cellphone"; // MODIFICA QUESTO con il classname dell'oggetto che vuoi usare

// Funzione per impostare l'ora
BTC_fnc_setTime = {
    params ["_hour", "_minute"];
    
    private _date = date;
    _date set [3, _hour]; 
    _date set [4, _minute]; 
    setDate _date;
    
    hint format ["Ora impostata a: %1:%2", _hour, _minute];
};

// Funzione per impostare il meteo
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
    
    hint format ["Meteo impostato a: %1", _weatherType];
    forceWeatherChange;
};

// Funzione per verificare se il giocatore ha l'oggetto
BTC_fnc_hasWeatherDevice = {
    BTC_weatherControlItem in (items player)
};

// Inizializza le azioni nel menu self-interaction
[] spawn {
    waitUntil {!isNull player && time > 0};
    
    // Aggiungi menu Time
    _timeAction = ["BTC_TimeMenu", "Set Time", "weather\ico\clock.paa", {}, {call BTC_fnc_hasWeatherDevice}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _timeAction] call ace_interact_menu_fnc_addActionToObject;
    
    // Aggiungi menu Weather
    _weatherAction = ["BTC_WeatherMenu", "Set Weather", "weather\ico\weather.paa", {}, {call BTC_fnc_hasWeatherDevice}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _weatherAction] call ace_interact_menu_fnc_addActionToObject;
    
    // Aggiungi opzioni Time
    _timeOptions = [
        ["Sunset", [05, 00], "weather\ico\sunset.paa"],
        ["Morning", [09, 0], "weather\ico\morning.paa"],
        ["Noon", [12, 0], "weather\ico\afternoon.paa"],
        ["After Noon", [15, 00], "weather\ico\afternoon.paa"],
        ["Sunrise", [18, 00], "weather\ico\sunrise.paa"],
        ["Evening", [22, 0], "weather\ico\evening.paa"],
        ["Night", [01, 0], "weather\ico\night.paa"]
    ];
    
    {
        _x params ["_name", "_time", "_icon"];
        _action = [
            format ["BTC_Time_%1", _name],
            _name,
            _icon,
            {
                params ["_target", "_player", "_params"];
                _params params ["_hour", "_minute"];
                [_hour, _minute] call BTC_fnc_setTime;
            },
            {call BTC_fnc_hasWeatherDevice},
            {},
            _time
        ] call ace_interact_menu_fnc_createAction;
        
        [player, 1, ["ACE_SelfActions", "BTC_TimeMenu"], _action] call ace_interact_menu_fnc_addActionToObject;
    } forEach _timeOptions;
    
    // Aggiungi opzioni Weather
    _weatherOptions = [
        ["Sunny", "Sunny", "weather\ico\sun.paa"],
        ["Few Clouds", "Few Clouds", "weather\ico\fclouds.paa"],
        ["Cloudy", "Cloudy", "weather\ico\clouds.paa"],
        ["Rain", "Rain", "weather\ico\rain.paa"],
        ["Storm", "Storm", "weather\ico\storm.paa"],
        ["Strong Storm", "Strong Storm", "weather\ico\storm.paa"]

    ];
    
    {
        _x params ["_name", "_type", "_icon"];
        _action = [
            format ["BTC_Weather_%1", _name],
            _name,
            _icon,
            {
                params ["_target", "_player", "_weatherType"];
                [_weatherType] call BTC_fnc_setWeather;
            },
            {call BTC_fnc_hasWeatherDevice},
            {},
            _type
        ] call ace_interact_menu_fnc_createAction;
        
        [player, 1, ["ACE_SelfActions", "BTC_WeatherMenu"], _action] call ace_interact_menu_fnc_addActionToObject;
    } forEach _weatherOptions;
};

// Aggiungi questo al tuo init.sqf o initPlayerLocal.sqf