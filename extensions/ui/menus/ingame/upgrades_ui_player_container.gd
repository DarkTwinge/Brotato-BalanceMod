extends "res://ui/menus/ingame/upgrades_ui_player_container.gd"

# Replace to pass in player level to reroll button
func show_upgrades_for_level(level: int) -> void :
	if _reroll_price == 0:
		var result = ItemService.get_reroll_price(RunData.current_wave, _reroll_count, player_index)
		_reroll_price = result[0]
		_reroll_discount = result[1]
	### Move this above the init call instead of below, so it is updated in time to be accurate
	_level = level
	##
	_reroll_button.init(_reroll_price, player_index)
	
	var upgrades = ItemService.get_upgrades(level, 4, _old_upgrades, player_index)
	_old_upgrades = upgrades

	var upgrade_uis: = _get_upgrade_uis()
	for i in upgrade_uis.size():
		var upgrade_ui = upgrade_uis[i]
		upgrade_ui.visible = i < upgrades.size()
		if upgrade_ui.visible:
			upgrade_ui.set_upgrade(upgrades[i], player_index)

	_reroll_button.visible = upgrades.size() > 1
	_update_gold_label()
	_items_container.hide()
	_upgrades_container.show()

