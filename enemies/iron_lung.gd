class_name NewIronLung
extends Enemy

export (Resource) var lung_angry_sound

signal became_full

var is_full: bool = false

onready var detection_zone = $DetectionZone
var sprite_full = preload("res://dlcs/dlc_1/enemies/iron_lung/iron_lung_full.png")

var _original_texture: Texture

func _ready():
	_original_texture = sprite.texture
	sprite.scale.x = Utils.get_rand_element([sprite.scale.x, - sprite.scale.x])


func respawn() -> void :
	.respawn()
	is_full = false
	sprite.texture = _original_texture
	_animation_player.playback_speed = 1
	_attack_behavior.cooldown = Utils.LARGE_NUMBER
	_attack_behavior._current_cd = _attack_behavior.cooldown


func _on_AttackBehavior_wanted_to_spawn_an_enemy(enemy_scene: PackedScene, at_position: Vector2) -> void :
	._on_AttackBehavior_wanted_to_spawn_an_enemy(enemy_scene, at_position)
	if not dead:
		die()


func _on_DetectionZone_body_entered(body):
	if not is_full and not dead and body is Enemy and is_instance_valid(body) and not body.dead and body.enemy_id == "stargazer":
		is_full = true
		sprite.texture = sprite_full
		_animation_player.playback_speed *= 2
		_attack_behavior.cooldown = 300
		_attack_behavior._current_cd = _attack_behavior.cooldown
		reset_health_stat(200)
		body.die()
		emit_signal("became_full")
		### Anger sound now plays here instead of in the Stargazer code
		SoundManager2D.play(lung_angry_sound, global_position, 18, 0.1, true)
		##

		if body.get_charmed_by_player_index() != - 1:
			set_charmed(body.get_charmed_by_player_index())


func on_stargazer_died(_entity, args: Entity.DieArgs) -> void :
	if not dead and not is_full and not args.cleaning_up:
		die()
