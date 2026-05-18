class_name NewPufferfish
extends Enemy


export (Resource) var pop_single_sound
onready var _death_shoot_projectiles_behavior = $DeathShootProjectilesBehavior

var shoot_projs_on_death = true


func _ready() -> void :
	_death_shoot_projectiles_behavior.init(self)
	_all_attack_behaviors.push_back(_death_shoot_projectiles_behavior)

func respawn() -> void :
	.respawn()
	shoot_projs_on_death = true


func _on_Hurtbox_area_entered(hitbox: Area2D) -> void :

	if hitbox.from != null and is_instance_valid(hitbox.from):
		if hitbox.from is RangedWeapon:
			shoot_projs_on_death = true
		elif hitbox.from is MeleeWeapon:
			shoot_projs_on_death = false
		elif hitbox.from is Pet:
			shoot_projs_on_death = hitbox.from.shoot_projectiles

	._on_Hurtbox_area_entered(hitbox)


func die(args: = Entity.DieArgs.new()) -> void :
	if Utils.get_scene_node()._wave_timer.time_left > 0.5:
		cleaning_up = args.cleaning_up
		if not cleaning_up:
			SoundManager2D.play(pop_single_sound, global_position, 5, 0.3, true)
			set_attack_behavior_damage(_death_shoot_projectiles_behavior)
			
			if shoot_projs_on_death:
				_death_shoot_projectiles_behavior.number_projectiles = 8
			else:
				_death_shoot_projectiles_behavior.number_projectiles = 4
			
			_death_shoot_projectiles_behavior.shoot()
	.die(args)
