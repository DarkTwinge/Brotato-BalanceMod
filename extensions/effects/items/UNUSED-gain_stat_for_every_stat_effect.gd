extends "res://effects/items/gain_stat_for_every_stat_effect.gd"

# New Padding effect
# King's changed ability
func get_args(player_index: int) -> Array:
	var actual_nb_scaled := 0.0
	var key_arg = key
	var perm_stats_only = text_key.to_upper() == "EFFECT_GAIN_STAT_FOR_EVERY_PERM_STAT"

	if stat_scaled == "materials":
		actual_nb_scaled = RunData.get_player_gold(player_index)
	elif stat_scaled == "structure":
		actual_nb_scaled = RunData.get_nb_structures(player_index)
	elif stat_scaled == "living_enemy":
		actual_nb_scaled = RunData.current_living_enemies
	elif stat_scaled == "burning_enemy":
		actual_nb_scaled = RunData.current_burning_enemies
	elif stat_scaled == "common_item":
		actual_nb_scaled = RunData.get_nb_different_items_of_tier(Tier.COMMON, player_index)
	elif stat_scaled == "legendary_item":
		actual_nb_scaled = RunData.get_nb_different_items_of_tier(Tier.LEGENDARY, player_index)
	elif stat_scaled == "duplicate_item":
		actual_nb_scaled = RunData.get_duplicate_items_count(player_index)
	elif stat_scaled.begins_with("item_"):
		actual_nb_scaled = RunData.get_nb_item(stat_scaled, player_index, false)
	elif stat_scaled == "living_tree":
		actual_nb_scaled = RunData.current_living_trees
	elif stat_scaled == "percent_player_missing_health":
		var current_health = RunData.get_player_current_health(player_index)
		var max_health = RunData.get_player_max_health(player_index)
		actual_nb_scaled = WeaponService.apply_inverted_health_bonus(1, 1, current_health, max_health)
	elif stat_scaled == "free_weapon_slots":
		actual_nb_scaled = RunData.get_free_weapon_slots(player_index)
	elif perm_stats_only:
		actual_nb_scaled = RunData.get_stat(stat_scaled, player_index)
	### Stat for materials leftover at end of wave (New Padding)
	elif stat_scaled == "bm_leftover_materials":
		actual_nb_scaled = RunData.effects["bm_leftover_materials"]
	##
	### New King ability counts uniques rather than total tier-4 weapons
	elif stat_scaled == "bm_unique_legendary_weapon":
		var unique_tier4_weapon_ids = []
		for weapon in RunData.get_player_weapons(player_index):
			if weapon.tier >= Tier.LEGENDARY: 
				if not unique_tier4_weapon_ids.has(weapon.weapon_id):
					unique_tier4_weapon_ids.push_back(weapon.weapon_id)
		actual_nb_scaled = unique_tier4_weapon_ids.size()
	##
	else:
		actual_nb_scaled = RunData.get_stat(stat_scaled, player_index) + TempStats.get_stat(stat_scaled, player_index)

	var bonus = int(floor(value * (actual_nb_scaled / nb_stat_scaled)))

	if key_arg == "number_of_enemies":
		key_arg = "pct_number_of_enemies"

	return [str(value), tr(key_arg.to_upper()), str(nb_stat_scaled), tr(stat_scaled.to_upper()), str(bonus)]
