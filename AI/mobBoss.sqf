private ["_unit","_numslots","_weapon","_magazine","_base","_config"];
_unit = _this;

_unit setVariable ["mobboss",true,false];

_unit addEventHandler ["HandleDamage", {
	_me = _this select 0;
	_src = _this select 3;
	if(captive _src) then {
		if((vehicle _src) != _src or (_src call unitSeenCRIM)) then {
			_src setCaptive false;				
		};		
	};	
}];

[_unit, (AIT_faces_local call BIS_fnc_selectRandom)] remoteExec ["setFace", 0, _unit];
[_unit, (AIT_voices_local call BIS_fnc_selectRandom)] remoteExec ["setSpeaker", 0, _unit];
_unit forceAddUniform AIT_clothes_mob;

removeAllItems _unit;
removeHeadgear _unit;
removeAllWeapons _unit;
removeVest _unit;
removeAllAssignedItems _unit;

_unit addWeapon "Laserdesignator_02_ghex_F";
_unit addGoggles "G_Bandanna_beast";
_unit addHeadgear "H_Booniehat_khk_hs";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit addVest (AIT_allExpensiveVests call BIS_fnc_selectRandom);
_unit linkItem "ItemRadio";
_hour = date select 3;
if(_hour < 8 or _hour > 15) then {
	_unit linkItem "O_NVGoggles_ghex_F";
};
if(AIT_hasACE) then {
	_unit linkItem "ACE_Altimeter";
}else{
	_unit linkItem "ItemWatch";
};


_weapons = (AIT_allExpensiveRifles + AIT_allSniperRifles);
_weapon = _weapons select floor(random(count _weapons));
_base = [_weapon] call BIS_fnc_baseWeapon;
_magazine = (getArray (configFile / "CfgWeapons" / _base / "magazines")) select 0;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addMagazine _magazine;
_unit addWeapon _weapon;

_config = configfile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo";
_numslots = count(_config);
for "_i" from 0 to (_numslots-1) do {
	if (isClass (_config select _i)) then {		
		_slot = configName(_config select _i);
		_com = _config >> _slot >> "compatibleItems";
		_items = [];
		if (isClass (_com)) then {
			for "_t" from 0 to (count(_com)-1) do {
				_items pushback (configName(_com select _t));
			};
		}else{
			_items = getArray(_com);
		};		
		if(count _items > 0) then {			
			_cls = _items call BIS_fnc_selectRandom;			
			_unit addPrimaryWeaponItem _cls;
		};
	};
};


_unit addWeapon "CUP_hgun_TaurusTracker455_gold";
for "_i" from 1 to 3 do {_unit addItemToUniform "CUP_6Rnd_45ACP_M";};

