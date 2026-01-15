extends "res://ui/menus/shop/item_description.gd"

### Now Obsolete, added to vanilla 
func set_item(item_data:ItemParentData, player_index:int, item_count: = 1)->void :
	.set_item(item_data, player_index, item_count)

	if _category.text == tr("ITEM"):
		for tag in item_data.tags:
			if tag == "structure":
				if item_data.my_id != "item_clockwork_wasp":
					_category.text = tr("BM_ITEM_STRUCTURE")
	elif _category.text == tr("UNIQUE"):
		for tag in item_data.tags:
			if tag == "structure":
				if item_data.my_id != "item_improved_tools":
					_category.text = tr("BM_UNIQUE_STRUCTURE")