extends "res://ui/menus/pages/main_menu.gd"

# Append to add the Balance Mod version to the title screen
func init() -> void :
	.init()
		
	version_label.text += " ~~ Balance Mod v" + ModLoaderMod.get_mod_data("DarkTwinge-BalanceMod").manifest.version_number
