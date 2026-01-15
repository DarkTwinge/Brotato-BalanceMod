extends "res://entities/units/enemies/boss/boss.gd"

# Increase Elite HP for Waves 17-19
func init(zone_min_pos: Vector2, zone_max_pos: Vector2, players_ref: Array = [], entity_spawner_ref = null) -> void :
	.init(zone_min_pos, zone_max_pos, players_ref, entity_spawner_ref)
	
	# Waves 17-19
	if RunData.current_wave >= 17 and RunData.current_wave <= 19:
		max_stats.health = round(max_stats.health * 1.15) as int
		current_stats.health = max_stats.health