gooncorp_frameworktest = {
hint "test for framework hardlink successful, its actually a shortcut! C: drive updated!";
};



gooncorp_playanimationglobally = {
if (playinganimation || vehicle player != player) exitwith {playinganimation = false;
xxx = player;
publicvariable "xxx";
sleep .3;
[{
xxx switchmove "";
xxx switchmove "";
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
xxx = player;
publicvariable "xxx";
xanim = (_this select 0);
publicvariable "xanim";
playinanimation = true;
sleep .3;
[{
xxx switchmove xanim;
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};


gooncorp_straightenbuildings = {	
if (!isnil "center") then {
areaobjects = nearestObjects [center, [], 1200];
{
_x setVectorUp [0,0,1];
} foreach areaobjects;
};
};

gooncorp_placemarkersatallbuildings = {	
x = 0;
if (ismultiplayer && isserver) exitwith {};
if (!isnil "center") then {
_areaobjects = nearestObjects [center, ["Building"], 1200];
{
x = x + 1;
_name = format ["markername%1", x];
_markerstr = createMarkerLocal [_name,[position _x select 0,position _x select 1]];
//_name setMarkerShape "ICON";
//_name setMarkerType "hd_dot";
_name setMarkerShapeLocal "RECTANGLE";
_name  setMarkerSizeLocal [5, 5];
_name  setMarkerDirLocal getdir _x;
} foreach _areaobjects;
};
};

gooncorp_destroygrass = {	
hint "destroying grass!";
if (!isnil "center") then {
_areaobjects2 = nearestObjects [center, [], 1200];
{
deletevehicle _x;
hideobject _x;
deleteCollection _x;
} foreach _areaobjects2;
};
};



gooncorp_assignboatpositions = {// puts people in boat safely negating jip broken features
if (!isnil "sl1") then {
if (player == sl1) then {
player moveindriver boat1;
};
};
if (!isnil "m1") then {
if (player == m1) then {
player moveInCargo [boat1, 2];
};
};
if (!isnil "mg1") then {
if (player == mg1) then {
player moveInCargo [boat1, 3];
};
};
if (!isnil "eng1") then {
if (player == eng1) then {
player moveInCargo [boat1, 1];
};
};
if (!isnil "rif1") then {
if (player == rif1) then {
player moveInCargo [boat1, 0];
};
};
if (!isnil "sl2") then {
if (player == sl2) then {
player moveindriver boat2;
};
};
if (!isnil "m2") then {
if (player == m2) then {
player moveInCargo [boat2, 0];
};
};
if (!isnil "mg2") then {
if (player == mg2) then {
player moveInCargo [boat2, 2];
};
};
if (!isnil "eng2") then {
if (player == eng2) then {
player moveInCargo [boat2, 3];
};
};
if (!isnil "rif2") then {
if (player == rif2) then {
player moveInCargo [boat2, 1];
};
};
if (!isnil "sl3") then {
if (player == sl3) then {
player moveindriver boat3;
};
};
if (!isnil "m3") then {
if (player == m3) then {
player moveInCargo [boat3, 0];
};
};
if (!isnil "mg3") then {
if (player == mg3) then {
player moveInCargo [boat3, 2];
};
};
if (!isnil "eng3") then {
if (player == eng3) then {
player moveInCargo [boat3, 3];
};
};
if (!isnil "rif3") then {
if (player == rif3) then {
player moveInCargo [boat3, 1];
};
};
};





gooncorp_spectate = {
//[] execVM "spectator.sqf";
};
gooncorp_debugging_toggle = {
if (debug) then {debug = false;hint "GOONCORP_DEBUGGING DEACTIVATED";} else {debug = true; _handle = [] spawn gooncorp_debug;hint "GOONCORP_DEBUGGING ACTIVATED";};
};

gooncorp_debugging_helpmenu = {
hint "GOONCORP_DEBUGGING MENU COMMANDS: \n\ncontrol shift - d		(toggle debug menu) \n\ncontrol shift - f		(melee attack) \n\ncontrol shift - h		(fix headbug) \n\ncontrol shift r		(reset gear)\ncontrol shift s		(spectate)";
};




gooncorp_keypress = {
//written by gooncorp
// do not copy unless you put my name in your briefing credits
private ["_phandler"];
sleep 1;
_pHandler = (findDisplay 46) displayAddEventHandler ["keydown", "
	if ((_this select 1) in [0x20] && (_this select 2) && (_this select 3) ) then
	{
	call gooncorp_debugging_toggle;
	};	
	if ((_this select 1) in [0x3B] && (_this select 2) && (_this select 3)) then
	{
	call gooncorp_debugging_helpmenu;
	};	
		if ((_this select 1) in [0x1F] && (_this select 2) && (_this select 3)) then
	{
	call gooncorp_specate;
	};
	
		if ((_this select 1) in [0x12]  && (_this select 2)) then
	{
	_handle = [] spawn  gooncorp_stab;

	};

		if ((_this select 1) in [0x52]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x4F]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_A_M04_briefing""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x50]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_HeliCargoTalking_loop""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x51]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_SittingWounded_wave""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x4B]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_EpicSplit""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x4C]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_Abuse_abuser""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x4D]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_CrouchGetLowGesture""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x47]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_Kore_PointingForward""] spawn gooncorp_playanimationglobally ;
	};
		
		if ((_this select 1) in [0x48]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_PknlMstpSlowWrflDnon""] spawn gooncorp_playanimationglobally ;
	};
		
		if ((_this select 1) in [0x49]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""passenger_injured_medevac_truck02""] spawn gooncorp_playanimationglobally ;
	};
"];
};






gooncorp_stab = {
hint "stabbing";
_objects = (position player) nearEntities [["Man"], 2];
hasStabbed = false;
{
if (side _x != (side player) && alive _x) exitwith {
hasStabbed = true;
rNum = floor random 4;
if (rNum == 0) then {
player globalchat "Eat it!";};
if (rNum == 1) then {
player globalchat "Die!";};
if (rNum == 2) then {
player globalchat "Take cold steel!";};
if (rNum == 3) then {
player globalchat "Your life has ended.";};
	strangler = player;
	victim = _x;		
	myscore = score player;
	myscore = myscore + 1;
	publicvariable "strangler";
	publicvariable "victim";
	publicvariable "myscore";
	sleep .27;
	//[{
	//},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;	
	[{
//victim say3d "Splat";		
strangler switchmove "AwopPercMstpSgthWpstDnon_Part4";
strangler attachto [victim, [0, -.7, 0]];
sleep .1;
chuck = victim;
lal = random 330;
val = round lal;
if (player distance chuck <150) then {
	//chuck say3d format ["ACE_scream%1",val];
};
               obj = vehicle victim;
               pos = position obj;
               magracity = [0,0,.1];
               color = [.5, 0, 0];
               alpha = .7;
               ps11 = "#particlesource" createVehicleLocal pos;  
               ps11 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 4, 12], "", "Billboard", 1, 2, [0, 0, .6], wind, 1, 2, 1, 0, [.004 + (random .02)], [color + [0], color + [alpha], color + [0]], [1000], 1, 1, "", "", obj];
               ps11 setParticleRandom [.1, [0, 0, 1], [random 1, random 1, 1.5], 1, 0, [0, 0, .2, 1.1], 0, 1];
               ps11 setParticleCircle [0, [0, 0, 0]];
               ps11 setDropInterval .01;		
	victim switchmove "c5efe_AlexDeath";
	sleep .9;
	strangler switchmove "";
	detach strangler;
	ps11 setpos getpos victim;
	strangler addscore 1;
	sleep .2;	
victim setdammage 2;
deletevehicle ps11;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
} foreach _objects;
if (!hasStabbed) then {
rNum = floor random 4;
if (rNum == 0) then {
player globalchat "Stab who, yourself?";};
if (rNum == 1) then {
player globalchat "No one is around...";};
if (rNum == 2) then {
player globalchat "You cannot see any enemies nearby.";};
if (rNum == 3) then {
player globalchat "You really like playing with knives dont you?";};
};
};






gooncorp_tvt_scoresimple =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = ["end4"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount < (_this select 0) && !ended) then {
		ended = true;
		[{_handle = ["end3"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;	
		};
	sleep 10;
	};
};


gooncorp_coop_scoresimple =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = [] spawn gooncorp_warriorending_lose;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount < (_this select 0) && !ended) then {
		ended = true;
		[{_handle = ["end2"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;	
		};
	sleep 10;
	if (random 1 < .2) then {
	[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	};
	};
};




gooncorp_debug = {
while {true} do {
if (!debug) exitWith {hint "STOPPING DEBUG!";};
totalOpfor = 0;
totalBlufor = 0;
{
if (side _x == east && alive _x) then {
totalOpfor = totalOpfor + 1;
};
if (side _x == west && alive _x) then {
totalBlufor = totalBlufor + 1;
};
} foreach allunits;
hintsilent format ["GOONCORP DEBUGGING: \n \n pos:%1 \n  magazine count : %2 \n all units: %3 \n total blufor count: %4 \n total opfor count: %5 \n time: %6 \n damage taken: %7 \n classname: %8 \n faction: %9 \n group count: %10", position player, 
count magazines player, count allunits, totalBlufor, totalOpfor, time, damage player, typeof player, side player, count units (group player)];
sleep 4;
};
};


gooncorp_blackin = {
titlecut ["You are on an elite Vietnam Special Forces Team.", "black in", 10];
};













gooncorp_enemyweapons = {
if (!isserver) exitwith {};
{
if (side _x == east) then {
sleep .1;
_handle = [_x,"insurgent3"] call gooncorp_fnc_globalgear;
};
} foreach allunits;
};





gooncorp_boatmanipulator = {
if (vehicle player != player) exitwith {hint "Your in the boat, you cant move it from there!";};
if (movingalready) exitwith {hint "I'm already moving!";};
hint "I'm trying to move the boat! If I cannot move it I must get into driver seat first, then get out and move it again!";
movingalready = true;
if ((_this select 0) == "forward") then {
_vehicle = (_this select 1);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 4; 
_vehicle setVelocity [	(_vel select 0) + (sin _dir * _speed), 	(_vel select 1) + (cos _dir * _speed), 	(_vel select 2)];};
if ((_this select 0) == "backward") then {
_vehicle = (_this select 1);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = -3; 
_vehicle setVelocity [	(_vel select 0) + (sin _dir * _speed), 	(_vel select 1) + (cos _dir * _speed), 	(_vel select 2)];};
sleep 5;
movingalready = false;
};






gooncorp_checkextract = {
if (!isserver) exitwith {};
endingTriggered = false;
while {true} do {
sleep 1;
//hint "checking extract";
sleep 1;
{
sleep 1;
hint format ["%1 _x stuff", items _x];
sleep 1;
if ('cse_notebook' in items _x && !endingTriggered && _x distance center > 700 && alive _x) then {
endingTriggered = true;
[{_handle = ["end2"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
} foreach playableunits;
sleep 5;
};
};



gooncorp_informationextracted = {
briefcase removeaction info;
player additem "cse_notebook";
sleep 1;
[{hint "Information extracted!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 5;
[{hint "You got the papers! Leave that briefcase behind and get to that exfil zone!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 5;
_handle = [center] spawn gooncorp_orderallenemiestoposition;
_handle = [] spawn gooncorp_checkextract;
while {true} do {
sleep 10;
[{hint "Waiting on extract! Get off that island with the documents!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
};




gooncorp_jipteleport = {
mantle = player addAction ["Teleport to squad leader", "_handle = [] spawn gooncorp_jipTeleportFunction"];
};

gooncorp_boataction = {
zing = (vehicle player) addAction ["Get out of boat", "_handle = [] spawn gooncorp_getoutofboat"];
};

gooncorp_getoutofboat = {
sleep .1;
player setpos getpos (vehicle player);
};

gooncorp_jipTeleportFunction = {
player removeaction mantle;
hint "Teleporting to squad leader!";
if (vehicle (leader group player) == (leader group player)) then {
player setpos getpos (leader group player);
} else {
player moveincargo (vehicle (leader group player));
};
};




gooncorp_vehiclecargo = {
if (!isserver) exitwith {};
clearItemCargoGlobal boat1;
clearItemCargoGlobal boat2;
clearmagazinecargoglobal boat1;
clearmagazinecargoglobal boat2;
boat1 addmagazinecargoglobal ["HandGrenade", 14];
boat2 addmagazinecargoglobal ["HandGrenade", 14];
boat2 addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 4];
boat1 addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 4];
boat2 addmagazinecargoglobal ["30Rnd_556x45_Stanag", 12];
boat1 addmagazinecargoglobal ["30Rnd_556x45_Stanag", 12];
boat2 addmagazinecargoglobal ["1Rnd_HE_Grenade_shell", 46];
boat1 addmagazinecargoglobal ["1Rnd_HE_Grenade_shell", 46];
};

gooncorp_jip = {
if (!isServer && isNull player) then {
waitUntil {!isNull player};
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
hint "I just jipped in!";
//call gooncorp_jipteleport;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 60;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
};

gooncorp_jipcatchup = {
call gooncorp_playertextures;
};


gooncorp_orderallenemiestoposition = {
{
if (alive _x && side _x == east) then {
sleep random 10;
_x move position (_this select 0);
};
} foreach allunits;
};



gooncorp_spreadenemies = {// called on group with leader buildingai1
if (isnil "buildingai1") exitwith {};
_locations = position buildingai1;
_range = 51;
_zig = 4 + floor random 10;
_biz = 1;
_height = [0,100];
_location = position buildingai1;
_bpos = [];
_r = 99;
_spot = [];
private ["_r"];
private ["_spot"];
{
  for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
    _bpos set [count _bpos,_p];
  };
} foreach (nearestObjects [_location, ["house"], _range]);
private ["_tmp","_min","_max","_h"];
_tmp = [];
_min = _height select 0;
_max = _height select 1;
{
  _h = _x select 2;
   _tmp set [count _tmp,_x] ;
} foreach _bpos;
if (count _tmp > 0) then {
{
_spot = (_tmp select _biz);
_r = _r + 1;
_x setpos _spot;
_r = 0;
_biz = ((floor random count _tmp) + (floor random 4));
_spot = (_tmp select _biz);
_x setpos _spot;
//_x disableAI "MOVE";
[_x]  join grpnull; 
_x setdir (random 360);
};
} foreach units (group buildingai1);
};










gooncorp_destroybuildingsinradius = {// called with (gameobjectlocatiion gameObject, radius float)
_buildings = position (_this select 0) nearObjects ["House",(_this select 1)];
{
hideobject _x;
} foreach _buildings;
};

gooncorp_respawnevent = {
//call BIS_fnc_respawnSpectator;
};



gooncorp_warriorending_win = {
hint "Someone has achieved a Victory...";
sleep 10;
call gooncorp_putaiinair;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((_this select 0) == "end1") then {
"end1" call BIS_fnc_endMission;};
if ((_this select 0) == "end2") then {
"end2" call BIS_fnc_endMission;};
if ((_this select 0) == "end3") then {
"end3" call BIS_fnc_endMission;};
if ((_this select 0) == "end4") then {
"end4" call BIS_fnc_endMission;};
};



gooncorp_warriorending_lose = {
sleep 10;
call gooncorp_putaiinair;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
["epicFail",false,2] call BIS_fnc_endMission;
};


































gooncorp_putaiinair = {
{
if (!isplayer _x && alive _x) then {
_x setpos [(getpos _x select 0), (getpos _x select 1), 5000];
};
} foreach allunits;
};



gooncorp_briefingcustominsertion = {
if (player == a1) then {
globalStartPos = position player;
player sidechat "You are the Mission Commander! Set insertion zone by left clicking once on map!";
onMapSingleClick "globalStartPos = _pos;";
sleep 1;
"start" setmarkerpos globalStartPos;
boat1 setpos [(globalStartPos select 0) + 10, (globalStartPos select 1), 0];
boat2 setpos [(globalStartPos select 0) + 20, (globalStartPos select 1), 0];
boat3 setpos [(globalStartPos select 0) - 10, (globalStartPos select 1), 0];
};
};


gooncorp_counttotalscore = {
	if (!isserver) exitwith {};

		while {true} do {
opforscore = 0;
bluforscore = 0;

{
if (side _x == east) then {
opforscore = opforscore + 1;
};

if (side _x == west) then {
bluforscore = bluforscore + 1;
};

} foreach playableunits;

sleep 15;
	[{
hint format ["blufor score is %1\nopfor score is %2", bluforscore, opforscore];
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

};
};




gooncorp_addreducearmor = {
{
if (!isserver) exitwith{};
if (side _x == east) then {
_x addEventHandler ["HandleDamage", {_this call gooncorp_reducearmor}];
};
} foreach allunits;
};

gooncorp_removeallclothing = {
{
if (side _x != west) then {
[_x] call gooncorp_clearclothing;}
} foreach allunits;
};

gooncorp_qrf = {
if (random 1 < .1) then {
if (!isnil "qrf1") then {
qrf1 move position (_this select 0);};
};
if (random 1 < .1) then {
if (!isnil "qrf2") then {
qrf2 move position (_this select 0);};
};
if (random 1 < .1) then {
if (!isnil "qrf3") then {
qrf3 move position (_this select 0);};
};
if (random 1 < .02) then {
if (!isnil "qrf1") then {
qrf1 move position center;};
};
if (random 1 < .02) then {
if (!isnil "qrf2") then {
qrf2 move position center;};
};
if (random 1 < .02) then {
if (!isnil "qrf3") then {
qrf3 move position center;};
};
};


gooncorp_reducearmor = {
if (random 1 < .2) then {
[(_this select 0)] call gooncorp_qrf;};
_damage = _this select 2;
_damage = _damage * 2;
_damage;
};

gooncorp_aitextures = {
{
if (side _x == east) then {
_x setObjectTexture [0,(_this select 0)]; 
_x setObjectTexture [1,(_this select 0)]; 
_x setObjectTexture [2,(_this select 0)]; 
};
} foreach allunits;
};

gooncorp_playertextures = {
{
if (side _x == west) then {
_x setObjectTexture [0,"textures\vietnam_marines_goon.paa"]; 
_x setObjectTexture [1,"textures\vietnam_marines_goon.paa"]; 
_x setObjectTexture [2,"textures\vietnam_marines_goon.paa"]; 
_x setObjectTexture [3,"textures\vietnam_marines_goon.paa"]; 
_x setObjectTexture [4,"textures\vietnam_marines_goon.paa"]; 
_x setObjectTexture [5,"textures\vietnam_marines_goon.paa"]; 
};
} foreach allunits;
};

gooncorp_setaiidentity = {
if ((_this select 0) == "vietnam") then {
{
if (side _x != west) then {
_val = floor random 5;
if (_val == 0) then {
_x setidentity "viet1";
};
if (_val == 1) then {
_x setidentity "viet2";
};
if (_val == 2) then {
_x setidentity "viet3";
};
if (_val == 3) then {
_x setidentity "viet4";
};
if (_val == 4) then {
_x setidentity "viet5";
};
};
} foreach allunits;
};
if ((_this select 0) == "africa") then {
{
if (side _x != west) then {
_val = floor random 3;
if (_val == 0) then {
_x setidentity "afri1";
};
if (_val == 1) then {
_x setidentity "afri2";
};
if (_val == 2) then {
_x setidentity "afri3";
};
};
} foreach allunits;
};
};





gooncorp_clearclothing = {
if (!isserver) exitwith {};
removeHeadgear (_this select 0);
removeGoggles (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
};




gooncorp_ordered_killcounter = {
private ["_bigArray"];
private ["_finalArray"];
private ["_nameArray"];
private ["_scoreArray"];
private ["_myFirstArray"];
private ["_mySingleArray"];
private ["_lastScore"];
private ["_finalArray"];
private ["_finalFinalArray"];
_bigArray = [[]];
_nameArray = [];
_scoreArray = [];
_finalFinalArray = [];
{
//if (side _x == west) then {
_mySingleArray = [score _x, name _x];
_myFirstArray = [name _x];
_mySecondArray = [score _x];// change this back to score _x // DANGER!!!
_bigArray = _bigArray + _mySingleArray;
_nameArray = _nameArray + _myFirstArray;
_scoreArray = _scoreArray + _mySecondArray;
//};
} foreach playableunits;
_lastScore = 0;
_finalArray = [];
_p = 0;
_l = 0;
private ["_l"];
private ["_p"];
_topName = "";
{
if (_x > _lastScore) then {
_lastScore = _x;
_topName = _nameArray select _p;
_finalArray = _finalArray + [_x] + [_nameArray select _p];
};
_p = _p + 1;
} foreach _scoreArray;
_finalFinalArray = [_lastScore] + _finalFinalArray + _scoreArray;
_stringer = format [" %1  %2" , _topName, _lastScore];
_text9 = "BODY COUNT = \n\n";
_text = _text9 + "\nMVP: " + _stringer + "\n\n";
_txt4 = "";
_txt2 = "";
private ["_txt2"];
private ["_txt4"];
private ["_text"];
{
//if (side _x == west) then {
_txt2 = format ["%1", (name _x)] + " " + format ["%1", (score _x)] + "\n" ;
_txt4 = _txt4 + _txt2;//};
} foreach playableunits;
sleep .2;
_txt5 = _text + _txt4;
titleCut [_txt5,"Black Faded",25];
};


