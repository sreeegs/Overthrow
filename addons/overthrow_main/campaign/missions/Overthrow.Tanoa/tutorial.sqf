hint "Get familiar with the basic controls, then press Y to continue";
sleep 0.1;

private _txt = "<t align='right'><t size='0.6' color='#ffffff'>Basic Controls</t><br/>";

_txt = format ["%1<t size='0.4' color='#ffffff'>Move Forward  <t size='0.6'>%2</t></t><br/>",_txt,"MoveForward" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Move Back  <t size='0.6'>%2</t></t><br/>",_txt,"MoveBack" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Move Left  <t size='0.6'>%2</t></t><br/>",_txt,"TurnLeft" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Move Right  <t size='0.6'>%2</t></t><br/><br/>",_txt,"TurnRight" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Open Inventory  <t size='0.6'>%2</t></t><br/>",_txt,"Gear" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Open Map  <t size='0.6'>%2</t></t><br/>",_txt,"ShowMap" call assignedKey];
_txt = format ["%1<t size='0.4' color='#ffffff'>Main Menu  <t size='0.6'>Y</t></t><br/>",_txt];
_txt = format ["%1<t size='0.4' color='#ffffff'>Go Back  <t size='0.6'>Esc</t></t><br/>",_txt];

_txt = format["%1</t>",_txt];

[_txt, 0.25, 0.2, 120, 1, 0, 2] spawn bis_fnc_dynamicText;

menuHandler = {
	hint format["Take some time to explore the main menu, when you're finished open the map (%1 key)","ShowMap" call assignedKey];	
	menuHandler = {};
	
	private _txt = "<t align='center'><t size='0.6' color='#ffffff'>Main Menu</t><br/><br/>";
	_txt = format ["%1<t size='0.5' color='#ffffff'>From here you can perform basic actions such as recruiting civilians or fast travelling to buildings you own, friendly bases and camps that you place. As you can see on the bottom right, this shack is owned by you, so you can therefore fast travel back here when you need to, but not while wanted.<br/><br/>To continue, close this menu (Esc) and open the map (%2 key)</t>",_txt,"ShowMap" call assignedKey];
	sleep 3;
	[_txt, 0, 0.2, 120, 1, 0, 2] spawn bis_fnc_dynamicText;
	
	waitUntil {sleep 1; visibleMap};

	hint format["Holding RMB will pan the map, zoom with the scrollwheel. When you are finished exploring the map, close it with the Esc key.","Action" call assignedKey];	
	sleep 3;
	_txt = "<t align='left'><t size='0.6' color='#000000'>Stability</t><br/>";
	_txt = format ["%1<t size='0.5' color='#000000'>Red areas indicate towns where stability is lowest. Blue icons indicate known NATO installations.</t><br/><br/>",_txt];
	_txt = format ["%1<t size='0.4' color='#101010'>This is Tanoa, a small island nation in the South Pacific with a long history of British and French colonial occupation. Currently under occupation by NATO forces, the nation has been under intense scrutiny by the media and international politicians since a tyrant was removed in 2020, with many conspiracy theories abound as to the future of the small but conveniently located archipelago.",_txt];
	_txt = format ["%1A massive protest against continued NATO occupation took place in the nation's capital Georgetown and the spokesperson for the 'Free Tanoa' movement was assasinated in cold blood by an unknown assailant. In response to the event NATO forces have issued a strict curfew and increased security to extreme levels; fuelling tension and conspiracy theories even further.<br/><br/></t>",_txt];
			
	[_txt, -0.5, 0.5, 240, 1, 0, 2] spawn bis_fnc_dynamicText;
	
	waitUntil {sleep 1; !visibleMap};
	hint "";
	sleep 3;
	
	_txt = "<t align='center'><t size='0.6' color='#ffffff'>Doing stuff</t><br/>";
	_txt = format ["%1<t size='0.5' color='#ffffff'>Some objects, including most of the ones in your shack, have actions that you can perform on them. Try it out by moving towards one of them and using your scroll wheel or pressing %2 to open the action menu. Select an item with your scroll wheel and then use %2 or middle mouse button to perform the action.</t><br/><br/>",_txt,"Action" call assignedKey];
	
	[_txt, 0, 0.2, 20, 1, 0, 2] spawn bis_fnc_dynamicText;
	
	sleep 20;
	_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];	
	_whendone = {
		_lines = [
			"Hello? Do I know you?",
			format ["No you don't. My name is %1 and I heard that you might be able to help me",name player],
			"Oh, really? Well that depends. With what?"
		];
		
		_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];
		_done = {
			_options = [
				[
					"I am sick of NATO pushing us around, what can I do about it?",
					{
						_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];
						private _end = {						
							hint format["The gun is in your pocket, you can equip it in your inventory (%1 key) by dragging it to your hands. But be careful, if NATO sees any weapons they will open fire on you, so best to keep it where it is until you uh... 'need' it", "Gear" call assignedKey]
						};
						[player,_gundealer,[(_this select 0),"I hear you. I bet it was even them who shot the protester... I tell you what, take this spare pistol I have laying around.","What am I supposed to do with this?","I don't know. But every other guy that's come in here recently that was angry with NATO wanted a gun, and I won't ask questions.","Um.. thanks I guess","No problem, just come back if you need more ammunition or anything else the stores won't sell you."],_end] spawn doConversation;					
						player addItemToUniform OT_item_BasicGun;
						player addItemToUniform OT_item_BasicAmmo;
						player addItemToUniform OT_item_BasicAmmo;
						player addItemToUniform OT_item_BasicAmmo;
					}
				],
				[
					"There's too much crime in Tanoa, and NATO isn't doing anything about it",
					{
						_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];
						private _end = {						
							hint format["The gun is in your pocket, you can equip it in your inventory (%1 key) by dragging it to your hands. But be careful, if NATO sees any weapons they will open fire on you. Bounties can be found by accessing 'Most Wanted' on the map in your home.", "Gear" call assignedKey]
						};
						[player,_gundealer,[(_this select 0),"I agree. I bet it was even them who shot the protester... I tell you what, take this spare pistol I have laying around.","What am I supposed to do with this?","Local businessmen are always setting bounties on the gang leaders around Tanoa, go and claim a few!","Alright.. thanks","No problem, just come back if you need more ammunition or anything else the stores won't sell you."],_end] spawn doConversation;					
						player addItemToUniform OT_item_BasicGun;
						player addItemToUniform OT_item_BasicAmmo;
						player addItemToUniform OT_item_BasicAmmo;
						player addItemToUniform OT_item_BasicAmmo;
					}
				],
				[
					"I want to make some cash, and I don't care about breaking the law",
					{
						_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];
						private _end = {						
							hint format["The drugs are in your pocket, you can see it in your inventory (%1 key). Try selling it to the civilians, larger towns fetch higher prices. But be careful, if NATO searches you and finds any they will confiscate it.", "Gear" call assignedKey]
						};
						[player,_gundealer,[(_this select 0),"Probably a good idea with everything that's happening. I tell you what, take this spare bud I have laying around.","What am I supposed to do with this?","Sell it to some of the civilians round here, maybe it will calm them down","Um.. thanks I guess","No problem, just come back if you need more, or anything else the stores won't sell you."],_end] spawn doConversation;					
						player addItemToUniform "OT_Ganja";
					}
				],
				[
					"I want to make some cash, legally",
					{
						_gundealer = spawner getVariable format["gundealer%1",(getpos player) call nearestTown];
						private _end = {						
							hint format["The items are in your pocket, you can see it in your inventory (%1 key). Balavu, Rautake and Tavu have shops that will buy them from you as well as locations all over Tanoa. Towns with lower stability will pay higher prices for all items.", "Gear" call assignedKey]
						};
						[player,_gundealer,[(_this select 0),"Well I'm not really the guy to help you there, but I have these items laying around","What am I supposed to do with these?","Take them to a shop and sell them I guess"],_end] spawn doConversation;					
						player addItemToUniform "ItemRadio";
						player addItemToUniform "ItemWatch";
					}
				]
			];
		
			_options spawn playerDecision;
		};
		[_gundealer,player,_lines,_done] spawn doConversation;
	};
	
	[player,getpos _gundealer,"Find the local dealer","Apparently the spokesperson of the 'Free Tanoa' movement was murdered at the protest last night. I don't know what's going on with this country anymore. I need some answers, and I think I know who could have them.",_whendone] spawn assignMission;
	sleep 3;
	hint format["You just recieved a task. To check it out open the map (%1 key) and click on 'Tasks'","ShowMap" call assignedKey];	
	waitUntil {sleep 1; visibleMap};
	sleep 3;
	hint format ["You can 'assign' the task once you find it, or shift-click on the map to give yourself a waypoint.\n\nWhen you're ready close the map with Esc or '%1' key.", "ShowMap" call assignedKey];
	
	waitUntil {sleep 1; !visibleMap};
	sleep 3;
	hint "Head towards the marked location, you have nothing to worry about as long as you are not carrying/wearing any illegal items.";
};

