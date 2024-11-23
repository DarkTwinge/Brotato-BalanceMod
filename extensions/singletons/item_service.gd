extends "res://singletons/item_service.gd"

# Replace original weapon-set-favoring pool with a weighted pool based on how many of the weapon you have
# Adjusts shop weapon pick odds based on number of weapon types held
func _get_rand_item_for_wave(wave:int, player_index:int, type:int, args:GetRandItemForWaveArgs)->ItemParentData:
	var player_character = RunData.get_player_character(player_index)
	var rand_wanted = randf()
	var item_tier = get_tier_from_wave(wave, player_index, args.increase_tier)

	if args.fixed_tier != - 1:
		item_tier = args.fixed_tier

	if type == TierData.WEAPONS:
		var min_weapon_tier = RunData.get_player_effect("min_weapon_tier", player_index)
		var max_weapon_tier = RunData.get_player_effect("max_weapon_tier", player_index)
		item_tier = clamp(item_tier, min_weapon_tier, max_weapon_tier)

	var pool = get_pool(item_tier, type)
	var backup_pool = get_pool(item_tier, type)
	var items_to_remove = []
	###
	var is_a_set_pick = false
	var held_weapons = RunData.get_player_weapons(player_index)
	##
	
	for shop_item in args.excluded_items:
		pool = remove_element_by_id(pool, shop_item[0])
		backup_pool = remove_element_by_id(pool, shop_item[0])

	if type == TierData.WEAPONS:
		var bonus_chance_same_weapon_set = max(0, (MAX_WAVE_ONE_WEAPON_GUARANTEED + 1 - RunData.current_wave) * (BONUS_CHANCE_SAME_WEAPON_SET / MAX_WAVE_ONE_WEAPON_GUARANTEED))
		var chance_same_weapon_set = CHANCE_SAME_WEAPON_SET + bonus_chance_same_weapon_set
		var bonus_chance_same_weapon = max(0, (MAX_WAVE_ONE_WEAPON_GUARANTEED + 1 - RunData.current_wave) * (BONUS_CHANCE_SAME_WEAPON / MAX_WAVE_ONE_WEAPON_GUARANTEED))
		var chance_same_weapon = CHANCE_SAME_WEAPON + bonus_chance_same_weapon

		var no_melee_weapons:bool = RunData.get_player_effect_bool("no_melee_weapons", player_index)
		var no_ranged_weapons:bool = RunData.get_player_effect_bool("no_ranged_weapons", player_index)
		var no_duplicate_weapons:bool = RunData.get_player_effect_bool("no_duplicate_weapons", player_index)
		var no_structures:bool = RunData.get_player_effect("remove_shop_items", player_index).has("structure")

		var player_sets:Array = RunData.get_player_sets(player_index)
		var unique_weapon_ids:Dictionary = RunData.get_unique_weapon_ids(player_index)

		### Adjusts shop weapon pick odds based on number of weapon types held
		### Gets a same-set weapon if no exact-match is available
		var new_chance_same_weapon = chance_same_weapon
		# Changes same-weapon chance based on weapon types; increase set bonus equally because they are a stacked check
		if unique_weapon_ids.size() <= 1:         # 19%
			new_chance_same_weapon -= 0.01
			chance_same_weapon_set -= 0.01
		# 2 is vanilla behavior
		#elif unique_weapon_ids.size() == 2:      # 20%
		elif unique_weapon_ids.size() == 3:       # 22%
			new_chance_same_weapon += 0.02
			chance_same_weapon_set += 0.02
		elif unique_weapon_ids.size() == 4:       # 24%
			new_chance_same_weapon += 0.04
			chance_same_weapon_set += 0.04
		elif unique_weapon_ids.size() >= 5:       # 25%
			new_chance_same_weapon += 0.05
			chance_same_weapon_set += 0.05

		# Verifies there are matching weapons available in the pool (there might not be due to tier restrictions)...
		if rand_wanted < new_chance_same_weapon:
			var nb_potential_same_weapons = 0
			for weapon in held_weapons:
				for item in pool:
					if item.weapon_id == weapon.weapon_id:
						nb_potential_same_weapons += 1
			# ...When there's none, look for a same-set weapon instead
			if nb_potential_same_weapons == 0:
				rand_wanted = 0.3
		##

		for item in pool:
			if no_melee_weapons and item.type == WeaponType.MELEE:
				backup_pool = remove_element_by_id(backup_pool, item)
				items_to_remove.push_back(item)
				continue

			if no_ranged_weapons and item.type == WeaponType.RANGED:
				backup_pool = remove_element_by_id(backup_pool, item)
				items_to_remove.push_back(item)
				continue

			if no_duplicate_weapons:
				for weapon in unique_weapon_ids.values():
					
					if item.weapon_id == weapon.weapon_id and item.tier < weapon.tier:
						backup_pool = remove_element_by_id(backup_pool, item)
						items_to_remove.push_back(item)
						break

					elif item.my_id == weapon.my_id and weapon.upgrades_into == null:
						backup_pool = remove_element_by_id(backup_pool, item)
						items_to_remove.push_back(item)
						break

			if no_structures and EntityService.is_weapon_spawning_structure(item):
				backup_pool = remove_element_by_id(backup_pool, item)
				items_to_remove.append(item)

			###
			#if rand_wanted < chance_same_weapon:
			if rand_wanted < new_chance_same_weapon:
			##
				if not item.weapon_id in unique_weapon_ids:
					items_to_remove.push_back(item)
					continue

			
			elif rand_wanted < chance_same_weapon_set:
				### Normal set logic will be skipped with a weighted pool generated below
				is_a_set_pick = true
				##
				var remove: = true
				for set in item.sets:
					if set.my_id in player_sets:
						remove = false
				if remove:
					items_to_remove.push_back(item)
					continue

	elif type == TierData.ITEMS:
		if Utils.get_chance_success(CHANCE_WANTED_ITEM_TAG) and player_character.wanted_tags.size() > 0:
			for item in pool:
				var has_wanted_tag = false

				for tag in item.tags:
					if player_character.wanted_tags.has(tag):
						has_wanted_tag = true
						break

				if not has_wanted_tag:
					items_to_remove.push_back(item)

		var remove_item_tags:Array = RunData.get_player_effect("remove_shop_items", player_index)
		for tag_to_remove in remove_item_tags:
			for item in pool:
				if tag_to_remove in item.tags:
					items_to_remove.append(item)

		if player_character.banned_item_groups.size() > 0:
			for banned_item_group in player_character.banned_item_groups:

				if not banned_item_group in item_groups:
					print(str(banned_item_group) + " does not exist in ItemService.item_groups")
					continue

				for item in pool:
					if item_groups[banned_item_group].has(item.my_id):
						items_to_remove.append(item)

		if player_character.banned_items.size() > 0:
			for item in pool:
				if player_character.banned_items.has(item.my_id):
					items_to_remove.append(item)

	var limited_items = get_limited_items(args.owned_and_shop_items)

	for key in limited_items:
		if limited_items[key][1] >= limited_items[key][0].max_nb:
			backup_pool = remove_element_by_id(backup_pool, limited_items[key][0])
			items_to_remove.push_back(limited_items[key][0])

	for item in items_to_remove:
		pool = remove_element_by_id(pool, item)

	### Replace original pool of only-set items with new weighted pool
#	if is_a_set_pick == true:
#
#		# Gathers all sets from all weapons
#		print("all sets:")
#		var all_sets_from_weapons = []
#		for weapon in held_weapons:
#			for set in weapon.sets:
#				all_sets_from_weapons.push_back(set)
#				print(set.my_id)
#
#		var newpool = []
#		for set in all_sets_from_weapons:
#			for weapon in pool:
#				print("weapon sets:")
#				print(set.my_id)
#				print(weapon.sets[0].my_id)
#				if weapon.sets.size() > 1:
#					print(weapon.sets[1].my_id)
#				print(weapon.sets)
#				print(set)
#				if weapon.sets.has(set):
#					newpool.push_back(weapon)
#					print("yeah")
#
#		print("pools:")
#		print(pool)
#		print(newpool)
#		pool = newpool
	##

	var elt

	if pool.size() == 0:
		if backup_pool.size() > 0:
			elt = Utils.get_rand_element(backup_pool)
		else :
			elt = Utils.get_rand_element(_tiers_data[item_tier][type])
	else :
		elt = Utils.get_rand_element(pool)
		if elt.my_id == "item_axolotl" and randf() < 0.5:
			elt = Utils.get_rand_element(pool)

	if DebugService.force_item_in_shop != "" and randf() < 0.5:
		elt = get_element(items, DebugService.force_item_in_shop)
	
	if elt.my_id == "item_axolotl" and elt.effects.size() > 0 and "stats_swapped" in elt.effects[0]:
		elt.effects[0].stats_swapped = []
		
	return apply_item_effect_modifications(elt, player_index)


# Partially reverts reroll price change [Now in vanilla]
#func get_reroll_price(wave:int, reroll_count:int, player_index:int)->Array:
#	# Original: 0.5; 1.1.6: 0.33; 1.1.7: 0.4
#	var delta: = int(max(1.0, (0.4 * wave * pow(1.0 + RunData.get_endless_factor(wave), 0.5))))
#	# Original: 'wave'; 1.1.6: 'wave / 2'; 1.1.7: 'wave * 0.75'
#	var normal_price: = wave * 0.75 + delta + delta * reroll_count
#	var reroll_price_amount:int = RunData.get_player_effect("reroll_price", player_index)
#	var reroll_price_factor:float = max(0.1, 1.0 + reroll_price_amount / 100.0)
#	var discounted_price: = ceil(normal_price * reroll_price_factor) as int
#	
#	return [discounted_price, normal_price - discounted_price]


# Add a decimal to armor tooltip for more accuracy
func get_stat_description_text(stat_name:String, value:int, player_index:int)->String:
	stat_name = stat_name.to_upper()
	var stat_sign = "POS_" if value >= 0 else "NEG_"
	var key = "INFO_" + stat_sign + stat_name
	
	print(key)
	print(stat_name)
	
	if stat_name == "STAT_ARMOR":
		### Now shows one decimal place; also extra clarification text
		key = "NEW_" + key
		return Text.text(key, [str(abs(stepify((1.0 - RunData.get_armor_coef(value)) * 100.0, 0.1)))])
		#return Text.text(key, [str(abs(round((1.0 - RunData.get_armor_coef(value)) * 100.0)))])
		##
	elif stat_name == "STAT_HARVESTING":
		if value >= 0:key += "_LIMITED"
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect("harvesting_growth", player_index)), str(RunData.nb_of_waves), str(RunData.ENDLESS_HARVESTING_DECREASE)])
	elif stat_name == "STAT_LIFESTEAL":
		### Clarity text change
		key = "NEW_" + key
		##
		return Text.text(key, [str(abs(value)), "10"])
	elif stat_name == "STAT_HP_REGENERATION":
		### Clarity text change
		key = "NEW_" + key
		##
		var val = RunData.get_hp_regeneration_timer(value)
		var amount = 1
		var amount_per_sec = 1 / val
		return Text.text(key, [str(amount), str(stepify(val, 0.01)), str(stepify(amount_per_sec, 0.01))])
	elif stat_name == "STAT_DODGE":
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect("dodge_cap", player_index)) + "%"])
	elif stat_name == "STAT_CRIT_CHANCE":
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect("crit_chance_cap", player_index)) + "%"])
	elif stat_name == "STAT_CURSE":
		var chance = 0.0
		for dlc_data in ProgressData.available_dlcs:
			if "max_curse_item_chance" in dlc_data:
				chance = dlc_data.max_curse_item_chance
				break
		var enemy_curse_chance = stepify(abs(Utils.get_curse_factor(value) / 2.0), 0.1)
		var item_curse_chance = stepify(abs(Utils.get_curse_factor(value, chance * 100.0)), 0.1)

		return Text.text(key, [str(enemy_curse_chance), str(item_curse_chance)])
	### Changed text for better clarity
	elif stat_name == "STAT_RANGE":
		key = "NEW_" + key
	elif stat_name == "STAT_ATTACK_SPEED":
		key = "NEW_" + key
	elif stat_name == "STAT_MELEE_DAMAGE":
		key = "NEW_" + key
	elif stat_name == "STAT_RANGED_DAMAGE":
		key = "NEW_" + key
	elif stat_name == "STAT_ELEMENTAL_DAMAGE":
		key = "NEW_" + key
	elif stat_name == "STAT_PERCENT_DAMAGE":
		key = "NEW_" + key
	elif stat_name == "STAT_LUCK":
		key = "NEW_" + key
	##
	
	print(key)
	
	return Text.text(key, [str(abs(value))])
