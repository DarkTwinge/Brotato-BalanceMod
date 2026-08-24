extends "res://entities/units/pet/bonk_dog/bonk_dog.gd"

func shoot() -> void :
	.shoot()


# Replace: remove Seapig targeting for dash
func jump() -> void :
	if dead or _animation_player.current_animation == "pet_the_dog":
		return
	
	var enemies_list = _entity_spawner_ref.get_all_enemies(false)
	var max_life: = - 1
	var target_enemy = null
	for enemy in enemies_list:
		if global_position.distance_squared_to(enemy.global_position) > min_squared_distance_for_jump_attack:
			if enemy.max_stats.health > max_life:
				### Don't target Seapigs
				if enemy.enemy_id != "sea_pig":
				##
					max_life = enemy.max_stats.health
					target_enemy = enemy

	if target_enemy == null:
		_current_ultime_cooldown = _explosion_effect.stats.cooldown * 0.4
		return

	_is_jumping = true
	_move_locked = true
	_animation_player.play("attack")
	SoundService.play_sound2d_with_limit("bonk_dog_attack", sound_attack.pick_random(), 1, global_position)

	
	_tween.interpolate_property(self, "global_position", global_position, target_enemy.global_position, charge_duration, 5)
	_tween.interpolate_callback(self, charge_duration, "jump_landing")
	_tween.start()
