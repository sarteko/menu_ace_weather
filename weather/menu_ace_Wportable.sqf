// Funzione che aggiunge azioni personalizzate agli oggetti
// Eseguito all'inizio per aggiungere azioni a tutti gli oggetti che necessitano

// Controllo se time_sector esiste già per il giocatore
private _existingMenu = (player getVariable ["time_sector", nil]);

if (isNull _existingMenu) then {
    // Se il menu non esiste, creiamo il menu per questo giocatore

    // Aggiungi azione all'oggetto SmartPhone
    private _item = nearestObject [player, "Item_SmartPhone"];  // Trova l'oggetto più vicino "Item_SmartPhone"
    
    if (!isNull _item) then {
        _item addAction ["Interact with SmartPhone", {
            hint "Hai interagito con lo SmartPhone!";
            // Aggiungi qui qualsiasi funzione che desideri venga eseguita quando si interagisce con lo SmartPhone
            [] call BTC_fnc_addToACE_Menu;  // Chiamata alla funzione che aggiunge le opzioni personalizzate al menu
        }];
    };

    // Ora impostiamo le variabili per time_sector
    player setVariable ["time_sector", true];

    // Aggiungi azioni al menu ACE per impostare tempo e meteo
    [time_sector, 0, ["ACE_MainActions"], [
        "BTC_setTime", 
        "Imposta Ora", 
        "weather\ico\clock.paa", 
        {}, 
        { true }
    ] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;

    [time_sector, 0, ["ACE_MainActions"], [
        "BTC_setWeather", 
        "Imposta Meteo", 
        "weather\ico\weather.paa", 
        {}, 
        { true }
    ] call ace_interact_menu_fnc_createAction] call ace_interact_menu_fnc_addActionToObject;

    // Crea il sottomenu con le opzioni ora e meteo
    [] call BTC_fnc_createTimeSubMenu;
    [] call BTC_fnc_createWeatherSubMenu;
} else {
    // Se time_sector esiste già, non fare nulla (evita la duplicazione)
    hint "Il menu è già stato aggiunto!";
};
