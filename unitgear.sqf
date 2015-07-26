





	private ["_unit, _type"];
	_unit = _this select 0;
	_type = _this select 1;
	_unit setVariable ["BIS_enableRandomization", false];
	if (!local _unit) exitwith{};
		if (isnull _unit) exitwith {};
			if (isnil "_unit") exitwith {};

	
	
	
	
	
	if (_type == "crate2") exitwith {
	

if (!isserver) exitwith {};
clearItemCargoGlobal (_this select 0) ;
clearItemCargoGlobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
(_this select 0) additemcargoglobal ["NVGoggles", 8];
(_this select 0) addmagazinecargoglobal ["HandGrenade", 24];
(_this select 0) addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 12];
(_this select 0) addmagazinecargoglobal ["30Rnd_556x45_Stanag", 25];
(_this select 0) addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 25];


(_this select 0) addmagazinecargoglobal ["SatchelCharge_Remote_Mag",4];
(_this select 0) addmagazinecargoglobal ["ClaymoreDirectionalMine_Remote_Mag",1];
(_this select 0) addmagazinecargoglobal ["ATMine_Range_Mag",3];

	
	
	};
	
	
	

	if (_type == "crate3_vietnam_masspool") exitwith {
	

if (!isserver) exitwith {};
clearItemCargoGlobal (_this select 0) ;
clearItemCargoGlobal (_this select 0) ;
clearweaponcargoglobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
(_this select 0) additemcargoglobal ["NVGoggles", 8];
(_this select 0) addmagazinecargoglobal ["HandGrenade", 124];
(_this select 0) addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 36];
(_this select 0) addmagazinecargoglobal ["30Rnd_556x45_Stanag", 225];
(_this select 0) addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 110];
(_this select 0) addmagazinecargoglobal ["SatchelCharge_Remote_Mag",12];
(_this select 0) addmagazinecargoglobal ["ClaymoreDirectionalMine_Remote_Mag",12];
(_this select 0) addweaponcargoglobal ["rhs_weap_m240B",1];
(_this select 0) addbackpackcargoglobal ["rhs_sidor",6];
	
(_this select 0) addweaponcargoglobal ["binocular",3];	
(_this select 0) addItemCargoGlobal ["ACE_fieldDressing",14];
(_this select 0) addItemCargoGlobal   ["ACE_packingBandage",13];
(_this select 0) addItemCargoGlobal   ["ACE_elasticBandage",13];
(_this select 0) addItemCargoGlobal   ["ACE_quikclot",13];
(_this select 0) addItemCargoGlobal  ["ACE_tourniquet",11];
(_this select 0) addItemCargoGlobal  ["ACE_morphine",11];

(_this select 0) addweaponcargoglobal ["rhs_weap_M320", 2];
(_this select 0) addweaponcargoglobal ["tb_sgun_M1014", 1];


//(_this select 0) addmagazinecargoglobal ["1000Rnd_65x39_Belt", 4];

(_this select 0) addmagazinecargoglobal ["tb_8Rnd_12ga_slug", 225];
(_this select 0) addmagazinecargoglobal ["tb_8Rnd_12ga_buck", 225];

(_this select 0) addmagazinecargoglobal ["rhs_mag_M441_HE", 225];
(_this select 0) addmagazinecargoglobal ["rhs_mag_m661_green", 25];
(_this select 0) additemCargoGlobal ["ACE_Clacker", 6];
(_this select 0) additemCargoGlobal ["ACE_M26_Clacker", 6];

	};



	
	
	removeallweapons _unit;
	removeAllAssignedItems _unit;

	
	removeUniform _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	removeVest _unit;
	
	_unit forceAddUniform "U_BG_Guerilla1_1";
	_unit addVest "rhs_vydra_3m";
	_done = true;
	
	private ["_done"];


	// handle randomization

    if (_type == "insurgentrandomizer") then {



    _val = floor random 5;
            if (_val < 1000) then {
    _type = "insurgent3";};
    if (_val == 0) then {
    _type = "insurgent2";};
        if (_val == 1) then {
    _type = "insurgent3";};
    if (_val > 1) then {
    _type = "insurgent1";};

	
    };


    if (_type == "vcinsurgentrandomizer") then {
    _val = floor random 3;

    if (_val == 0) then {
    _type = "insurgent2a";};
    if (_val > 0) then {
    _type = "insurgent1a";};
	
    };



	if (random 1 < .5 && side _unit == west) then {
	_done = false;
	_unit addheadgear "H_Bandanna_sgg";};



	if (random 1 < .5 && !_done && side _unit == west) then {
	_unit addheadgear "H_Booniehat_oli";};

	
	_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	










if (random 1 < .3) then {
_unit addItemToUniform "muzzle_snds_acp";
};

	if (_type == "mg") then {
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m240B";
		_num = 5 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		_unit addItemToVest "rhsusf_100Rnd_762x51";
		x = x + 1;
		};
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_100Rnd_762x51",2];
		(unitBackpack _unit) addmagazinecargoglobal  ["9Rnd_45ACP_Mag",2];
	};
	
	if (_type == "eng") then {
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m16a4_carryhandle";
		_num = 5 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "30Rnd_556x45_Stanag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["30Rnd_556x45_Stanag",1];};
		x = x + 1;
		};	
		//MineDetector
		//B_FieldPack_oli
		//(unitBackpack _unit) additemcargoglobal ["MineDetector",1];
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",3];
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",3];
		(unitBackpack _unit) addmagazinecargoglobal  ["DemoCharge_Remote_Mag",1];
		(unitBackpack _unit) addmagazinecargoglobal  ["ClaymoreDirectionalMine_Remote_Mag",2];
	};



	if (_type == "rif") then {
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m16a4_carryhandle";
		_num = 9 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "30Rnd_556x45_Stanag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["30Rnd_556x45_Stanag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",3];
		(unitBackpack _unit) addmagazinecargoglobal  ["30Rnd_556x45_Stanag",5];
	};




	if (_type == "gren") exitwith {

		_unit addbackpack "B_FieldPack_oli";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];

(uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",4];
_unit addItem  "ACE_packingBandage";
_unit addItem  "ACE_packingBandage";
_unit addItem  "ACE_packingBandage";
_unit addItem  "ACE_elasticBandage";
_unit addItem  "ACE_elasticBandage";
_unit addItem  "ACE_elasticBandage";
_unit addItem  "ACE_quikclot";
_unit addItem  "ACE_quikclot";
_unit addItem  "ACE_quikclot";
_unit addItem "ACE_tourniquet";
_unit addItem  "ACE_morphine";
		_unit addsecondaryweaponitem "rhs_weap_M320";
		_unit addweapon "rhs_weap_M320";
		_num = 14;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		
		_unit addItemToVest "rhs_mag_M441_HE";	
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_mag_M441_HE",30];
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_mag_m661_green",8];
	};




















	if (_type == "jtac") then {
	_unit addbackpack "B_AssaultPack_blk";
	clearAllItemsFromBackpack _unit;
        _unit additem "ACRE_PRC148";
      _unit addweapon "binocular";
      _unit additem "ACE_MapTools";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m16a4_carryhandle";
		_num = 9 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "30Rnd_556x45_Stanag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["30Rnd_556x45_Stanag",1];};
		x = x + 1;
		};	

	

	};



	
	if (_type == "medic") then {
		_unit addbackpack "B_FieldPack_oli";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m16a4_carryhandle";
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "30Rnd_556x45_Stanag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["30Rnd_556x45_Stanag",1];};
		x = x + 1;
		};	
	};















































	if (_type == "navyseal_sl") then {

removeVest _unit;
	_unit addvest "V_RebreatherB";
	removeUniform _unit;
	_unit addUniform "U_B_Wetsuit";
		_unit addbackpack "rhs_sidor";
_unit linkitem "NVGoggles";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_num = 7 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
	};

	if (_type == "navyseal_eng") then {
_unit linkitem "NVGoggles";
removeVest _unit;
	_unit addvest "V_RebreatherB";
	removeUniform _unit;
	_unit addUniform "U_B_Wetsuit";
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",5];
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_num = 7 + floor random 4;
		private ["_num"];
		(unitBackpack _unit) addmagazinecargoglobal  ["SatchelCharge_Remote_Mag",1];
		(unitBackpack _unit) addmagazinecargoglobal  ["ClaymoreDirectionalMine_Remote_Mag",2];
		(unitBackpack _unit) addmagazinecargoglobal  ["ATMine_Range_Mag",1];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
	};

	if (_type == "navyseal_dm") then {
_unit linkitem "NVGoggles";
	removeUniform _unit;
	_unit addUniform "U_B_Wetsuit";
removeVest _unit;
	_unit addvest "V_RebreatherB";
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_SOS";
		_num = 7 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
	};



	if (_type == "army_dm") then {
_unit linkitem "NVGoggles";
removeVest _unit;
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_SOS";
		_num = 7 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
	};



	if (_type == "navyseal_medic") then {

removeVest _unit;
	_unit addvest "V_RebreatherB";
	removeUniform _unit;
_unit linkitem "NVGoggles";
	_unit addUniform "U_B_Wetsuit";
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
	
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_num = 7 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
		_unit addItemToUniform "9Rnd_45ACP_Mag";
	};


	if (_type == "navyseal_mg") then {
_unit linkitem "NVGoggles";
removeVest _unit;
	_unit addvest "V_RebreatherB";
	removeUniform _unit;
	_unit addUniform "U_B_Wetsuit";
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "rhs_weap_m240B";
		_num = 5 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		_unit addItemToVest "rhsusf_100Rnd_762x51";
		x = x + 1;
		};
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_100Rnd_762x51",2];
		(unitBackpack _unit) addmagazinecargoglobal  ["9Rnd_45ACP_Mag",2];
			_unit addItemToUniform "9Rnd_45ACP_Mag";
	_unit addItemToUniform "9Rnd_45ACP_Mag";
	_unit addItemToUniform "9Rnd_45ACP_Mag";
		
	};























		if (_type == "insurgent1a") then {

_unit addbackpack "rhs_sidor";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);

//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
//if (random 1 < .3) then {
//(_this select 0) addheadgear "H_Bandanna_gry";};
(_this select 0) forceAddUniform "U_IG_Guerilla3_1";
		
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "rhs_30Rnd_762x39mm_tracer";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
		_unit addweapon "rhs_weap_akm";
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};





		if (_type == "insurgent2a") then {
_unit addbackpack "rhs_sidor";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);


//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);

removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
//if (random 1 < .3) then {
//(_this select 0) addheadgear "H_Bandanna_gry";};
(_this select 0) forceAddUniform "U_IG_Guerilla3_1";
		
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 5) then {
		_unit addItemToVest "JO_75rnd_RPK";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
		_unit addweapon "JO_RF_RPK";
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};
















		if (_type == "insurgent1") then {

_unit addbackpack "rhs_sidor";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);
if (random 1 < .5) then {
_unit addheadgear "H_Shemag_tan";};
//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);
if (random 1 < .4) then {_unit addGoggles "G_Bandanna_khk";};
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
//if (random 1 < .3) then {
//(_this select 0) addheadgear "H_Bandanna_gry";};
(_this select 0) forceAddUniform "U_IG_Guerilla3_1";
		_unit addweapon "rhs_weap_akm";
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "rhs_30Rnd_762x39mm_tracer";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};





		if (_type == "insurgent2") then {
_unit addbackpack "rhs_sidor";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);
if (random 1 < .5) then {_unit addheadgear "H_Shemag_khk";};

//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);
if (random 1 < .4) then {_unit addGoggles "G_Bandanna_khk";};
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
//if (random 1 < .3) then {
//(_this select 0) addheadgear "H_Bandanna_gry";};
(_this select 0) forceAddUniform "U_IG_Guerilla3_1";
		_unit addweapon "JO_RF_RPK";
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 5) then {
		_unit addItemToVest "JO_75rnd_RPK";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};

		



		if (_type == "insurgent3") then {
if (random 1 < 1) then {_unit addbackpack "rhs_sidor";};

	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);
if (random 1 < .5) then {
_unit addheadgear "H_Shemag_tan";};
//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);
	if (random 1 < .4) then {_unit addGoggles "G_Bandanna_khk";};
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
//if (random 1 < .3) then {
//(_this select 0) addheadgear "H_Bandanna_gry";};
(_this select 0) forceAddUniform "U_IG_Guerilla3_1";
_unit addItemToVest "rhs_rpg7_PG7VL_mag";
(unitBackpack _unit) addmagazinecargoglobal  ["rhs_rpg7_PG7VL_mag",1];
		_unit addweapon "rhs_weap_rpg7";
		_num = 2 + floor random 2;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 3) then {
		_unit addItemToVest "rhs_rpg7_PG7VL_mag";	};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_rpg7_PG7VL_mag",1];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};





























































		if (_type == "insurgent5a") then {
_unit addbackpack "O_HMG_01_weapon_F";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);


(_this select 0) addheadgear "H_Booniehat_khk";
//H_TurbanO_blk H_Shemag_tan
removeGoggles (_this select 0);

removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
(_this select 0) forceAddUniform "rhs_uniform_mflora_patchless";
		
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 5) then {
		_unit addItemToVest "JO_75rnd_RPK";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
_unit addweapon "JO_RF_RPK";
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};



		if (_type == "insurgent6a") then {

_unit addbackpack "O_HMG_01_weapon_F";
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
removeHeadgear (_this select 0);
removeGoggles (_this select 0);
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
(_this select 0) addheadgear "H_Booniehat_khk";
removeAllAssignedItems (_this select 0);
(_this select 0) forceAddUniform "rhs_uniform_mflora_patchless";
		
		_num = 8 + floor random 8;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 8) then {
		_unit addItemToVest "rhs_30Rnd_762x39mm_tracer";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhs_30Rnd_762x39mm_tracer",1];};
		x = x + 1;
		};	
_unit addweapon "rhs_weap_akm";
		(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
			_unit linkitem "itemmap";
	_unit linkitem "itemcompass";
	_unit linkitem "itemwatch";	
	_unit unassignItem "itemradio";
    _unit removeitem "itemradio";
	};



























	
	if (_type == "sl") then {
		_unit addbackpack "rhs_sidor";
			(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShell",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["SmokeShellRed",1];
	(unitBackpack _unit) addmagazinecargoglobal  ["HandGrenade",2];
		_unit addweapon "binocular";
		_unit additem "ACRE_PRC148";
		_unit addweapon "rhs_weap_m14ebrri";
		_num = 7 + floor random 4;
		private ["_num"];
		x = 0;
		while {x < _num} do {
		if (x < 4) then {
		_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";	} else {	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",1];};
		x = x + 1;
		};	
		(unitBackpack _unit) addmagazinecargoglobal  ["rhsusf_20Rnd_762x51_m118_special_Mag",5];
	};
	

	if (_type == "eng") then {
		(unitBackpack _unit) addmagazinecargoglobal  ["SatchelCharge_Remote_Mag",1];
		(unitBackpack _unit) addmagazinecargoglobal  ["ClaymoreDirectionalMine_Remote_Mag",2];
		(unitBackpack _unit) addmagazinecargoglobal  ["ATMine_Range_Mag",1];
	};




	if (_type == "cdc") exitwith {



	if (side _unit == west) then {
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addweapon "hgun_ACPC2_F";};





(uniformContainer _unit) addItemCargoGlobal ["ACE_fieldDressing",4];
(unitBackpack _unit) addItemCargoGlobal   ["ACE_packingBandage",3];
(unitBackpack _unit) addItemCargoGlobal   ["ACE_elasticBandage",3];
(unitBackpack _unit) addItemCargoGlobal   ["ACE_quikclot",3];
(unitBackpack _unit) addItemCargoGlobal  ["ACE_tourniquet",1];
(unitBackpack _unit) addItemCargoGlobal  ["ACE_morphine",1];

};






























		if ( _type ==  "medic") then {
	(unitBackpack _unit) additemcargoglobal ["ACE_bandage_basic",30];
    (unitBackpack _unit) additemcargoglobal ["ACE_tourniquet",12];
    (unitBackpack _unit) additemcargoglobal ["ACE_packingBandage",30];
    (unitBackpack _unit) additemcargoglobal ["ACE_morphine",10];
    (unitBackpack _unit) additemcargoglobal ["ACE_epinephrine",10];
    (unitBackpack _unit) additemcargoglobal ["ACE_personalAidKit",15];
    (unitBackpack _unit) additemcargoglobal ["ACE_elasticBandage",20];
    (unitBackpack _unit) additemcargoglobal ["ACE_salineiv",6];
    (unitBackpack _unit) additemcargoglobal ["ACE_plasmaiv",1];
    (unitBackpack _unit) additemcargoglobal ["ACE_surgical_kit",1];
	(unitBackpack _unit) additemcargoglobal ["ACE_salineIV_250",4];
	
	(unitBackpack _unit) additemcargoglobal ["ACE_quikclot",15];




	};
	
	if ( _type == "navyseal_medic") then {
	(unitBackpack _unit) additemcargoglobal ["ACE_bandage_basic",30];
    (unitBackpack _unit) additemcargoglobal ["ACE_tourniquet",12];
    (unitBackpack _unit) additemcargoglobal ["ACE_packingBandage",30];
    (unitBackpack _unit) additemcargoglobal ["ACE_morphine",10];
    (unitBackpack _unit) additemcargoglobal ["ACE_epinephrine",10];
    (unitBackpack _unit) additemcargoglobal ["ACE_personalAidKit",15];
    (unitBackpack _unit) additemcargoglobal ["ACE_elasticBandage",20];
    (unitBackpack _unit) additemcargoglobal ["ACE_salineiv",6];
    (unitBackpack _unit) additemcargoglobal ["ACE_plasmaiv",1];
    (unitBackpack _unit) additemcargoglobal ["ACE_surgical_kit",1];




	};
	
	if (side _unit == west) then {
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addItemToVest "9Rnd_45ACP_Mag";
	_unit addweapon "hgun_ACPC2_F";};
	
	


(uniformContainer _unit) addItemCargoGlobal ["ACE_EarPlugs",1];

