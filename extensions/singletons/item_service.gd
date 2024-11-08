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
				print("no weapon matches")
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
		
	return apply_item_effect_modifications(elt, player_index)
