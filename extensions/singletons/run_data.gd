extends "res://singletons/run_data.gd"

# Replaced to guarantee Horde Waves for Loud
func init_elites_spawn(base_wave:int = 10, horde_chance:float = 0.4)->void :
	elites_spawn = []
	var diff = current_difficulty
	var nb_elites = 0
	var possible_elites = ItemService.get_elites_from_zone(current_zone)

	for player_index in get_player_count():
		var current_character = get_player_character(player_index)
		if current_character != null and current_character.my_id == "character_jack":
			horde_chance = 0.0
		### Loud is guaranteed Horde Waves on 11/12 and 14/15
		elif current_character != null and current_character.my_id == "character_loud":
			horde_chance = 1.0
		##

	if DebugService.spawn_specific_elite != "":
		nb_elites = 1
	elif diff < 2:
		return 
	elif diff < 4:
		nb_elites = 1
	else :
		nb_elites = 3

	var wave = Utils.randi_range(base_wave + 1, base_wave + 2)

	for i in nb_elites:

		var type = EliteType.HORDE if Utils.get_chance_success(horde_chance) else EliteType.ELITE

		if DebugService.spawn_specific_elite != "":
			type = EliteType.ELITE
			wave = DebugService.starting_wave

		if i == 1:
			wave = Utils.randi_range(base_wave + 4, base_wave + 5)
		elif i == 2:
			wave = Utils.randi_range(base_wave + 7, base_wave + 8)
			type = EliteType.ELITE

		var elite_id = Utils.get_rand_element(possible_elites).my_id if type == EliteType.ELITE else ""

		for elite in possible_elites:
			if elite.my_id == elite_id:
				possible_elites.erase(elite)
				break

		if DebugService.spawn_specific_elite != "":
			elite_id = DebugService.spawn_specific_elite

		elites_spawn.push_back([wave, type, elite_id])





# Added set bonus for One-armed
func update_sets(player_index:int)->void :
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
			else :
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



# Slightly reduce the effect of armor
func get_armor_coef(armor:int)->float:
	var percent_dmg_taken = 10.0 / (10.0 + (abs(armor) / 1.6)) # Was 1.5

	if armor < 0:
		percent_dmg_taken = (1.0 - percent_dmg_taken) + 1.0
	
	return percent_dmg_taken



# Gives an extra starting Sausage for Gun Mage
func add_starting_items_and_weapons()->void :
	.add_starting_items_and_weapons()

	for player_index in players_data.size():
		var effects: = get_player_effects(player_index)
		if effects["starting_item"].size() > 0:
			for item_id in effects["starting_item"]:
				for i in item_id[1]:
					var item = ItemService.get_element(ItemService.items, item_id[0])
					### If adding a starting Sausage, add a 2nd if the starting weapon is an SMG or Shotgun
					if item_id[0] == "item_scared_sausage":
						var weapons = RunData.get_player_weapons(player_index)
						if weapons[0].my_id == "weapon_double_barrel_shotgun_1" or weapons[0].my_id == "weapon_smg_1":
							add_item(item, player_index)
					##
