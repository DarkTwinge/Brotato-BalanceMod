extends "res://ui/menus/shop/shop_item.gd"

# Helper function
func get_fairy_icon():
	for item in RunData.items:
		if item.my_id == "item_fairy":
			return item.icon.get_data()

# Add fairy icon to applicable shop items
func set_shop_item(p_item_data:ItemParentData, p_wave_value:int = RunData.current_wave)->void :
	activate()
	item_data = p_item_data
	_item_description.set_item(p_item_data)
	wave_value = p_wave_value
	value = ItemService.get_value(wave_value, p_item_data.value, true, p_item_data is WeaponData, p_item_data.my_id)
	
	var icon = ItemService.material_icon.get_data()
	var texture = ImageTexture.new()
	var color = Utils.GOLD_COLOR
	
	if RunData.effects["hp_shop"]:
		value = ceil(value / 20.0) as int
		icon = ItemService.get_stat_icon("stat_max_hp").get_data()
		icon.resize(64, 64)
		color = Color.white
	
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
			color = Color.white
	### Replace material icon with king for shop items that king is affected by
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
			color = Color.white	
	# Replace material icon with fairy for shop items that fairy is affected by
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
			color = Color.white
	###
	
	texture.create_from_image(icon)
	_button.set_icon(texture, color)
	_button.set_value(value)
	
	if not locked:
		var stylebox_color = _panel.get_stylebox("panel").duplicate()
		ItemService.change_panel_stylebox_from_tier(stylebox_color, p_item_data.tier)
		_panel.add_stylebox_override("panel", stylebox_color)
