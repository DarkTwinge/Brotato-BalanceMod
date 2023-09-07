extends "res://ui/menus/upgrades/item_box_ui.gd"

# Helper function -- TODO Make this not two identical functions
func get_fairy_icon():
	for item in RunData.items:
		if item.my_id == "item_fairy":
			return item.icon.get_data()

# Append
func set_item_data(p_item_data:ItemParentData)->void :
	.set_item_data(p_item_data)
	
	_take_button.icon_align = 2 # Put icon on the right
	_take_button.icon = null    # Reset icon
	var icon = ItemService.material_icon.get_data()
	var texture = ImageTexture.new()
	
	# Add Renegade icon to item crates for unobtained tier-1s
	if RunData.current_character != null and RunData.current_character.my_id == "character_renegade" and item_data is ItemData and item_data.tier == Tier.COMMON:
		
		var already_has_item = false
		
		for item in RunData.items:
			if item.my_id == item_data.my_id:
				already_has_item = true
				break
		
		if not already_has_item:
			icon = RunData.current_character.icon.get_data()
			icon.resize(52, 52)
			texture = ImageTexture.new()
			texture.create_from_image(icon)
			_take_button.icon = texture
	# King
	elif RunData.current_character != null and RunData.current_character.my_id == "character_king" and item_data is ItemData and (item_data.tier == Tier.COMMON or item_data.tier == Tier.LEGENDARY):
		var already_has_item = false
		
		for item in RunData.items:
			if item.my_id == item_data.my_id:
				already_has_item = true
				break
		
		if not already_has_item:
			icon = RunData.current_character.icon.get_data()
			icon.resize(52, 52)
			texture = ImageTexture.new()
			texture.create_from_image(icon)
			_take_button.icon = texture	
	# Add Fairy icon to item crates for unobtained tier-1s & tier-4s
	elif RunData.get_nb_item("item_fairy", false) > 0 and item_data is ItemData and (item_data.tier == Tier.COMMON or item_data.tier == Tier.LEGENDARY):
		
		var already_has_item = false

		for item in RunData.items:
			if item.my_id == item_data.my_id:
				already_has_item = true
				break
		
		if not already_has_item:
			icon = get_fairy_icon()
			icon.resize(52, 52)
			texture = ImageTexture.new()
			texture.create_from_image(icon)
			_take_button.icon = texture
	
