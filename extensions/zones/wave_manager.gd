extends "res://zones/wave_manager.gd"

# Adds a new set of Magicians to Wave 14/15 Hordes
func init(p_wave_timer:Timer, wave_data:Resource)->void :
	wave_timer = p_wave_timer
	current_wave_data = wave_data

	###
	var new_group_to_add = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/horde_group_magician-spawner.tres")
	horde_groups.push_back(new_group_to_add)
	###

	if DebugService.no_enemies:
		current_wave_data.groups_data = []

	if DebugService.spawn_debug_enemies:
		current_wave_data.groups_data.append_array(debug_groups)
		debug_groups[0].wave_units_data = DebugService.debug_enemies

	for group_data in groups_data_in_all_waves:
		var group_data_to_add = group_data.duplicate()

		if group_data.is_loot and group_data.wave_units_data.size() > 0:
			var total_chance_increase:float = RunData.sum_all_player_effects("increase_loot_alien_chance") / 100.0
			group_data.wave_units_data[0].spawn_chance *= 1.0 + total_chance_increase
		current_wave_data.groups_data.push_back(group_data_to_add)

	for player_index in RunData.get_player_count():
		var effects = RunData.get_player_effects(player_index)
		for effect in effects["extra_enemies_next_wave"]:
			var group_data = load(effect[0])
			var group_count = effect[1]
			for _i in range(group_count):
				current_wave_data.groups_data.push_back(group_data)
		effects["extra_enemies_next_wave"] = []

	for player_index in RunData.get_player_count():
		var effects = RunData.get_player_effects(player_index)
		for i in effects["extra_loot_aliens_next_wave"]:
			for group in loot_alien_groups:
				var new_group = group.duplicate()
				new_group.spawn_timing = rand_range(5, wave_timer.time_left - 10)
				current_wave_data.groups_data.push_back(new_group)
		effects["extra_loot_aliens_next_wave"] = 0

	var groups_to_add = []

	for group_data in wave_data.groups_data:
		if group_data.is_boss:
			var units_data = []
			
			if RunData.current_wave == RunData.nb_of_waves:
				if DebugService.spawn_specific_boss:
					var wave_unit_data = create_boss_wave_unit_data(DebugService.spawn_specific_boss)
					units_data.push_back(wave_unit_data)
				else :
					for boss_id in RunData.bosses_spawn:
						var wave_unit_data = create_boss_wave_unit_data(boss_id)
						units_data.push_back(wave_unit_data)
			
			elif RunData.current_wave > RunData.nb_of_waves:
				var local_elite_group = init_elite_group()
				groups_to_add.push_back(local_elite_group)

				for boss_id in RunData.get_bosses_to_spawn(true):
					var wave_unit_data = create_boss_wave_unit_data(boss_id)
					units_data.push_back(wave_unit_data)

			group_data.wave_units_data = units_data

	if RunData.elites_spawn.size() > 0:
		for elite_spawn in RunData.elites_spawn:
			if RunData.current_wave == (elite_spawn[0] as int):
				_is_elite_wave = true
				_elite_spawn_data = elite_spawn

				if elite_spawn[1] == EliteType.ELITE:
					var local_elite_group = init_elite_group([elite_spawn[2]])
					groups_to_add.push_back(local_elite_group)
				elif elite_spawn[1] == EliteType.HORDE:
					for group_data in horde_groups:
						if RunData.current_wave >= group_data.min_wave and RunData.current_wave <= group_data.max_wave:
							groups_to_add.push_back(group_data)
				break

	for group_to_add in groups_to_add:
		current_wave_data.groups_data.push_back(group_to_add)
