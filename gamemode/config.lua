-- This config is not basic, but is designed to be moron proofed.
-- If you are a DEVELOPER and want some more intermediate config see the following files
-- IGNORE THIS IF YOU CAN'T CODE AT AN INTERMEDIATE LEVEL WITH LUA!
-- README_SF.md for hooks and methods
-- gamemode/server/hooks.lua for XP and karma logic, along with some examples of how to use hooks
-- gamemode/server/commands.lua for chat commands
-- gamemode/server/mysql.lua for MySQL configuration, do not turn this on unless you know what you are doing!

-- The language the gamemode will run with, right now the built in languages are:
--ENGLISH
--FRENCH
--SPANISH
--DUTCH
--RUSSIAN
--GERMAN
--KOREAN

-- If you need another language, check language.lua for more information
-- The language file also contains the currency symbol.
BASEWARS_CHOSEN_LANGUAGE = "RUSSIAN"

BaseWars.Config = {
	-- RadarRange: Range of the radar, in source units
	RadarRange = 4096,
	
	-- SBoxWeps: The same as sbox_weapons, if players spawn with hl2 weapons
	SBoxWeps = false,
	-- XPMultiplier: Multiplier on XP earned through various actions
	-- To further customize XP distribution see server/hooks.lua
	XPMultiplier = 1.0,
	
	-- Forums: Link to your forums, accessed with /forums
	Forums 		= "http://www.hexahedron.pw",
	-- SteamGroup: Link to your steam group, accessed with /steam
	SteamGroup 	= "http://steamcommunity.com/groups/hexahedronic",
	-- Workshop: Link to your workshop download, accessed with /workshop
	Workshop    = "http://steamcommunity.com/sharedfiles/filedetails/?id=617210377",
	
	-- ScaleVIPPayDay: Should VIP ranks get better paydays, scaling with their money?
	ScaleVIPPayDay = true,
	-- VIPRanks: Table of ranks which VIP items and ScaleVIPPayDay, etc applies to
	VIPRanks = {
		"donators",
	},
	
	-- MaximumPay: Maximum amount players can give eachother, helps stop inflation
	MaximumPay = 10^4,
	-- BountyDelimiter: When receiving a bounty players are limited by this * their current money or the maximum bounty amount, whichever is smallest
	BountyDelimiter = 2,
	
	-- PricesSize: Size of font for spawnmenu labels, change this if your language makes it look bad
	PricesSize = 11,
	-- IconSize: Size of icons on spawnmenu, change this if the text doesnt fit with your language
	IconSize = 72,
	
	-- AllowPropPunt: Should people be allowed to punt props with the gravgun
	AllowPropPunt = false,
	-- SpawnBuilding: 0 = Disabled, people can spawn any props at spawn, 1 = Admin only, only admins can spawn props, 2 and above = Nobody, nobody can spawn props at spawn
	SpawnBuilding = 1,

	Ents = {
		Electronics = {
			-- Explode: Should electronics detonate upon destruction
			Explode		= true,
			-- WaterProof: Are electronics Water Proof by default
			WaterProof	= false,
		},
		SpawnPoint = {
			-- Offset: How far above the spawnpoint should you spawn
			Offset 		= Vector(0, 0, 16),
		},
	},

	Drugs = {
		DoubleJump = {
			-- JumpHeight: The velocity vector applied when double jumping
			JumpHeight 	= Vector(0, 0, 320),
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Steroid = {
			-- Walk: New walk speed when using drug
			Walk 		= 330,
			-- Run: New run speed when using drug
			Run 		= 580,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Regen = {
			-- Duration: Duration of the drug
			Duration 	= 30,
		},
		Adrenaline = {
			-- Mult: Health multiplier while using drug
			Mult		= 1.5,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		PainKiller = {
			-- Mult: Damage multiplier while using drug
			Mult 		= .675,
			-- Duration: Duration of the drug
			Duration	= 80,
		},
		Rage = {
			-- Mult: Damage multiplier while using drug
			Mult 		= 1.675,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Shield = {

		},
		Antidote = {

		},
		-- CookTime: How long does the drug lab take
		CookTime	= 60 * 2,
	},

	Notifications = {
		-- LinesAmount: Amount of lines on the notification HUD
		LinesAmount = 11,
		-- Width: Width of the notification HUD
		Width		= 582,
		-- BackColor: The background color of the notification HUD
		BackColor	= Color(30, 30, 30, 140),
		-- OpenTime: Time notification HUD remains open after a notification
		OpenTime	= 10,
	},

	Raid = {
		-- Time: Time a raid lasts for
		Time 			= 60 * 5,
		-- CoolDownTime: Time after a raid the person being raided is protected for
		CoolDownTime	= 60 * 15,
		-- NeededPrinters: Amount of valid raidables needed to be raided
		NeededPrinters	= 1,
		-- CertainInflictors: Only allow certain inflictors to hurt props, enable this if you liked the old style blowtorch system
		CertainInflictors = false,
		-- Inflictors: If you have CertainInflictors enabled, these are the classes which can damage props
		-- NOTE: bw_blowtorch can ALWAYS damage props, no matter the setting
		-- NOTE: Inverted table! [class] = true
		Inflictors = {
			["bw_blowtorch"] = true,
			["bw_explosive_c4"] = true,
			["bw_explosive_bigbomb"] = true,
			["bw_explosive_bigbomb_fragment"] = true,
			["bw_explosive_nuke"] = true,
		},
	},

	AFK  = {
		-- Time: Time in seconds before AFK HUD shows (DOES NOT KICK)
		Time 	= 30000,
	},

	HUD = {
		-- EntFont: Title font for ent HUD overlay
		EntFont = "TargetID",
		-- EntFont2: Subtitle font for ent HUD overlay
		EntFont2 = "BudgetLabel",
		-- EntW: Width of ent HUD overlay
		EntW	= 175,
		-- EntH: Height of ent HUD overlay
		EntH	= 25,
	},

	Rules = {
		-- IsHTML: Is the next variable HTML, if not it is a URI to a valid HTML file
		IsHTML 	= false,
		-- HTML: HTML string or valid URI
		HTML	= "http://hexahedron.pw/default_rules.html",
	},

	Adverts = {
		-- Time: Time between adverts by the system
		Time = 120,
	},

	-- SpawnWeps: Weapons that everyone gets when they spawn
	SpawnWeps = {
		"weapon_physcannon",
		"wep_jack_gmod_hands",
	},

	-- WeaponDropBlacklist: Weapons nobody can drop using /dropweapon
	-- NOTE: Inverted table! [class] = true
	WeaponDropBlacklist = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["hands"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
		["wep_jack_gmod_hands"] = true,
	},
	
	-- PhysgunBlockClasses: Entity classes that you cant physgun
	-- NOTE: Inverted table! [class] = true
	PhysgunBlockClasses = {
		["bw_spawnpoint"] = true,
		["bw_explosive_c4"] = true,
		["bw_explosive_bigbomb"] = true,
		["bw_explosive_bigbomb_fragment"] = true,
		["bw_explosive_mine"] = true,
		["bw_explosive_mine_speed"] = true,
		["bw_explosive_mine_power"] = true,
		["bw_explosive_mine_shock"] = true,
		["bw_explosive_nuke"] = true,
	},

	-- BlockedTools: Tools which only admins can use
	-- NOTE: Inverted table! [model] = true
	BlockedTools = {
		["dynamite"] = true,
		["duplicator"] = true,
		["paint"] = true,
	},

	-- ModelBlacklist: Models which nobody can spawn
	-- NOTE: Inverted table! [model] = true
	ModelBlacklist = {
	},

	NPC = {
		-- FadeOut: Fade distance for NPC title
		FadeOut = 400,
	},

	AntiRDM = {
		-- HurtTime: Time after getting attacked in which it's not 'rdm' to kill someone
		HurtTime 		= 80,
		-- RDMSecondsAdd: Seconds added to respawn timer per random kill
		RDMSecondsAdd 	= 3,
		-- KarmaSecondPer: Seconds added to respawn timer per X negative karma, whats X? fuck if i know
		KarmaSecondPer 	= 4,
		-- KarmaLoss: Karma lost per random kill
		KarmaLoss 		= -2,
		-- KarmaGlowLevel: Level as which players glow green or red due to karma, set to > 100 to disable
		KarmaGlowLevel 	= 65,
	},

	-- PayDayBase: Base payday rate
	PayDayBase 			= 500,
	-- PayDayMin: Lowest amount per payday
	PayDayMin			= 50,
	-- PayDayDivisor: amt = baserate - (playermoney / divisor)
	PayDayDivisor		= 1000,
	-- PayDayRate: Amount of seconds between paydays
	PayDayRate 			= 60 * 3,
	-- PayDayRandom: Randomization rate from calculated value
	PayDayRandom		= 50,

	-- StartMoney: Amount of money new players get
	StartMoney 			= 5000,

	-- CustomChat: Load the built in custom chatbox, disable if you use your own (ours is better)
	CustomChat			= true,
	-- ExtraStuff: Load some extra things such as source engine fixes and player nickname customiser, disable if you dont want this
	ExtraStuff			= true,
	-- CleanProps: Finds all physics props on the map and removes them when all the entities are frist initialized (AKA: When the map first loads)
	CleanProps			= false,

	-- AllowFriendlyFire: Can people hurt other people in their faction
	AllowFriendlyFire	= true,

	-- DefaultWalk: Default walking speed with no drugs
	DefaultWalk			= 90,
	-- DefaultRun: Default running speed with no drugs,
	DefaultRun			= 235,

	-- DefaultLimit: If no limit for an entity is specified this will be used, set to math.huge if you like your server crashing
	DefaultLimit		= 5,
	-- SpawnOffset: Height offset for spawning entities
	SpawnOffset			= Vector(0, 0, 40),

	-- UniversalPropConstant: Like the universal gravitational constant except it dictates how much damage props can take
	UniversalPropConstant = 2.7,
	-- DestroyReturn: Fraction of the value of an entity which is returned/given to the raider if it is destroyed
	DestroyReturn 		= 0.6,

	-- RestrictProps: Use the BaseWars menu for spawning props as well as entities, not recommended
	RestrictProps 		= false,

	-- DispenserTime: Time taken for a dispenser to reload
	DispenserTime		= 0.5,

	LevelSettings = {
		-- BuyWeapons: Level needed to buy weapons, this is 2 to stop people wasting their starter money
		BuyWeapons = 2,
		-- MaxLevel: Maximum level you can be
		MaxLevel = 5000,
	},
	
}

-- How to use the NPC table:
-- Make a subtable with the key equal to your map name, for example
-- ["rp_downtown_craprp_v3_v4_v69d"] = {}
-- and in that subtable make a subtable for every help NPC you want to spawn
-- ["rp_downtown_craprp_v3_v4_v69d"] = {[1] = {}, [2] = {}}
-- Then in those, put Pos = Vector(x, y, z), and Ang = Angle(p, y, r),
-- If you didnt understand this, just look at the default ones
-- do getpos in your console for your position
BaseWars.NPCTable = {

	["rp_downtown_v4c_v2"] = {

		[1] = {
			Pos = Vector(338, -1137, -193),
			Ang = Angle(0, 135, 0),
		},

	},

	["rp_bangclaw"] = {

		[1] = {
			Pos = Vector(-1006, -1441, 75),
			Ang = Angle(0, 135, 0),
		},

		[2] = {
			Pos = Vector(2055, -2289, 75),
			Ang = Angle(0, 141, 0),
		},

		[3] = {
			Pos = Vector(1315, 2129, 147),
			Ang = Angle(0, -133, 0),
		},

		[4] = {
			Pos = Vector(3619, 364, 75),
			Ang = Angle(0, -145, 0),
		},

		[5] = {
			Pos = Vector(51, -1924, 75),
			Ang = Angle(0, -141, 0),
		},

		[6] = {
			Pos = Vector(712, -90, 74),
			Ang = Angle(0, 87, 0),
		},

	},
	
	["rp_eastcoast_v3"] = {
	    [1] = {
	        Pos = Vector(-3170, 2210, 4),
	        Ang = Angle(0, 135, 0),
	    },
	
	    [2] = {
	        Pos = Vector(-3878, 1869, 3),
            Ang = Angle(0, 40, 0),
        },
    
        [3] = {
            Pos = Vector(-2574, 894, 3),
            Ang = Angle(0, 135, 0),
        },
    
        [4] = {
            Pos = Vector(-3972, 798, 3),
            Ang = Angle(0, 0, 0),
        },
	},

}

-- You can make similar maps have the same NPCs like this
BaseWars.NPCTable.rp_eastcoast_v4 = BaseWars.NPCTable.rp_eastcoast_v3
BaseWars.NPCTable.basewars_bangclaw_v1 = BaseWars.NPCTable.rp_bangclaw

-- How to use the Advert Table:
-- add a new subtable containing a sequence of colors and string,
-- {Grey, "this server really is the worst, ", NiceGreen, "please leave", Grey, "."},
-- Look below for examples

-- Valid colors: NiceGreen, NiceBlue, Grey, White, Pink

-- Empty the table if you dont want this
BaseWars.AdvertTbl = {

	{Grey, "Remember to join our ", NiceGreen, "Steam Group", Grey, "! (/steam)"},
	{Grey, "You can find out more on the ", NiceGreen, "Forums", Grey, "! (/forums)"},
	{Grey, "To download our content manually, type ", NiceGreen, "/workshop"},

}

if Prometheus then
	BaseWars.AdvertTbl[#BaseWars.AdvertTbl+1] = {Grey, "If you want to support this server, type ", NiceBlue, "!donate ", Grey, "or", NiceBlue, " contact the owner."}
end

-- How to use the Help Table:
-- Add subtables to add new entries to the Help NPC
-- each subtable contains strings, each string is a new line
-- Look below for examples
BaseWars.Config.Help = {

	["What is this server?"] = {

		"This is a BaseWars server.",
		"It runs a version of BaseWars originally designed for Hexahedron!",
		"",
		"BaseWars is a gamemode about making money and raiding.",
		"It also contains cool guns and ways to defend your base!",

	},

	["What are the controls?"] = {

		"To spawn printers and other entities you can open the spawnmenu by holding [Q] or your binding for it,",
		"From here you can select the [Entities] sub-category of the [BaseWars] tab.",
		"",
		"To Raid or Create a Faction you can press [F3] to open the [Main Menu]. From here you can select [Factions],",
		"[Raids], [Rules] and in the future the [Store] and your [Equipment Inventory]!",

	},

	["How do I make a base?"] = {

		"Firstly find an area in the map which is secure, and you would be happy defending,",
		"Then use some props from the spawnmenu to secure the entrances,",
		"Finally use the [Fading Door] tool on the props to make yourself a secure way in and out.",
		"",
		"After you have secured the area, you can buy printers and generators from the [BaseWars] tab.",
		"You will need to make sure you have enough power to supply your printers!",

	},

	["How do I raid?"] = {

		"To raid you and your target must both have atleast 1 copper or higher printer.",
		"",
		"If you are raidable, press F3, then select the [Raids] tab, followed by clicking on your target's name.",
		"Watch the [Notifications] in the top left corner to see if they are raidable. If they are, the raid menu",
		"will open. If they aren't, it will tell you why not.",
		"",
		"Once a raid has started you can destroy any props your enemy owns, along with electronics! But be careful!",
		"They can counter raid you while it is on-going!",

	},

	["Are there any rules?"] = {

		"Yes, press F3 then select the [Rules] tab!",

	},

	["How does the power system work?"] = {

		"Generators will transmit power to all nearby powered items in an area of effect.",
		"This means you do not need to worry about 'wiring' or similar.",
		"",
		"If an electronic has a [POWER FAILURE] then you may need more generators, or you might",
		"just need to wait for the power supply to stabilise.",
		"",
		"If a generator has a [POWER FAILURE] then that means its power generation is being strained,",
		"but it does not mean it is not working!",

	},

	["What about RDM (Killing people randomly)?"] = {

		"RDM is allowed. Do not complain and instead if you so desire, seek your own revenge.",
		"Beware though, killing people will decrease your karma. This increases your respawn time.",

	},

	["How do I upgrade my printers?"] = {

		"All you need to do is look at them and type /upg",
		"You can bind \"basewars upgrade\" to a key to do it automaticly!",

	},

	["How do I sell my printers?"] = {

		"All you need to do is look at them and type /sell",
		"You can bind \"basewars sell\" to a key to do it automaticly!",

	},

	["How do I level up?"] = {

		"There are several ways to increase your level. For example:",
		"Buying printers, generators or collecting your printer.",

	},

	["What does a higher level earn me?"] = {

		"When you level up, you unlock new items.",
		"They are usually more powerful or more efficient than the older version.",

	},

	["What is the 'E Use/Collect Money' thingy?"] = {

		"It allows you to see if an entity has recharged yet.",
		"If you don't like it, you can disable it by typing",
		"'bw_interactions_enabled 0' into your console.",

	},

	["How do I own/lock or unlock doors?"] = {
		
		"Your hands double as what you may think of as 'keys',",
		"although you cannot 'own' a door, left clicking will lock a door",
		"and right clicking unlock a door.",
		
	},
}

-- This is the same as the Help Table but for the drugs section
BaseWars.Config.DrugHelp = {
	["What does the Regen drug do?"] = {

		"Regen does exactly what it says on the tin!",
		"You will regenerate HP (and armor) for 30 seconds.",

	},

	["What does the Steroid drug do?"] = {

		"Steroid increases your move speed!",
		"You will move 45% faster for 2 minutes.",

	},

	["What does the Adrenaline drug do?"] = {

		"Adrenaline increases your maximum health!",
		"Your max health will be increased by 50% for 2 minutes.",

	},

	["What does the DoubleJump drug do?"] = {

		"Do you really need a explanation for that?",
		"You can jump again while in the air.",

	},

	["What does the PainKiller drug do?"] = {

		"Painkillers will help you survive longer in a fight.",
		"You will experience 30% less damage.",

	},

	["What does the Shield drug do?"] = {

		"Shield will help you when you need it the most.",
		"You will be survive one killing blow.",

	},

	["What does the Rage drug do?"] = {

		"Rage will help you fight other players!",
		"You will deal 70% more damage for 2 minutes",

	},
}

-- This is the same as the Help and Drugs Table but for the commands section
BaseWars.Config.CommandsHelp = {
  ["Upgrade Items"] = {
    "Everyone loves a little efficiency.",
    "Look at your printer and use one of these.",
    "",
    "/upg        /upgrade        /upgr",

  },

  ["Sell Items"] = {
    "Didn't mean to buy that? Want to get rid of it? Need some your money back?.",
    "Look at your item and use one of these.",
    "",
    "/sell        /destroy        /remove",

  },


  ["Drop Weapons"] = {
    "Sometimes the noobs need a little extra defense.",
    "",
    "/dw        /dropweapon        /dropwep",


  },

  ["Private Message"] = {
    "Psst...",
    "",
    "/tell (playername)        /msg (playername)",

  },

  ["Give Money to Player"] = {
    "Share the wealth!",
    "",
    "/givemoney (playername) (amt)     /pay (playername) (amt)    /moneygive (playername) (amt)",


  },

  ["Place a Bounty"] = {
    "Need someone gone, but too lazy and rich? We have just the thing for you.",
    "",
    "/bounty  (playername)        /place (playername)        /placebounty (playername)",


  },
}

-- Spawnmenu Category Creation
-- First argument is the category name, second is the icon16 name
-- See http://www.famfamfam.com/lab/icons/silk/preview.php for a list of icon16 icons.
-- As of 1.2.1 the category names can now be multiple words
BaseWars.SpawnList.Entities = BaseWars.NewCAT(BaseWars.LANG.Entities, "icon16/bricks.png")
BaseWars.SpawnList.Loadout =  BaseWars.NewCAT(BaseWars.LANG.Loadout, "icon16/gun.png")

-- Default weapons not working? Install these
-- https://steamcommunity.com/sharedfiles/filedetails/?id=349050451
-- https://steamcommunity.com/sharedfiles/filedetails/?id=358608166
-- https://steamcommunity.com/sharedfiles/filedetails/?id=359830105

-- This is the spawnmenu generator, this works similarly to the last few things
-- The key (["Crowbar"]) is the item name, then you make that equal to BaseWars.GSL{your values}
-- BaseWars.SpawnList.Loadout for weapons, BaseWars.SpawnList.Entities for entities
-- Valid values are:

--Gun (sets the object to spawn using the weapon handler)
--Drug (sets the object to spawn using the drug handler)
--ClassName (entity class, or weapon class if using Gun and drug effect if using Drug)
--Model (model displayed on the icon)
--Price (how much it costs, dont include for free)
--Level (level required for it)
--VIP (is it a VIP only item)
--VehicleName (The name of a registed vehicle to spawn, still requires you to know the vehicle's class and model)

-- Look below for a LOT of examples

BaseWars.SpawnList.Loadout["Weapons (T1)"] = {

	["Crowbar"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_crowbar.mdl", Price = 1000, ClassName = "weapon_crowbar"},

	["USP"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_usp.mdl", Price = 5000, ClassName = "cw_g4p_usp40"},
	["M1911"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_usp.mdl", Price = 5000, ClassName = "cw_m1911"},
	["FiveSeven"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_fiveseven.mdl", Price = 5000, ClassName = "cw_g4p_fiveseven"},

	["Deagle"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 10000, ClassName = "cw_deagle"},
	["MR96"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 11500, ClassName = "cw_mr96"},
	["MP412"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_pist_deagle.mdl", Price = 11500, ClassName = "cw_g4p_mp412_rex"},

	["UMP"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_ump45.mdl", Price = 20000, ClassName = "cw_g4p_ump45"},
	["MP5"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mp5.mdl", Price = 20000, ClassName = "cw_mp5"},
	["MAC11"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_mac10.mdl", Price = 20000, ClassName = "cw_mac11"},

	["Magpul"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_smg_p90.mdl", Price = 25000, ClassName = "cw_g4p_magpul_masada"},
	["FN FAL"] 					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 25000, ClassName = "cw_g4p_fn_fal"},
	["G36"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 25000, ClassName = "cw_g36c"},

	["AK74"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_ak47.mdl", Price = 30000, ClassName = "cw_ak74"},
	["AR15"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 30000, ClassName = "cw_ar15"},
	["XM8"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_m4a1.mdl", Price = 32500, ClassName = "cw_g4p_xm8"},
	
	["Shorty"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 35000, ClassName = "cw_shorty"},

	["G3A3"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_g3sg1.mdl", Price = 90000, ClassName = "cw_g3a3"},
	["AWM"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_awp.mdl", Price = 100000, ClassName = "cw_g4p_awm"},
	["M98b"] 						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_snip_sg550.mdl", Price = 125000, ClassName = "cw_g4p_m98b"},


}

BaseWars.SpawnList.Loadout["Ammo Kits"] = {

	["Kit"]		= BaseWars.GSL{Ammo = true, Model = "models/items/boxsrounds.mdl", Price = 5000, ClassName = "cw_ammo_kit_small"},
	["Crate"]	= BaseWars.GSL{Ammo = true, Model = "models/items/boxsrounds.mdl", Price = 35000, ClassName = "cw_ammo_crate_small"},
	["40mm Grenades"]	= BaseWars.GSL{Ammo = true, Model = "models/items/boxsrounds.mdl", Price = 35000, ClassName = "cw_ammo_40mm"},

}

BaseWars.SpawnList.Loadout["Drugs"] = {

	["DoubleJump"] 					= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "DoubleJump"},
	["Regen"] 						= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "Regen"},
	["PainKiller"] 					= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "PainKiller"},
	["Steroid"] 					= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "Steroid"},
	["Adrenaline"] 					= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "Adrenaline"},
	["Rage"] 						= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "Rage"},
	["Shield"] 						= BaseWars.GSL{Drug = true, Price = 45000, ClassName = "Shield"},
	["Antidote"]					= BaseWars.GSL{Drug = true, Price = 5000, ClassName = "Antidote"},

}

BaseWars.SpawnList.Loadout["Weapons (Grenades)"] = {

	["Frag"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_grenade.mdl", Price = 450000, ClassName = "cw_frag_grenade", Level = 20},
	["Smoke"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_eq_flashbang_thrown.mdl", Price = 450000, ClassName = "cw_smoke_grenade", Level = 20},
	["Flash"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_eq_flashbang_thrown.mdl", Price = 450000, ClassName = "cw_flash_grenade", Level = 20},
	["Gas"]						= BaseWars.GSL{Gun = true, Model = "models/weapons/w_eq_flashbang_thrown.mdl", Price = 15000000, ClassName = "bw_gasnade", Level = 150},

}

BaseWars.SpawnList.Loadout["Weapons (T2)"] = {

	["SCAR"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 550000, ClassName = "cw_scarh", Level = 25},
	["M249"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_mach_m249para.mdl", Price = 800000, ClassName = "cw_m249_official", Level = 30},
	["M3"] 							= BaseWars.GSL{Gun = true, Model = "models/weapons/w_shot_m3super90.mdl", Price = 550000, ClassName = "cw_m3super90", Level = 25},
	["L85 (Bullpup)"]				= BaseWars.GSL{Gun = true, Model = "models/weapons/w_rif_galil.mdl", Price = 600000, ClassName = "cw_l85a2", Level = 25},
	["Heal Gun"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_physics.mdl", Price = 3500000, ClassName = "bw_health", Level = 45},

}

BaseWars.SpawnList.Loadout["Raid Tools"] = {
	
	["Blowtorch"]		= BaseWars.GSL{Gun = true, Model = "models/weapons/w_irifle.mdl", Price = 45000, ClassName = "bw_blowtorch", Level = 5},
	["C4"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_c4.mdl", Price = 5500000, ClassName = "bw_weapon_c4", Level = 30},
	["BigBomb"]			= BaseWars.GSL{Model = "models/props_c17/oildrum001.mdl", Price = 30*10^6, ClassName = "bw_explosive_bigbomb", Level = 50, Limit = 1, ShouldFreeze = false, IgnoreRaid = true},
	["Nuke"]				= BaseWars.GSL{Model = "models/props_phx/mk-82.mdl", Price = 100*10^6, ClassName = "bw_explosive_nuke", Level = 85, Limit = 1, ShouldFreeze = false, IgnoreRaid = true},
	
}

BaseWars.SpawnList.Loadout["Vehicles"] = {

	["Jeep"]				= BaseWars.GSL{Model = "models/buggy.mdl", Price = 2*10^10, ClassName = "prop_vehicle_jeep", VehicleName = "Jeep", Level = 1000},

}

BaseWars.SpawnList.Entities["Generators (T1)"] = {

	["Gas Generator"]				= BaseWars.GSL{Model = "models/xqm/hydcontrolbox.mdl", Price = 500, ClassName = "bw_gen_gas"},
	["Solar Panel"]					= BaseWars.GSL{Model = "models/props_lab/miniteleport.mdl", Price = 1500, ClassName = "bw_gen_solar", Level = 2},
	["Coal Fired Generator"]		= BaseWars.GSL{Model = "models/props_wasteland/laundry_washer003.mdl", Price = 20000, ClassName = "bw_gen_coalfired", Level = 5},
	["Fission Reactor"]				= BaseWars.GSL{Model = "models/props/de_nuke/equipment1.mdl", Price = 75000, ClassName = "bw_gen_fission", Level = 15},

}

BaseWars.SpawnList.Entities["Generators (T2)"] = {

	["Hydro-Electric Generator"]		= BaseWars.GSL{Model = "models/props_industrial/oil_storage.mdl", Price = 5000000, ClassName = "bw_gen_hydro", Level = 50},
	["Fusion Reactor"]				= BaseWars.GSL{Model = "models/props/de_train/pallet_barrels.mdl", Price = 15000000, ClassName = "bw_gen_fusion", Level = 75},

}

BaseWars.SpawnList.Entities["Generators (T3)"] = {
	
	["Dark Fusion Reactor"]				= BaseWars.GSL{Model = "models/props/de_train/pallet_barrels.mdl", Price = 250000000, ClassName = "bw_gen_dark", Level = 125},

}

BaseWars.SpawnList.Entities["Dispensers (T1)"] = {

	["Vending Machine"]				= BaseWars.GSL{Model = "models/props_interiors/VendingMachineSoda01a.mdl", Price = 20000, ClassName = "bw_vendingmachine"},
	["Ammo Dispenser"]				= BaseWars.GSL{Model = "models/props_lab/reciever_cart.mdl", Price = 155000, ClassName = "bw_dispenser_ammo"},
	["Armour Dispenser"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 35000, ClassName = "bw_dispenser_armor"},

}

BaseWars.SpawnList.Entities["Dispensers (T2)"] = {
	
	["Printer-Paper Refiller"]		= BaseWars.GSL{Model = "models/props_lab/plotter.mdl", Price = 150000000, ClassName = "bw_dispenser_paper", Limit = 1, Level = 100},
	["HealthPad"]					= BaseWars.GSL{Model = "models/props_lab/teleplatform.mdl", Price = 45000000, ClassName = "bw_healthpad", UseSpawnFunc = true, level = 80},

}

BaseWars.SpawnList.Entities["Dispensers (T3)"] = {

	["Ammo Dispenser v2"]				= BaseWars.GSL{Model = "models/props_lab/reciever_cart.mdl", Price = 4*10^8, ClassName = "bw_dispenser_ammo2", Level = 125},
	["Armour Dispenser v2"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 2*10^8, ClassName = "bw_dispenser_armor2", Level = 110},

}


BaseWars.SpawnList.Entities["Structures (T1)"] = {

	-- T1
	["Spawnpoint"]					= BaseWars.GSL{Model = "models/props_trainstation/trainstation_clock001.mdl", Price = 15000, ClassName = "bw_spawnpoint", UseSpawnFunc = true},
	["Drug Lab"]					= BaseWars.GSL{Model = "models/props_lab/crematorcase.mdl", Price = 35000, ClassName = "bw_druglab"},

}

BaseWars.SpawnList.Entities["Structures (T2)"] = {

	-- T2
	["Radar"]						= BaseWars.GSL{Model = "models/props_rooftop/roof_dish001.mdl", Price = 25000000, ClassName = "bw_radar",  Limit = 1, Level = 35},

}

BaseWars.SpawnList.Entities["Defense (T1)"] = {

	-- T1
	["Explosive Mine"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 40000, ClassName = "bw_explosive_mine", Limit = 8, Level = 9, ShouldFreeze = false},
	["Ballistic Turret"] 			= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 85000, ClassName = "bw_turret_ballistic", Limit = 2, Level = 15},
	["Laser Turret"] 					= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 120000, ClassName = "bw_turret_laser", Limit = 1, Level = 18},
	
}

BaseWars.SpawnList.Entities["Defense (T2)"] = {

	-- T2
	["Fast Mine"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 80000, ClassName = "bw_explosive_mine_speed", Limit = 5, Level = 20, ShouldFreeze = false},
	["Powerful Mine"] 			= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 150000, ClassName = "bw_explosive_mine_power", Limit = 5, Level = 25, ShouldFreeze = false},
	["Shock Mine"] 			= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 250000, ClassName = "bw_explosive_mine_shock", Limit = 3, Level = 30, ShouldFreeze = false},
	["Controllable Turret"] = BaseWars.GSL{Model = "models/props_combine/combine_barricade_short02a.mdl", Price = 750000, ClassName = "bw_turret_manual", Limit = 3, Level = 35},
	["Rapid Laser Turret"] 			= BaseWars.GSL{Model = "models/Combine_turrets/Floor_turret.mdl", Price = 1100000, ClassName = "bw_turret_laser_rapid", Limit = 1, Level = 45},
	["Tesla Coil"]					= BaseWars.GSL{Model = "models/props_c17/substation_transformer01d.mdl", Price = 65000000, ClassName = "bw_tesla", Limit = 1, Level = 65},

}

BaseWars.SpawnList.Entities["Consumables (T1)"] = {

	["Repair Kit"]					= BaseWars.GSL{Model = "models/Items/car_battery01.mdl", Price = 30000, ClassName = "bw_repairkit", UseSpawnFunc = true},
	["Armour Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 85000, ClassName = "bw_entityarmor", UseSpawnFunc = true},
	["Capacity Kit"]				= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 100000, ClassName = "bw_printercap", UseSpawnFunc = true},
	["Battery Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 40000, ClassName = "bw_battery", UseSpawnFunc = true},
	["Printer Paper"]				= BaseWars.GSL{Model = "models/props_junk/garbage_newspaper001a.mdl", Price = 2000, ClassName = "bw_printerpaper", UseSpawnFunc = true},

}

BaseWars.SpawnList.Entities["Consumables (T2)"] = {
	
	["Heavy Armour Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 8500000, ClassName = "bw_armor_heavy", UseSpawnFunc = true, Level = 75},
	["Heavy Capacity Kit"]					= BaseWars.GSL{Model = "models/props_junk/cardboard_box004a.mdl", Price = 12500000, ClassName = "bw_cap_heavy", UseSpawnFunc = true, Level = 75},
	
}


BaseWars.SpawnList.Entities["Printers (T0)"] = {

	["Wooden Printer"]				= BaseWars.GSL{Model = "models/props_junk/wood_crate001a.mdl", Price = 200, ClassName = "bw_printer_wooden"},
	["Plastic Printer"]				= BaseWars.GSL{Model = "models/props_lab/partsbin01.mdl", Price = 500, ClassName = "bw_printer_plastic"},
	["Scrap Metal Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01c.mdl", Price = 1000, ClassName = "bw_printer_scrap"},
	["Basic Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2000, ClassName = "bw_base_moneyprinter"},

	["T0 VIP Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2001, ClassName = "bw_printer_vip0", VIP = true},

}

BaseWars.SpawnList.Entities["Printers (T1)"] = {

	-- T1
	["Copper Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 12500, ClassName = "bw_printer_copper", Level = 3},
	["Silver Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 20000, ClassName = "bw_printer_silver", Level = 7},
	["Gold Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 50000, ClassName = "bw_printer_gold", Level = 9},
	["Platinum Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 75000, ClassName = "bw_printer_platinum", Level = 13},
	["Iridium Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 150000, ClassName = "bw_printer_iridium", Level = 17},
	["Uranium Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 300000, ClassName = "bw_printer_nuclear", Level = 21},

	["T1 VIP Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 300001, ClassName = "bw_printer_vip1", VIP = true},

}

BaseWars.SpawnList.Entities["Printers (T2)"] = {

	-- T2
	["Mobius Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price =     15000000, ClassName = "bw_printer_mobius", Level = 50},
	["Dark Matter Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price =   30000000, ClassName = "bw_printer_darkmatter", Level = 60},
	["Red Matter Printer"]    		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 45000000, ClassName = "bw_printer_redmatter", Level = 70},
	["Monolith Printer"]      		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 60000000, ClassName = "bw_printer_monolith", Level = 80},
	["Quantum Printer"]       		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 85000000, ClassName = "bw_printer_quantum", Level = 90},
	["Quasar Printer"]       		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 	 110000000, ClassName = "bw_printer_quasar", Level = 100},

	["T2 VIP Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 110000001, ClassName = "bw_printer_vip2", VIP = true},

}

BaseWars.SpawnList.Entities["Printers (T3)"] = {

	-- T3
	["Emerald Printer"]    			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 550000000, ClassName = "bw_printer_emerald", Level = 125},
	["Obsidian Printer"]     		= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 1000000000, ClassName = "bw_printer_obsidian", Level = 150},
	["Diamond Printer"]       	= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 1300000000, ClassName = "bw_printer_diamond", Level = 175},
	["Tanzanite Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 1800000000, ClassName = "bw_printer_tanzan", Level = 200},
	["Black Opal Printer"]			= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2200000000, ClassName = "bw_printer_opal", Level = 225},
	["Red Beryl Printer"]      	= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2600000000, ClassName = "bw_printer_beryl", Level = 250},

	["T3 VIP Printer"]				= BaseWars.GSL{Model = "models/props_lab/reciever01a.mdl", Price = 2600000001, ClassName = "bw_printer_vip3", VIP = true},

}
