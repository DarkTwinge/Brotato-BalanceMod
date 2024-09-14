class_name FairyCounterEffect
extends Effect

export (String) var counter = ""

func apply(player_index: int)->void :
	pass


func unapply(player_index: int)->void :
	pass


func get_args(player_index: int)->Array:
	var unique_tier1_items = [ ]
	for item in RunData.items:
		if item.tier == Tier.COMMON:
			if not unique_tier1_items.has(item.my_id):
				unique_tier1_items.push_back(item.my_id)
	
	counter = str(value - (unique_tier1_items.size() % value))
	return [str(counter), tr(text_key.to_upper())]
