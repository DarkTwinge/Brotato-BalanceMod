extends "res://singletons/run_data.gd"

# Added set bonus for One-armed
func update_sets(player_index:int)->void :
	var player_data = players_data[player_index]
	var active_set_effects = player_data.active_set_effects
	var active_sets = player_data.active_sets

	for effect in active_set_effects:
		effect[1].unapply(player_index)

	active_sets.clear()
	active_set_effects.clear()

	var weapons: = get_player_weapons(player_index)
	for weapon in weapons:
		for set in weapon.sets:
			if get_player_effect_bool("all_weapons_count_for_sets", player_index):
				active_sets[set.my_id] = weapons.size()
			elif active_sets.has(set.my_id):
				active_sets[set.my_id] += 1
			else :
				active_sets[set.my_id] = 1
				### Treats One-armed as having a 4-set Bonus, except for Legendary weapons
				var current_character = get_player_character(player_index)
				if current_character.my_id == "character_one_arm" and not set.my_id == "set_legendary":
					active_sets[set.my_id] = 4	
				##				

	for key in active_sets:
		if active_sets[key] >= 2:
			var set = ItemService.get_set(key)
			var set_effects = set.set_bonuses[min(active_sets[key] - 2, set.set_bonuses.size() - 1)]

			for effect in set_effects:
				effect.apply(player_index)
				active_set_effects.push_back([key, effect])


# Changes effect of King's abilities to be unique weapons
func update_tier_iv_weapon_bonuses(player_index:int)->void :
	var effects: = get_player_effects(player_index)
	var tier_iv_weapon_effects = players_data[player_index].tier_iv_weapon_effects

	for effect in tier_iv_weapon_effects:
		effects[effect[0]] -= effect[1]

	tier_iv_weapon_effects.clear()

	var weapons: = get_player_weapons(player_index)
	###
	var unique_tier4_weapon_ids = []
	##
	for weapon in weapons:
		if weapon.tier >= Tier.LEGENDARY:
			### Keep track of duplicate weapons
			if not unique_tier4_weapon_ids.has(weapon.weapon_id):
				unique_tier4_weapon_ids.push_back(weapon.weapon_id)
			##
				for effect in effects["tier_iv_weapon_effects"]:
					effects[effect[0]] += effect[1]
					tier_iv_weapon_effects.push_back([effect[0], effect[1]])

				

# Slightly reduce the effect of armor
func get_armor_coef(armor:int)->float:
	var percent_dmg_taken = 10.0 / (10.0 + (abs(armor) / 1.6)) # Was 1.5

	if armor < 0:
		percent_dmg_taken = (1.0 - percent_dmg_taken) + 1.0
	
	return percent_dmg_taken


# Makes Glutton, Spicy Sauce, and Rip and Tear all use the crit stat
func handle_explode_effect(key:String, position:Vector2, player_index:int)->void :
	var effects: = get_player_effects(player_index)

	var explosion_chance: = 0.0
	for explosion in effects[key]:
		explosion_chance += explosion.chance
	if not Utils.get_chance_success(explosion_chance):
		return 

	var dmg = 0
	###
	var crit_chance = 0
	##
	var exploding_effect = ExplodingEffect.new()
	for explosion in effects[key]:
		var args: = WeaponServiceInitStatsArgs.new()
		args.effects = [exploding_effect]
		var explosion_stats = WeaponService.init_base_stats(explosion.stats, player_index, args)
		dmg += explosion_stats.damage
		### Take the highest calculated crit chance from all the separate explosion sources
		crit_chance = max(crit_chance, explosion_stats.crit_chance)
		##

	var first_effect = effects[key][0]
	var first_stats = first_effect.stats

	if first_effect is ItemExplodingAndBurnEffect:
		first_stats.burning_data = first_effect.burning_data

	
	position = Utils.get_random_offset_position(position, 10)

	var args: = WeaponServiceExplodeArgs.new()
	args.pos = position
	args.damage = dmg
	args.accuracy = first_stats.accuracy
	### Use the newly calculated crit chance
	args.crit_chance = crit_chance
	#args.crit_chance = first_stats.crit_chance
	##
	args.crit_damage = first_stats.crit_damage
	args.burning_data = first_stats.burning_data
	args.damage_tracking_key = first_effect.tracking_key
	args.from_player_index = player_index
	var _inst = WeaponService.explode(first_effect, args)


# Gives an extra starting Sausage for Gun Mage
func add_starting_items_and_weapons()->void :
	.add_starting_items_and_weapons()

	for player_index in players_data.size():
		var effects: = get_player_effects(player_index)
		if effects["starting_item"].size() > 0:
			for item_id in effects["starting_item"]:
				for i in item_id[1]:
					var item = ItemService.get_element(ItemService.items, item_id[0])
					### If adding a starting Sausage, add a 2nd if the starting weapon is an SMG or Shotgun
					if item_id[0] == "item_scared_sausage":
						var weapons = RunData.get_player_weapons(player_index)
						if weapons[0].my_id == "weapon_double_barrel_shotgun_1" or weapons[0].my_id == "weapon_smg_1":
							add_item(item, player_index)
					##


# Fixes tooltip for Fairy
func get_scaling_bonus(value:int, stat_scaled:String, nb_stat_scaled:int, perm_stats_only:bool, player_index:int)->int:
	var orig_value = .get_scaling_bonus(value, stat_scaled, nb_stat_scaled, perm_stats_only, player_index)
	var actual_nb_scaled: = 0.0
	# Changes how the rounding happens for Fairy's tooltip
	if stat_scaled == "common_item":
		actual_nb_scaled = get_nb_different_items_of_tier(Tier.COMMON, player_index)
		return int(value * floor((actual_nb_scaled / nb_stat_scaled)))
	# For anything other than Tier-1 Items, use original rounding
	else:
		return orig_value



# Debug stuff
#func reset(restart:bool = false)->void :
#	.reset(restart)
#	current_wave = 16
#	invulnerable = true
#	temp = load("res://weapons/ranged/double_barrel_shotgun/4/double_barrel_shotgun_4_data.tres")
#	players_data[0].weapons.push_back(temp)
