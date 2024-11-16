extends "res://ui/menus/shop/reroll_button.gd"

# Default level to 1 so the shop's reroll button stays normal
func init(value:int, player_index:int, level:int=1)->void :
	set_value(value, RunData.get_player_gold(player_index))
	set_text((tr("REROLL") + " - " + str(value)).to_upper())

	### Set the color of the reroll button to indicate the reroll will have a guaranteed rarity
	var tier = 0
	if level == 5:
		tier = Tier.UNCOMMON
	elif level == 10 or level == 15 or level == 20:
		tier = Tier.RARE
	elif level % 5 == 0:
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
	##
