extends "res://effects/weapons/exploding_effect.gd"

# Replace to add scale to arg list
func get_args(_player_index:int)->Array:
	return [str(round(chance * 100.0)), str(round(scale * 100.0))]

