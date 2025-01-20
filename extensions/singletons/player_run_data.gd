extends "res://singletons/player_run_data.gd"

static func init_effects()->Dictionary:
	var new_effects = {
		"bm_stats_on_poison_fruit":[],
		"bm_max_enemy_limit":0
	}
	var all_effects = .init_effects()
	
	all_effects.merge(new_effects)
	return all_effects
