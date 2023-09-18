extends "res://ui/menus/ingame/upgrades_ui.gd"

func show_upgrade_options(level:int)->void :
	### Pass in level so the button can highlight if it's guaranteed rarity
	_reroll_button.init(_reroll_price, level)
	###
	var upgrades = ItemService.get_upgrades(level, 4, _old_upgrades)
	_old_upgrades = upgrades
	_level = level
	_upgrade_ui_1.set_upgrade(upgrades[0])
	_upgrade_ui_2.set_upgrade(upgrades[1])
	_upgrade_ui_3.set_upgrade(upgrades[2])
	_upgrade_ui_4.set_upgrade(upgrades[3])
	_stats_container.update_stats()
	show()
