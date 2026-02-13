extends "res://singletons/item_service.gd"

# New restricted item changes
func _ready() -> void :
	._ready()
	item_groups["stand_still"] = ["item_barricade", "item_chameleon", "item_statue", "item_coral"]
	item_groups["range_and_attack_speed"] = ["item_banner", "item_gummy_berserker"]
	item_groups["attack_speed"] = ["item_crystal", "item_coffee", "item_community_support", "item_retromations_hoodie", "item_statue"]
	item_groups["dodge"].erase("item_chameleon")
	item_groups["lifesteal_and_hp_regeneration"].push_back("item_doc_moth")


# Replace original weapon-set-favoring pool with a weighted pool based on how many of the weapon you have
# Adjusts shop weapon pick odds based on number of weapon types held
func _get_rand_item_for_wave(wave: int, player_index: int, type: int, args: GetRandItemForWaveArgs) -> ItemParentData:
	var player_character = RunData.get_player_character(player_index)
	var rand_wanted = randf()
	var item_tier = get_tier_from_wave(wave, player_index, args.increase_tier)

	if args.fixed_tier != - 1:
		item_tier = args.fixed_tier

	if type == TierData.WEAPONS:
		var min_weapon_tier = RunData.get_player_effect(Keys.min_weapon_tier_hash, player_index)
		var max_weapon_tier = RunData.get_player_effect(Keys.max_weapon_tier_hash, player_index)
		item_tier = clamp(item_tier, min_weapon_tier, max_weapon_tier)

	var banned_items = RunData.players_data[player_index].banned_items
	var pool = get_pool(item_tier, type)
	var backup_pool = get_pool(item_tier, type)
	var items_to_remove = []
	###
	var is_a_set_pick = false
	var held_weapons = RunData.get_player_weapons(player_index)
	##

	if banned_items.size() > 0:
		for item_id in banned_items:
			if item_id is String:
				var item_id_hash = Keys.generate_hash(item_id)
				pool = remove_element_by_id(pool, item_id_hash)
				backup_pool = remove_element_by_id(backup_pool, item_id_hash)
			else:
				pool = remove_element_by_id(pool, item_id)
				backup_pool = remove_element_by_id(backup_pool, item_id)

	
	for shop_item in args.excluded_items:
		pool = remove_element_by_id_with_item(pool, shop_item[0])
		backup_pool = remove_element_by_id_with_item(pool, shop_item[0])

	if type == TierData.WEAPONS:
		var bonus_chance_same_weapon_set = max(0, (MAX_WAVE_ONE_WEAPON_GUARANTEED + 1 - RunData.current_wave) * (BONUS_CHANCE_SAME_WEAPON_SET / MAX_WAVE_ONE_WEAPON_GUARANTEED))
		var chance_same_weapon_set = CHANCE_SAME_WEAPON_SET + bonus_chance_same_weapon_set
		var bonus_chance_same_weapon = max(0, (MAX_WAVE_ONE_WEAPON_GUARANTEED + 1 - RunData.current_wave) * (BONUS_CHANCE_SAME_WEAPON / MAX_WAVE_ONE_WEAPON_GUARANTEED))
		var chance_same_weapon = CHANCE_SAME_WEAPON + bonus_chance_same_weapon

		var no_melee_weapons: bool = RunData.get_player_effect_bool(Keys.no_melee_weapons_hash, player_index)
		var no_ranged_weapons: bool = RunData.get_player_effect_bool(Keys.no_ranged_weapons_hash, player_index)
		var no_duplicate_weapons: bool = RunData.get_player_effect_bool(Keys.no_duplicate_weapons_hash, player_index)
		var no_structures: bool = RunData.get_player_effect(Keys.remove_shop_items_hash, player_index).has(Keys.structure_hash)

		var player_sets: Array = RunData.get_player_sets(player_index)
		var unique_weapon_ids: Dictionary = RunData.get_unique_weapon_ids(player_index)

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
		elif unique_weapon_ids.size() >= 5:       # 26%
			new_chance_same_weapon += 0.06
			chance_same_weapon_set += 0.06

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
				backup_pool = remove_element_by_id_with_item(backup_pool, item)
				items_to_remove.push_back(item)
				continue

			if no_ranged_weapons and item.type == WeaponType.RANGED:
				backup_pool = remove_element_by_id_with_item(backup_pool, item)
				items_to_remove.push_back(item)
				continue

			if no_duplicate_weapons:
				for weapon in unique_weapon_ids.values():
					
					if item.weapon_id_hash == weapon.weapon_id_hash and item.tier < weapon.tier:
						backup_pool = remove_element_by_id_with_item(backup_pool, item)
						items_to_remove.push_back(item)
						break

					elif item.my_id_hash == weapon.my_id_hash and weapon.upgrades_into == null:
						backup_pool = remove_element_by_id_with_item(backup_pool, item)
						items_to_remove.push_back(item)
						break

			if no_structures and EntityService.is_weapon_spawning_structure(item):
				backup_pool = remove_element_by_id_with_item(backup_pool, item)
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
					if set.my_id_hash in player_sets:
						remove = false
				if remove:
					items_to_remove.push_back(item)
					continue

	elif type == TierData.ITEMS:
		var wanted_item_tag_chance = CHANCE_WANTED_ITEM_TAG
		if RunData.get_player_effects(player_index).has(Keys.stat_boosted_wanted_item_tag_hash) and RunData.get_player_effect_bool(Keys.stat_boosted_wanted_item_tag_hash, player_index):
			wanted_item_tag_chance = BOOSTED_WANTED_ITEM_TAG
		if Utils.get_chance_success(wanted_item_tag_chance) and player_character.wanted_tags.size() > 0:
			for item in pool:
				var has_wanted_tag = false

				for tag in item.tags:
					if player_character.wanted_tags.has(tag):
						has_wanted_tag = true
						break

				if not has_wanted_tag:
					items_to_remove.push_back(item)

		if args.forced_shop_tag != null:
			for item in pool:
				if not items_to_remove.has(item) and not item.tags.has(args.forced_shop_tag):
					items_to_remove.push_back(item)


		var remove_item_tags: Array = RunData.get_player_effect(Keys.remove_shop_items_hash, player_index)
		for tag_to_remove in remove_item_tags:
			for item in pool:
				if Keys.hash_to_string[tag_to_remove] in item.tags:
					items_to_remove.append(item)

		if RunData.current_wave < RunData.nb_of_waves:
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
		else:
			
			for item in pool:
				if banned_items_for_endless.has(item.my_id_hash):
					items_to_remove.append(item)


	var limited_items = get_limited_items(args.owned_and_shop_items)

	for key in limited_items:
		if limited_items[key][1] >= limited_items[key][0].max_nb:
			backup_pool = remove_element_by_id_with_item(backup_pool, limited_items[key][0])
			items_to_remove.push_back(limited_items[key][0])

	for item in items_to_remove:
		pool = remove_element_by_id_with_item(pool, item)

	### Replace original pool of only-set items with new weighted pool
	if is_a_set_pick == true:

		# Gathers all sets from all weapons
		var all_sets_from_weapons = []
		for weapon in held_weapons:
			for set in weapon.sets:
				all_sets_from_weapons.push_back(set)

		var newpool = []
#		var newpool_queue = []
		for set in all_sets_from_weapons:
			for weapon in pool:
#				print("weapon sets:")
#				print(set.my_id)
#				print(weapon.sets[0].my_id)
#				if weapon.sets.size() > 1:
#					print(weapon.sets[1].my_id)
#				print(weapon.sets)
#				print(set)
				if weapon.sets.has(set):
					newpool.push_back(weapon)
##					if newpool_queue.has(
##					newpool_queue.push_back(weapon)
##			newpool.push_back(newpool_queue)
##			newpool_queue = []

		
#		var wepstring = ""
#		print("pools:")
#		for wep in pool:
#			wepstring = wepstring + ", " + wep.my_id
#		print(wepstring)
#		wepstring = ""
#		for wep in newpool:
#			wepstring = wepstring + ", " + wep.my_id
#		print(wepstring)
		
		pool = newpool
	##

	var elt

	if pool.size() == 0:
		if backup_pool.size() > 0:
			elt = Utils.get_rand_element(backup_pool)
		else:
			elt = Utils.get_rand_element(_tiers_data[item_tier][type])
	else:
		elt = Utils.get_rand_element(pool)
		if elt.my_id_hash == Keys.item_axolotl_hash and randf() < 0.5:
			elt = Utils.get_rand_element(pool)

	if DebugService.force_item_in_shop != "" and randf() < 0.5:
		elt = get_element(items, Keys.generate_hash(DebugService.force_item_in_shop))
		if elt == null:
			elt = get_element(weapons, Keys.generate_hash(DebugService.force_item_in_shop))

	if elt.my_id_hash == Keys.item_axolotl_hash and elt.effects.size() > 0 and Keys.stats_swapped_hash in elt.effects[0]:
		elt.effects[0][Keys.stats_swapped_hash] = []
		
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
func get_stat_description_text(stat_hash: int, value: int, player_index: int) -> String:
	var stat_name = Keys.hash_to_string[stat_hash].to_upper()
	var stat_sign = "POS_" if value >= 0 else "NEG_"
	var key = "INFO_" + stat_sign + stat_name
	
	if stat_hash == Keys.stat_armor_hash:
		### Now shows one decimal place; also extra clarification text
		key = "NEW_" + key
		print(RunData.get_armor_coef(value))
		# Extra decimal place if Armor is over 80% reduction
		if RunData.get_armor_coef(value) <= 0.2:
			return Text.text(key, [str(abs(stepify((1.0 - RunData.get_armor_coef(value)) * 100.0, 0.01)))])
		else:
			return Text.text(key, [str(abs(stepify((1.0 - RunData.get_armor_coef(value)) * 100.0, 0.1)))])
		#return Text.text(key, [str(abs(round((1.0 - RunData.get_armor_coef(value)) * 100.0)))])
		##
	elif stat_hash == Keys.stat_harvesting_hash:
		if value >= 0: key += "_LIMITED"
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect(Keys.harvesting_growth_hash, player_index)), str(RunData.nb_of_waves), str(RunData.ENDLESS_HARVESTING_DECREASE)])
	elif stat_hash == Keys.stat_lifesteal_hash:
		### Clarity text change
		key = "NEW_" + key
		##
		return Text.text(key, [str(abs(value)), "10"])
	elif stat_hash == Keys.stat_hp_regeneration_hash:
		### Clarity text change
		key = "NEW_" + key
		##
		var val = RunData.get_hp_regeneration_timer(value)
		var amount = 1
		var amount_per_sec = 1 / val
		return Text.text(key, [str(amount), str(stepify(val, 0.01)), str(stepify(amount_per_sec, 0.01))])
	elif stat_hash == Keys.stat_dodge_hash:
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect(Keys.dodge_cap_hash, player_index)) + "%"])
	elif stat_hash == Keys.stat_crit_chance_hash:
		return Text.text(key, [str(abs(value)), str(RunData.get_player_effect(Keys.crit_chance_cap_hash, player_index)) + "%"])
	elif stat_hash == Keys.stat_curse_hash:
		var chance = 0.0
		for dlc_data in ProgressData.available_dlcs:
			if "max_curse_item_chance" in dlc_data:
				chance = dlc_data.max_curse_item_chance
				break
		var enemy_curse_chance = stepify(abs(Utils.get_curse_factor(value) / 2.0), 0.1)
		var item_curse_chance = stepify(abs(Utils.get_curse_factor(value, chance * 100.0)), 0.1)
		###
#		print(value)
#		print(chance)
#		print(enemy_curse_chance)
#		print(item_curse_chance)	
		##

		return Text.text(key, [str(enemy_curse_chance), str(item_curse_chance)])
	### Changed text for better clarity
	elif stat_hash == Keys.stat_range_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_attack_speed_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_melee_damage_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_ranged_damage_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_elemental_damage_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_percent_damage_hash:
		key = "NEW_" + key
	elif stat_hash == Keys.stat_luck_hash:
		key = "NEW_" + key
	##
	
	return Text.text(key, [str(abs(value))])

# Fix King's smiley-face indicator for tier-4 weapons
func get_icon_for_duplicate_shop_item(character: CharacterData, player_items: Array, player_weapons: Array, shop_item: ItemParentData, player_index: int) -> Texture:
	var orig_result = .get_icon_for_duplicate_shop_item(character, player_items, player_weapons, shop_item, player_index)
	
	# Original loop, run again to re-check
	var same_tier_copies = 0
	if shop_item is WeaponData:
		for weapon in player_weapons:
			if weapon.weapon_id_hash == shop_item.weapon_id_hash:
				same_tier_copies += 1
	var already_has_it = same_tier_copies > 0
	
	if character.my_id_hash == Keys.character_king_hash and (shop_item is WeaponData and already_has_it) and shop_item.tier == Tier.LEGENDARY:
		return null
	else:
		return orig_result
	
	
