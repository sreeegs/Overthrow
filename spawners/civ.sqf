private ["_id","_params","_town","_posTown","_groups","_numCiv","_shops","_houses","_stability","_pop","_count","_mSize","_civTypes","_hour","_range","_found"];

_count = 0;
_town = _this;
_groups = [];
			
_pop = server getVariable format["population%1",_town];
_stability = server getVariable format ["stability%1",_town];
_posTown = server getVariable _town;

_mSize = 350;
if(_town in AIT_capitals) then {
	_mSize = 800;
};

if(_pop > 15) then {
	_numCiv = round(_pop * AIT_spawnCivPercentage);
	if(_numCiv < 5) then {
		_numCiv = 5;
	};
}else {
	_numCiv = _pop;
};

_hour = date select 3;


_count = 0;

_pergroup = 2;
if(_numCiv < 10) then {_pergroup = 1};
if(_numCiv > 30) then {_pergroup = 3};
if(_numCiv > 50) then {_pergroup = 4};
if(_numCiv > 70) then {_pergroup = 5};
if(_numCiv > 100) then {_pergroup = 8};
_idd = 1;
while {_count < _numCiv} do {
	_groupcount = 0;
	_group = createGroup civilian;
	_group setBehaviour "SAFE";
	_groups pushback _group;
	_group setGroupId [format["%1 %2-1",_town,_idd],""];
	_idd = _idd + 1;
	
	//Give this group a "home"
	_home = [[[_posTown,_mSize]]] call BIS_fnc_randomPos;			
	while {(_groupcount < _pergroup) and (_count < _numCiv)} do {
		_pos = [[[_home,50]]] call BIS_fnc_randomPos;
		
		_civ = _group createUnit [AIT_civType_local, _pos, [],0, "NONE"];
		_civ setBehaviour "SAFE";
		[_civ] call initCivilian;		
		_count = _count + 1;
		_groupcount = _groupcount + 1;
	};
	[_group,_home] call civilianGroup;
	if((_hour > 18 and _hour < 23) or (_hour < 9 and _hour > 5)) then {
		//Put a light on at home
		_pos = getpos _home;
		_light = "#lightpoint" createVehicle [_pos select 0,_pos select 1,(_pos select 2)+2.2];
		_light setLightBrightness 0.09;
		_light setLightAmbient[.9, .9, .6];
		_light setLightColor[.5, .5, .4];
		_groups pushback _light;
	};	
	sleep (0.01 * _pergroup);
};	
_groups