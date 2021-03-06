if !(captive player) exitWith {"You cannot buy buildings while wanted" call notify_minor};

_b = player call getNearestRealEstate;
_handled = false;
_type = "buy";
_err = false;
if(typename _b == "ARRAY") then {
	_building = (_b select 0);
	if !(_building call hasOwner) then {
		_handled = true;
	}else{
		_owner = _building getVariable "owner";
		if(_owner == getplayeruid player) then {
			_home = player getVariable "home";
			if(_home == _building) exitWith {"You cannot sell your home" call notify_minor;_err = true};
			_type = "sell";
			_handled = true;
		};		
	};
};
if(_err) exitWith {};
if(_handled) then {
	_building = _b select 0;
	_price = _b select 1;
	_sell = _b select 2;
	_lease = _b select 3;
	_totaloccupants = _b select 4;

	_money = player getVariable "money";
	
	if(_type == "buy" and _money < _price) exitWith {"You cannot afford that" call notify_minor};

	playSound "3DEN_notificationDefault";
	_mrkid = format["bought%1",str(_building)];
	_owned = player getVariable "owned";
	
	if(_type == "buy") then {
		_building setVariable ["owner",getPlayerUID player,true];
		player setVariable ["money",_money-_price,true];
		
		_mrk = createMarkerLocal [_mrkid,getpos _building];
		_mrk setMarkerShape "ICON";
		_mrk setMarkerType "loc_Tourism";
		_mrk setMarkerColor "ColorWhite";
		_mrk setMarkerAlpha 0;
		_mrk setMarkerAlphaLocal 1;
		_owned pushback _building;
		"Building purchased" call notify_minor;
		if(_price > 10000) then {
			[_town,round(_price / 10000)] call standing;		
		};
	}else{
		_building setVariable ["owner",nil,true];
		deleteMarker _mrkid;
		_owned deleteAt (_owned find _building);
		"Building sold" call notify_minor;
		player setVariable ["money",_money+_sell,true];
	};
	
	player setVariable ["owned",_owned,true];
		
	
}else{
	"There are no buildings for sale nearby" call notify_minor;
};

