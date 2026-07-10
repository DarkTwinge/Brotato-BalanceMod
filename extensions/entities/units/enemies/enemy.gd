extends "res://entities/units/enemies/enemy.gd"

func _on_hurt(hitbox: Hitbox) -> void :
	### Don't apply Ugly Tooth to Gobbler
	# Currently ignores the debug one-shots on Gobbler as well as a side-effect
	if self.enemy_id != "evil_mob":
		._on_hurt(hitbox)
