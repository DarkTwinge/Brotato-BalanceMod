extends "res://weapons/weapon_stats/weapon_stats.gd"

func get_knockback_text(base_stats: Resource) -> String:
	var orig_result = .get_knockback_text(base_stats)
	# Standard knockback shows as normal
	if base_stats.knockback_piercing == 0 or knockback == 0:
		return orig_result
	else:
		
		# Formatting stuff, same as original func
		var a = get_signed_col_a(knockback, base_stats.knockback)
		if base_stats.can_have_negative_knockback and not base_stats.can_have_positive_knockback:
			a = get_signed_col_a(base_stats.knockback, knockback)
		
		# When there's Knockback Piercing, show it in the tooltip
		var kbpierce = base_stats.knockback_piercing * 100
		return "\n" + Text.text("STAT_FORMATTED", [get_col_a() + tr("KNOCKBACK") + col_b, a + str(knockback) + col_b + " (" + tr("BM_KB_PIERCE") + " " + str(kbpierce) + "%)"])

