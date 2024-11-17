extends "res://entities/units/player/player.gd"

func on_consumable_picked_up(consumable_data:ConsumableData)->void :
	.on_consumable_picked_up(consumable_data)

	if consumable_data.my_id == "consumable_poisoned_fruit":
		var stats_on_fruit_effects = RunData.get_player_effect("bm_stats_on_poison_fruit", player_index)
		for stats_on_fruit_effect in stats_on_fruit_effects:
			var stat_name = stats_on_fruit_effect[0]
			var stat_value = stats_on_fruit_effect[1]
			var effect_chance = stats_on_fruit_effect[2]
			if Utils.get_chance_success(effect_chance / 100.0):
				RunData.add_stat(stat_name, stat_value, player_index)
				RunData.add_tracked_value(player_index, "character_druid", stat_value)

	RunData.emit_stats_updated()
