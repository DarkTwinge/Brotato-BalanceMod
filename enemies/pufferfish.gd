class_name NewPufferfish
extends Enemy


onready var _death_shoot_projectiles_behavior = $DeathShootProjectilesBehavior

var shoot_projs_on_death = true


func _ready()->void :
	_death_shoot_projectiles_behavior.init(self)
	_all_attack_behaviors.push_back(_death_shoot_projectiles_behavior)

func respawn()->void :
	.respawn()
	shoot_projs_on_death = true
	

func _on_Hurtbox_area_entered(hitbox:Area2D)->void :

	if hitbox.from != null and is_instance_valid(hitbox.from):
		if hitbox.from is RangedWeapon:
			shoot_projs_on_death = true
		elif hitbox.from is MeleeWeapon:
			shoot_projs_on_death = false

	._on_Hurtbox_area_entered(hitbox)


func die(args: = Utils.default_die_args) -> void :
	.die(args)

	if not cleaning_up:
		if shoot_projs_on_death:
			_death_shoot_projectiles_behavior.number_projectiles = 8
		###
		else :
			_death_shoot_projectiles_behavior.number_projectiles = 4
		##
		_death_shoot_projectiles_behavior.shoot()
