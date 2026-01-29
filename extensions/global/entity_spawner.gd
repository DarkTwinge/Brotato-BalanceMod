extends "res://global/entity_spawner.gd"

func _physics_process(_delta: float) -> void :
	if _cleaning_up:
		return

	cur_spawn_delay += 1

	if cur_spawn_delay >= SPAWN_DELAY:
		for player_index in Utils.shuffled_range(queues_to_spawn_structures.size()):
			var struct_queue = queues_to_spawn_structures[player_index]
			if struct_queue.size() > 0:
				spawn(struct_queue, player_index)
			var pet_queue = queues_to_spawn_pets[player_index]
			if pet_queue.size() > 0:
				spawn(pet_queue, player_index)
				
		spawn(queue_to_spawn_trees)
		spawn(queue_to_spawn_bosses)
		spawn(queue_to_spawn_summons)

		var nb_to_spawn = 1
		
		###
		var enemy_limit = QUEUE_LIMIT
		var enemy_limit_mods = (RunData.sum_all_player_effects(Keys.generate_hash("bm_max_enemy_limit")) / 100.0)
		enemy_limit = enemy_limit + enemy_limit * enemy_limit_mods
		
		if queue_to_spawn.size() >= enemy_limit:
			nb_to_spawn = int(clamp((queue_to_spawn.size() - enemy_limit) / 10.0, 1, 2))
		##

		for i in nb_to_spawn:
			spawn(queue_to_spawn)

		cur_spawn_delay = 0



func on_group_spawn_timing_reached(group_data: WaveGroupData) -> void :
	if _cleaning_up:
		return

	var max_enemies = int(_current_wave_data.max_enemies + ((RunData.get_player_count() - 1) * (_current_wave_data.max_enemies / 8.0)))
	###
	var enemy_limit_mods = (RunData.sum_all_player_effects(Keys.generate_hash("bm_max_enemy_limit")) / 100.0)
	max_enemies = max_enemies + max_enemies * enemy_limit_mods
	##

	if enemies.size() > max_enemies:
		for i in enemies.size() - max_enemies:
			var array_from = enemies

			if enemies_to_remove_in_priority.size() > 0:
				array_from = enemies_to_remove_in_priority

			var en = Utils.get_rand_element(array_from)

			en.can_drop_loot = false
			en.die()
			enemies_removed_for_perf += 1

	var group_pos: Vector2 = get_group_pos(group_data)
	group_pos = get_group_pos_away_from_players(group_pos, group_data)

	var units_data = group_data.wave_units_data
	var coop_factor = (RunData.get_player_count() - 1) * CoopService.additional_enemies_per_coop_player
	var enemy_modifier = (RunData.sum_all_player_effects(Keys.number_of_enemies_hash) / 100.0)
	var tree_modifier = RunData.sum_all_player_effects(Keys.trees_hash)

	for unit_wave_data in units_data:
		var number: float = Utils.randi_range(unit_wave_data.min_number, unit_wave_data.max_number) as float
		number *= DebugService.nb_enemies_mult

		if unit_wave_data.type == EntityType.ENEMY and not group_data.is_loot:
			number += number * coop_factor
			number = max(1.0, number + number * enemy_modifier)
		elif unit_wave_data.type == EntityType.NEUTRAL:
			number += tree_modifier

		var number_total: float = number * unit_wave_data.spawn_chance
		var number_floored: = int(number_total)
		var residual_chance: = number_total - number_floored
		var spawn_count: = (number_floored + 1) if Utils.get_chance_success(residual_chance) else number_floored

		for i in spawn_count:
			var spawn_pos = get_spawn_pos_in_area(group_pos, group_data.area, group_data.spawn_dist_away_from_edges, group_data.spawn_edge_of_map)
			spawn_pos = get_spawn_pos_away_from_players(spawn_pos, group_pos, group_data, unit_wave_data)
			if group_data.is_boss:
				queue_to_spawn_bosses.push_back([unit_wave_data.type, unit_wave_data.unit_scene, spawn_pos])
			elif unit_wave_data.type == EntityType.ENEMY:
				queue_to_spawn.push_back([unit_wave_data.type, unit_wave_data.unit_scene, spawn_pos])
			elif unit_wave_data.type == EntityType.NEUTRAL:
				queue_to_spawn_trees.push_back([unit_wave_data.type, unit_wave_data.unit_scene, spawn_pos])
