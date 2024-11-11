extends "res://singletons/progress_data.gd"

### ALL BASELINE DLC CHANGES ###
func add_all_dlcs()->void :
	.add_all_dlcs()

	## This theoretically should check for DLC presence but doesn't seem to work here
	##if RunData.enabled_dlcs.has("abyssal_terrors"):
	var temp

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
	temp.value = 15		# 10 (Extra Speed when hit)


	# Items: Tier-3
	temp = load("res://dlcs/dlc_1/items/goldfish/goldfish_data.tres")
	temp.value = 18   # 23	


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
