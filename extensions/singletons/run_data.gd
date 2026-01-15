extends "res://singletons/run_data.gd"

var bm_player_index: = 0

# Added set bonus for One-armed
func update_sets(player_index: int) -> void :
	var player_data = players_data[player_index]
	var active_set_effects = player_data.active_set_effects
	var active_sets = player_data.active_sets

	for effect in active_set_effects:
		effect[1].unapply(player_index)

	active_sets.clear()
	active_set_effects.clear()

	var weapons: = get_player_weapons(player_index)
	for weapon in weapons:
		for set in weapon.sets:
			if get_player_effect_bool("all_weapons_count_for_sets", player_index):
				active_sets[set.my_id] = weapons.size()
			elif active_sets.has(set.my_id):
				active_sets[set.my_id] += 1
			else:
				active_sets[set.my_id] = 1
				### Treats One-armed as having a 4-set Bonus, except for Legendary weapons
				var current_character = get_player_character(player_index)
				if current_character.my_id == "character_one_arm" and not set.my_id == "set_legendary":
					active_sets[set.my_id] = 4	
				##				

	for key in active_sets:
		if active_sets[key] >= 2:
			var set = ItemService.get_set(key)
			var set_effects = set.set_bonuses[min(active_sets[key] - 2, set.set_bonuses.size() - 1)]

			for effect in set_effects:
				effect.apply(player_index)
				active_set_effects.push_back([key, effect])


# Changes effect of King's abilities to be unique weapons
func update_tier_iv_weapon_bonuses(player_index: int) -> void :
	var effects: = get_player_effects(player_index)
	var tier_iv_weapon_effects = players_data[player_index].tier_iv_weapon_effects

	for effect in tier_iv_weapon_effects:
		effects[effect[0]] -= effect[1]

	tier_iv_weapon_effects.clear()

	var weapons: = get_player_weapons(player_index)
	###
	var unique_tier4_weapon_ids = []
	##
	for weapon in weapons:
		if weapon.tier >= Tier.LEGENDARY:
			### Keep track of duplicate weapons
			if not unique_tier4_weapon_ids.has(weapon.weapon_id):
				unique_tier4_weapon_ids.push_back(weapon.weapon_id)
			##
				for effect in effects["tier_iv_weapon_effects"]:
					effects[effect[0]] += effect[1]
					tier_iv_weapon_effects.push_back([effect[0], effect[1]])

				

# Slightly reduce the effect of armor
func get_armor_coef(armor: int) -> float:
	var percent_dmg_taken = 10.0 / (10.0 + (abs(armor) / 1.6)) # Was 1.5

	if armor < 0:
		percent_dmg_taken = (1.0 - percent_dmg_taken) + 1.0
	
	return percent_dmg_taken


# Gives an extra starting Sausage for non-Elemental Mage
func add_starting_items_and_weapons() -> void :
	.add_starting_items_and_weapons()

	for player_index in players_data.size():
		var effects: = get_player_effects(player_index)
		if effects["starting_item"].size() > 0:
			for item_id in effects["starting_item"]:
				for i in item_id[1]:
					var item = ItemService.get_element(ItemService.items, item_id[0])
					### If adding a starting Sausage, add a 2nd if the starting weapon is non-Elemental (TODO: Make it not hard-cased)
					var current_character = get_player_character(player_index)
					if item_id[0] == "item_scared_sausage" and current_character.my_id == "character_mage":
						var weapons = RunData.get_player_weapons(player_index)
						if weapons[0].my_id == "weapon_double_barrel_shotgun_1" or weapons[0].my_id == "weapon_smg_1" or weapons[0].my_id == "weapon_wrench_1" or weapons[0].my_id == "weapon_spoon_1" or weapons[0].my_id == "weapon_cacti_club_1":
							add_item(item, player_index)
					##

# Removes useless-for-the-character stats from the random list for Candy Bag
func get_random_primary_stats() -> String:
	var stats_list = [
		"stat_max_hp", 
		"stat_armor", 
		"stat_crit_chance", 
		"stat_luck", 
		"stat_attack_speed", 
		"stat_elemental_damage", 
		"stat_hp_regeneration", 
		"stat_lifesteal", 
		"stat_melee_damage", 
		"stat_percent_damage", 
		"stat_dodge", 
		"stat_engineering", 
		"stat_range", 
		"stat_ranged_damage", 
		"stat_speed", 
		"stat_harvesting"
	]

	##TODO - this doesn't have a player_index to tell apart co-op players, does it need to ignore this in co-op?
	for player_data in RunData.players_data:
		var character = player_data.current_character

		if character.banned_item_groups.has("armor"):
			stats_list.erase("stat_armor")
		if character.banned_item_groups.has("dodge"):
			stats_list.erase("stat_dodge")
		if character.banned_item_groups.has("harvesting"):
			stats_list.erase("stat_harvesting")
		if character.banned_item_groups.has("melee_damage"):
			stats_list.erase("stat_melee_damage")
		if character.banned_item_groups.has("ranged_damage"):
			stats_list.erase("stat_ranged_damage")
		if character.banned_item_groups.has("elemental_damage"):
			stats_list.erase("stat_elemental_damage")
		if character.banned_item_groups.has("engineering"):
			stats_list.erase("stat_engineering")
		if character.banned_item_groups.has("speed"):
			stats_list.erase("stat_speed")
		if character.banned_item_groups.has("hp_regeneration"):
			stats_list.erase("stat_hp_regeneration")
		if character.banned_item_groups.has("lifesteal"):
			stats_list.erase("stat_lifesteal")
			
	return stats_list[randi() % stats_list.size()]
		
		
# Fixes tooltip for Fairy
#func get_scaling_bonus(value:int, stat_scaled:String, nb_stat_scaled:int, perm_stats_only:bool, player_index:int)->int:
#	var orig_value = .get_scaling_bonus(value, stat_scaled, nb_stat_scaled, perm_stats_only, player_index)
#	var actual_nb_scaled: = 0.0
#	# Changes how the rounding happens for Fairy's tooltip
#	if stat_scaled == "common_item":
#		actual_nb_scaled = get_nb_different_items_of_tier(Tier.COMMON, player_index)
#		return int(value * floor((actual_nb_scaled / nb_stat_scaled)))
#	# For anything other than Tier-1 Items, use original rounding
#	else:
#		return orig_value



# Debug stuff
#func reset(restart:bool = false)->void :
#	.reset(restart)
#	current_wave = 16
#	invulnerable = true
#	temp = load("res://weapons/ranged/double_barrel_shotgun/4/double_barrel_shotgun_4_data.tres")
#	players_data[0].weapons.push_back(temp)
