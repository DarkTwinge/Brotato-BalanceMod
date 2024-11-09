extends "res://singletons/weapon_service.gd"

# Allows Crazy's +100 Range to apply to Crossbow/Sniper
# Allows Brawler's +Attack Speed to apply to Claw
func sum_scaling_stat_values(p_scaling_stats:Array, player_index:int)->float:
	var value = 0
	for scaling_stat in p_scaling_stats:
		if scaling_stat[0] == "stat_levels":
			value += RunData.get_player_level(player_index) * scaling_stat[1]
		else :
			value += Utils.get_stat(scaling_stat[0], player_index) * scaling_stat[1]
			### Counts Contextual Flat-Stat Class Bonuses to apply to weapons that scale with those stats
			var effects = RunData.get_player_effects(player_index)
			
			# Romantic Bonus
			## Needs a check for melee-weapon added to work properly
			#if effects.weapon_type_bonus != []:
			#	if scaling_stat[0] == "stat_range" and effects.weapon_type_bonus[0][1] == "max_range":
			#		value += effects.weapon_type_bonus[0][2] * scaling_stat[1]
			
			if effects.weapon_class_bonus != []:
				# Crazy Bonus
				if scaling_stat[0] == "stat_range" and effects.weapon_class_bonus[0][0] == "set_precise" and effects.weapon_class_bonus[0][1] == "max_range":
					value += effects.weapon_class_bonus[0][2] * scaling_stat[1]
				# Brawler Bonus
				elif scaling_stat[0] == "stat_attack_speed" and effects.weapon_class_bonus[0][0] == "set_unarmed" and effects.weapon_class_bonus[0][1] == "attack_speed_mod":
					value += effects.weapon_class_bonus[0][2] * scaling_stat[1]
			##
	return value
	
	
	
