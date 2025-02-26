extends "res://dlcs/dlc_1/dlc_1_data.gd"

func curse_item(item_data:ItemParentData, player_index:int, turn_randomization_off:bool = false, min_modifier:float = 0.0)->ItemParentData:
	
	# Hijack global variable to transfer info into _get_cursed_item_effect_modifier
	RunData.bm_player_index = player_index
	var orig_result = .curse_item(item_data, player_index, turn_randomization_off, min_modifier)
	RunData.bm_player_index = 0
	
	var i = 0
	for effect in orig_result.effects:
		
		# Hard-coded to reset to original BM Fairy Counter value
		if effect.text_key == "bm_effect_fairy_counter":
			orig_result.effects[i].value = 3
		# BM text changes for cursed versions
		elif effect.key == "hit_protection":
			orig_result.effects[i].text_key = "bm_effect_hit_protection_plural"
		elif effect.key == "bounce":
			orig_result.effects[i].text_key = "new_effect_bouncing_plural"
		# Changes to BM text when a curse makes an explosion 100% chance
		elif effect.text_key == "effect_explode":
				orig_result.effects[i].text_key = "new_effect_explode"
		# Fixes Weird Ghost to Curse properly
		elif effect.key == "hp_start_next_wave":
			effect.value = -90	# Resets to base value, when vanilla forced it to -100
			var override = false
			var overriden_sign = Sign.POSITIVE
			var effect_modifier: = _get_cursed_item_effect_modifier(turn_randomization_off, min_modifier)
			var max_effect_modifier = max(0.0, effect_modifier)
			effect.value = _boost_effect_value_positively(effect, max_effect_modifier, override, overriden_sign)
		# White Flag adjustment, affects Enemy Limit at half the 'normal' amount
		elif effect.key == "bm_max_enemy_limit":
			var override = true
			var overriden_sign = Sign.POSITIVE
			var effect_modifier: = _get_cursed_item_effect_modifier(turn_randomization_off, min_modifier)
			effect_modifier = effect_modifier * 0.5
			var max_effect_modifier = max(0.0, effect_modifier)
			effect.value = _boost_effect_value_positively(effect, max_effect_modifier, override, overriden_sign)
		
		i = i + 1
	
	# Removes the extra trees added by Curse since those will naturally be there anyway now
	i = 0
	if orig_result.my_id == "item_pocket_factory":
		for effect in orig_result.effects:
			if effect.key == "trees" && effect.value == 1:
				orig_result.effects.erase(effect)
				break
			i = i + 1
	
	return orig_result as ItemParentData



func _get_cursed_item_effect_modifier(turn_randomization_off:bool = false, min_modifier:float = 0.0)->float:
	var result = ._get_cursed_item_effect_modifier(turn_randomization_off, min_modifier)
	
	# Using RunData to pass in player_index from the above function to get the character and then the Curse stat amount
	var character = RunData.get_player_character(RunData.bm_player_index)
	var character_id = character.my_id
	if character_id == "character_creature":
		# Random range is now -20 to +30 for Creature, reducing bad rolls
		var random_modifier: = 0 if turn_randomization_off else Utils.randi_range( - cursed_item_random_percent_modifier + 10, cursed_item_random_percent_modifier)
		var wave_basis = 0 if turn_randomization_off else RunData.current_wave
		# Creature bonus increasing based on amount of Curse
		print(random_modifier)
		print(Utils.get_stat("stat_curse", RunData.bm_player_index))
		var current_curse = Utils.get_stat("stat_curse", RunData.bm_player_index)
		var creature_bonus = round(2 * pow(current_curse, 0.55))
		print(creature_bonus)
		# Base = 40; Per Wave = 2; random = -30 to +30 (-20 to +30 now)
		var percent_modifier: = cursed_item_base_percent_modifier + cursed_item_percent_modifier_increase_each_wave * min(20, (wave_basis - 1)) + random_modifier + int(creature_bonus)
		print(percent_modifier)
		print("~~~")
		result = max(min_modifier, percent_modifier / 100.0)
	return result
