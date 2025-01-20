class_name NewStargazer
extends Enemy

export (Resource) var angry_sound

onready var _on_triggered_movement_behavior = $OnTriggeredMovementBehavior

var boost_args:BoostArgs = BoostArgs.new()

func _ready():
	var _e = entity_spawner.connect("enemy_spawned", self, "on_enemy_spawned")
	_on_triggered_movement_behavior.init(self)
	##boost_args.hp_boost = 150
	boost_args.hp_boost = 200
	boost_args.damage_boost = 25
	##boost_args.speed_boost = 250
	boost_args.speed_boost = 325


func on_enemy_spawned(enemy:Entity)->void :
	if enemy is Enemy and is_instance_valid(enemy) and enemy.enemy_id == "iron_lung" and enemy.source_spawner == self:
		_movement_behavior.add_lung(enemy)

		var _e = enemy.connect("became_full", self, "on_target_lung_became_full")
		_e = enemy.connect("died", self, "on_target_lung_died")
		_e = connect("died", enemy, "on_stargazer_died")


func on_target_lung_died(entity:Entity, _die_args:Entity.DieArgs)->void :
	if not dead and not entity.is_full:
		get_angry()


func on_target_lung_became_full()->void :
	# Moved sfx play over here so it only plays on entering vats, and increased volume
	SoundManager2D.play(angry_sound, global_position, 15, 0.1, true)
	if not dead:
		get_angry()


func get_angry()->void :
	_current_movement_behavior = _on_triggered_movement_behavior
	can_be_boosted = true
	if is_boosted and _boosted_args:
		boost_args.hp_boost += _boosted_args.hp_boost
		boost_args.damage_boost += _boosted_args.damage_boost
		boost_args.speed_boost += _boosted_args.speed_boost
	boost(boost_args)
	can_be_boosted = false
	#SoundManager2D.play(angry_sound, global_position, 15, 0.1, true)
