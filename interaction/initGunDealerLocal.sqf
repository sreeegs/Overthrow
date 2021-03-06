_civ = _this;

_civ addAction ["Buy", {	
	_town = (getpos player) call nearestTown; 

	_stock = server getVariable format["gunstock%1",_town];
	if(isNil "_stock") then {
		_basic = cost getVariable AIT_item_BasicGun;		
		_numguns = round(random 5)+3;
		_count = 0;
		_stock = [];
		_tostock = [];
		while {_count < _numguns} do {
			_type = AIT_allWeapons call BIS_fnc_selectRandom;
			if !(_type in _tostock) then {
				
				_tostock pushBack _type;
				_count = _count + 1;
				_cost = cost getVariable _type;
				_price = round((_cost select 0) * ((random 2) + 1));
				_stock pushBack [_type,_price];
				
				_base = [_type] call BIS_fnc_baseWeapon;
				_magazines = getArray (configFile / "CfgWeapons" / _base / "magazines");
				_price = 2;
				if(_type in AIT_allSubMachineGuns) then {
					_price = 3;
				};
				if(_type in AIT_allAssaultRifles) then {
					_price = 5;
					if((_cost select 0) > 1400) then {
						_price = 10;
					};
				};
				if(_type in AIT_allMachineGuns) then {
					_price = 12;
				};
				if(_type in AIT_allSniperRifles) then {
					_price = 20;
				};
				if(_type in AIT_allRocketLaunchers) then {
					_price = 50;
				};
				if(_type in AIT_allMissileLaunchers) then {
					_price = 100;
				};				
				_stock pushBack [_magazines call BIS_fnc_selectRandom,_price];				
			};
		};
		
		_stock pushback [AIT_ammo_50cal,25];
		
		{			
			_cost = cost getVariable _x;
			_price = _cost select 0;
			_stock pushBack [_x,_price];
		}foreach(AIT_allStaticBackpacks);
		
		{			
			_price = round(50 * ((random 1) + 1));
			_stock pushBack [_x,_price];
		}foreach(AIT_illegalItems);		
		
		server setVariable [format["gunstock%1",_town],_stock,true];
	};
	
	createDialog "AIT_dialog_buy";
	{			
		_cls = _x select 0;
		_price = _x select 1;
		_txt = _cls;
		_pic = "";
		
		call {
			if(_cls in AIT_allMagazines) exitWith {	
				_txt = format["--- %1",_cls call ISSE_Cfg_Magazine_GetName];			
				_pic = _cls call ISSE_Cfg_Magazine_GetPic;
			};
			if(_cls in AIT_allStaticBackpacks) exitWith {	
				_txt = format["--- %1",_cls call ISSE_Cfg_Vehicle_GetName];			
				_pic = _cls call ISSE_Cfg_Vehicle_GetPic;
			};			
			_txt = _cls call ISSE_Cfg_Weapons_GetName;	
			_pic = _cls call ISSE_Cfg_Weapons_GetPic;			
		};
		_idx = lbAdd [1500,format["%1",_txt]];
		lbSetData [1500,_idx,_cls];
		lbSetValue [1500,_idx,_price];
		lbSetPicture [1500,_idx,_pic];
	}foreach(_stock);

},nil,1.5,true,true,"","alive _target",5];