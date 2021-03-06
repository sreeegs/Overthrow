private ["_town","_count","_pop","_stability","_numVeh","_start","_road","_vehtype","_dirveh","_roadscon","_mSize","_posTown","_groups"];
if (!isServer) exitwith {};

_count = 0;

_town = _this;
_posTown = server getVariable _town;
_groups = [];

_mSize = 380;
if(_town in AIT_capitals + AIT_sprawling) then {//larger search radius
	_mSize = 700;
};

_count = 0;
_pop = server getVariable format["population%1",_town];
_stability = server getVariable format ["stability%1",_town];
_numVeh = 2;
if(_pop > 15) then {
	_numVeh = 2 + round(_pop * AIT_spawnVehiclePercentage);
};
while {(_count < _numVeh)} do {		
	_start = [[[_posTown,_mSize]]] call BIS_fnc_randomPos;
	_road = [_start] call BIS_fnc_nearestRoad;
	if (!isNull _road) then {		
		_pos = getPos _road;
		_vehtype = AIT_vehTypes_civ call BIS_Fnc_selectRandom;
		_dirveh = 0;
		_roadscon = roadsConnectedto _road;
		if (count _roadscon == 2) then {
			_dirveh = [_road, _roadscon select 0] call BIS_fnc_DirTo;
			if(isNil "_dirveh") then {_dirveh = random 359};
			_posVeh = ([_pos, 6, _dirveh + 90] call BIS_Fnc_relPos) findEmptyPosition [0,15,_vehtype];
			
			if(count _posVeh > 0) then {
				_veh = _vehtype createVehicle _posVeh;
				clearItemCargoGlobal _veh;
						
				_veh setDir _dirveh;
				_groups pushBack _veh;
				sleep 0.03;
			};
		};
	};
	_count = _count + 1;	
};
_groups