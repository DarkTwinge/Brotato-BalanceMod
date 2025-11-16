class_name NewEvilMob
extends Enemy

export (Array, StreamTexture) var textures_evolution
export (Array, int) var quantity_to_evolve
export (int) var decrease_speed_by_evolve

onready var life_bar = $"%LifeBar" as UIProgressBar
var life_bar_y_positions = [ - 60, - 60, - 100]

var gold_count: = 0
var evolution: = 0

func _ready():
	._ready()
	var _error_hp_lifebar = connect("health_updated", self, "on_health_updated")

func _on_ItemAttractArea_area_entered(item:Item)->void :
	if dead:
		return 

	var should_attract_item: = item is Gold
	if not should_attract_item:
		return 
	var item_already_attracted_by_player: = item.attracted_by != null
	if should_attract_item and not item_already_attracted_by_player:
		item.attracted_by = self

func _on_ItemPickUpArea_area_entered(area:Area2D)->void :
	if dead:
		return 

	if area is Gold:
		var gold = area as Gold
		gold_count += gold.value
		gold.reset()
		_entity_spawner_ref._main._active_golds.erase(gold)
		_entity_spawner_ref._main.add_node_to_pool(gold)

		if evolution + 1 < quantity_to_evolve.size():
			if gold_count >= quantity_to_evolve[evolution + 1]:
				evolve(evolution + 1)


func evolve(newEvolution:int)->void :
	if newEvolution >= 1:
		if ProgressData.settings.hp_bar_on_bosses:
			if not life_bar.visible:
				life_bar.show()
	life_bar.rect_position.y = life_bar_y_positions[newEvolution]
	evolution = newEvolution
	sprite.texture = textures_evolution[evolution]
	bonus_speed = - (decrease_speed_by_evolve * evolution)
	### 0.5 -> 0.75
	current_stats.health *= int(1 + (0.75 * evolution))
	max_stats.health *= int(1 + (0.75 * evolution))
	##

func get_stats_value()->int:
	return int(gold_count * (evolution + 1))

func die(args: = Entity.DieArgs.new())->void :
	.die(args)
	life_bar.hide()

func on_health_updated(_unit:Unit, current_val:int, max_val:int)->void :
	if ProgressData.settings.hp_bar_on_bosses:
		if not life_bar.visible and evolution >= 1:
			life_bar.show()

		life_bar.update_value(current_val, max_val)
	elif life_bar.visible:
		life_bar.hide()
