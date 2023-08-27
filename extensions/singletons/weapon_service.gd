extends "res://singletons/weapon_service.gd"

# Replaces existing function; melee Range now divided by 1.5 instead of 2.0
func init_melee_stats(from_stats:MeleeWeaponStats = MeleeWeaponStats.new(), weapon_id:String = "", sets:Array = [], effects:Array = [], is_structure:bool = false)->MeleeWeaponStats:
	var new_stats = init_base_stats(from_stats, weapon_id, sets, effects, is_structure) as MeleeWeaponStats
	
	new_stats.alternate_attack_type = from_stats.alternate_attack_type
	
	if not is_structure:
	###
		new_stats.max_range = max(MIN_RANGE, new_stats.max_range + (Utils.get_stat("stat_range") / 1.5)) as int
	###
	
	return new_stats


# Adds functionality for characters to get a Set Percent Damage bonus
func init_base_stats(from_stats:WeaponStats, weapon_id:String = "", sets:Array = [], effects:Array = [], is_structure:bool = false)->WeaponStats:
	
	var base_stats = from_stats.duplicate()
	var new_stats:WeaponStats
	var is_exploding = false
	
	if from_stats is MeleeWeaponStats:
		new_stats = MeleeWeaponStats.new()
	else :
		new_stats = RangedWeaponStats.new()
	
	for weapon_bonus in RunData.effects["weapon_bonus"]:
		if weapon_id == weapon_bonus[0]:
			base_stats.set(weapon_bonus[1], base_stats.get(weapon_bonus[1]) + weapon_bonus[2])
	
	for class_bonus in RunData.effects["weapon_class_bonus"]:
		for set in sets:
			if set.my_id == class_bonus[0]:
				var value = base_stats.get(class_bonus[1]) + class_bonus[2]
				
				if class_bonus[1] == "lifesteal":
					value = base_stats.get(class_bonus[1]) + (class_bonus[2] / 100.0)
				### New addition - Percent Damage
				elif class_bonus[1] == "damage_stack":
					value = base_stats.get(class_bonus[1]) + (class_bonus[2] / 100.0)
				###
				base_stats.set(class_bonus[1], value)
	
	for effect in effects:
		if effect is BurningEffect:
			base_stats.burning_data = BurningData.new(effect.burning_data.chance, effect.burning_data.damage, effect.burning_data.duration, effect.burning_data.spread)
		elif effect is WeaponStackEffect:
			var nb_same_weapon = 0
			
			for checked_weapon in RunData.weapons:
				if checked_weapon.weapon_id == effect.weapon_stacked_id:
					nb_same_weapon += 1
			
			base_stats.set(effect.stat_name, base_stats.get(effect.stat_name) + (effect.value * max(0.0, nb_same_weapon - 1)))
		elif effect is ExplodingEffect:
			is_exploding = true
	
	new_stats.scaling_stats = base_stats.scaling_stats
	
	var atk_spd = (Utils.get_stat("stat_attack_speed") + base_stats.attack_speed_mod) / 100.0
	
	if is_structure:
		atk_spd = 0
	
	new_stats.burning_data = init_burning_data(base_stats.burning_data, false, is_structure)
	new_stats.min_range = base_stats.min_range if not RunData.effects["no_min_range"] else 0
	new_stats.effect_scale = base_stats.effect_scale
	
	if atk_spd > 0:
		new_stats.cooldown = max(2, base_stats.cooldown * (1 / (1 + atk_spd))) as int
		new_stats.recoil = base_stats.recoil / (1 + atk_spd)
		new_stats.recoil_duration = base_stats.recoil_duration / (1 + atk_spd)
	else :
		new_stats.cooldown = max(2, base_stats.cooldown * (1 + abs(atk_spd))) as int
		new_stats.recoil = base_stats.recoil
		new_stats.recoil_duration = base_stats.recoil_duration
	
	new_stats.attack_speed_mod = base_stats.attack_speed_mod
	new_stats.max_range = base_stats.max_range
	
	if is_structure:
		new_stats.max_range = base_stats.max_range
	
	new_stats.damage = base_stats.damage
	new_stats.damage = max(1.0, new_stats.damage + get_scaling_stats_value(base_stats.scaling_stats)) as int
	
	var percent_dmg_bonus = (1 + (Utils.get_stat("stat_percent_damage") / 100.0))
	var exploding_dmg_bonus = 0
	
	if is_structure:
		percent_dmg_bonus = 1
	
	if is_exploding:
		exploding_dmg_bonus = (Utils.get_stat("explosion_damage") / 100.0)
	
	#new_stats.damage = max(1, round(new_stats.damage * (percent_dmg_bonus + exploding_dmg_bonus))) as int
	### New - adds in Character percent damage bonus
	new_stats.damage = max(1, round(new_stats.damage * (percent_dmg_bonus + exploding_dmg_bonus + base_stats.damage_stack))) as int
	###
	
	new_stats.crit_damage = base_stats.crit_damage
	
	new_stats.crit_chance = base_stats.crit_chance + (Utils.get_stat("stat_crit_chance") / 100.0)
	
	if is_structure:
		new_stats.crit_chance = base_stats.crit_chance
	
	new_stats.accuracy = (base_stats.accuracy + (RunData.effects["accuracy"] / 100.0))
	new_stats.is_healing = base_stats.is_healing
	
	new_stats.lifesteal = ((Utils.get_stat("stat_lifesteal") / 100.0) + base_stats.lifesteal)
	
	if is_structure:
		new_stats.lifesteal = base_stats.lifesteal
	
	new_stats.knockback = max(0.0, base_stats.knockback + RunData.effects["knockback"]) as int
	
	new_stats.shooting_sounds = base_stats.shooting_sounds
	new_stats.sound_db_mod = base_stats.sound_db_mod
	new_stats.additional_cooldown_every_x_shots = base_stats.additional_cooldown_every_x_shots
	new_stats.additional_cooldown_multiplier = base_stats.additional_cooldown_multiplier
	
	return new_stats


# Adds +1 duration for every Eyes Surgery
func init_burning_data(base_burning_data:BurningData = BurningData.new(), is_global:bool = false, is_structure:bool = false)->BurningData:
	var new_burning_data = base_burning_data.duplicate()
	var global_burning = RunData.effects["burn_chance"]
	var base_weapon_has_no_burning = base_burning_data.chance == 0
	
	if not is_global:
		if base_burning_data.chance == 0:
			new_burning_data.chance = global_burning.chance
			new_burning_data.damage = global_burning.damage
			new_burning_data.duration = global_burning.duration
		elif base_burning_data.chance > 0:
			new_burning_data.damage += global_burning.damage
	
	new_burning_data.spread += RunData.effects["burning_spread"]
	
	if not is_structure or (is_structure and base_weapon_has_no_burning):
		
		new_burning_data.damage += Utils.get_stat("stat_elemental_damage")
		
		var percent_dmg_bonus = (1 + (Utils.get_stat("stat_percent_damage") / 100.0))
		new_burning_data.damage = max(1, round(new_burning_data.damage * percent_dmg_bonus)) as int
	
	### +1 Duration per Eyes Surgery
	new_burning_data.duration += (RunData.effects["burning_cooldown_reduction"] / 10)
	###
	return new_burning_data

# Allows Crazy's +100 Range to apply to Crossbow/Sniper
func get_scaling_stats_value(p_scaling_stats:Array)->float:
	var value = 0
	
	for scaling_stat in p_scaling_stats:
		if scaling_stat[0] == "stat_levels":
			value += RunData.current_level * scaling_stat[1]
		else :
			value += Utils.get_stat(scaling_stat[0]) * scaling_stat[1]
			### Counts a Range Class Bonus to apply to weapons that scale with Range
			if RunData.effects.weapon_class_bonus != []:
				# Crazy Bonus
				if scaling_stat[0] == "stat_range" and RunData.effects.weapon_class_bonus[0][0] == "set_precise" and RunData.effects.weapon_class_bonus[0][1] == "max_range":
					value += RunData.effects.weapon_class_bonus[0][2] * scaling_stat[1]
				# Brawler Bonus
				elif scaling_stat[0] == "stat_attack_speed" and RunData.effects.weapon_class_bonus[0][0] == "set_unarmed" and RunData.effects.weapon_class_bonus[0][1] == "attack_speed_mod":
					value += RunData.effects.weapon_class_bonus[0][2] * scaling_stat[1]
			###
	return value
