extends "res://ui/menus/shop/shop.gd"

## [Bugfix: Update stats on reroll] Removed - Now live in vanilla

# Append to refresh shop items on weapon combine for King's ability
func _on_item_combine_button_pressed(weapon_data:WeaponData, player_index:int, is_upgrade:bool = false)->void :
	._on_item_combine_button_pressed(weapon_data, player_index, is_upgrade)
	# Don't refresh if upgrade is from Anvil
	if not is_upgrade:
		_shop_items_container.reload_shop_items_descriptions()
