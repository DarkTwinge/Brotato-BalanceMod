extends "res://effects/items/item_exploding_effect.gd"

func get_args(player_index:int)->Array:
	var args: = WeaponServiceInitStatsArgs.new()
	args.effects = [ExplodingEffect.new()]
	var current_stats = WeaponService.init_base_stats(stats, player_index, args)
	var total_damage:int = current_stats.damage + get_additional_scaling_damage(player_index)
	var scaling_text = WeaponService.get_scaling_stats_icon_text(stats.scaling_stats)
	
	return [str(chance * 100), str(total_damage), scaling_text, str(value), str(round(scale * 100.0))]

