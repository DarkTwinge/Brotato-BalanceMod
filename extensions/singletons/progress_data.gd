extends "res://singletons/progress_data.gd"

const BALMOD_DIR_DLCE = "res://mods-unpacked/DarkTwinge-BalanceMod/extensions/dlcs/dlc_1/"

### ALL BASELINE DLC CHANGES ###
func add_all_dlcs()->void :
	.add_all_dlcs()

	## This theoretically should check for DLC presence but doesn't seem to work here
	##if RunData.enabled_dlcs.has("abyssal_terrors"):
	var temp
	var temp_2

	### ENEMIES ###
	# Turtle buff
	var elite_scenes = {
		"elite_turtle":"res://mods-unpacked/DarkTwinge-BalanceMod/elites/turtle.tscn"
	}
	for dlc in available_dlcs:
		for elite in dlc.elites:
			if elite.my_id in elite_scenes.keys():
				elite.scene = load(elite_scenes[elite.my_id])

	
	# Regular enemies
	temp = load("res://dlcs/dlc_1/enemies/walrus/walrus_stats.tres")
	temp.health = 45											# 40
	temp.knockback_resistance = 0.87			# 0.9
	
	temp = load("res://dlcs/dlc_1/enemies/narwhal/narwhal_stats.tres")
	temp.health_increase_each_wave = 8.75	# 8.0
	temp.knockback_resistance = 0.87			# 0.9
	
	## WAVE CHANGES ##
	# Find all waves with Stargazers and replace them with my version
	for dlc in available_dlcs:
		for zone in dlc.zones:
			for wave in zone.waves_data:
				for group in wave.groups_data:
					for unit in group.wave_units_data:
						if unit.unit_scene.get_path() == "res://dlcs/dlc_1/enemies/stargazer/stargazer.tscn":
							unit.unit_scene = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/stargazer.tscn")
			for unit in zone.endless_enemy_scenes:
				if unit.get_path() == "res://dlcs/dlc_1/enemies/stargazer/stargazer.tscn":
					unit = load("res://mods-unpacked/DarkTwinge-BalanceMod/enemies/stargazer.tscn")
		


	### ITEMS ###
	# Items: Tier-1
	temp = load("res://dlcs/dlc_1/items/corrupted_shard/corrupted_shard_data.tres")
	temp.value = 13   # 12
	temp = load("res://dlcs/dlc_1/items/corrupted_shard/effects/corrupted_shard_effect_1.tres")
	temp.value = 2		# 1 (Curse)


	# Items: Tier-2
	temp = load("res://dlcs/dlc_1/items/bone_dice/bone_dice_data.tres")
	temp.value = 25   # 30
	temp = load("res://dlcs/dlc_1/items/bone_dice/effects/bone_dice_effect_0.tres")
	temp.value2 = 60	# 50 (Chance to proc +1% Damage)

	temp = load("res://dlcs/dlc_1/items/cauldron/effects/cauldron_effect_1.tres")
	temp.value = 25   # 20 (Temp Damage%)
	temp.value2 = 3		# 2 (Seconds of Duration)

	temp = load("res://dlcs/dlc_1/items/eyepatch/effects/eyepatch_effect_1.tres")
	temp.value = 5		# 3 (Crit Chance)

	temp = load("res://dlcs/dlc_1/items/saltwater/effects/saltwater_effect_1.tres")
	temp.value = 20		# 10 (Extra Speed when hit)


	# Items: Tier-3
	temp = load("res://dlcs/dlc_1/items/goldfish/goldfish_data.tres")
	temp.value = 17   # 23	


	# Items: Tier-4
	temp = load("res://dlcs/dlc_1/items/krakens_eye/krakens_eye_data.tres")
	temp.value = 90		# 110

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
	temp = load("res://dlcs/dlc_1/weapons/melee/sickle/4/sickle_4_data.tres")
	temp.value = 111		# 122
	
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
	temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/4/war_hammer_4_data.tres")
	temp.value = 209				#	255
	temp = load("res://dlcs/dlc_1/weapons/melee/war_hammer/4/war_hammer_4_stats.tres")
	temp.crit_damage = 1.75	# 1.5
	
	## RANGED WEAPONS ##
	# Blunderbuss
	temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/2/blunderbuss_2_data.tres")
	temp.value = 46					# 45
	temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/3/blunderbuss_3_data.tres")
	temp.value = 90					# 95
	temp = load("res://dlcs/dlc_1/weapons/ranged/blunderbuss/4/blunderbuss_4_data.tres")
	temp.value = 160				# 192
	
	# Flute
	temp = load("res://dlcs/dlc_1/weapons/ranged/flute/1/flute_data.tres")
	temp.value = 19					# 20
	temp = load("res://dlcs/dlc_1/weapons/ranged/flute/2/flute_2_data.tres")
	temp.value = 41					# 45
	temp = load("res://dlcs/dlc_1/weapons/ranged/flute/3/flute_3_data.tres")
	temp.value = 81					# 80
	temp = load("res://dlcs/dlc_1/weapons/ranged/flute/4/flute_4_data.tres")
	temp.value = 150				# 165
	
	# Grenade Launcher
	temp = load("res://dlcs/dlc_1/weapons/ranged/grenade_launcher/4/grenade_launcher_4_data.tres")
	temp.value = 191				# 212
	
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
	

	### STARTING WEAPONS ###
	# Chunky
#	temp = load("res://items/characters/chunky/chunky_data.tres")
#	temp_2 = load("res://dlcs/dlc_1/weapons/melee/sickle/1/sickle_data.tres")
#	temp.starting_weapons.push_back(temp_2)
	
	# Cryptid
## Not working??
	temp = load("res://items/characters/cryptid/cryptid_data.tres")
	temp_2 = load("res://dlcs/dlc_1/weapons/ranged/flute/1/flute_data.tres")
	temp.starting_weapons.push_back(temp_2)	

	# Explorer
	temp = load("res://items/characters/explorer/explorer_data.tres")
	temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
	temp.starting_weapons.push_back(temp_2)
	temp_2 = load("res://dlcs/dlc_1/weapons/melee/lute/1/lute_data.tres")
	temp.starting_weapons.push_back(temp_2)
	
	# Romantic
	temp = load("res://dlcs/dlc_1/characters/romantic/romantic_data.tres")
	temp_2 = load("res://weapons/melee/jousting_lance/1/jousting_lance_data.tres")
	temp.starting_weapons.push_back(temp_2)	
## Not working??
	temp_2 = load("res://weapons/melee/claw/1/claw_data.tres")
	temp.starting_weapons.push_back(temp_2)	
	# Remove
	temp_2 = load("res://weapons/melee/fist/1/fist_data.tres")
	temp.starting_weapons.erase(temp_2)

	# Sick
	temp = load("res://items/characters/sick/sick_data.tres")
	temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
	temp.starting_weapons.push_back(temp_2)

	# Vampire
	temp = load("res://items/characters/vampire/vampire_data.tres")
	temp_2 = load("res://dlcs/dlc_1/weapons/ranged/javelin/1/javelin_data.tres")
	temp.starting_weapons.push_back(temp_2)
