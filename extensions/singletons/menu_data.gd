extends "res://singletons/menu_data.gd"

func _init():
	print("this part gets run (twice?)")
	ModLoaderMod.install_script_extension("res://mods-unpacked/DarkTwinge-BalanceMod/extensions/weapons/weapon_stats/ranged_weapon_stats.gd")