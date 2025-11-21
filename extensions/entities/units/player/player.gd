extends "res://entities/units/player/player.gd"

# Tardigrades now ignore single-damage hits
#func get_damage_value(dmg_value:int, _from_player_index:int, armor_applied: = true, dodgeable: = true, _is_crit: = false, _hitbox:Hitbox = null, _is_burning: = false)->Unit.GetDamageValueResult:
#	var result: = Unit.GetDamageValueResult.new()
#	if dodgeable and randf() < min(current_stats.dodge, RunData.get_player_effect("dodge_cap", player_index) / 100.0):
#		result.value = 0
#		result.dodged = true
#	###	Adds a check for damage to be at least 2 to activate Tardigrade
#	elif _hit_protection > 0 and dmg_value >= 2:
#	##
#		result.value = 0
#		result.protected = true
#		_hit_protection -= 1
#	else :
#		var armor_coef = RunData.get_armor_coef(current_stats.armor)
#		result.value = max(1, round(dmg_value * armor_coef)) as int if armor_applied else dmg_value
#	return result

# Tardigrades now ignore anything that bypasses invincibility (i.e. self-damage) -- hopefully compatible with other mods this way
func take_damage(value:int, args:TakeDamageArgs)->Array:
	# Essentially copies the normal take_damage function in full, but uses my get_damage_value function to not remove Tardigrade
	if args.bypass_invincibility:

		if dead:
			return [0, 0, false]

		var hitbox = args.hitbox
		var dodgeable = args.dodgeable
		var bypass_invincibility = args.bypass_invincibility
		var from = args.from

		if hitbox and hitbox.is_healing:
			var _healed = on_healing_effect(value, hitbox.damage_tracking_key)
			return [0, 0, false]
		
		### Uses a modified function to skip the Tardigrade
		var dmg_value_result = get_damage_value_no_tardigrade(value, args.from_player_index, args.armor_applied, dodgeable, false, hitbox, args.is_burning)
		##
		var full_dmg_value = dmg_value_result.value
		var is_dodge = dmg_value_result.dodged
		var is_protected = dmg_value_result.protected

		var dmg_taken = clamp(full_dmg_value, 0, current_stats.health)
		current_stats.health = max(0.0, current_stats.health - full_dmg_value) as int
		emit_signal("health_updated", self, current_stats.health, max_stats.health)

		if dodgeable:
			disable_hurtbox()
			_invincibility_timer.start(get_iframes(dmg_taken))

		var sound = Utils.get_rand_element(hurt_sounds)
		if is_dodge:
			sound = Utils.get_rand_element(dodge_sounds)

			var dmg_on_dodge_effect = RunData.get_player_effect("dmg_on_dodge", player_index)
			if dmg_on_dodge_effect.size() > 0 and hitbox != null and is_instance_valid(hitbox.from):
				var total_dmg_to_deal = 0
				for dmg_on_dodge in dmg_on_dodge_effect:
					if randf() >= dmg_on_dodge[2] / 100.0:
						continue
					var dmg_from_stat = max(1, (dmg_on_dodge[1] / 100.0) * Utils.get_stat(dmg_on_dodge[0], player_index))
					var dmg = WeaponService.apply_damage_bonus(dmg_from_stat, player_index) as int
					total_dmg_to_deal += dmg
				var dodge_damage_args = TakeDamageArgs.new(player_index)
				var dodge_dmg_dealt = hitbox.from.take_damage(total_dmg_to_deal, dodge_damage_args)
				RunData.add_tracked_value(player_index, "item_riposte", dodge_dmg_dealt[1])

			var heal_on_dodge_effect = RunData.get_player_effect("heal_on_dodge", player_index)
			if heal_on_dodge_effect.size() > 0:
				var total_to_heal = 0
				for heal_on_dodge in heal_on_dodge_effect:
					if randf() < heal_on_dodge[2] / 100.0:
						total_to_heal += heal_on_dodge[1]
				var _healed = on_healing_effect(total_to_heal, "item_adrenaline", false)

			var temp_stats_on_dodge_effect = RunData.get_player_effect("temp_stats_on_dodge", player_index)
			for temp_stat_on_hit in temp_stats_on_dodge_effect:
				TempStats.add_stat(temp_stat_on_hit[0], temp_stat_on_hit[1], player_index)

		if dmg_taken > 0:
			flash()
			_attract_nearby_consumables()

			var explode_on_hit_effects = RunData.get_player_effect("explode_on_hit", player_index)
			var explode_when_below_hp_effects = RunData.get_player_effect("explode_when_below_hp", player_index)
			var nb_explosions = explode_on_hit_effects.size() + explode_when_below_hp_effects.size()

			for effect in explode_on_hit_effects:
				explode(_explode_on_hit_stats[effect], effect, nb_explosions)

			for effect in explode_when_below_hp_effects:
				if current_stats.health <= max_stats.health * (effect.hp_threshold / 100.0) and _explode_when_below_hp_triggers[effect] > 0:
					explode(_explode_when_below_hp_stats[effect], effect, nb_explosions)
					_explode_when_below_hp_triggers[effect] -= 1

			var temp_stats_on_hit_effect = RunData.get_player_effect("temp_stats_on_hit", player_index)
			for temp_stat_on_hit in temp_stats_on_hit_effect:
				TempStats.add_stat(temp_stat_on_hit[0], temp_stat_on_hit[1], player_index)

			if _health_regen_timer.is_stopped():
				_health_regen_timer.start()

			for stat in _remove_temp_stats_on_hit:
				var stat_value:int = _remove_temp_stats_on_hit[stat]
				TempStats.remove_stat(stat, stat_value, player_index)
				_remove_temp_stats_on_hit[stat] = 0

			
			var decaying_stats_on_hit_effects = RunData.get_player_effect("decaying_stats_on_hit", player_index)
			for decaying_stats_on_hit_effect in decaying_stats_on_hit_effects:
				var decaying_stat_name = decaying_stats_on_hit_effect[0]
				var decaying_stat_value = decaying_stats_on_hit_effect[1]
				var decaying_stat_duration = decaying_stats_on_hit_effect[2]
				_start_decaying_stats_effect_timer(_decaying_stats_on_hit, decaying_stat_name, decaying_stat_value, decaying_stat_duration)

		SoundManager2D.play(sound, global_position, 0, 0.2, true)

		if current_stats.health <= 0:
			var die_args: = Entity.DieArgs.new()
			die_args.from = from
			die(die_args)

		emit_signal(
			"took_damage", 
			self, 
			full_dmg_value, 
			Vector2.ZERO, 
			false, 
			is_dodge, 
			is_protected, 
			false, 
			args, 
			HitType.NORMAL, 
			false
		)

		return [full_dmg_value, dmg_taken, is_dodge]

	# Run the normal function, which does the same thing but applies Tardigrade if appropriate
	else :
		var normal_result = .take_damage(value, args)
		return normal_result


func get_damage_value_no_tardigrade(dmg_value:int, _from_player_index:int, armor_applied: = true, dodgeable: = true, _is_crit: = false, _hitbox:Hitbox = null, _is_burning: = false)->Unit.GetDamageValueResult:
	var result: = Unit.GetDamageValueResult.new()
	if dodgeable and randf() < current_stats.dodge:
		result.value = 0
		result.dodged = true
	##elif _hit_protection > 0:
	##	result.value = 0
	##	result.protected = true
	##	_hit_protection -= 1
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
	
	# No longer used?
	##RunData.emit_stats_updated()
