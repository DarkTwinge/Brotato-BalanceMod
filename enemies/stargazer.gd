class_name NewStargazer
extends Enemy

export (Resource) var angry_sound

onready var _on_triggered_movement_behavior = $OnTriggeredMovementBehavior

var boost_args: BoostArgs = BoostArgs.new()

var _target_lung: NewIronLung
var _signals_connected: = false


func init(zone_min_pos: Vector2, zone_max_pos: Vector2, p_players_ref: Array = [], entity_spawner_ref = null) -> void :
	.init(zone_min_pos, zone_max_pos, p_players_ref, entity_spawner_ref)

	var _e = entity_spawner_ref.connect("enemy_respawned", self, "on_enemy_respawned")
	_on_triggered_movement_behavior.init(self)
	##boost_args.hp_boost = 150
	boost_args.hp_boost = 200
	boost_args.damage_boost = 25
	##boost_args.speed_boost = 250
	boost_args.speed_boost = 280


func respawn() -> void :
	.respawn()
	can_be_boosted = true
	_target_lung = null
	_movement_behavior.lung = null




func _clean_up_signals() -> void :
	if _signals_connected and _target_lung:
		_target_lung.disconnect("became_full", self, "on_target_lung_became_full")
		_target_lung.disconnect("died", self, "on_target_lung_died")
		disconnect("died", _target_lung, "on_stargazer_died")
		_signals_connected = false


func die(args: = Utils.default_die_args) -> void :
	.die(args)
	_clean_up_signals()


func on_enemy_respawned(enemy: Entity) -> void :
	if not dead and enemy is Enemy and is_instance_valid(enemy) and enemy.enemy_id == "iron_lung" and enemy.source_spawner == self:
		_target_lung = enemy
		_movement_behavior.add_lung(enemy)

		var _e = enemy.connect("became_full", self, "on_target_lung_became_full")
		_e = enemy.connect("died", self, "on_target_lung_died")
		_e = connect("died", enemy, "on_stargazer_died")
		_signals_connected = true


func on_target_lung_died(entity: Entity, _die_args:Entity.DieArgs) -> void :
	_clean_up_signals()
	if not dead and not entity.is_full:
		get_angry()


func on_target_lung_became_full() -> void :
	# Moved sfx play over here so it only plays on entering vats, and increased volume
	##SoundManager2D.play(angry_sound, global_position, 18, 0.1, true)
	_clean_up_signals()
	if not dead:
		get_angry()


func get_angry() -> void :
	_current_movement_behavior = _on_triggered_movement_behavior
	can_be_boosted = true
	if is_boosted and _boosted_args:
		_boosted_args.hp_boost += boost_args.hp_boost
		_boosted_args.damage_boost += boost_args.damage_boost
		_boosted_args.speed_boost += boost_args.speed_boost
		_boosted_args.show_outline = boost_args.show_outline
		boost(_boosted_args)
	else:
		boost(boost_args)

	can_be_boosted = false
	##SoundManager2D.play(angry_sound, global_position, 5, 0.1, true)
