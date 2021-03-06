private ["_uniqueCounter","_allspawners","_id","_start","_end"];

diag_virt = 0;
publicVariable "diag_virt";

AIT_spawnUniqueCounter = -1;

AIT_allspawners = [];

AIT_fnc_registerSpawner = {
    private ["_pos","_code","_params","_start","_end","_id"];
    _pos = _this select 0;
    _code = _this select 1;
    _params = [];
    
    
    if(count _this > 2) then {
        _params = _this select 2;
    };
    _start = [];
    _end = [];
    if((count _pos) == 2) then {
        _start = _pos select 0;
        _end = _pos select 1;       
    }else{
        _start = _pos;
        _end = _pos;
    };
        
    AIT_spawnUniqueCounter = AIT_spawnUniqueCounter + 1;

    _id = format["spawn%1",AIT_spawnUniqueCounter];
    
    spawner setvariable [_id,false,true];
    AIT_allspawners pushBack [_id,_start,_end];
    
    
    
    if(typename _code == "ARRAY")then {
        {
            [_id,_start,_end,_params] spawn _x;
        }foreach(_code);
    }else{
        [_id,_start,_end,_params] spawn _code;
    };
    AIT_spawnUniqueCounter
};
publicVariable "AIT_fnc_registerSpawner";

AIT_fnc_deregisterSpawner = {   
    _found = false;
    _idx = -1;
    {
        _idx = _idx + 1;
        _id = _x select 0;
        if(_id == _this) exitWith{_found = true};       
    }foreach(AIT_allspawners);
    if(_found) then {
        AIT_allspawners deleteAt _idx;
    };
};

AIT_fnc_updateSpawnerPosition = {   
    _changeid = _this select 0;
    _start = _this select 1;
    _end = _this select 2;

    {
        _id = _x select 0;
        if(_id == _changeid) exitWith{
            _x set[1,_start];
            _x set[2,_end];
        };      
    }foreach(AIT_allspawners);
};

_last = time;
while{true} do {
    if (time - _last >= 0.5) then {sleep 0.1} else {sleep 0.5 - (time - _last)};
    diag_virt = time - _last;
    //hint format["virt %1 @ %2",diag_virt,count AIT_allSpawners];
    _last = time;   
    {
        _id = _x select 0;
        _start = _x select 1;
        _end = _x select 2;
        _val = spawner getvariable [_id,false];
        
        if((_start select 0) == (_end select 0)) then {
            if(_val) then {
                if !(_start call inSpawnDistance) then {
                    spawner setvariable [_id,false,false];
                };
            }else{
                if (_start call inSpawnDistance) then {
                    spawner setvariable [_id,true,false];
                };
            };
        }else{
            if(_val) then {
                if !((_start call inSpawnDistance) || (_end call inSpawnDistance)) then {
                    spawner setvariable [_id,false,false];
                };
            }else{
                if ((_start call inSpawnDistance) || (_end call inSpawnDistance)) then {
                    spawner setvariable [_id,true,false];
                };
            };
        };
    }foreach(AIT_allspawners);
}