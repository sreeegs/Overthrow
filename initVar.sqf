//Here is where you can change stuff to suit your liking or support mods/another map

AIT_spawnBlacklist = ["Georgetown","Sosovu","Tuvanaka","Belfort","Nani"]; //dont spawn in these towns
//Shop items
AIT_item_ShopRegister = "Land_CashDesk_F";//Cash registers
AIT_item_BasicGun = "hgun_Pistol_heavy_01_F";//All dealers will stock this close to cost price to ensure starting players can afford a weapon
AIT_legalItems = ["FirstAidKit","Medikit","Toolkit","ItemGPS","ItemCompass","ItemMap","ItemWatch","Binocular","Rangefinder","ItemRadio"]; //Anyone can create/buy/sell/carry these without NATO getting pissed off, all other items including mod items are considered illegal
AIT_consumableItems = ["FirstAidKit","Medikit","Toolkit"]; //Shops will try to stock more of these

//Player items
AIT_item_Main = "Land_Laptop_unfolded_F"; //object for main interactions at owned houses
AIT_item_Secondary = "Land_PortableLongRangeRadio_F"; //object for secondary interactions at owned houses (not used yet, may be a mid game thing)
AIT_items_Sleep = ["CUP_vojenska_palanda"]; //Items with the "sleep" interaction (Single player only)
AIT_items_Heal = ["Land_WaterCooler_01_old_F"]; //Where the player can heal themselves
AIT_items_Repair = ["Toolkit"]; //Inventory items that can be used to repair vehicles
AIT_items_Storage = ["B_CargoNet_01_ammo_F"]; //Where gun dealers will deliver your shit
AIT_items_Simulate = ["Box_NATO_Equip_F","Box_T_East_Wps_F","B_CargoNet_01_ammo_F","OfficeTable_01_old_F","Land_PortableLongRangeRadio_F"]; //These will be saved, position + inventory and have gravity

//NATO stuff
AIT_NATOregion = "island_5"; //where NATO lives
AIT_NATOwhitelist = ["Comms Alpha","Comms Bravo","Comms Whiskey","port"]; //NameLocal/Airport place names to definitely occupy with military personnel
AIT_NATO_priority = ["Tuvanaka Airbase","Comms Alpha"];
AIT_NATO_control = ["control_1","control_2","control_3","control_4","control_5","control_6"]; //NATO checkpoints, create markers in editor
AIT_NATO_HQ = "Tuvanaka Airbase";
AIT_NATO_HQPos = [0,0,0];

AIT_NATO_Unit_PoliceCommander = "B_Gen_Commander_F";
AIT_NATO_Unit_Police = "B_Gen_Soldier_F";
AIT_NATO_Vehicle_PoliceHeli = "B_Heli_Light_01_F"; //Used to transport the above two into towns
AIT_NATO_Unit_PoliceHeliPilot = "B_T_HeliPilot_F";
AIT_NATO_Unit_PoliceHeliCoPilot = "B_T_Helicrew_F";

//Criminal stuff
AIT_CRIM_Unit_Leader = "I_C_Soldier_Camo_F";
AIT_CRIM_Units_Bandit = ["I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_8_F"];
AIT_CRIM_Units_Para = ["I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F"];
AIT_CRIM_Vehicle_Offroad = "I_C_Offroad_02_unarmed_F";

//ECONOMY

//This is the prices table, shops will only stock these items, any others must be imported or produced and will have their costs generated automatically
//Format ["Cfg class",Base price,Steel,Wood,Plastics]

//The price of an item in a shop will be the base price + local markup (taking into account stability and player rep)
//The cost to produce an item will be the Base price - player/factory bonuses + raw materials
//The wholesale sell price of an item will be the base price - local markup
//NB: the local markup can be negative, making buy prices lower and sell prices higher, in certain situations (high stability and/or player rep)
AIT_items = [
	["FirstAidKit",10,0,0,0.1],
	["Medikit",40,0,0,0.5],
	["ToolKit",25,1,0,0],
	["ItemGPS",90,0,0,1],
	["ItemCompass",5,0.1,0,0],
	["ItemMap",1,0,0,0],
	["ItemWatch",50,0,0,1],
	["Binocular",120,0,0,1],
	["Rangefinder",280,0,0,1],
	["Laserdesignator",500,1,0,0],
	["NVGoggles",700,1,0,0],
	["ItemRadio",60,0,0,1]	
];

AIT_weapons = [
	["hgun_Pistol_heavy_01_F",80,1,0,0],
	["hgun_ACPC2_F",100,1,0,0],
	["hgun_P07_F",120,1,0,0],
	["hgun_Rook40_F",110,1,0,0],
	["hgun_PDW2000_F",410,1,0,0],
	["SMG_02_F",450,1,0,0],
	["SMG_01_F",390,1,0,0],
	["arifle_Mk20_plain_F",800,1,0,0],
	["arifle_Mk20_GL_plain_F",1520,1,0,0],
	["arifle_Mk20C_plain_F",730,1,0,0]
];

AIT_vehicles = [
	["CUP_C_Skoda_Blue_CIV",50,1,1,1],
	["CUP_C_Skoda_Green_CIV",60,1,1,1],
	["CUP_C_Skoda_Red_CIV",60,1,1,1],
	["CUP_C_Skoda_White_CIV",60,1,1,1],
	["CUP_C_Datsun",100,1,1,1],
	["CUP_C_Datsun_Covered",100,1,1,1],
	["C_Quadbike_01_F",200,1,1,1],
	["CUP_C_Golf4_black_Civ",400,1,1,1],
	["CUP_C_Golf4_blue_Civ",400,1,1,1],
	["CUP_C_Golf4_green_Civ",400,1,1,1],
	["CUP_C_Golf4_white_Civ",400,1,1,1],
	["CUP_C_Golf4_yellow_Civ",400,1,1,1],
	["CUP_C_Octavia_CIV",500,1,1,1],
	["C_SUV_01_F",600,1,1,1],
	["C_Offroad_01_F",700,1,1,1],
	["C_Offroad_02_unarmed_F",800,1,1,1],
	["C_Van_01_transport_F",1000,1,1,1],
	["C_Van_01_box_F",1000,1,1,1],
	["C_Truck_02_transport_F",1500,1,1,1],
	["C_Truck_02_covered_F",1500,1,1,1],
	["C_Truck_02_fuel_F",2000,1,1,1],
	["C_Truck_02_box_F",2500,1,1,1]
];

AIT_allVehicles = [];
AIT_allItems = [];
AIT_allWeapons = [];
AIT_allMagazines = [];

//populate the cost gamelogic with the above data so it can be accessed quickly
{
	cost setVariable [_x select 0,[_x select 1,_x select 2,_x select 3,_x select 4],true];
	AIT_allItems pushBack (_x select 0);
}foreach(AIT_items);

{
	cost setVariable [_x select 0,[_x select 1,_x select 2,_x select 3,_x select 4],true];
	AIT_allVehicles pushBack (_x select 0);
}foreach(AIT_vehicles);

{
	cost setVariable [_x select 0,[_x select 1,_x select 2,_x select 3,_x select 4],true];
	AIT_allWeapons pushBack (_x select 0);
	
	_base = [_x select 0] call BIS_fnc_baseWeapon;
	_magazines = getArray (configFile / "CfgWeapons" / _base / "magazines");
	{
		AIT_allMagazines pushBack _x;
	}foreach(_magazines);
}foreach(AIT_weapons);

publicVariable "AIT_allVehicles";
publicVariable "AIT_allItems";
publicVariable "AIT_allWeapons";
publicVariable "AIT_allMagazines";

AIT_regions = ["island_1","island_2","island_3","island_4","island_5","island_6","island_7"]; //for both economic and travel purposes. define rectangles in eden
AIT_capitals = ["Georgetown","Lijnhaven","Katkoula","Balavu","Tuvanaka","Sosovu","Ipota"]; //region capitals

AIT_mansions = ["Land_House_Big_02_F","Land_House_Big_03_F","Land_House_Small_04_F"]; //buildings that rich guys like to live in
AIT_spawnHouses = ["Land_Slum_01_F","Land_Slum_02_F","Land_GarageShelter_01_F"]; //houses where players will spawn ,"Land_Slum_01_F","Land_Slum_02_F","Land_GarageShelter_01_F"

AIT_gunDealerHouses = ["Land_Slum_01_F","Land_Slum_02_F","Land_House_Big_02_F","Land_House_Small_03_F","Land_House_Small_06_F","Land_GarageShelter_01_F","Land_House_Small_05_F"];//houses where gun dealers will spawn

AIT_crimHouses = AIT_spawnHouses + AIT_gunDealerHouses + AIT_mansions;

AIT_lowPopHouses = ["Land_House_Native_02_F","Land_House_Small_06_F","Land_House_Small_02_F","Land_House_Small_03_F","Land_Slum_01_F","Land_Slum_02_F","Land_GarageShelter_01_F","Land_Slum_04_F"]; //buildings with just 1-4 people living in them (also player start houses)
AIT_medPopHouses = ["Land_House_Native_01_F","Land_House_Big_01_F","Land_Slum_05_F","Land_House_Small_01_F","Land_Slum_03_F","Land_Slum_04_F","Land_House_Small_05_F","Land_Addon_04_F"]; //buildings with 5-10 people living in them
AIT_highPopHouses = ["Land_House_Big_04_F"]; //buildings with up to 20
AIT_hugePopHouses = ["Land_MultistoryBuilding_03_F"]; //buildings with potentially lots of people living in them
AIT_touristHouses = ["Land_House_Big_05_F"]; //hostels and the like
AIT_allShops = ["Land_Shop_Town_01_F","Land_Shop_Town_02_F","Land_Shop_Town_03_F","Land_Shop_Town_04_F","Land_Shop_Town_05_F","Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Shop_City_03_F","Land_Shop_City_04_F","Land_Shop_City_05_F","Land_Shop_City_06_F","Land_Shop_City_07_F"]; //used to calculate civ spawn positions and initial stability
AIT_markets = []; //buildings/objects that will spawn local markets (no templates required)
AIT_shops = ["Land_Shop_Town_01_F","Land_Shop_Town_03_F","Land_Shop_City_02_F","Land_Supermarket_01_F"]; //buildings that will spawn the main shops (must have a template with a cash register)
AIT_warehouses = ["Land_Warehouse_03_F"]; //buildings that will spawn local distribution centers
AIT_carShops = ["Land_FuelStation_01_workshop_F","Land_FuelStation_02_workshop_F"]; //buildings that will spawn car salesmen (must have a template with a cash register)
AIT_offices = ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_04_F"]; 

AIT_activeShops = [];
AIT_activeCarShops = [];
AIT_allTowns = [];

//get all the templates we need

{
	_filename = format["templates\houses\%1.sqf",_x];
	if(_filename call KK_fnc_fileExists) then {
		_template = call(compileFinal preProcessFileLineNumbers _filename);
		{
			if((_x select 0) in AIT_items_Simulate) then {
				_x set [8,true];
			}else{
				_x set [8,false];
			};
		}forEach(_template);
		
		templates setVariable [_x,_template,true];		
	};	
} foreach(AIT_mansions + AIT_lowPopHouses + AIT_medPopHouses + AIT_highPopHouses + AIT_shops + AIT_carShops);

{
	AIT_allTowns pushBack (text _x);
}foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameCityCapital","NameCity","NameVillage","CityCenter"], 50000]);

AIT_varInitDone = true;
publicVariable "AIT_varInitDone";