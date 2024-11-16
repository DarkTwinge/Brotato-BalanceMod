extends Node

const BALMOD_DIR = "res://mods-unpacked/DarkTwinge-BalanceMod/"
const BALMOD_DIR_E = "res://mods-unpacked/DarkTwinge-BalanceMod/extensions/"

func _init(modLoader = ModLoader):


	# Adds another arg to explosions so they can also show the size
	# -->TODO Items side still needs more finishing right? It's wrong for e.g. Sauce?
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "effects/weapons/exploding_effect.gd")
###	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "effects/items/item_exploding_effect.gd")


	
	#y Increases Luck's effect on higher-tier equipment/level-ups
	#y Weighs weapon-set-favoring bonus based on how many of the weapons providing those sets you have
	# Adjusts shop weapon pick odds based on number of weapon types held
	# Turns exact-weapon picks into weapon-set picks if it can't find an exact-pick
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "singletons/item_service.gd")
	
	# Gives One-armed a 4-set Bonus for their weapon
	# Slightly reduce the strength of armor
	#x? Makes Glutton, Spicy Sauce, and Rip and Tear all use the crit stat
	# Gives Gun Mage an extra Sausage
	#y (Adds new effects to RunData)
	#y (Adds new init effects)
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "singletons/run_data.gd")

	# Now applies Crazy's +Range to Crossbow/Sniper
	# Now applies Brawler's +AttackSpeed to Claw 
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "singletons/weapon_service.gd")

	# Fix Lightning Shiv bounce count
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "effects/weapons/projectiles_on_hit_effect.gd")

	#y New Padding Effect
	#y New Couch Negative Speed Effect
##	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "singletons/linked_stats.gd")
	
	#x This part removed as it seemed naturally fixed now? [Make tooltip for Speed Generator work properly]
	#y Add new Padding effect
##	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "effects/items/gain_stat_for_every_stat_effect.gd")

	# Adds a new enemy-group to Horde waves to spawn Magicians for Wave 14/15
### TODO Check if this affects Abyss
###	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "zones/wave_manager.gd")

	# Load up new and fixed descriptions
	ModLoaderMod.add_translation("res://mods-unpacked/DarkTwinge-BalanceMod/translations/BalanceMod.en.translation")
	
	# All DLC Changes are here
	ModLoaderMod.install_script_extension(BALMOD_DIR_E + "singletons/progress_data.gd")


func _ready()->void:
	var temp
	var temp_2
	var temp_find


	## TEXT KEYS ##
	# Changed effects/text
	Text.keys_needing_operator.new_effect_gain_stat_for_every_different_stat = [0, 4]
	Text.keys_needing_operator.new_effect_damage_against_bosses = [0]
	Text.keys_needing_operator.effect_bounce_damage = [0]
	Text.keys_needing_operator.new_effect_item_box_gold = [0]
	Text.keys_needing_operator.new_effect_on_hit = [0]
	Text.keys_needing_percent.new_effect_damage_against_bosses = [0]
	###Text.keys_needing_percent.new_effect_burning_cooldown_reduction = [0]
	Text.keys_needing_percent.new_effect_burn_chance = [0]
	Text.keys_needing_percent.effect_bounce_damage = [0]
	Text.keys_needing_percent.new_effect_explode_melee = [0]
	Text.keys_needing_percent.new_effect_explode_custom = [0]
	Text.keys_needing_percent.new_effect_explode_on_consumable = [0]
	Text.keys_needing_percent.new_effect_explode_on_death = [0]
	
	# New effects
	###Text.keys_needing_percent.bm_enemy_charge_speed = [0]
	Text.keys_needing_percent.bm_non_elemental_reduce_stat_gains = [1]
	###Text.keys_needing_operator.bm_effect_for_negative_speed = [0]
	Text.keys_needing_operator.bm_effect_unique_tier_iv_weapon_bonus = [0, 2]
	# This group for making descriptions shorter
	Text.keys_needing_percent.new_effect_increase_stat_gains = [1]
	Text.keys_needing_percent.new_effect_reduce_stat_gains = [1]
	Text.keys_needing_operator.new_effect_gain_stat_for_every_tree = [0, 4]
	Text.keys_needing_percent.new_effect_convert_stat_temp_half_wave = [0]
	
	
	## ENEMIES ##
	# Elite scenes to change behavior:
	# Hivemind Phase 2 cooldown nerf
	# Rhino buff	
	# Butcher range increase
	# Insect buff
	var elite_scenes = {
		"elite_colossus":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/colossus.tscn",
##		"elite_rhino":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/rhino.tscn",
		"elite_butcher":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/butcher.tscn",
		"elite_insect":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/mantis.tscn"
	}
	for elite in ItemService.elites:
		if elite.my_id in elite_scenes.keys():
			elite.scene = load(elite_scenes[elite.my_id])

	# Rhino Elite
	temp = load("res://entities/units/enemies/rhino/rhino_stats.tres")
	temp.speed = 275 	# 250


	# Small Charger
	temp = load("res://entities/units/enemies/charger/charger_stats.tres")
	temp.knockback_resistance = 0.75		 # 0.8

	# Small Viking
	temp = load("res://entities/units/enemies/horned_charger/horned_charger_stats.tres")
	temp.knockback_resistance = 0.75		 # 0.8
		
	# Tall Bruiser
	temp = load("res://entities/units/enemies/bruiser/bruiser_stats.tres")
	temp.knockback_resistance = 0.87		 # 0.9

	# Tall Armored Bruiser
	temp = load("res://entities/units/enemies/horned_bruiser/horned_bruiser_stats.tres")
	temp.knockback_resistance = 0.87		 # 0.9

	# Hatched Slasher
	temp = load("res://entities/units/enemies/slasher/slasher_stats.tres")
	temp.knockback_resistance = 0.87		 # 0.9
	
	# Lamprey Fish
	temp = load("res://entities/units/enemies/lamprey/lamprey_stats.tres")
	temp.knockback_resistance = 0.93		 # 0.95
	
	
	## WAVE SPAWNS ##
	# Wave 12
	temp = load("res://zones/zone_1/012/d1_group_1.tres") # Healers
	temp_2 = load("res://zones/zone_1/012/unit_2.tres")
	temp.wave_units_data.push_back(temp_2)  # Add a Mummy to the Healer group (+6 total)
	
	# Wave 14
	temp = load("res://zones/zone_1/014/unit_5.tres")  # Magicians
	temp.max_number = 1     # 1-2 -> 1
	temp = load("res://zones/zone_1/014/group_2.tres") # Helmets
	temp.repeating_interval = 6  # 5 (Total groups 18 -> 17)
	temp = load("res://zones/zone_1/014/unit_2.tres")  # Helmets
	temp.min_number = 5     # 6 
	temp.max_number = 5     # 6
	# Adds one extra early group of edge Basics (120 total Basics -> 130)
	temp = load("res://zones/zone_1/014/group_3.tres") # Basics
	temp.spawn_timing = 6   # 15
	temp.repeating_interval = 7 # 5
	temp = load("res://zones/zone_1/014/unit_3.tres")
	temp.max_number = 7     # 6.0 -> 6.5
	
	# Wave 15
	temp = load("res://zones/zone_1/015/unit_2.tres")  # Helmets
	temp.min_number = 5     # 6 
	temp.max_number = 5     # 6
	
	# Wave 16
	# Add 2 Fly alongside the Helmets + Buffers
	temp = load("res://zones/zone_1/016/group_1.tres") # Helmets + Buffers
	temp.area = 700 # 500
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/wave16_fly.tres")
	temp.wave_units_data.push_back(temp_2)
	# Adds 2 more groups of Bruisers starting earlier in the wave
	temp = load("res://zones/zone_1/016/group_4.tres") # 1 Bruiser + 1 Armored Bruiser
	temp.reduce_repeating_interval = 1
	temp.repeating_interval = 5     # 3
	temp.min_repeating_interval = 3 # (1)
	temp.spawn_timing = 22				  # 32
	
	# Wave 20
	temp = load("res://zones/zone_1/020/wave_20.tres")
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/wave20_basic.tres")
	temp.groups_data.push_back(temp_2)
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/wave20_fin.tres")
	temp.groups_data.push_back(temp_2)

	# Wave 14 & 15 Horde
	# Basics 26x4 & Chasers 26x4 -> 0 & 0 for Wave 14/15
	temp = load("res://zones/zone_1/000_hordes/group_3b.tres")
	temp.max_wave = 13    # Groups of 4 Chasers + 4 Basics in 2nd half removed for 14+15 to make more room for others
	temp = load("res://zones/zone_1/000_hordes/group_4.tres")
	# Helmets 33x8.5 -> 31x6
	temp.repeating_interval = 3 
	temp.spawn_edge_of_map = true
	temp = load("res://zones/zone_1/000_hordes/unit_3.tres") # Helmet
	temp.min_number = 5   # 8
	temp.max_number = 7   # 9
	temp = load("res://zones/zone_1/000_hordes/group_5.tres")
	temp.min_wave = 13		# 15
	temp.spawn_edge_of_map = true
	# Basic 28x4 & Chaser 28x4 -> 0
	temp_2 = load("res://zones/zone_1/000_hordes/unit_1.tres") # Basic
	temp.wave_units_data.erase(temp_2) 
	temp_2 = load("res://zones/zone_1/000_hordes/unit_2.tres") # Chaser
	temp.wave_units_data.erase(temp_2)
	# (Leaving only 28x6.5 Fins)
	
		


	## TIER-1 ITEMS ##
	temp = load("res://items/all/alien_tongue/alien_tongue_data.tres")
	temp.value = 23  # 25
	temp = load("res://items/all/alien_tongue/alien_tongue_effect_1.tres")
	temp.value = 40  # 30 (Pickup Range)
	temp = load("res://items/all/alien_tongue/alien_tongue_effect_2.tres")
	temp.value = 2  # 1 (Knockback)	

	temp = load("res://items/all/baby_gecko/baby_gecko_effect_0.tres")
	temp.value = 12   # 10 (Range)

	temp = load("res://items/all/bag/bag_data.tres")
	temp.value = 16   # 15
	temp = load("res://items/all/bag/bag_effect_1.tres")
	temp.text_key = "new_effect_item_box_gold"
	
	temp = load("res://items/all/beanie/beanie_effect_2.tres")
	temp.value = -7  # -6 (Range)
	
	temp = load("res://items/all/book/book_data.tres")
	temp.value = 7  # 8
		
	temp = load("res://items/all/boxing_glove/boxing_glove_effect_1.tres")
	temp.value = 4  # 3 (Knockback)

	temp = load("res://items/all/broken_mouth/broken_mouth_data.tres")
	temp.value = 26   # 25

	temp = load("res://items/all/cake/cake_data.tres")
	temp.value = 16   # 15

	temp = load("res://items/all/coupon/coupon_data.tres")
	temp.value = 19   # 15
	
	temp = load("res://items/all/cute_monkey/cute_monkey_data.tres")
	temp.value = 34  # 25
	temp.max_nb = 10 # 13 (Limit)
	temp = load("res://items/all/cute_monkey/cute_monkey_effect_1.tres")
	temp.value = 10  # 8 (Healing Proc Chance)
	
	temp = load("res://items/all/duct_tape/duct_tape_data.tres")
	temp.value = 15  # 20 
	
	temp = load("res://items/all/fertilizer/fertilizer_data.tres")
	temp.value = 17  # 15
	temp = load("res://items/all/fertilizer/fertilizer_effect_1.tres")
	temp.value = 7   # 8 (Harvesting)
	
	temp = load("res://items/all/glasses/glasses_effect_1.tres")
	temp.value = 22  # 20 (Range)
	
	temp = load("res://items/all/head_injury/head_injury_data.tres")
	temp.value = 24  # 25
	temp = load("res://items/all/head_injury/head_injury_effect_1.tres")
	temp.value = 7   # 6 (Damage%)
	temp = load("res://items/all/head_injury/head_injury_effect_2.tres")
	temp.key = "stat_speed"
	temp.value = -2  # -8 Range -> -2 Speed
	
	temp = load("res://items/all/hedgehog/hedgehog_data.tres")
	temp.value = 25  # 30

	temp = load("res://items/all/helmet/helmet_data.tres")
	temp.value = 19  # 15
	temp = load("res://items/all/helmet/helmet_effect_2.tres")
	temp.key = "stat_range"
	temp.value = -10 # -2 Speed -> -10 Range
	
	temp = load("res://items/all/landmines/landmines_data.tres")
	temp.value = 14  # 15
	## THIS TOOLTIP IS HARDCODED
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/landmine_size_text.tres")
	temp.effects.push_back(temp_2) # Add explosion size text
	
	temp = load("res://items/all/lens/lens_effect_2.tres")
	temp.value = -10  # -5 (Range)
	
	temp = load("res://items/all/lost_duck/lost_duck_effect_1.tres")
	temp.value = 9  # 8 (Luck)
	
	temp = load("res://items/all/lumberjack_shirt/lumberjack_shirt_data.tres")
	temp.value = 13  # 15

	temp = load("res://items/all/mutation/mutation_data.tres")
	temp.value = 20  # 25
	temp = load("res://items/all/mutation/mutation_effect_3.tres")
	temp.value = -2  # -3 (Knockback)

	temp = load("res://items/all/propeller_hat/propeller_hat_data.tres")
	temp.value = 25  # 28

	temp = load("res://items/all/scar/scar_data.tres")
	temp.value = 24  # 25
	temp = load("res://items/all/scar/scar_effect_2.tres")
	temp.value = -11 # -8 (Range)
	
	temp = load("res://items/all/scared_sausage/scared_sausage_data.tres")
	temp.value = 20  # 25
	temp = load("res://items/all/scared_sausage/scared_sausage_effect_1.tres")
	temp.text_key = "NEW_EFFECT_BURN_CHANCE"
	
	temp = load("res://items/all/snake/snake_data.tres")
	temp.value = 23  # 25	
	temp.max_nb = 3  # -1	

	temp = load("res://items/all/terrified_onion/terrified_onion_data.tres")
	temp.value = 13  # 15
	
	temp = load("res://items/all/turret/turret_data.tres")
	temp.value = 16  # 15	
	
	temp = load("res://items/all/weird_food/weird_food_data.tres")
	temp.value = 24  # 20
		

	## TIER-2 ITEMS ##
	temp = load("res://items/all/acid/acid_data.tres")
	temp.value = 63   # 65

	temp = load("res://items/all/alien_eyes/alien_eyes_data.tres")
	temp.value = 53   # 50
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/alien_eyes_range_malus.tres")
	temp.effects.push_back(temp_2) # -8 Range
	
	temp = load("res://items/all/banner/banner_effect_1.tres")
	temp.value = 25   # 20 (Range)
		
	temp = load("res://items/all/blindfold/blindfold_effect_3.tres")
	temp.value = -18  # -15 (Range)
	
	temp = load("res://items/all/blood_leech/blood_leech_data.tres")
	temp.value = 41   # 45	

	temp = load("res://items/all/campfire/campfire_data.tres")
	temp.value = 46   # 40
	temp = load("res://items/all/campfire/campfire_effect_2.tres")
	temp.value = 3    # 2 (HP Regen)

	temp = load("res://items/all/cyclops_worm/cyclops_worm_effect_2.tres")
	temp.value = -16  # -12 (Range)
	
	temp = load("res://items/all/dangerous_bunny/dangerous_bunny_data.tres")
	temp.value = 35   # 30
	
	temp = load("res://items/all/energy_bracelet/energy_bracelet_effect_1.tres")
	temp.value = 5    # 4 (Crit Chance)
	
	# Garden
	temp = load("res://items/all/garden/garden_data.tres")
	temp.tags.push_back("garden")
	temp = load("res://items/all/garden/garden_effect_1.tres")
	temp.text_key = "new_effect_garden"

	# Incendiary Turret
	temp = load("res://items/all/turret_flame/turret_flame_data.tres")
	temp.value = 42  # 40
	temp = load("res://entities/structures/turret/flame/flame_turret_stats.tres")
	temp.scaling_stats = [ [ "stat_engineering", 0.35 ] ]  # 0.33

	temp = load("res://items/all/gambling_token/gambling_token_effect_1.tres")
	temp.value = 9  # 8 (Dodge)
	
	temp = load("res://items/all/leather_vest/leather_vest_data.tres")
	temp.value = 48  # 45

	temp = load("res://items/all/little_frog/little_frog_data.tres")
	temp.value = 43  # 45
	temp = load("res://items/all/little_frog/little_frog_effect_1.tres")
	temp.value = 35  # 20 (Pickup Range)
	
	temp = load("res://items/all/little_muscley_dude/little_muscley_dude_effect_3.tres")
	temp.value = -18  # -15 (Range)

	temp = load("res://items/all/lure/lure_data.tres")
	temp.value = 37  # 34
			
	temp = load("res://items/all/medal/medal_data.tres")
	temp.value = 60  # 55
	temp = load("res://items/all/medal/medal_effect_5.tres")
	temp.value = -3  # -4 (Crit%)
	
	temp = load("res://items/all/metal_detector/metal_detector_effect_4.tres")
	temp.value = -4  # -5 (Damage%)
	
	temp = load("res://items/all/metal_plate/metal_plate_data.tres")
	temp.value = 42  # 40
	
	temp = load("res://items/all/missile/missile_data.tres")
	temp.value = 43  # 45
	temp = load("res://items/all/missile/missile_effect_1.tres")
	temp.value = 11  # 10 (Damage%)
	
	temp = load("res://items/all/pocket_factory/pocket_factory_effect_0.tres")
	temp.value = 3   # 2 (Engineering)
	
	temp = load("res://items/all/pumpkin/pumpkin_data.tres")
	temp.max_nb = 8  # -1
	temp_2 = load("res://items/all/pumpkin/pumpkin_effect_2.tres")
	temp.effects.erase(temp_2)     # Remove -2% Damage penalty
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/pumpkin_bounce.tres")
	temp.effects.push_back(temp_2) # Add +15% Bounce Damage

	temp = load("res://items/all/recycling_machine/recycling_machine_data.tres")
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/recycling_machine_attack_speed_malus.tres")
	temp.effects.push_back(temp_2) # -2 Attack Speed
	
	temp = load("res://items/all/riposte/riposte_data.tres")
	temp.value = 34  # 40
	
	temp = load("res://items/all/ritual/ritual_data.tres")
	temp.value = 57  # 60

	temp = load("res://items/all/scope/scope_effect_2.tres")
	temp.value = 40  # 25 (Range)

	temp = load("res://items/all/shady_potion/shady_potion_effect_1.tres")
	temp.value = 19  # 20 (Luck)

	temp = load("res://items/all/spicy_sauce/spicy_sauce_data.tres")
	temp.value = 41  # 40
	temp.max_nb = 3  # 4 (Limit)
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/rip_sauce_clarify_effect.tres")
	temp.effects.append(temp_2)	
	temp = load("res://items/all/spicy_sauce/spicy_sauce_effect_1.tres")
	temp.scale = 1.35   # 1.25 (Explosion Size)
	temp.chance = 0.35  # 0.33 (Proc Chance)
	temp.text_key = "new_effect_explode_on_consumable"
	temp = load("res://items/all/spicy_sauce/spicy_sauce_stats.tres")
	temp.crit_chance = 0.01  # 0 (Crit Chance)

	temp = load("res://items/all/wheelbarrow/wheelbarrow_data.tres")
	temp.value = 37  # 40	
	
	temp = load("res://items/all/whetstone/whetstone_data.tres")
	temp.value = 42  # 40
	
	temp = load("res://items/all/white_flag/white_flag_effect_1.tres")
	temp.value = 6   # 5 (Harvesting)


	## TIER-3 ITEMS ##
	temp = load("res://items/all/adrenaline/adrenaline_data.tres")
	temp.value = 57  # 60

	temp = load("res://items/all/alien_magic/alien_magic_data.tres")
	temp.value = 82  # 85
	
	temp = load("res://items/all/alloy/alloy_effect_1.tres")
	temp.value = 5   # 3 (Melee Damage)
	temp = load("res://items/all/alloy/alloy_effect_5.tres")
	temp.value = -5  # -6 (Dodge)
	
	temp = load("res://items/all/baby_with_a_beard/baby_with_a_beard_effect_1.tres")
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/weapons/baby_beard_weapon_stats.tres")
	temp.weapon_stats = temp_2 # Ranged Damage scaling 100% -> 75%

	temp = load("res://items/all/blood_donation/blood_donation_data.tres")
	temp.value = 43  # 50
	
	temp = load("res://items/all/bowler_hat/bowler_hat_data.tres")
	temp.value = 70  # 75
	temp = load("res://items/all/bowler_hat/bowler_hat_effect_1.tres")
	temp.value = 17  # 15 (Luck)
	
	temp = load("res://items/all/candle/candle_data.tres")
	temp.value = 50  # 65
	temp = load("res://items/all/candle/candle_effect_1.tres")
	temp.value = 3   # 4 (Elemental Damage)
	temp = load("res://items/all/candle/candle_effect_4.tres")
	temp.key = "stat_attack_speed"
	temp.value = -4  # -5 (Damage -> Attack Speed)
	
	temp = load("res://items/all/chameleon/chameleon_data.tres")
	temp.value = 55  # 70
	temp = load("res://items/all/chameleon/chameleon_effect_2.tres")
	temp.value = -2  # -4 (%Damage)

	temp = load("res://items/all/community_support/community_support_data.tres")
	temp.value = 72  # 75
	temp.tags.push_back("stat_attack_speed")
	
	temp = load("res://items/all/crown/crown_data.tres")
	temp.value = 68  # 70
	
	# Fairy
	temp = load("res://items/all/fairy/fairy_data.tres")
	temp.value = 90  # 85
	###temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/fairy_count_tier1s.tres")
	###temp.effects.insert(1, temp_2)
	temp = load("res://items/all/fairy/fairy_effect_1.tres")
	temp.value = 2   # 1 (HP Regen Gained)
	temp.nb_stat_scaled = 3 # 1 (Items Required)
	temp.text_key = "NEW_EFFECT_GAIN_STAT_FOR_EVERY_DIFFERENT_STAT"
	temp = load("res://items/all/fairy/fairy_effect_2.tres")
	temp.key = "stat_speed"
	temp.value = -3  # (-2 HP Regen -> -3 Speed)

	temp = load("res://items/all/fin/fin_effect_1.tres")
	temp.value = 9   # 10 (Speed)
	temp = load("res://items/all/fin/fin_effect_3.tres")
	temp.value = -9  # -8 (Luck)

	temp = load("res://items/all/glass_cannon/glass_cannon_data.tres")
	temp.value = 70  # 75
	
	temp = load("res://items/all/hunting_trophy/hunting_trophy_data.tres")
	temp.value = 60  # 55
	
	temp = load("res://items/all/lucky_charm/lucky_charm_data.tres")
	temp.value = 70  # 75
	
	temp = load("res://items/all/plastic_explosive/plastic_explosive_data.tres")
	temp.value = 53  # 60
	
	temp = load("res://items/all/poisonous_tonic/poisonous_tonic_effect_3.tres")
	temp.value = 27  # 15 (Range)

	temp = load("res://items/all/power_generator/power_generator_data.tres")
	temp_2 = load("res://items/all/power_generator/power_generator_effect_2.tres")
	temp.effects.erase(temp_2) # Remove -Damage%
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/power_generator_2_max_hp_malus.tres")
	temp.effects.push_back(temp_2) # -1 HP per 5% Speed
##temp = load("res://items/all/power_generator/power_generator_effect_1.tres")
##temp.text_key = "EFFECT_GAIN_STAT_FOR_EVERY_STAT" # Change to all Speed instead of Perm only

	temp = load("items/all/rip_and_tear/rip_and_tear_data.tres")
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/rip_sauce_clarify_effect.tres")
	temp.effects.append(temp_2)
	temp = load("items/all/rip_and_tear/rip_and_tear_stats.tres")
	temp.crit_chance = 0.01  # 0 (Crit Chance)
	temp = load("items/all/rip_and_tear/rip_and_tear_effect_1.tres")
	temp.text_key = "new_effect_explode_on_death"
	
	temp = load("res://items/all/shackles/shackles_data.tres")
	temp.value = 86  # 80
	temp = load("res://items/all/shackles/shackles_effect_3.tres")
	temp.value = 88  # 80 (Range)

	temp = load("res://items/all/shmoop/shmoop_data.tres")
	temp.value = 65  # 60
	temp = load("res://items/all/shmoop/shmoop_effect_2.tres")
	temp.value = 3   # 2 (HP Regen)
	
	temp = load("res://items/all/statue/statue_data.tres")
	temp.value = 55  # 60

	temp = load("res://items/all/strange_book/strange_book_data.tres")
	temp.value = 65  # 70
	
	temp = load("res://items/all/tardigrade/tardigrade_data.tres")
	temp.value = 42  # 50

	temp = load("res://items/all/toolbox/toolbox_effect_1.tres")
	temp.value = 7   # 6 (Engineering)
	temp = load("res://items/all/toolbox/toolbox_effect_2.tres")
	temp.value = -5  # -8 (Attack Speed)
	
	temp = load("res://items/all/triangle_of_power/triangle_of_power_effect_3.tres")
	temp.text_key = "new_effect_on_hit"
	
	temp = load("res://items/all/vigilante_ring/vigilante_ring_data.tres")
	temp.value = 80  # 92
	
	temp = load("res://items/all/wandering_bot/wandering_bot_data.tres")
	temp.value = 43  # 60
	
	temp = load("res://items/all/wheat/wheat_data.tres")
	temp.value = 81  # 85
	temp = load("res://items/all/wheat/wheat_effect_3.tres")
	temp.value = 13  # 10 (Harvesting)
	
	temp = load("res://items/all/wings/wings_effect_2.tres")
	temp.value = 35  # 30 (Range)
	
	temp = load("res://items/all/wisdom/wisdom_data.tres")
	temp.value = 82  # 85
	

	## TIER-4 ITEMS ##
	# Diploma
	temp = load("res://items/all/diploma/diploma_data.tres")
	temp.value = 85   # 90
	
	# Explosive Shells
	temp = load("res://items/all/explosive_shells/explosive_shells_effect_1.tres")
	temp.value = 45   # 60 (Explosion Damage)	
	temp = load("res://items/all/explosive_shells/explosive_shells_effect_1b.tres")
	temp.value = 20   # 15 (Explosion Size)	
	temp = load("res://items/all/explosive_shells/explosive_shells_effect_2.tres")
	temp.value = -7   # -15 (Damage%)
	
	# Explosive Turret
	temp = load("res://items/all/turret_rocket/turret_rocket_data.tres")
	## THIS TOOLTIP IS HARDCODED
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/explosive_turret_size_text.tres")
	temp.effects.push_back(temp_2) # Add explosion size text
	
	# Focus
	temp = load("res://items/all/focus/focus_data.tres")
	temp.value = 100  # 110
	temp = load("res://items/all/focus/focus_effect_2.tres")
	temp.value = -4   # -3 (AtkSpd per weapon)
	
	# Gnome
	temp = load("res://items/all/gnome/gnome_effect_1.tres")
	temp.value = 12   # 10 (Melee Damage)	
	temp = load("res://items/all/gnome/gnome_effect_2.tres")
	temp.value = 8    # 10 (Elemental Damage)
	temp = load("res://items/all/gnome/gnome_effect_3.tres")
	temp.value = -25    # -20 (Range)
	
	# Heavy Bullets
	temp = load("res://items/all/heavy_bullets/heavy_bullets_data.tres")
	temp.value = 95   # 100
	temp.tags = [ "stat_ranged_damage", "stat_percent_damage", "stat_crit_chance" ]
	temp_2 = load("res://items/all/heavy_bullets/heavy_bullets_effect_5.tres")
	temp.effects.erase(temp_2)		 # -5% Crit -v
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/heavy_bullets_accuracy_malus.tres")
	temp.effects.push_back(temp_2) # -30% Accuracy
	temp = load("res://items/all/heavy_bullets/heavy_bullets_effect_3.tres")
	temp.key = "stat_crit_chance"
	temp.value = 5   # 10 Range -> 5% Crit Chance

	# Jetpack
	temp = load("res://items/all/jetpack/jetpack_data.tres")
	temp.value = 92  # 100
	temp = load("res://items/all/jetpack/jetpack_effect_3.tres")
	temp.value = -3  # -5

	# Lucky Coin
	temp = load("res://items/all/lucky_coin/lucky_coin_data.tres")
	temp.value = 70  # 105
	temp = load("res://items/all/lucky_coin/lucky_coin_effect_2.tres")
	temp.value = -1  # -2 (Armor)

	# Mammoth
	temp = load("res://items/all/mammoth/mammoth_data.tres")
	temp.value = 115 # 110
	temp = load("res://items/all/mammoth/mammoth_effect_1.tres")
	temp.value = 17  # 20 (Melee Damage)
	temp = load("res://items/all/mammoth/mammoth_effect_2.tres")
	temp.value = 4   # 5 (HP Regen)	
	temp = load("res://items/all/mammoth/mammoth_effect_4.tres")
	temp.value = -5  # -3 (Speed)	

	# Medikit
	temp = load("res://items/all/medikit/medikit_data.tres")
	temp.value = 105 # 95
	temp = load("res://items/all/medikit/medikit_effect_1.tres")
	temp.value = 4   # 10 (HP Regen)
	
	# Night Goggles
	temp = load("res://items/all/night_goggles/night_goggles_data.tres")
	temp.value = 87  # 95
	temp = load("res://items/all/night_goggles/night_goggles_effect_1.tres")
	temp.value = 14  # 15 (Crit Chance)
	temp = load("res://items/all/night_goggles/night_goggles_effect_2.tres")
	temp.value = 80  # 50 (Range)
	temp = load("res://items/all/night_goggles/night_goggles_effect_3.tres")
	temp.key = "stat_speed"
	temp.value = -4  # -3 HP -> -4 Speed

	# Octopus
	temp = load("res://items/all/octopus/octopus_data.tres")
	temp.value = 110 # 105
	
	# Potato
	temp = load("res://items/all/potato/potato_data.tres")
	temp.value = 100 # 95
	
	# Regeneration Potion
	temp = load("res://items/all/potion/potion_effect_2.tres")
	temp.value = 4   # 3 (HP Regen)
	
	# Retro's Hoodie
	temp = load("res://items/all/retromations_hoodie/retromations_hoodie_effect_0.tres")
	temp.value = 3   # 2 (AtkSpd per
	temp.nb_stat_scaled = 2 # 1  per Dodge)
	
	# Ricochet & adjacent changes
	temp = load("res://items/all/ricochet/ricochet_effect_1.tres")
	temp.text_key = "new_effect_bouncing"
	temp = load("res://items/all/ricochet/ricochet_effect_2.tres")
	temp.value = -20 # -25 (Damage%)
	temp = load("res://weapons/ranged/chain_gun/4/chain_gun_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/crossbow/1/crossbow_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/crossbow/2/crossbow_stats_2.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/crossbow/3/crossbow_stats_3.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/crossbow/4/crossbow_stats_4.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/double_barrel_shotgun/1/double_barrel_shotgun_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/double_barrel_shotgun/2/double_barrel_shotgun_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/double_barrel_shotgun/3/double_barrel_shotgun_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/double_barrel_shotgun/4/double_barrel_shotgun_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/flamethrower/2/flamethrower_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/flamethrower/3/flamethrower_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/flamethrower/4/flamethrower_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/gatling_laser/4/gatling_laser_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/laser_gun/1/laser_gun_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/laser_gun/2/laser_gun_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/laser_gun/3/laser_gun_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/laser_gun/4/laser_gun_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/minigun/3/minigun_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/minigun/4/minigun_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/obliterator/3/obliterator_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	temp = load("res://weapons/ranged/obliterator/4/obliterator_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/pistol/1/pistol_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/pistol/2/pistol_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/pistol/3/pistol_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/pistol/4/pistol_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/shredder/1/shredder_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/shredder/2/shredder_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/shredder/3/shredder_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/shredder/4/shredder_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/icicle/1/icicle_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/icicle/2/icicle_2_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/icicle/3/icicle_3_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://weapons/ranged/icicle/4/icicle_4_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5	
	temp = load("res://entities/structures/turret/laser/laser_turret_stats.tres")
	temp.bounce_dmg_reduction = 0.3 # 0.5
	
	# Spider
	temp = load("res://items/all/spider/spider_effect_1.tres")
	temp.value = 8   # 12 (Damage%)
	temp = load("res://items/all/spider/spider_effect_2.tres")
	temp.value = 8   # 6 (Atk Speed for Diff Weapons)	

	# Wolf Helm
	temp = load("res://items/all/wolf_helmet/wolf_helmet_data.tres")
	temp.value = 95  # 90
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/wolf_helm_malus.tres")
	temp.effects.push_back(temp_2)  # -5 Harvesting

	
	
	## WEAPONS ##
	## WEAPONS - MELEE ##
	# Cacti Club
	temp = load("res://weapons/melee/cactus_mace/4/cactus_mace_4_data.tres")
	temp.value = 133		 # 149
	
	# Chopper
	temp = load("res://weapons/melee/chopper/1/chopper_stats.tres")
	temp.damage = 7			 # 6
	temp = load("res://weapons/melee/chopper/3/chopper_3_stats.tres")
	temp.damage = 17     # 18
	temp = load("res://weapons/melee/chopper/4/chopper_4_data.tres")
	temp.value = 111		 # 122
	temp = load("res://weapons/melee/chopper/4/chopper_4_stats.tres")
	temp.damage = 27     # 30
	
	# Circular Saw
	temp = load("res://weapons/melee/circular_saw/4/circular_saw_4_data.tres")
	temp.value = 151		 # 173
	
	# Claw
	temp = load("res://weapons/melee/claw/4/claw_4_data.tres")
	temp.value = 100		 # 110	
	
	# Flaming Brass Knuckles
	temp = load("res://weapons/melee/flaming_knuckles/4/flaming_knuckles_4_data.tres")
	temp.value = 151		 # 173
	
	# Fist
	temp = load("res://weapons/melee/fist/1/fist_data.tres")
	temp.value = 12      # 10
	temp = load("res://weapons/melee/fist/1/fist_stats.tres")
	temp.cooldown = 14   # 13
	temp = load("res://weapons/melee/fist/2/fist_2_data.tres")
	temp.value = 26      # 22
	temp = load("res://weapons/melee/fist/2/fist_2_stats.tres")
	temp.cooldown = 11   # 10
	temp = load("res://weapons/melee/fist/3/fist_3_data.tres")
	temp.value = 52      # 45
	temp = load("res://weapons/melee/fist/3/fist_3_stats.tres")
	temp.cooldown = 9    # 8
	temp = load("res://weapons/melee/fist/4/fist_4_data.tres")
	temp.value = 95	     # 91
	temp = load("res://weapons/melee/fist/4/fist_4_stats.tres")
	temp.cooldown = 3    # 2
	
	# Ghost Axe
	temp = load("res://weapons/melee/ghost_axe/4/ghost_axe_4_data.tres")
	temp.value = 133		 # 149	
	
	# Ghost Flint
	temp = load("res://weapons/melee/ghost_flint/1/ghost_flint_stats.tres")
	temp.damage = 7      # 6
	temp.cooldown = 41   # 40
	temp = load("res://weapons/melee/ghost_flint/4/ghost_flint_4_data.tres")
	temp.value = 95			 # 105
	
	# Hammer
	temp = load("res://weapons/melee/hammer/4/hammer_4_data.tres")
	temp.value = 168		 # 190
	
	# Hand
	temp = load("res://weapons/melee/hand/1/hand_data.tres")
	temp.value = 9       # 10
	temp = load("res://weapons/melee/hand/1/hand_effect_1.tres")
	temp.value = 2			 # 3
	temp = load("res://weapons/melee/hand/2/hand_2_data.tres")
	temp.value = 19      # 22
	temp = load("res://weapons/melee/hand/2/hand_2_effect_1.tres")
	temp.value = 5			 # 6
	temp = load("res://weapons/melee/hand/3/hand_3_data.tres")
	temp.value = 33     	# 45
	temp = load("res://weapons/melee/hand/3/hand_3_effect_1.tres")
	temp.value = 10				# 9
	temp = load("res://weapons/melee/hand/4/hand_4_data.tres")
	temp.value = 60     	# 91
	temp = load("res://weapons/melee/hand/4/hand_4_effect_1.tres")
	temp.value = 20				# 18
	
	# Hatchet
	temp = load("res://weapons/melee/hatchet/1/hatchet_stats.tres")
	temp.max_range = 135	# 125
	temp = load("res://weapons/melee/hatchet/2/hatchet_2_stats.tres")
	temp.max_range = 135	# 125
	temp = load("res://weapons/melee/hatchet/3/hatchet_3_stats.tres")
	temp.max_range = 135	# 125
	temp = load("res://weapons/melee/hatchet/4/hatchet_4_data.tres")
	temp.value = 111			# 122
	temp = load("res://weapons/melee/hatchet/4/hatchet_4_stats.tres")
	temp.max_range = 135	# 125
	
	# Jousting Lance
	temp = load("res://weapons/melee/jousting_lance/3/jousting_lance_3_data.tres")
	temp.value = 71				# 72
	temp = load("res://weapons/melee/jousting_lance/4/jousting_lance_4_data.tres")
	temp.value = 128			# 132
	
	# Knife
	temp = load("res://weapons/melee/knife/4/knife_4_data.tres")
	temp.value = 111		 # 122

	# Lightning Shiv
	temp = load("res://weapons/melee/lightning_shiv/1/lightning_shiv_stats.tres")
	temp.cooldown = 28      # 27
	temp = load("res://weapons/melee/lightning_shiv/2/lightning_shiv_2_stats.tres")
	temp.cooldown = 24      # 22
	temp = load("res://weapons/melee/lightning_shiv/3/lightning_shiv_3_data.tres")
	temp.value = 68					# 66
	temp = load("res://weapons/melee/lightning_shiv/3/lightning_shiv_3_stats.tres")
	temp.cooldown = 20      # 18
	temp = load("res://weapons/melee/lightning_shiv/4/lightning_shiv_4_data.tres")
	temp.value = 125				# 142
	temp = load("res://weapons/melee/lightning_shiv/4/lightning_shiv_4_stats.tres")
	temp.cooldown = 15      # 13
	temp = load("res://weapons/melee/lightning_shiv/1/lightning_shiv_effect_1.tres")
	temp.key = "NEW_EFFECT_LIGHTNING_ON_HIT"
	temp = load("res://weapons/melee/lightning_shiv/2/lightning_shiv_2_effect_1.tres")
	temp.key = "NEW_EFFECT_LIGHTNING_ON_HIT"
	temp = load("res://weapons/melee/lightning_shiv/3/lightning_shiv_3_effect_1.tres")
	temp.key = "NEW_EFFECT_LIGHTNING_ON_HIT"
	temp = load("res://weapons/melee/lightning_shiv/4/lightning_shiv_4_effect_1.tres")
	temp.key = "NEW_EFFECT_LIGHTNING_ON_HIT"
	
	# Plank
	temp = load("res://weapons/melee/plank/1/plank_exploding_effect.tres")
	temp.scale = 0.8 			# 0.75
	temp.key = "new_effect_explode_melee"
	temp = load("res://weapons/melee/plank/2/plank_2_exploding_effect.tres")
	temp.scale = 0.9  		# 0.75
	temp.key = "new_effect_explode_melee"
	temp = load("res://weapons/melee/plank/3/plank_3_exploding_effect.tres")
	temp.scale = 1.0 			# 0.75
	temp.key = "new_effect_explode_melee"
	temp = load("res://weapons/melee/plank/4/plank_4_data.tres")
	temp.value = 111			# 122	
	temp = load("res://weapons/melee/plank/4/plank_4_exploding_effect.tres")
	temp.scale = 1.1			# 0.75
	temp.key = "new_effect_explode_melee"
	
	# Plasma Sledge
	temp = load("res://weapons/melee/plasma_sledgehammer/3/plasma_sledgehammer_3_data.tres")
	temp.value = 122			# 136
	temp = load("res://weapons/melee/plasma_sledgehammer/3/plasma_sledgehammer_3_effect.tres")
	temp.scale = 1.1    	# 1.0
	temp.chance = 0.33  	# 0.25
	temp.key = "new_effect_explode_melee"
	temp = load("res://weapons/melee/plasma_sledgehammer/4/plasma_sledgehammer_4_data.tres")
	temp.value = 218			# 272
	temp = load("res://weapons/melee/plasma_sledgehammer/4/plasma_sledgehammer_4_effect.tres")
	temp.scale = 1.35    	# 1.25
	temp.key = "new_effect_explode_melee"
	
	# Power Fist
	temp = load("res://weapons/melee/power_fist/3/power_fist_3_exploding_effect.tres")
	temp.key = "new_effect_explode_melee"
	temp = load("res://weapons/melee/power_fist/4/power_fist_4_data.tres")
	temp.value = 198			# 221	
	temp = load("res://weapons/melee/power_fist/4/power_fist_4_exploding_effect.tres")
	temp.key = "new_effect_explode_melee"
	
	# Pruner
	temp = load("res://weapons/melee/pruner/4/pruner_4_data.tres")
	temp.value = 93				# 95
	
	# Quarterstaff
	temp = load("res://weapons/melee/fighting_stick/4/fighting_stick_4_data.tres")
	temp.value = 120			# 130
	
	# Rock
	temp = load("res://weapons/melee/rock/4/rock_4_data.tres")
	temp.value = 81				# 91	
	
	# Scissors
	temp = load("res://weapons/melee/scissors/4/scissors_4_data.tres")
	temp.value = 111			# 122
	
	# Screwdriver
	temp = load("res://weapons/melee/screwdriver/1/screwdriver_data.tres")
	temp.value = 11					# 10
	temp = load("res://weapons/melee/screwdriver/1/screwdriver_stats.tres")
	temp.max_range = 135 		# 125
	temp.cooldown = 24  		# 31
	temp = load("res://weapons/melee/screwdriver/2/screwdriver_2_data.tres")
	temp.value = 23					# 22
	temp = load("res://weapons/melee/screwdriver/2/screwdriver_2_stats.tres")
	temp.max_range = 135 		# 125
	temp.cooldown = 21   		# 28
	temp.crit_chance = 0.12 # 15
	temp.crit_damage = 2.25 # 2.0
	temp = load("res://weapons/melee/screwdriver/3/screwdriver_3_data.tres")
	temp.value = 46					# 45
	temp = load("res://weapons/melee/screwdriver/3/screwdriver_3_stats.tres")
	temp.max_range = 135 		# 125
	temp.cooldown = 18   		# 26	
	temp.crit_chance = 0.15	# 20
	temp.crit_damage = 2.5  # 2.0
	temp = load("res://weapons/melee/screwdriver/4/screwdriver_4_data.tres")
	temp.value = 84					# 91
	temp = load("res://weapons/melee/screwdriver/4/screwdriver_4_stats.tres")
	temp.max_range = 135 		# 125
	temp.cooldown = 14   		# 20
	temp.crit_chance = 0.20 # 30
	temp.crit_damage = 3.0 	# 2.0
	
	# Scythe
	temp = load("res://weapons/melee/scythe/4/scythe_effect_2.tres")
	temp.text_key = "new_effect_on_hit"
	
	# Sharp Tooth
	temp = load("res://weapons/melee/sharp_tooth/4/sharp_tooth_4_data.tres")
	temp.value = 95			 # 105

	# Spear
	temp = load("res://weapons/melee/spear/1/spear_stats.tres")
	temp.max_range = 325 # 350
	temp.cooldown = 49   # 45
	temp = load("res://weapons/melee/spear/2/spear_2_stats.tres")
	temp.max_range = 350 # 375
	temp.cooldown = 39   # 36
	temp = load("res://weapons/melee/spear/3/spear_3_stats.tres")
	temp.max_range = 375 # 400
	temp.cooldown = 31   # 27
	temp = load("res://weapons/melee/spear/4/spear_4_data.tres")
	temp.value = 133		 # 149
	temp = load("res://weapons/melee/spear/4/spear_4_stats.tres")
	temp.max_range = 450 # 500
	temp.cooldown = 22   # 18
	
	# Spiky Shield
	temp = load("res://weapons/melee/spiky_shield/4/spiky_shield_4_data.tres")
	temp.value = 111		 # 122
	
	# Stick
	temp = load("res://weapons/melee/stick/4/stick_4_data.tres")
	temp.value = 81			 # 91
	
	# Sword
	temp = load("res://weapons/melee/sword/4/sword_4_data.tres")
	temp.value = 168		 # 190
	
	# Thief Dagger
	temp = load("res://weapons/melee/dagger/4/dagger_4_data.tres")
	temp.value = 95			 # 105
	temp = load("res://weapons/melee/dagger/4/dagger_4_stats.tres")
	temp.crit_chance = 0.35		# 0.4
	
	# Thunder Sword
	temp = load("res://weapons/melee/thunder_sword/4/thunder_sword_4_data.tres")
	temp.value = 209		 # 238
	
	# Torch
	temp = load("res://weapons/melee/torch/4/torch_4_data.tres")
	temp.value = 81			 # 91
	
	# Wrench
	temp = load("res://weapons/melee/wrench/4/wrench_4_data.tres")
	temp.value = 133		 # 149
	
	
	## WEAPONS - RANGED ##
	# Chain-gun
	temp = load("res://weapons/ranged/chain_gun/4/chain_gun_4_data.tres")
	temp.value = 280  		 # 300
	temp = load("res://weapons/ranged/chain_gun/4/chain_gun_4_stats.tres")
	temp.accuracy = 0.65	 # 0.8
	temp.additional_cooldown_multiplier = 104.0 # 60.0
	
	# Crossbow
	temp = load("res://weapons/ranged/crossbow/2/crossbow_data_2.tres")
	temp.value = 32	  		 # 34
	temp = load("res://weapons/ranged/crossbow/3/crossbow_data_3.tres")
	temp.value = 61	  		 # 62
	temp = load("res://weapons/ranged/crossbow/4/crossbow_data_4.tres")
	temp.value = 107  		 # 132
	
	# Double-barrel Shotgun
	temp = load("res://weapons/ranged/double_barrel_shotgun/2/double_barrel_shotgun_2_stats.tres")
	temp.accuracy = 0.9			# 0.95
	temp = load("res://weapons/ranged/double_barrel_shotgun/3/double_barrel_shotgun_3_stats.tres")
	temp.accuracy = 0.9			# 1.0
	temp = load("res://weapons/ranged/double_barrel_shotgun/4/double_barrel_shotgun_4_data.tres")
	temp.value = 133				# 149
	temp = load("res://weapons/ranged/double_barrel_shotgun/4/double_barrel_shotgun_4_stats.tres")
	temp.accuracy = 0.9			# 1.0
	
	# Fireball
	temp = load("res://weapons/ranged/fireball/fireball_effect.tres")
	temp.key = "new_effect_explode"
	temp.effect_sign = 0
	temp = load("res://weapons/ranged/fireball/3/fireball_3_data.tres")
	temp.value = 68					# 66
	temp = load("res://weapons/ranged/fireball/4/fireball_4_data.tres")
	temp.value = 125				# 140
	
	# Flamethrower
	temp = load("res://weapons/ranged/flamethrower/4/flamethrower_4_data.tres")
	temp.value = 185				#	207
	
	# Ghost Scepter
	temp = load("res://weapons/ranged/ghost_scepter/4/ghost_scepter_4_data.tres")
	temp.value = 111				#	122
	
	# Icicle
	temp = load("res://weapons/ranged/icicle/3/icicle_3_data.tres")
	temp.value = 68					# 66
	temp = load("res://weapons/ranged/icicle/4/icicle_4_data.tres")
	temp.value = 125				# 140
	
	# Laser Gun
	temp = load("res://weapons/ranged/laser_gun/4/laser_gun_4_data.tres")
	temp.value = 111				#	122
	
	# Medical Gun
	temp = load("res://weapons/ranged/medical_gun/1/medical_gun_stats.tres")
	temp.accuracy = 1.0			# 0.9
	temp = load("res://weapons/ranged/medical_gun/2/medical_gun_2_stats.tres")
	temp.accuracy = 1.0			# 0.9
	temp = load("res://weapons/ranged/medical_gun/3/medical_gun_3_stats.tres")
	temp.accuracy = 1.0			# 0.9
	temp = load("res://weapons/ranged/medical_gun/4/medical_gun_4_data.tres")
	temp.value = 111				# 122

	# Minigun
	temp = load("res://weapons/ranged/minigun/3/minigun_3_data.tres")
	temp.value = 122				# 127
	temp = load("res://weapons/ranged/minigun/3/minigun_3_stats.tres")
	temp.accuracy = 0.8			# 0.85
	temp = load("res://weapons/ranged/minigun/4/minigun_4_data.tres")
	temp.value = 218				# 255
	
	# Nuclear Launcher
	temp = load("res://weapons/ranged/nuclear_launcher/3/nuclear_launcher_3_effect.tres")
	temp.key = "new_effect_explode"
	temp.effect_sign = 0
	temp = load("res://weapons/ranged/nuclear_launcher/4/nuclear_launcher_4_data.tres")
	temp.value = 256				# 289
	temp = load("res://weapons/ranged/nuclear_launcher/4/nuclear_launcher_4_effect.tres")
	temp.key = "new_effect_explode"
	temp.effect_sign = 0
	
	# Obliterator
	temp = load("res://weapons/ranged/obliterator/3/obliterator_3_data.tres")
	temp.value = 122  			# 127
	temp = load("res://weapons/ranged/obliterator/3/obliterator_3_stats.tres")
	temp.projectile_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/weapons/obliterator_bullet.tscn")
	temp = load("res://weapons/ranged/obliterator/4/obliterator_4_data.tres")
	temp.value = 218  			# 255	
	temp = load("res://weapons/ranged/obliterator/4/obliterator_4_stats.tres")
	temp.projectile_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/weapons/obliterator_bullet.tscn")
	
	# Particle Accelerator
	temp = load("res://weapons/ranged/particle_accelerator/4/particle_accelerator_4_data.tres")
	temp.value = 256				# 289
	
	# Pistol
	temp = load("res://weapons/ranged/pistol/4/pistol_4_data.tres")
	temp.value = 81					# 91
	
	# Potato Thrower
	temp = load("res://weapons/ranged/potato_thrower/2/potato_thrower_2_data.tres")
	temp.value = 33					# 36
	temp_2 = load("res://items/sets/blunt/blunt_set_data.tres")
	temp.sets.push_back(temp_2)
	temp = load("res://weapons/ranged/potato_thrower/2/potato_thrower_2_stats.tres")
	temp.damage = 2					# 1
	temp.accuracy = 1.0			# 0.9
	temp = load("res://weapons/ranged/potato_thrower/3/potato_thrower_3_data.tres")
	temp.value = 64					# 69
	temp_2 = load("res://items/sets/blunt/blunt_set_data.tres")
	temp.sets.push_back(temp_2)
	temp = load("res://weapons/ranged/potato_thrower/3/potato_thrower_3_stats.tres")
	temp.damage = 3					# 1
	temp.accuracy = 1.0			# 0.9
	temp = load("res://weapons/ranged/potato_thrower/4/potato_thrower_4_data.tres")
	temp.value = 114				# 139
	temp_2 = load("res://items/sets/blunt/blunt_set_data.tres")
	temp.sets.push_back(temp_2)
	temp = load("res://weapons/ranged/potato_thrower/4/potato_thrower_4_stats.tres")
	temp.damage = 4					# 1
	temp.accuracy = 1.0			# 0.9
	
	# Revolver
	temp = load("res://weapons/ranged/revolver/1/revolver_data.tres")
	temp.value = 18					# 20
	temp = load("res://weapons/ranged/revolver/1/revolver_stats.tres")
	temp.max_range = 425		# 450
	temp = load("res://weapons/ranged/revolver/2/revolver_2_data.tres")
	temp.value = 36					# 34
	temp = load("res://weapons/ranged/revolver/2/revolver_2_stats.tres")
	temp.max_range = 425		# 450
	temp = load("res://weapons/ranged/revolver/3/revolver_3_data.tres")
	temp.value = 68					# 70
	temp = load("res://weapons/ranged/revolver/3/revolver_3_stats.tres")
	temp.max_range = 425		# 450
	temp = load("res://weapons/ranged/revolver/4/revolver_4_data.tres")
	temp.value = 125				# 130
	temp = load("res://weapons/ranged/revolver/4/revolver_4_stats.tres")
	temp.max_range = 425		# 450

	# Rocket Launcher
	temp = load("res://weapons/ranged/rocket_launcher/2/rocket_launcher_2_stats.tres")
	temp.accuracy = 0.9			# 0.8
	temp = load("res://weapons/ranged/rocket_launcher/3/rocket_launcher_3_stats.tres")
	temp.max_range = 500		# 550
	temp = load("res://weapons/ranged/rocket_launcher/4/rocket_launcher_4_data.tres")
	temp.value = 185				# 207
	temp = load("res://weapons/ranged/rocket_launcher/4/rocket_launcher_4_stats.tres")
	temp.max_range = 500		# 600
	temp.accuracy = 0.9			# 1.0
	temp = load("res://weapons/ranged/rocket_launcher/rocket_launcher_effect.tres")
	temp.key = "new_effect_explode"
	temp.effect_sign = 0
	
	# Shredder
	temp = load("res://weapons/ranged/shredder/1/shredder_effect.tres")
	temp.key = "new_effect_explode_custom"	
	temp = load("res://weapons/ranged/shredder/2/shredder_2_effect.tres")
	temp.key = "new_effect_explode_custom"	
	temp = load("res://weapons/ranged/shredder/3/shredder_3_effect.tres")
	temp.key = "new_effect_explode_custom"	
	temp = load("res://weapons/ranged/shredder/4/shredder_4_data.tres")
	temp.value = 111				# 122
	temp = load("res://weapons/ranged/shredder/4/shredder_4_effect.tres")
	temp.key = "new_effect_explode"	
	
	# Shuriken
	temp = load("res://weapons/ranged/shuriken/4/shuriken_4_data.tres")
	temp.value = 95					# 105
	
	# Slingshot
	temp = load("res://weapons/ranged/slingshot/4/slingshot_4_data.tres")
	temp.value = 111				# 122
	
	# SMG
	temp = load("res://weapons/ranged/smg/2/smg_2_stats.tres")
	temp.accuracy = 0.74		# 0.75
	temp = load("res://weapons/ranged/smg/3/smg_3_stats.tres")
	temp.accuracy = 0.77		# 0.80
	temp = load("res://weapons/ranged/smg/4/smg_4_data.tres")
	temp.value = 133				# 149
	temp = load("res://weapons/ranged/smg/4/smg_4_stats.tres")
	temp.accuracy = 0.80		# 0.85
	
	# Sniper Gun
	temp = load("res://weapons/ranged/sniper_gun/3/sniper_gun_3_stats.tres")
	temp.max_range = 550		# 800
	temp.scaling_stats = [ [ "stat_ranged_damage", 2.0 ], [ "stat_range", 0.2 ] ]  # 1.0 / 0.2
	temp = load("res://weapons/ranged/sniper_gun/4/sniper_gun_4_data.tres")
	temp.value = 205				# 245
	temp = load("res://weapons/ranged/sniper_gun/4/sniper_gun_4_stats.tres")
	temp.max_range = 600		# 1000
	temp.scaling_stats = [ [ "stat_ranged_damage", 2.5 ], [ "stat_range", 0.3 ] ]  # 1.0 / 0.3
	
	# Taser
	temp = load("res://weapons/ranged/taser/4/taser_4_data.tres")
	temp.value = 111				# 122
	
	# Wand
	temp = load("res://weapons/ranged/wand/1/wand_stats.tres")
	temp.cooldown = 38			# 40
	temp = load("res://weapons/ranged/wand/2/wand_2_stats.tres")
	temp.cooldown = 34			# 35	
	temp = load("res://weapons/ranged/wand/3/wand_3_stats.tres")
	temp.cooldown = 29			# 30
	temp = load("res://weapons/ranged/wand/4/wand_4_data.tres")
	temp.value = 95					# 105
	
	
	## SET BONUSES ##
	temp = load("res://items/sets/primitive/2/set_2_effect_1.tres")
	temp.value = 2  # 3 (Max HP)
	temp = load("res://items/sets/primitive/3/set_3_effect_1.tres")
	temp.value = 4  # 6 (Max HP)
	temp = load("res://items/sets/primitive/4/set_4_effect_1.tres")
	temp.value = 6  # 9 (Max HP)
	temp = load("res://items/sets/primitive/5/set_5_effect_1.tres")
	temp.value = 8  # 12 (Max HP)
	temp = load("res://items/sets/primitive/6/set_6_effect_1.tres")
	temp.value = 10 # 15 (Max HP)

	temp = load("res://items/sets/gun/2/set_2_effect_1.tres")
	temp.key = "stat_attack_speed"
	temp.value = 2  # 10 (Range->AtkSpd)
	temp = load("res://items/sets/gun/3/set_3_effect_1.tres")
	temp.key = "stat_attack_speed"
	temp.value = 4  # 20 (Range->AtkSpd)	
	temp = load("res://items/sets/gun/4/set_4_effect_1.tres")
	temp.key = "stat_attack_speed"
	temp.value = 6  # 30 (Range->AtkSpd)
	temp = load("res://items/sets/gun/5/set_5_effect_1.tres")
	temp.key = "stat_attack_speed"
	temp.value = 8  # 40 (Range->AtkSpd)
	temp = load("res://items/sets/gun/6/set_6_effect_1.tres")
	temp.key = "stat_attack_speed"
	temp.value = 10 # 50 (Range->AtkSpd)
	
	temp = load("res://items/sets/blunt/2/set_2_effect_2.tres")
	temp.value = -1  # -2 (Speed)
	temp = load("res://items/sets/blunt/3/set_3_effect_3.tres")
	temp.value = -2  # -4 (Speed)
	temp = load("res://items/sets/blunt/4/set_4_effect_3.tres")
	temp.value = -3  # -6 (Speed)
	temp = load("res://items/sets/blunt/5/set_5_effect_3.tres")
	temp.value = -4  # -8 (Speed)
	temp = load("res://items/sets/blunt/6/set_6_effect_3.tres")
	temp.value = -5  # -10 (Speed)



	## LEVEL-UPS ##
	# HP Regen
	temp = load("res://items/upgrades/health_regeneration/4/health_regeneration_4_effect.tres")
	temp.value = 6  # 5
	
	# Engineering
	temp = load("res://items/upgrades/engineering/4/engineering_4_effect.tres")
	temp.value = 6  # 5
	
	# Crit Chance
	temp = load("res://items/upgrades/crit_chance/4/crit_chance_4_effect.tres")
	temp.value = 10 # 9

	# Harvesting
	temp = load("res://items/upgrades/harvesting/1/harvesting_effect.tres")
	temp.value = 4  # 5
	temp = load("res://items/upgrades/harvesting/3/harvesting_3_effect.tres")
	temp.value = 11 # 10
	temp = load("res://items/upgrades/harvesting/4/harvesting_4_effect.tres")
	temp.value = 15 # 12
	
	# Luck
	temp = load("res://items/upgrades/luck/2/luck_2_effect.tres")
	temp.value = 11 # 10	
	temp = load("res://items/upgrades/luck/3/luck_3_effect.tres")
	temp.value = 18 # 15	
	temp = load("res://items/upgrades/luck/4/luck_4_effect.tres")
	temp.value = 26 # 20
	
	# Range
	temp = load("res://items/upgrades/range/1/range_effect.tres")
	temp.value = 20 # 15
	temp = load("res://items/upgrades/range/2/range_2_effect.tres")
	temp.value = 35 # 30
	temp = load("res://items/upgrades/range/3/range_3_effect.tres")
	temp.value = 50 # 45	
	temp = load("res://items/upgrades/range/4/range_4_effect.tres")
	temp.value = 70 # 60
	

	## CHARACTERS ##
	# Baby
## Testing
	temp = load("res://items/characters/baby/effects/baby_effect_0a.tres")
	temp.value = 14  # 12 (Harvesting)
	temp = load("res://items/characters/baby/effects/baby_effect_0b.tres")
	temp.value = -15 # -20 (Item Price)

	# Brawler
	temp = load("res://items/characters/brawler/brawler_effect_1.tres")
	temp.value = 40  # 50 (Unarmed AtkSpd Bonus)

	# Bull
	temp = load("res://items/characters/bull/bull_effect_2.tres")
	temp.value = 10  # 15 (HP Regen)
	temp = load("res://items/characters/bull/bull_effect_4.tres")
	temp.text_key = "new_effect_explode_on_hit"
	
	# Crazy
	temp = load("res://items/characters/crazy/crazy_data.tres")
	temp_2 = load("res://items/characters/crazy/crazy_effect_3.tres")
	temp.effects.erase(temp_2) # Remove starting Knife
	temp = load("res://items/characters/crazy/crazy_effect_4.tres")
	temp.value = -15 # -30 (Dodge)
	temp = load("res://items/characters/crazy/crazy_effect_5.tres")
	temp.value = -15 # -10 (Engineering)
	temp = load("res://items/characters/crazy/crazy_effect_6.tres")
	temp.value = -15 # -10 (Ranged Damage)
	
	# Cryptid
	temp = load("res://items/characters/cryptid/cryptid_effect_1.tres")
	temp.value = 11 # 12 (Harvesting per Tree)

	# Demon
	temp = load("res://items/characters/demon/demon_effect_1.tres")
	temp.value = 14 # 13 (Material to HP Ratio)
	
	# Doctor
	temp = load("res://items/characters/doctor/doctor_data.tres")
	temp_2 = load("res://items/characters/doctor/doctor_effect_4.tres")
	temp.effects.erase(temp_2) # Remove starting 5 Harvesting
	temp = load("res://items/characters/doctor/doctor_effect_2.tres")
	temp.value = 3  # 5 (HP Regen)
	
	# Engineer
	temp = load("res://items/characters/engineer/engineer_effect_1.tres")
	temp.value = 5  # 10 (Base Engineering)
	temp = load("res://items/characters/engineer/engineer_data.tres")
	temp_2 = load("res://items/characters/engineer/engineer_effect_2.tres")
	temp.effects.erase(temp_2) # Remove starting Wrench
	temp_2 = load("res://items/characters/engineer/engineer_effect_4.tres")
	temp.effects.erase(temp_2) # Remove original All-Damage Malus
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/engineer_elemental_damage_malus.tres")
	temp.effects.push_back(temp_2) # Add lower -20% Elemental Damage malus
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/engineer_non-elemental_damage_malus.tres")
	temp.effects.push_back(temp_2) # Re-add other Damage types still at -50%
	
	# Explorer
	temp = load("res://items/characters/explorer/explorer_effect_1.tres")
	temp.value = 11   # 12 (Starting Trees)

	# Farmer
	temp = load("res://items/characters/farmer/farmer_data.tres")
	###temp.wanted_tags = [ "garden" ] # Add new Garden Tag
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/farmer_starting_garden.tres")
	temp.effects.push_back(temp_2) # Starts with Garden
	temp_2 = load("res://items/characters/farmer/farmer_effect_3.tres")
	temp.effects.erase(temp_2) # Re-order to put downside at the end
	temp.effects.push_back(temp_2)
	
	# Gladiator
	temp = load("res://items/characters/gladiator/gladiator_effect_5.tres")
	temp.value = -40  # -30

	# Glutton
	temp = load("res://items/characters/glutton/glutton_data.tres")
	temp.wanted_tags = [ "garden" ] # Add new Garden Tag
	temp = load("res://items/characters/glutton/glutton_effect_2.tres")
	temp.text_key = "new_effect_explode_on_consumable"

	# Golem
	temp = load("res://items/characters/golem/golem_effect_5.tres")
	temp.text_key = "new_effect_no_heal"
	
	# King
	temp = load("res://items/characters/king/king_effect_1.tres")
	temp.value = 20 	# 25 (Damage%)
	temp.text_key = "BM_EFFECT_UNIQUE_TIER_IV_WEAPON_BONUS"
	temp = load("res://items/characters/king/king_effect_1b.tres")
	temp.value = 20 	# 25 (AtkSpd)
	temp.text_key = "BM_EFFECT_UNIQUE_TIER_IV_WEAPON_BONUS"	
	
	# Knight
	temp = load("res://items/characters/knight/knight_effect_1.tres")
	temp.value = 3  # 2
	temp.nb_stat_scaled = 2 # 1 (2 melee per 1 armor -> 3 melee per 2 armor)
	temp = load("res://items/characters/knight/knight_effect_4.tres")
	temp.text_key = "new_effect_min_weapon_tier" # Hard-coded to fix the color being red when it should be green
	
	# Loud
	temp = load("res://items/characters/loud/loud_effect_3.tres")
	temp.value = -4	# -3 (Harvesting per Wave)

	# Lucky
	temp = load("res://items/characters/lucky/lucky_effect_1.tres")
	temp.value = 75 # 100 (Starting Luck)
	temp = load("res://items/characters/lucky/lucky_effect_2.tres")
	temp.value = 40 # 25 (+% Luck Modificaitons)
	temp = load("res://items/characters/lucky/lucky_effect_4.tres")
	temp.value = -50 # -60 (Attack Speed)

	# Mage
	temp = load("res://items/characters/mage/mage_data.tres")
	temp_2 = load("res://items/characters/mage/mage_effect_7.tres")
	temp.effects.erase(temp_2)
	temp.effects.push_back(temp_2) # Re-order penalties so Engineering is shown first
	temp_2 = load("res://items/characters/mage/mage_effect_8.tres")
	temp.effects.erase(temp_2)
	temp.effects.push_back(temp_2) # Re-order penalties so Engineering is shown first
	temp = load("res://items/characters/mage/mage_effect_9.tres")
	temp.value = -33   # -50 (Engineering Modifications)
	temp = load("res://items/characters/mage/mage_effect_3b.tres")
	temp.text_key = "new_sausage_effect_starting_item"
	
	# Masochist
	temp = load("res://items/characters/masochist/masochist_effect_3.tres")
	temp.value = 15   # 20 (HP Regen)
	temp = load("res://items/characters/masochist/masochist_effect_4.tres")
	temp.value = 5    # 8 (Armor)
	temp = load("res://items/characters/masochist/masochist_effect_1.tres")
	temp.text_key = "new_effect_on_hit"

	# Mutant
	temp = load("res://items/characters/mutant/mutant_effect_1.tres")
	temp.value = -60  # -66 (XP Needed for Level-up)

	# One-armed
	temp = load("res://items/characters/one_arm/one_arm_effect_3.tres")
	temp.text_key = "NEW_EFFECT_ONE_WEAPON_SLOT_LIMIT"
	
	# Pacifist
	temp = load("res://items/characters/pacifist/pacifist_effect_2.tres")
	temp.text_key = "NEW_EFFECT_PACIFIST"
	
	# Ranger
	temp = load("res://items/characters/ranger/ranger_data.tres")
	temp_2 = load("res://items/characters/ranger/ranger_effect_3.tres")
	temp.effects.erase(temp_2) # Remove starting Pistol

	# Renegade
	temp = load("res://items/characters/renegade/renegade_data.tres")
	temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/renegade_increasing_shop_prices.tres")
	temp.effects.push_back(temp_2) # +2% Shop Price Per Wave
	temp = load("res://items/characters/renegade/renegade_effect_0a.tres")
	temp.text_key = "NEW_SHORT_EFFECT_PIERCING"
	
	# Soldier
	temp = load("res://items/characters/soldier/soldier_effect_3.tres")
	temp.value = 125 # 200 (Pickup Range)
	
	# Speedy
	temp = load("res://items/characters/speedy/speedy_effect_1.tres")
	temp.value = 25  # 30 (Speed)
	temp = load("res://items/characters/speedy/speedy_effect_4.tres")
	temp.value = -2  # -3 (Armor)
	
	# Streamer
	temp = load("res://items/characters/streamer/streamer_data.tres")
	temp.wanted_tags = [ "structure", "stand_still" ] # Adds existing Stand-Still Tag

	# Wildling
	temp = load("res://items/characters/wildling/wildling_data.tres")
	temp_2 = load("res://items/characters/wildling/wildling_effect_2.tres")
	temp.effects.erase(temp_2) # Remove starting Stick


	## OTHER CHARACTER TEXT TWEAKS ##
	temp = load("res://items/characters/artificer/artificer_effect_3.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/arms_dealer/arms_dealer_effect_1b.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	
	temp = load("res://items/characters/bull/bull_effect_3b.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	
	temp = load("res://items/characters/chunky/chunky_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/chunky/chunky_effect_3b.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/chunky/chunky_effect_3c.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/chunky/chunky_effect_4.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/cryptid/cryptid_effect_2.tres")
	temp.text_key = "NEW_EFFECT_GAIN_STAT_FOR_EVERY_TREE"
	
	temp = load("res://items/characters/cyborg/cyborg_effect_1a.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/cyborg/cyborg_effect_1b.tres")
	temp.text_key = "NEW_EFFECT_CONVERT_STAT_TEMP_HALF_WAVE"
	temp = load("res://items/characters/cyborg/cyborg_effect_2.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/cyborg/cyborg_effect_3.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/cyborg/cyborg_effect_4.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/doctor/doctor_effect_6.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/engineer/engineer_effect_1b.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/engineer/engineer_effect_4.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/entrepreneur/entrepreneur_effect_1.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/entrepreneur/entrepreneur_effect_4.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"	
	
	temp = load("res://items/characters/golem/golem_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/golem/golem_effect_3.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	
	temp = load("res://items/characters/hunter/hunter_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/hunter/hunter_effect_4.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/hunter/hunter_effect_5.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/knight/knight_effect_5.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/knight/knight_effect_7.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/lich/lich_effect_3.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/lucky/lucky_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	
	temp = load("res://items/characters/mage/mage_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/mage/mage_effect_7.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/mage/mage_effect_8.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	temp = load("res://items/characters/mage/mage_effect_9.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/one_arm/one_arm_effect_2.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	
	temp = load("res://items/characters/ranger/ranger_effect_4.tres")
	temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
	temp = load("res://items/characters/ranger/ranger_effect_6.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
	
	temp = load("res://items/characters/renegade/renegade_effect_5.tres")
	temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
			
	
	## STARTING WEAPONS ##
	# Crazy
	temp = load("res://items/characters/crazy/crazy_data.tres")
	temp_2 = load("res://weapons/ranged/crossbow/1/crossbow_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# Cyborg
	temp = load("res://items/characters/cyborg/cyborg_data.tres")
	# Remove
	temp_2 = load("res://weapons/ranged/crossbow/1/crossbow_data.tres")
	temp.starting_weapons.erase(temp_2)	

	# Demon
	temp = load("res://items/characters/demon/demon_data.tres")
	temp_2 = load("res://weapons/ranged/potato_thrower/2/potato_thrower_2_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# Engineer
	temp = load("res://items/characters/engineer/engineer_data.tres")
	# Remove
	temp_2 = load("res://weapons/melee/hammer/2/hammer_2_data.tres")
	temp.starting_weapons.erase(temp_2)

	# Generalist
	temp = load("res://items/characters/generalist/generalist_data.tres")
	# Remove
	temp_2 = load("res://weapons/melee/lightning_shiv/1/lightning_shiv_data.tres")
	temp.starting_weapons.erase(temp_2)
	
	# Jack
	temp = load("res://items/characters/jack/jack_data.tres")
	# Remove
	temp_2 = load("res://weapons/ranged/shuriken/1/shuriken_data.tres")
	temp.starting_weapons.erase(temp_2)	
###temp_2 = load("res://weapons/melee/wrench/1/wrench_data.tres")
###temp.starting_weapons.erase(temp_2)	

	# Loud
	###temp = load("res://items/characters/loud/loud_data.tres")
	# Remove
	###temp_2 = load("res://weapons/melee/pruner/1/pruner_data.tres")
	###temp.starting_weapons.erase(temp_2)
	
	# Mage
	temp = load("res://items/characters/mage/mage_data.tres")
	temp_2 = load("res://weapons/melee/wrench/1/wrench_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# One-armed
	temp = load("res://items/characters/one_arm/one_arm_data.tres")
	temp_2 = load("res://weapons/melee/sword/2/sword_2_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://weapons/melee/hammer/2/hammer_2_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://weapons/melee/flaming_knuckles/2/flaming_knuckles_2_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://weapons/ranged/fireball/2/fireball_2_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# Pacifist
	temp = load("res://items/characters/pacifist/pacifist_data.tres")
	temp_2 = load("res://weapons/melee/rock/1/rock_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://weapons/melee/scissors/1/scissors_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://weapons/melee/spiky_shield/1/spiky_shield_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# Ranger
	# Remove
	temp = load("res://items/characters/ranger/ranger_data.tres")
	temp_2 = load("res://weapons/ranged/pistol/1/pistol_data.tres")
	temp.starting_weapons.erase(temp_2)	
	
	# Saver
	temp = load("res://items/characters/saver/saver_data.tres")
	temp_2 = load("res://weapons/melee/stick/1/stick_data.tres")
	temp.starting_weapons.insert(5, temp_2)
##Testing
	temp_2 = load("res://weapons/melee/torch/1/torch_data.tres")
	temp.starting_weapons.push_back(temp_2)

