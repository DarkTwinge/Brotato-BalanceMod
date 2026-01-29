extends "res://weapons/weapon.gd"

func on_weapon_hit_something(_thing_hit: Node, damage_dealt: int, hitbox: Hitbox) -> void :
	RunData.add_weapon_dmg_dealt(weapon_pos, damage_dealt, _parent.player_index)
	if hitbox == null:
		return
	var attack_id: = hitbox.player_attack_id
	if attack_id < 0:
		
		return
	var attack_hit_count = _hit_count_by_attack_id.get(attack_id, 0)
	attack_hit_count += 1
	_hit_count_by_attack_id[attack_id] = attack_hit_count
	
	if current_stats is MeleeWeaponStats:
		ChallengeService.try_complete_challenge(ChallengeService.chal_unstoppable_force_hash, attack_hit_count)
	
	var remove_until_attack_id: = attack_id - MAX_ATTACK_COUNT_HISTORY + 1
	for old_attack_id in range(_oldest_attack_id, remove_until_attack_id):
		var _erased = _hit_count_by_attack_id.erase(old_attack_id)
		_erased = _kill_count_by_attack_id.erase(old_attack_id)
	_oldest_attack_id = remove_until_attack_id
	assert (_hit_count_by_attack_id.size() <= MAX_ATTACK_COUNT_HISTORY)
	assert (_kill_count_by_attack_id.size() <= MAX_ATTACK_COUNT_HISTORY)
	
	### Skip Brick-check if it is Wave 1
	if RunData.current_wave != 1:
	##
		for effect in effects:
			if effect.key_hash == Keys.break_on_hit_hash:
				if Utils.get_chance_success(effect.value / 100.0):
					emit_signal("wanted_to_break", self, effect.value2)