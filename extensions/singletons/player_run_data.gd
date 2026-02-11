extends "res://singletons/player_run_data.gd"

static func init_effects() -> Dictionary:

	var new_effects = {
		Keys.generate_hash("bm_stats_on_poison_fruit"): [],
		Keys.generate_hash("bm_max_enemy_limit"): 0
##		Keys.generate_hash("bm_stats_next_wave_chance"): 0
	}
	var all_effects = .init_effects()
	
	all_effects.merge(new_effects)
	return all_effects
