extends "res://zones/wave_manager.gd"

# Adds a new set of Magicians to Wave 14/15 Hordes
func init(p_wave_timer:Timer, zone_data:ZoneData, wave_data:Resource)->void :
	# Crash Zone only
	if zone_data.my_id == 0:
		var new_group_to_add = load("res://mods-unpacked/DarkTwinge-BalanceMod/waves/horde_group_magician-spawner.tres")
		zone_data.horde_groups.push_back(new_group_to_add)

	.init(p_wave_timer, zone_data, wave_data)
