extends "res://ui/menus/shop/reroll_button.gd"

# 
func init(value:int, player_index:int)->void :
	.init(value, player_index)
	
	var player_level = _wl_get_upgrade_level()

	# Set the color of the reroll button to indicate the reroll will have a guaranteed rarity
	var tier = 0
	if player_level == 5:
		tier = Tier.UNCOMMON
	elif player_level == 10 or player_level == 15 or player_level == 20:
		tier = Tier.RARE
	elif player_level >= 25 and player_level % 5 == 0:
		tier = Tier.LEGENDARY
	
	if tier > 0:
		# See https://docs.godotengine.org/en/3.5/classes/class_button.html#theme-properties for other styleboxes
		var stylebox_color = get_stylebox("normal").duplicate()
		ItemService.change_panel_stylebox_from_tier(stylebox_color, tier)
		stylebox_color.border_width_left = 3
		stylebox_color.border_width_top = 3
		stylebox_color.border_width_right = 3
		stylebox_color.border_width_bottom = 2
		add_stylebox_override("normal", stylebox_color)
	else:
		remove_stylebox_override("normal")
		

# Stealing WL's level-grab solution to help compatability
func _wl_get_upgrade_level() -> int:
	var node = self
	while !node.get("_level"):
		node = node.get_parent()
		if node == null:
			return 0
	return node._level
