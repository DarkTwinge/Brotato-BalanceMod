extends "res://effects/burning_data.gd"

# Replace to tweak Incendiary scaling
func _convert_burning_type_to_scaling_stats(serialized: Dictionary)->void :
	var burning_type_elemental = 0
	var burning_type_engineering = 1
	var type = serialized.get("type")
	if type == burning_type_elemental:
		scaling_stats = [["stat_elemental_damage", 1.0]]
	if type == burning_type_engineering:
		scaling_stats = [["stat_engineering", 0.35]]	# 0.33
