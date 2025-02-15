extends "res://singletons/progress_data.gd"

const BM_DIR_DLCE = "res://mods-unpacked/DarkTwinge-BalanceMod/extensions/dlcs/dlc_1/"

### ALL BASELINE DLC CHANGES ###
func add_all_dlcs()->void :
	# Checks if the DLC exists before loading script extensions
	if File.new().file_exists("res://dlcs/dlc_1/dlc_data.tres"):
		# Curse adjustments
		ModLoaderMod.install_script_extension(BM_DIR_DLCE + "dlc_1_data.gd")
	
	# Run the normal function to load DLCs
	.add_all_dlcs()
	
	# Checks if DLC is available and loaded before replacing any DLC data
	if ProgressData.is_dlc_available("abyssal_terrors"):
		var temp
		var temp_2

		
		### TEXT KEYS ###
		Text.keys_needing_operator.bm_effect_stat_on_poison_fruit = [0]
		Text.keys_needing_percent.bm_effect_stat_on_poison_fruit = [2]
		Text.keys_needing_percent.new_effect_poisoned_fruit = [0]
		Text.keys_needing_percent.new_effect_explode_when_below_hp = [5]
		Text.keys_needing_operator.new_effect_gain_stat_for_every_different_stat_short = [0, 4]
		Text.keys_needing_percent.new_effect_stronger_loot_aliens_on_kill = [0]
		Text.keys_needing_percent.new_effect_chance_explode_on_hit = [0]
		Text.keys_needing_percent.new_effect_break_on_hit = [0]
		Text.keys_needing_percent.new_effect_loot_alien_chance = [0]
		Text.keys_needing_operator.new_effect_loot_alien_chance = [0]
		Text.keys_needing_percent.new_sf_effect_bonus_damage_against_targets_above_hp = [0, 2]
		Text.keys_needing_operator.new_sf_effect_bonus_damage_against_targets_above_hp = [0]
		

		### ENEMIES ###
		# Turtle buff
		# Spider Crab buff
		var elite_scenes = {
			"elite_turtle":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/turtle.tscn",
			"elite_spider_crab":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/spider_crab.tscn"
		}
		for dlc in available_dlcs:
			for elite in dlc.elites:
				if elite.my_id in elite_scenes.keys():
					elite.scene = load(elite_scenes[elite.my_id])
		
		temp = load("res://dlcs/dlc_1/enemies/turtle/turtle_stats.tres")
		temp.armor = 1												# 3
		temp.armor_increase_each_wave = 0.75	# 0.5
		temp.health_increase_each_wave = 750.0	# 700.0
		
		# Regular enemies
		temp = load("res://dlcs/dlc_1/enemies/walrus/walrus_stats.tres")
		temp.health = 45											# 40
		temp.knockback_resistance = 0.87			# 0.9
		
		temp = load("res://dlcs/dlc_1/enemies/narwhal/narwhal_stats.tres")
		temp.knockback_resistance = 0.87			# 0.9
		
		temp = load("res://dlcs/dlc_1/enemies/stargazer/stargazer_stats.tres")
		temp.speed = 115											# 100
		
		temp = load("res://dlcs/dlc_1/enemies/vampire_squid/vampire_squid_stats.tres")
		temp.health_increase_each_wave = 6.0	# 5.0

		temp = load("res://dlcs/dlc_1/enemies/goblin_shark/goblin_shark_stats.tres")
		temp.base_drop_chance = 0.02					# 0.01
		
		## WAVE CHANGES ##
		# Find all waves with Stargazers, Pufferfish, and Vampire Squid to replace them with my versions
		for dlc in available_dlcs:
			for zone in dlc.zones:
				for wave in zone.waves_data:
					for group in wave.groups_data:
						for unit in group.wave_units_data:
							print(unit.unit_scene.get_path())
							if unit.unit_scene.get_path() == "res://dlcs/dlc_1/enemies/stargazer/stargazer.tscn":
								unit.unit_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/stargazer.tscn")
							elif unit.unit_scene.get_path() == "res://dlcs/dlc_1/enemies/pufferfish/pufferfish.tscn":
								unit.unit_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/pufferfish.tscn")
							elif unit.unit_scene.get_path() == "res://dlcs/dlc_1/enemies/vampire_squid/vampire_squid.tscn":
								unit.unit_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/vampire_squid.tscn")
				for unit in zone.endless_enemy_scenes:
					if unit.get_path() == "res://dlcs/dlc_1/enemies/stargazer/stargazer.tscn":
						unit = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/stargazer.tscn")
					elif unit.get_path() == "res://dlcs/dlc_1/enemies/pufferfish/pufferfish.tscn":
						unit = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/pufferfish.tscn")
					elif unit.get_path() == "res://dlcs/dlc_1/enemies/vampire_squid/vampire_squid.tscn":
						unit = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/vampire_squid.tscn")
		
		# Wave 13 - Spawn single Egglord and Stargazer sooner
		temp = load("res://dlcs/dlc_1/zones/abyss/013/d5_group_1.tres")
		temp.spawn_timing = 34			# 40 (Egglord)

		temp = load("res://dlcs/dlc_1/zones/abyss/013/d1_group_1b.tres")
		temp.spawn_timing = 28			# 30 (Stargazer)
		
		## Crash Zone - Adds single Curse Goblins to Waves 3 and 6
		temp = load("res://zones/zone_1/003/wave_3.tres")
		temp_2 = load("res://dlcs/dlc_1/zones/abyss/004/group_4b.tres")
		temp.groups_data.push_back(temp_2)
		temp = load("res://zones/zone_1/006/wave_6.tres")
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/crashzone-wave6-seapigs.tres")		
		temp.groups_data.push_back(temp_2)
		
		# Adds three pairs of Curse Goblins to Wave 13
		temp = load("res://zones/zone_1/013/wave_13.tres")
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/crashzone-wave13-seapigs.tres")
		temp.groups_data.push_back(temp_2)
		
		# Wave 16: Replace the added '2 Flies' with 1 Fly and 1 Pufferfish
		temp = load("res://zones/zone_1/016/group_1.tres") # Helmets + Buffers
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/wave16_fly.tres")
		temp.wave_units_data.erase(temp_2)
		temp_2 =load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/DLC-wave16_pufferfish.tres")
		temp.wave_units_data.push_back(temp_2)
		temp_2 =load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/DLC-wave16_fly.tres")
		temp.wave_units_data.push_back(temp_2)
		
		# Wave 4 Lamprey now on DL1
		temp = load("res://dlcs/dlc_1/zones/abyss/004/d5_group_1.tres")
		temp.min_difficulty = 1
		
		
		# Vamp Squid
		temp = load("res://dlcs/dlc_1/zones/abyss/017/unit_1.tres")
		temp.additional_min_distance_from_player = 100.0		# 0.0
		
		### ITEMS ###
		# Items: Tier-1 #
		temp = load("res://dlcs/dlc_1/items/corrupted_shard/corrupted_shard_data.tres")
		temp.value = 14   # 12
		temp = load("res://dlcs/dlc_1/items/corrupted_shard/effects/corrupted_shard_effect_0.tres")
		temp.value = 4		#	3 (%Damage)
		temp = load("res://dlcs/dlc_1/items/corrupted_shard/effects/corrupted_shard_effect_1.tres")
		temp.value = 2		# 1 (Curse)

		temp = load("res://dlcs/dlc_1/items/feather/feather_data.tres")
		temp.value = 19   # 18
		
		temp = load("res://dlcs/dlc_1/items/small_fish/effects/small_fish_effect_0.tres")
		temp.text_key = "NEW_SF_EFFECT_BONUS_DAMAGE_AGAINST_TARGETS_ABOVE_HP"
		
		temp = load("res://dlcs/dlc_1/items/whistle/effects/whistle_effect_0.tres")
		temp.value = 60   # 50 (Extra Loot Goblins)
		temp.text_key = "NEW_EFFECT_LOOT_ALIEN_CHANCE"
		
		# Items: Tier-2 #
		temp = load("res://dlcs/dlc_1/items/bone_dice/bone_dice_data.tres")
		temp.value = 27   # 30
		temp = load("res://dlcs/dlc_1/items/bone_dice/effects/bone_dice_effect_0.tres")
		temp.value2 = 60	# 50 (Chance to proc +1% Damage)

		temp = load("res://dlcs/dlc_1/items/cauldron/effects/cauldron_effect_1.tres")
		temp.value = 25   # 20 (Temp Damage%)
		temp.value2 = 3		# 2 (Seconds of Duration)

		temp = load("res://dlcs/dlc_1/items/eyepatch/eyepatch_data.tres")
		temp.value = 63		# 55
		temp = load("res://dlcs/dlc_1/items/eyepatch/effects/eyepatch_effect_1.tres")
		temp.value = 6		# 3 (Crit Chance)

		temp = load("res://dlcs/dlc_1/items/jerky/jerky_data.tres")
		temp.value = 53		# 50

		temp = load("res://dlcs/dlc_1/items/pearl/pearl_data.tres")
		temp.value = 55   # 60
		temp = load("res://dlcs/dlc_1/items/pearl/effects/pearl_effect_1.tres")
		temp.value = 4		# 3 (Chance to find an extra Pearl)

		temp = load("res://dlcs/dlc_1/items/saltwater/effects/saltwater_effect_1.tres")
		temp.value = 20		# 10 (Extra Speed when hit)

		temp = load("res://dlcs/dlc_1/items/spyglass/spyglass_data.tres")
		temp.value = 35		# 30
		
		temp = load("res://dlcs/dlc_1/items/treasure_map/treasure_map_data.tres")
		temp.tags = [ "stat_luck", "exploration" ]	# Luck only -> Luck & Explore


		# Items: Tier-3 #
		temp = load("res://dlcs/dlc_1/items/black_flag/black_flag_data.tres")
		temp.value = 57		# 60
		
		temp = load("res://dlcs/dlc_1/items/crystal/crystal_data.tres")
		temp.value = 57		# 65
		temp = load("res://dlcs/dlc_1/items/crystal/effects/crystal_effect_0c.tres")
		temp.key = "stat_max_hp"	# Engineering
		temp = load("res://dlcs/dlc_1/items/crystal/effects/crystal_effect_0b.tres")
		temp.text_key = "NEW_EFFECT_LOST_ON_HIT"

		temp = load("res://dlcs/dlc_1/items/goblet/goblet_data.tres")
		temp.value = 75		# 70
		
		temp = load("res://dlcs/dlc_1/items/goldfish/goldfish_data.tres")
		temp.value = 15   # 23

		temp = load("res://dlcs/dlc_1/items/starfish/starfish_data.tres")
		temp.value = 70		# 75
		
		temp = load("res://dlcs/dlc_1/items/sunken_bell/sunken_bell_data.tres")
		temp.value = 45		# 65
		temp = load("res://dlcs/dlc_1/items/sunken_bell/effects/sunken_bell_effect_0.tres")
		temp.scale = 7.5	# 6.0
		temp.text_key = "new_effect_explode_when_below_hp"
		

		# Items: Tier-4 #
		temp = load("res://dlcs/dlc_1/items/krakens_eye/krakens_eye_data.tres")
		temp.value = 90		# 110
		temp = load("res://dlcs/dlc_1/items/krakens_eye/effects/krakens_eye_effect_0.tres")
		temp.text_key = "new_effect_chance_explode_on_hit"

		# Ricochet-related tweaks
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/2/blunderbuss_2_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/3/blunderbuss_3_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/4/blunderbuss_4_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/3/harpoon_gun_3_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/4/harpoon_gun_4_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/2/javelin_2_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/3/javelin_3_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/4/javelin_4_stats.tres")
		temp.bounce_dmg_reduction = 0.3 # 0.5	


		### WEAPONS ###
		## MELEE WEAPONS ##
		# Anchor
		temp = load("res://dlcs/dlc_1/weapons/melee/anchor/4/anchor_4_data.tres")
		temp.value = 168		# 190
		
		# Brick
		temp = load("res://dlcs/dlc_1/weapons/melee/brick/1/brick_effect_0.tres")
		temp.text_key = "new_effect_break_on_hit"
		temp = load("res://dlcs/dlc_1/weapons/melee/brick/2/brick_2_effect_0.tres")
		temp.text_key = "new_effect_break_on_hit"
		temp = load("res://dlcs/dlc_1/weapons/melee/brick/3/brick_3_effect_0.tres")
		temp.text_key = "new_effect_break_on_hit"
		temp = load("res://dlcs/dlc_1/weapons/melee/brick/4/brick_4_effect_0.tres")
		temp.text_key = "new_effect_break_on_hit"
		temp = load("res://dlcs/dlc_1/weapons/melee/brick/4/brick_4_data.tres")
		temp.value = 36			# 40

		# Captain's Sword
		temp = load("res://dlcs/dlc_1/weapons/melee/captains_sword/4/captains_sword_4_data.tres")
		temp.value = 198		# 210
		
		# Chainsaw
		temp = load("res://dlcs/dlc_1/weapons/melee/chainsaw/4/chainsaw_4_data.tres")
		temp.value = 210		# 242
		
		# Hiking Pole
		temp = load("res://dlcs/dlc_1/weapons/melee/hiking_stick/4/hiking_stick_4_data.tres")
		temp.value = 120		# 130
		
		# Lute
		temp = load("res://dlcs/dlc_1/weapons/melee/lute/4/lute_4_data.tres")
		temp.value = 111		# 122

		# Mace
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/2/mace_2_data.tres")
		temp.value = 43			# 46
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/2/mace_2_stats.tres")
		temp.cooldown	= 43	# 50
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/3/mace_3_data.tres")
		temp.value = 81			# 92
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/3/mace_3_stats.tres")
		temp.cooldown	= 36	# 45
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/4/mace_4_data.tres")
		temp.value = 142		# 185
		temp = load("res://dlcs/dlc_1/weapons/melee/mace/4/mace_4_stats.tres")
		temp.cooldown	= 30	# 40
		
		# Sickle
		temp = load("res://dlcs/dlc_1/weapons/melee/sickle/1/sickle_data.tres")
		temp.tier = -1
		temp.add_to_chars_as_starting = [ ]
		temp = load("res://dlcs/dlc_1/weapons/melee/sickle/2/sickle_2_data.tres")
		temp.tier = -1
		temp = load("res://dlcs/dlc_1/weapons/melee/sickle/3/sickle_3_data.tres")
		temp.tier = -1
		temp = load("res://dlcs/dlc_1/weapons/melee/sickle/4/sickle_4_data.tres")
		temp.tier = -1
	
		# Spoon
		temp = load("res://dlcs/dlc_1/weapons/melee/spoon/4/spoon_4_data.tres")
		temp.value = 111		# 122
		
		# Trident
		temp = load("res://dlcs/dlc_1/weapons/melee/trident/2/trident_2_data.tres")
		temp.value = 51			#	52
		temp = load("res://dlcs/dlc_1/weapons/melee/trident/3/trident_3_data.tres")
		temp.value = 95			#	96
		temp = load("res://dlcs/dlc_1/weapons/melee/trident/4/trident_4_data.tres")
		temp.value = 168		#	200
		
		# War Hammer
		temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/3/war_hammer_3_data.tres")
		temp.value = 119				#	130
		temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/3/war_hammer_3_stats.tres")
		temp.crit_damage = 1.75	# 1.5
		temp.cooldown = 83			# 90
		temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/4/war_hammer_4_data.tres")
		temp.value = 209				#	255
		temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/4/war_hammer_4_stats.tres")
		temp.crit_damage = 1.75	# 1.5
		temp.cooldown = 73			# 80
		
		## RANGED WEAPONS ##
		# Blunderbuss
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/2/blunderbuss_2_data.tres")
		temp.value = 46					# 45
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/3/blunderbuss_3_data.tres")
		temp.value = 90					# 95
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/3/blunderbuss_3_stats.tres")
		temp.damage = 45				# 50
		temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/4/blunderbuss_4_data.tres")
		temp.value = 160				# 192
		
		# Flute
		temp = load("res://dlcs/dlc_1/weapons/ranged/flute/1/flute_data.tres")
		temp.value = 19					# 20
		temp.add_to_chars_as_starting = [ "character_lucky", "character_glutton", "character_renegade", "character_jack", "character_golem", "character_soldier", "character_demon" ] 	# Removed Baby
		temp = load("res://dlcs/dlc_1/weapons/ranged/flute/2/flute_2_data.tres")
		temp.value = 41					# 45
		temp = load("res://dlcs/dlc_1/weapons/ranged/flute/3/flute_3_data.tres")
		temp.value = 81					# 80
		temp = load("res://dlcs/dlc_1/weapons/ranged/flute/4/flute_4_data.tres")
		temp.value = 150				# 165
		
		# Grenade Launcher
		temp = load("res://dlcs/dlc_1/weapons/ranged/grenade_launcher/2/grenade_launcher_2_effect_0.tres")
		temp.key = "new_effect_explode"
		temp = load("res://dlcs/dlc_1/weapons/ranged/grenade_launcher/3/grenade_launcher_3_effect_0.tres")
		temp.key = "new_effect_explode"
		temp = load("res://dlcs/dlc_1/weapons/ranged/grenade_launcher/4/grenade_launcher_4_data.tres")
		temp.value = 191				# 212
		temp = load("res://dlcs/dlc_1/weapons/ranged/grenade_launcher/4/grenade_launcher_4_effect_0.tres")
		temp.key = "new_effect_explode"
		
		# Harpoon Gun
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_data.tres")
		temp.value = 46					# 50
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_stats.tres")
		temp.max_range = 750		# 800
		temp.scaling_stats = [ [ "stat_ranged_damage", 1.0 ], [ "stat_melee_damage", 0.8 ] ]	# 1.0, 1.0
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/3/harpoon_gun_3_data.tres")
		temp.value = 90					# 105
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/3/harpoon_gun_3_stats.tres")
		temp.max_range = 825		# 850
		temp.scaling_stats = [ [ "stat_ranged_damage", 1.0 ], [ "stat_melee_damage", 0.9 ] ]	# 1.0, 1.0
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/4/harpoon_gun_4_data.tres")
		temp.value = 160				# 220
		temp = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/4/harpoon_gun_4_stats.tres")
		temp.piercing = 6				# 5
		
		# Javelin
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/3/javelin_3_data.tres")
		temp.value = 68					# 66
		temp = load("res://dlcs/dlc_1/weapons/ranged/javelin/4/javelin_4_data.tres")
		temp.value = 125				# 140
		
		### CHARACTERS ###
		# Captain
		temp = load("res://dlcs/dlc_1/characters/captain/captain_data.tres")
		temp.wanted_tags = [  ]	# Had XP Gain
		
		# Chef
		temp = load("res://dlcs/dlc_1/characters/chef/chef_data.tres")
		temp.banned_items = [ "item_frozen_heart", "item_eyes_surgery" ]
		
		# Druid
		temp = load("res://dlcs/dlc_1/characters/druid/druid_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/druid/effects/druid_effect_0.tres")
		temp.effects.erase(temp_2)		# Remove +5 Starting HP
		temp_2 = load("res://dlcs/dlc_1/characters/druid/effects/druid_effect_1.tres")
		temp_2.value = 2
		temp_2.value2 = 100
		temp_2.custom_key = "bm_stats_on_poison_fruit"
		temp_2.text_key = "BM_EFFECT_STAT_ON_POISON_FRUIT"
		temp.effects.erase(temp_2)
		temp.effects.insert(3, temp_2) # Reposition so it appears after you see what poison fruit are
		temp_2 = load("res://dlcs/dlc_1/characters/druid/effects/druid_effect_3.tres")
		temp_2.text_key = "NEW_EFFECT_POISONED_FRUIT"
		
		# Dwarf
		temp = load("res://dlcs/dlc_1/characters/dwarf/dwarf_data.tres")
		temp.banned_items = [ "item_seashell" ]
		
		# Hiker
		temp = load("res://dlcs/dlc_1/characters/hiker/hiker_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/hiker/effects/hiker_effect_3.tres")
		temp.effects.erase(temp_2)		#	Remove -5 Speed
		temp_2 = load("res://dlcs/dlc_1/characters/hiker/effects/hiker_effect_2.tres")
		temp.effects.erase(temp_2)		# Remove +Speed Mod
		temp = load("res://dlcs/dlc_1/characters/hiker/effects/hiker_effect_1.tres")
		temp.value2 = 75							# 80 (Steps per HP)
		
		## OTHER CHARACTER TEXT TWEAKS ##
		# Builder
		temp = load("res://dlcs/dlc_1/characters/builder/effects/builder_effect_2b.tres")
		temp.text_key = "NEW_EFFECT_NO_STRUCTURES"		
		temp = load("res://dlcs/dlc_1/characters/builder/builder_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/builder/effects/builder_effect_1.tres")
		temp.effects.erase(temp_2)
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/builder_effect_1-newtext.tres")
		temp.effects.insert(1,temp_2)
		temp = load("res://dlcs/dlc_1/characters/builder/effects/builder_effect_2.tres")
		temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"
		temp = load("res://dlcs/dlc_1/characters/builder/effects/builder_effect_3.tres")
		temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS_ALL"
		
		temp = load("res://dlcs/dlc_1/characters/captain/effects/captain_effect_4.tres")
		temp.text_key = "NEW_NEXT_LEVEL_XP_NEEDED"
		
		temp = load("res://dlcs/dlc_1/characters/chef/effects/chef_effect_4.tres")
		temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
		temp = load("res://dlcs/dlc_1/characters/chef/effects/chef_effect_2b.tres")
		temp.text_key = "NEW_EFFECT_EXPLODE_AND_BURN_ON_CONSUMABLE"

		temp = load("res://dlcs/dlc_1/characters/curious/curious_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/curious/effects/curious_effect_2.tres")
		temp.effects.erase(temp_2)
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/curious_effect_2-newtext.tres")
		temp.effects.insert(1,temp_2)
		temp = load("res://dlcs/dlc_1/characters/curious/curious_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/curious/effects/curious_effect_1.tres")
		temp.effects.erase(temp_2)
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/curious_effect_1-newtext.tres")
		temp.effects.insert(3,temp_2)
		
		temp = load("res://dlcs/dlc_1/characters/diver/diver_data.tres")
		temp_2 = load("res://dlcs/dlc_1/characters/diver/effects/diver_effect_0.tres")
		temp.effects.erase(temp_2)
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/diver_effect_0-newtext.tres")
		temp.effects.insert(0,temp_2)
		temp = load("res://dlcs/dlc_1/characters/diver/effects/diver_effect_1c.tres")
		temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"	

		temp = load("res://dlcs/dlc_1/characters/druid/effects/druid_effect_6.tres")
		temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"

		temp = load("res://dlcs/dlc_1/characters/dwarf/effects/dwarf_effect_3.tres")
		temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"
		temp = load("res://dlcs/dlc_1/characters/dwarf/effects/dwarf_effect_1a.tres")
		temp.text_key = "new_effect_no_ranged_weapons"
		
		# NOTE ELITE INCREASES IN TOOLTIP HARD-CODED
		temp = load("res://dlcs/dlc_1/characters/gangster/effects/gangster_effect_1.tres")
		temp.text_key = "new_effect_stronger_elites_on_kill"
		
		temp = load("res://dlcs/dlc_1/characters/hiker/effects/hiker_effect_2.tres")
		temp.key = "NEW_EFFECT_INCREASE_STAT_GAINS"	

		temp = load("res://dlcs/dlc_1/characters/ogre/effects/ogre_effect_2.tres")
		temp.text_key = "new_effect_no_ranged_weapons"
		
		temp = load("res://dlcs/dlc_1/characters/romantic/effects/romantic_effect_2.tres")
		temp.text_key = "new_effect_gain_stat_end_of_wave"
		temp = load("res://dlcs/dlc_1/characters/romantic/romantic_data.tres")
		temp_2 = load("res://mods-unpacked/DarkTwinge-BalanceMod/effects/charm_clarify_effect.tres")
		temp.effects.append(temp_2)		
		
		temp = load("res://dlcs/dlc_1/characters/sailor/effects/sailor_effect_6.tres")
		temp.key = "NEW_EFFECT_REDUCE_STAT_GAINS"


		### STARTING WEAPONS ###
		# Baby
		temp = load("res://items/characters/baby/baby_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/lute/1/lute_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/brick/1/brick_data.tres")
		temp.starting_weapons.push_back(temp_2)
		# (Flute Removed Above)
		
		# Buccaneer
		temp = load("res://dlcs/dlc_1/characters/buccaneer/buccaneer_data.tres")
		temp_2 = load("res://weapons/melee/wrench/1/wrench_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://weapons/melee/plank/1/plank_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# Builder
		temp = load("res://dlcs/dlc_1/characters/builder/builder_data.tres")
		temp_2 = load("res://weapons/ranged/icicle/1/icicle_data.tres")
		temp.starting_weapons.push_back(temp_2)		
		
		# Chef
		temp = load("res://dlcs/dlc_1/characters/chef/chef_data.tres")
		# Remove
		temp_2 = load("res://weapons/melee/plank/1/plank_data.tres")
		temp.starting_weapons.erase(temp_2)	
		temp_2 = load("res://weapons/melee/stick/1/stick_data.tres")
		temp.starting_weapons.erase(temp_2)
		
		# Creature
		temp = load("res://dlcs/dlc_1/characters/creature/creature_data.tres")
		# Remove
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/sickle/1/sickle_data.tres")
		temp.starting_weapons.erase(temp_2)	# Needs to be manually removed despite being a Tier -1 weapon
		
		# Cryptid
		temp = load("res://items/characters/cryptid/cryptid_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/flute/1/flute_data.tres")
		temp.starting_weapons.push_back(temp_2)	
		
		# Curious
		temp = load("res://dlcs/dlc_1/characters/curious/curious_data.tres")
		temp_2 = load("res://weapons/ranged/medical_gun/1/medical_gun_data.tres")
		temp.starting_weapons.insert(11, temp_2)
		
		# Demon
		temp = load("res://items/characters/demon/demon_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/mace/2/mace_2_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/brick/1/brick_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# Druid
		temp = load("res://dlcs/dlc_1/characters/druid/druid_data.tres")
		# Remove
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/sickle/1/sickle_data.tres")
		temp.starting_weapons.erase(temp_2)	# Needs to be manually removed despite being a Tier -1 weapon
		
		# Entrepreneur
		temp = load("res://items/characters/entrepreneur/entrepreneur_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/brick/1/brick_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# Explorer
		temp = load("res://items/characters/explorer/explorer_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/lute/1/lute_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# Hiker
		temp = load("res://dlcs/dlc_1/characters/hiker/hiker_data.tres")
		temp_2 = load("res://weapons/ranged/slingshot/1/slingshot_data.tres")
		temp.starting_weapons.push_back(temp_2)			
		temp_2 = load("res://weapons/ranged/medical_gun/1/medical_gun_data.tres")
		temp.starting_weapons.insert(9, temp_2)
		
		# King
		temp = load("res://items/characters/king/king_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/spoon/2/spoon_2_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_data.tres")
		temp.starting_weapons.push_back(temp_2)
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/2/blunderbuss_2_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		#
		# Lucky
#		temp = load("res://items/characters/lucky/lucky_data.tres")
#		temp_2 = load("res://dlcs/dlc_1/weapons/melee/brick/1/brick_data.tres")
#		temp.starting_weapons.push_back(temp_2)		
		#
		
		# Mage
		temp = load("res://items/characters/mage/mage_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/spoon/1/spoon_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		#
		# Masochist
#		temp = load("res://items/characters/masochist/masochist_data.tres")
#		temp_2 = load("res://dlcs/dlc_1/weapons/melee/spoon/1/spoon_data.tres")
#		temp.starting_weapons.push_back(temp_2)		
		#
		
		# Multi-tasker
		temp = load("res://items/characters/multitasker/multitasker_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/melee/spoon/1/spoon_data.tres")
		temp.starting_weapons.push_back(temp_2)
		# Remove
		temp_2 = load("res://weapons/ranged/revolver/1/revolver_data.tres")
		temp.starting_weapons.erase(temp_2)
		
		# Ogre
		temp = load("res://dlcs/dlc_1/characters/ogre/ogre_data.tres")
		temp_2 = load("res://weapons/melee/knife/1/knife_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# One-armed
		temp = load("res://items/characters/one_arm/one_arm_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_data.tres")
		temp.starting_weapons.push_back(temp_2)
		
		# Romantic
		temp = load("res://dlcs/dlc_1/characters/romantic/romantic_data.tres")
		temp_2 = load("res://weapons/melee/jousting_lance/1/jousting_lance_data.tres")
		temp.starting_weapons.push_back(temp_2)	
		temp_2 = load("res://weapons/melee/screwdriver/1/screwdriver_data.tres")
		temp.starting_weapons.push_back(temp_2)			
		# Remove
		temp_2 = load("res://weapons/melee/fist/1/fist_data.tres")
		temp.starting_weapons.erase(temp_2)
		
		# Sailor
		temp = load("res://dlcs/dlc_1/characters/sailor/sailor_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/harpoon_gun/2/harpoon_gun_2_data.tres")
		temp.starting_weapons.push_back(temp_2)		
		
		# Sick
		temp = load("res://items/characters/sick/sick_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
		temp.starting_weapons.push_back(temp_2)

		# Vampire
		temp = load("res://items/characters/vampire/vampire_data.tres")
		temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
		temp.starting_weapons.push_back(temp_2)
