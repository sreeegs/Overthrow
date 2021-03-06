private ["_shops","_active","_posTown"];

_town    = _this select 0;
_posTown = server getVariable _town;

_shops   = 0;
_active  = [];
{   
    if !(_x call hasOwner) then {
        //spawn any main shops
        if((random 100 > 20)) then {
            _shops        = _shops + 1;
            _stock        = [];
            _itemsToStock = [];
            
            _numitems     = floor(random 6) + 4;
            _count        = 0;
            
            while {_count < _numitems} do {
                _item = (AIT_allItems - AIT_illegalItems - AIT_consumableItems) call BIS_Fnc_selectRandom;
                if!(_item in _itemsToStock) then {
                    _itemsToStock pushback _item;
                    _count = _count + 1;
                };          
            };
            
            //1 Backpack
            _item = (AIT_allBackpacks) call BIS_Fnc_selectRandom;
            _itemsToStock pushback _item;       
            
            {
                _num = floor(random 5) + 1;         
                _stock pushBack [_x,_num];
            }foreach(_itemsToStock);
            {
                _num = floor(random 20) + 10;           
                _stock pushBack [_x,_num];
            }foreach(AIT_consumableItems);
            
            _active pushback [(getpos _x),_stock];
        };
    };
}foreach(nearestObjects [_posTown, AIT_shops, 700]);

server setVariable [format["shopsin%1",_town],_shops,true];
server setVariable [format["activeshopsin%1",_town],_active,true];
_active = [];
{   
    if !(_x call hasOwner) then {
        if((random 100) > 60) then {
            _pos   = getpos _x;
            _stock = [];
            {
                _cost = cost getVariable _x;
                _base = _cost select 0;
                
                _max = 20;
                if(_base > 40) then {
                    _max = 5;
                };          
                
                _num = floor(random _max);
                if(_x in AIT_consumableItems) then {
                    _num = floor(_num * 2);
                };
                if(_num > 0) then {
                    _stock pushBack [_x,_num];
                };
            }foreach(AIT_allItems + AIT_allBackpacks);
            server setVariable [format["garrison%1",(getpos _x)],2 + round(random 4),true];
            _active pushback [(getpos _x),_stock];
        };
    };
}foreach(nearestObjects [_posTown, AIT_warehouses, 700]);
server setVariable [format["activedistin%1",_town],_active,true];