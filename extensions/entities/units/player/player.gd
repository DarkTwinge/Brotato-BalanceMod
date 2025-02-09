extends "res://entities/units/player/player.gd"

# Tardigrades now ignore single-damage hits
func get_damage_value(dmg_value:int, _from_player_index:int, armor_applied: = true, dodgeable: = true, _is_crit: = false, _hitbox:Hitbox = null, _is_burning: = false)->Unit.GetDamageValueResult:
	var result: = Unit.GetDamageValueResult.new()
	if dodgeable and randf() < min(current_stats.dodge, RunData.get_player_effect("dodge_cap", player_index) / 100.0):
		result.value = 0
		result.dodged = true
	###	Adds a check for damage to be at least 2 to activate Tardigrade
	elif _hit_protection > 0 and dmg_value >= 2:
	##
		result.value = 0
		result.protected = true
		_hit_protection -= 1
	else :
		var armor_coef = RunData.get_armor_coef(current_stats.armor)
		result.value = max(1, round(dmg_value * armor_coef)) as int if armor_applied else dmg_value
	return result


# Increase volume of Brick breaking
func on_weapon_wanted_to_break(weapon:Weapon, gold_dropped:int)->void :

	if not current_weapons.has(weapon):
		return 

	emit_signal("wanted_to_spawn_gold", gold_dropped, weapon.global_position, 300)
	var _r = RunData.remove_weapon_by_index(weapon.weapon_pos, player_index)

	current_weapons.erase(weapon)

	for current_weapon in current_weapons:
		if current_weapon.weapon_pos > weapon.weapon_pos:
			current_weapon.weapon_pos -= 1
	
	# -15 -> -10
	SoundManager.play(Utils.get_rand_element(WeaponService.breaking_sounds), - 10, 0.1, true)

	weapon.queue_free()
	

# New Druid effect for only poisoned fruits
func on_consumable_picked_up(consumable_data:ConsumableData)->void :
	.on_consumable_picked_up(consumable_data)

	if consumable_data.my_id == "consumable_poisoned_fruit":
		var stats_on_fruit_effects = RunData.get_player_effect("bm_stats_on_poison_fruit", player_index)
		for stats_on_fruit_effect in stats_on_fruit_effects:
			var stat_name = stats_on_fruit_effect[0]
			var stat_value = stats_on_fruit_effect[1]
			var effect_chance = stats_on_fruit_effect[2]
			if Utils.get_chance_success(effect_chance / 100.0):
				RunData.add_stat(stat_name, stat_value, player_index)
				RunData.add_tracked_value(player_index, "character_druid", stat_value)

	RunData.emit_stats_updated()
