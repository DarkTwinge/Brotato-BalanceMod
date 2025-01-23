extends "res://dlcs/dlc_1/dlc_1_data.gd"

func curse_item(item_data:ItemParentData, player_index:int, turn_randomization_off:bool = false, min_modifier:float = 0.0)->ItemParentData:
	
	var orig_result = .curse_item(item_data, player_index, turn_randomization_off, min_modifier)
	
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
		
		i = i + 1
		
	return orig_result as ItemParentData

