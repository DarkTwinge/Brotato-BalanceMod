extends "res://main.gd"

# Cyborg SFX on state change
#func _physics_process(_delta:float)->void :
#	if not _convert_stats_half_wave_proced and _wave_timer.time_left <= _wave_timer.wait_time / 2.0:
#		for player_index in RunData.get_player_count():
#			if RunData.get_player_effect("convert_stats_half_wave", player_index) != []:
#				var cyborg_swap_sfx = load("res://mods-unpacked/DarkTwinge-BalanceMod/sounds/cyborg.wav")
#				SoundManager.play(cyborg_swap_sfx, 0, 0, true)
#				break
	
	## (Automatically executed anyway)
	##._physics_process(_delta)


# Replace to reduce Horde Wave profits
# Tweak mat drops to be per-mat rather than per-enemy
func spawn_loot(unit:Unit, entity_type:int, args:Entity.DieArgs)->void :

	if not unit.can_drop_loot:
		return 

	if unit.stats.can_drop_consumables:
		spawn_consumables(unit)

	var wave_factor = RunData.current_wave * 0.015
	var spawn_chance = 1.0 if RunData.current_wave < 5 else max(0.5, (1.0 - wave_factor))

	if _is_horde_wave:
		### 0.65 -> 0.6
		spawn_chance *= 0.6
		##

	if unit.stats.always_drop_consumables:
		spawn_chance = 1.0
	
	# (Old behavior: all or nothing mat drops)
	##if entity_type == EntityType.ENEMY and not Utils.get_chance_success(spawn_chance):
	##	return 

	var pos:Vector2 = unit.global_position
	var value:float = get_gold_value(entity_type, args, unit.get_stats_value(), unit)
	var gold_spread = clamp((value - 1) * 25, unit.stats.gold_spread, 200)
	
	# New behavior: Each mat is rolled independantly
	var total_mats:float = value
	for i in value:
		if entity_type == EntityType.ENEMY and not Utils.get_chance_success(spawn_chance):
			total_mats = total_mats - 1
	
	spawn_gold(total_mats, pos, gold_spread)


# Append to save next-wave mats for new Padding
#func clean_up_room(is_last_wave:bool = false, is_run_lost:bool = false, is_run_won:bool = false)->void :
#	.clean_up_room(is_last_wave, is_run_lost, is_run_won)
#	
#	RunData.effects["bm_leftover_materials"] = RunData.bonus_gold

