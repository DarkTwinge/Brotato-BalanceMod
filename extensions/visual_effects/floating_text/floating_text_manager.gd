extends "res://visual_effects/floating_text/floating_text_manager.gd"

# Replace; Vorpal effect
func _on_unit_took_damage(unit: Unit, value: int, _knockback_direction: Vector2, is_crit: bool, is_dodge: bool, is_protected: bool, armor_did_something: bool, _args: TakeDamageArgs, hit_type: int, is_one_shot: bool) -> void :
	if not ProgressData.settings.damage_display:
			return

	var color: Color = Color.white
	var text = str(value)
	var always_display = false
	var need_translate = false

	if unit is Player:
		always_display = true
		if value > 0:
			color = ProgressData.settings.color_negative
			text = "-" + text
		elif is_dodge:
			text = "DODGE"
			need_translate = true
		elif is_protected:
			text = "NULLIFIED"
			need_translate = true
	elif is_crit:
		color = Color.yellow
	elif is_one_shot:
		always_display = true
		### Replace Vorpal text effect
		color = Color.darkorange
		text = "NEW_ONE_SHOT"
		##
		need_translate = true
	elif armor_did_something:
		color = Color.gray


	var icon = null if hit_type == HitType.NORMAL else get_special_hit_icon(hit_type)

	display(text, unit.global_position, color, icon, duration, always_display, direction, need_translate)
