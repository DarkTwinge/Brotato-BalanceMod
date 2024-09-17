extends "res://singletons/linked_stats.gd"

#y New Padding effect
#y Esty's Couch Negative Speed effect
# King's changed ability
func reset_player(player_index:int)->void :
	.reset_player(player_index)

	var effects = RunData.get_player_effects(player_index)
	for linked_stat in effects["stat_links"]:
		var stat_to_tweak = linked_stat[0]
		var nb_stat_to_tweak = linked_stat[1]
		var stat_scaled = linked_stat[2]
		var nb_stat_scaled = linked_stat[3]
		var perm_stats_only = linked_stat[4]

		var actual_nb_scaled = 0.0
		### New King ability counts uniques rather than total tier-4 weapons
		if stat_scaled == "bm_unique_legendary_weapon": 
			var unique_tier4_weapon_ids = []
			for weapon in RunData.get_player_weapons(player_index):
				if weapon.tier >= Tier.LEGENDARY: 
					if not unique_tier4_weapon_ids.has(weapon.weapon_id):
						unique_tier4_weapon_ids.push_back(weapon.weapon_id)
			actual_nb_scaled = unique_tier4_weapon_ids.size()
		##
		### New Padding effect
		elif stat_scaled == "bm_leftover_materials":
			actual_nb_scaled = RunData.effects["bm_leftover_materials"]
		##

		var amount_to_add = int(floor(nb_stat_to_tweak * (actual_nb_scaled / nb_stat_scaled)))

		add_stat(stat_to_tweak, amount_to_add, player_index)

	### Negative Speed for new Esty's Couch
	#for conditional_stat in RunData.effects["bm_stats_for_negative_speed"]:
	#	if RunData.effects.has(conditional_stat[0]):
	#		if (RunData.get_stat("stat_speed") + TempStats.get_stat("stat_speed") + LinkedStats.get_stat("stat_speed")) < 0:
	#			var stat_to_tweak = conditional_stat[0]
	#			
	#			add_stat(stat_to_tweak, conditional_stat[1])
	###
