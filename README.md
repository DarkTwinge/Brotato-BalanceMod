# Overview
Elites are closer in overall difficulty to each other, more weapons feel fun and are worth using, and fewer characters and starting weapons should feel frustrating or unfun. More items are worth using, and fewer choices are overpowered or 'always-picks'. Knockback is less frustrating, the Range stat is better, Luck is more valuable, mixed-weapon builds are easier to manage, and several bugs are fixed.

[The full, detailed list of all changes is here](https://github.com/DarkTwinge/Brotato-BalanceMod/#full-changelog). Below is a shorter summary of the major changes you should know about.
# Change Summary
### Mechanics
* Knockback now never pushes enemies towards you.
* Range gained from level-ups & items is ~33% larger (both the increases and decreases).
* Armor is slightly less effective (~7%).
* Easier to have mixed-weapon builds: Shop weapon-set favoring now accounts for all of your weapons (rather than weighing all your sets equally), and the chances of being offered one of the exact weapons you already have is higher the more weapon types you have.
* Base item/weapon rarity offered in shops slightly lower; Luck impacts shop rarity more; Tier 2-4 Luck Level-ups better.
* Small tweaks to other level-ups, notably dropping tier-1 Harvesting to 4 and boosting several weaker tier-4 level-ups to be more worthwhile.
* Horde Waves give ~8% fewer materials.
* All explosions can now crit and tooltips now display explosion size.
* Several tooltips cleaned up to be more clear, hidden mechanics are detailed, & character descriptions take up less room. Additional Quality of Life features such as icons for relevant Fairy & King items. Various vanilla-game bugfixes.

### Weapons
* Torch, Wand, Crossbow, Plank, Cacti Club, Screwdriver, and Sniper Rifle all receive relevant buffs.
* Spear, SMG, Lightning Shiv, Flamethrower, and Stick receive nerfs.
* Rock, Pistol, Chopper, Hatchet, Scissors, Medical Gun, Potato Thrower, and Plasma Sledge receive minor buffs; Flaming Brass Knuckles, Fist, Nuclear Launcher, and Chain-gun receive minor nerfs.
* Lightning Shiv & Sniper Rifle projectiles now have the same Crit Chance & Crit Damage as the main hit.
* Hand partially reworked to make tier-3 and 4 worth buying.

### Items
Tons of items receive small buffs or nerfs: overall more items are worth buying more often and the strongest give less power for their cost. Note that the goal is not to make everything equally strong; there is still plenty of variance and build-specific decision-making. Some highlights:
* Esty's Couch, Robot Arm, and Padding have been reworked.
* Spicy Sauce has a bigger explosion and proc chance.
* Eyes Surgery also adds +1 burn duration.
* Weird Food is now Tier-2 (easier to find if you have high Luck).
* Snail now also slows enemy charges.
* Power Generator now reduces your HP as it powers up.
* Tardigrade is no longer wasted by Bloody Hand/Donation.
* Ricochet is now friendlier with already-piercing weapons.
* Heavy Bullets now stronger overall but lowers Accuracy.
* Fairy gives less HP Regen and gives negative speed for tier-4s instead of negative HP Regen.
* Candle is cheaper, and thus more viable for non-Elemental builds that want fewer enemies.
* Sifd's Relic much cheaper.
* Alien Tongue & Mutation significantly buffed.
* Medikit & Bloody Hand nerfed.
* Fixed several missing item tags (which make certain characters more likely to find appropriate items).

### Characters
As with items, the goal is not for characters to be equal strength, as it is more interesting and fun for them to be varied. Instead, we compress the difference from top to bottom a little bit so the easiest options are less 'free' and the hardest are less frustrating/punishing. (For example, Jack is buffed and Masochist is nerfed, but Masochist is still a much easier character.)
* Jack, One-armed, and Farmer receive moderate buffs.
* Artificer now deals base damage with Tools (instead of only 1).
* Knight, Loud, Masochist, Renegade, Bull, Doctor, Cryptid, Demon, King, Gladiator, and Brawler receive modest nerfs.
* Mage can now run an Engineering build (turrets causing burn via Sausage) and also handles Gun builds better (extra Sausage).
* Several characters have more sensible tagging (items they are favored to find), e.g. Streamer is now more likely to find structures. Streamer also now gets +2 Armor from Pocket Factory (instead of nothing).
* Starting weapons overhauled to make more sense and to be more fun for random-weapon runs, with several nonsense picks removed and many new appropriate options added.

### Enemies & Waves
* Smiley/Croc, Hivemind/Colossus, and Mother Elites nerfed.
* Gargoyle/Bat, Monk, Chef/Butcher, Mantis, and Rhino Elites buffed.
* Loot Goblins are easier to kill in early waves.
* Helmet enemies have more HP.
* Wave 16 harder. Wave 14/15 Horde waves harder. Wave 12 slightly harder.
* Wave 20 has additional small enemies, making it slightly harder and allowing for more synergy from effects that rely on killing enemies or picking up materials.

# Support Me
Tune into my stream where I play a wide variety of indie games: https://www.twitch.tv/darktwinge

If you'd like to financially support my ability to make and maintain mods like this, you can do so on Patreon: http://www.patreon.com/DarkTwinge or directly: https://paypal.me/DarkTwinge

# Other Resources
Fully unlocked Brotato save file (with blank character completion so you can still track your progress): https://www.darktwinge.com/skip-metaprogression-unlocks/brotato-save-file/

You might also enjoy my FTL Balance Mod: https://www.darktwinge.com/ftl-balance/index.php

### Recommended Quality of Life Mods
* Bait & Egg Reminder: https://steamcommunity.com/sharedfiles/filedetails/?id=3029249900
* Elites in Pause Menu: https://steamcommunity.com/sharedfiles/filedetails/?id=3032359714
* Piggy Bank Reminder: https://steamcommunity.com/sharedfiles/filedetails/?id=3005196583
* Tooltip Tracking Fix: https://steamcommunity.com/sharedfiles/filedetails/?id=3003583829
* Advanced Statistics: https://steamcommunity.com/sharedfiles/filedetails/?id=3025488976
* Revamped Icons: https://steamcommunity.com/sharedfiles/filedetails/?id=3003721761

# Thanks To
Inschato, ArosRising, Hyphen-ated, Pasha, and everyone else that's assisted with feedback, suggestions, or coding help!

# License
You are free to use concepts and code contained within elsewhere, ideally with attribution. E.g. if you want to make a spin-off mod for, say, only the Elite changes, you are welcome and encouraged to do so but I'd appreciate a link back to the Balance Mod and/or to my stream.

# Full Changelog
## General Changes
* Knockback: The direction enemies are knocked back now depends half on the original knockback calculation and half on the position of the player relative to the enemy, meaning it now never moves the enemy towards the player and will generally move them more directly away from the player. (Most enemies that were immune to knockback are also now slightly vulnerable to it, see below.)
* Armor is about 7% less effective (you now hit 50% reduction at 16 Armor instead of 15). _[This probably still leaves it as the strongest general stat, but now closer to its peers.]_
* Mixed Weapon Sets don't hurt your shop odds as much: The calculation that weighs shop weapons to more often match weapon sets you currently have (15% of the time, more often in the first 5 waves) now factors in how many copies of the set you have rather than weighing them all equally. For example, if you have 5 Thief Daggers (Precise set) and 1 Scissors (Precise & Medical sets): when the shop is picking a tier-1 weapon based on sets, in vanilla this would give you a 1 in 7 chance to be offered a Medical Gun -- now the odds of it picking Medical Gun are only 1 in 32. _[This also means multi-set weapons will inherently be favored slightly more, which helps offset the fact they are pulling in a lot of weapons into the pool from being a part of multiple sets to begin with.]_
* Additionally, having multiple different weapon types will make the shop more likely to offer you an exact-match of a weapon you already have. In vanilla, this is always a 20% chance; now it's 19%/20%/22%/24%/25%/26% for having 1/2/3/4/5/6+ different weapon types.
* Base shop (and level-up) odds for higher tiers is slightly worse, and Luck's potential impact on these odds is now higher. Base Increase-Per-Wave for higher-tier equipment reduced: 6%/2%/0.23% -> 5%/1.85%/0.23%. Base Max Chance for higher-tier equipment -/60%/25%/8% -> -/56.5%/24%/8.5%; this max is now only a softcap, with Luck being able to go to a new potential hardcap of -/65%/27%/- at -/172/224/- Luck (Negative Luck does not reduce the cap).
* Luck's impact on Tier-4 equipment is now 20% higher than vanilla (both positive and negative Luck; caps at +285 Luck by Wave 15 or +157 by Wave 19). _[Luck affects shop odds significantly less than most players expect and overall has less of an impact than most stats, so this helps align expectations and bring the stat closer to the others.]_
* When a shop tries to offer you an exact weapon you have but can't, it will now offer you a same-set weapon (previously it just reverted to a random weapon). This makes it a little easier to match-up a starting tier-2+ only weapon (e.g. Potato Thrower or Sword) with something relevant.
* For consistency, all explosions can now crit (Rip & Tear, Spicy Sauce, and Glutton's crit chance affected). All explosion tooltips now also list their explosion size (weapons, items, and characters).
* Clarified various tooltips to be more clear. Shortened several character effect descriptions to fit in the box better. Tooltips for Armor and Improved Tools + Gardens are more precise. Knight's tooltip color-coded properly. Fixed Lightning Shiv's bounce count. Fixed Incendiary Turret tooltip's incorrect damage rounding.
* The reroll button for level-ups is now appropriately colored for levels that have a guaranteed rarity. (Level 5, 10, 15, etc.)
* Horde Wave Materials: 65% -> 60% _[This still leaves them as generally more profitable and easier than Elite waves, but now more closely aligned.]_
_Note: Altered and new descriptions will currently not display for non-English languages._ (If anyone wants to help me make a translation set for another language, let me know! There's about 50 text keys that are mostly tweaks of vanilla text which already has extant translations to reference.)


## Standard Enemies
* **Loot Goblin:** Base HP  50->2; HP/wave 25->30 _[Makes early Loot Goblins far more reasonable to kill and late-game ones slightly harder to kill.]_
* **Helmet Enemy:** Base HP 8->4; HP/wave 3->4.5  _[Aim is to make them feel like a more meaningful presence on the field, especially for Wave 16 where, when buffed (red outline), they go from 185hp in vanilla to 250hp in Balance Mod.]_
* **Tentacles:** Fruit Drop Chance 1% -> 2%; Convert-to-Item-Crate Chance 1% -> 4%

+ **Small Charger:** Knockback Resistance 100% -> 80%
+ **Small Viking Charger:** Knockback Resistance 100% -> 80%
+ **Tall Bruiser:** Knockback Resistance 100% -> 90%
+ **Tall Armored Bruiser:** Knockback Resistance 100% -> 90%
+ **Hatched Slasher:** Knockback Resistance 100% -> 90%
+ **Lamprey Fish:** Knockback Resistance 100% -> 90%
+ **Spawned Magician:** Knockback Resistance 0% -> 40% _[Makes them a little easier to kill with high-knockback weaponry.]_

## Elites
* **Mother Elite:** Phase 1 Initial Cooldown 2s->1.67s; Phase 2 now switches between a) summoning rapidly (9 Fins per second, vanilla behavior) but slicing half the time, and b) summoning slowly (3 Fins per second) and slicing constantly (vanilla behavior)
* **Smiley/Croc Elite:** Contact Damage Per Wave 1.5 -> 1.3 _[~2-5 less damage]_; Phase 2 Circle Size 450->480; Phase 2 Cooldown 0.75s -> 0.85s
* **Hivemind/Colossus Elite:** Phase 1 Projectile Count 50 -> 47; Phase 2 Cooldown 0.9s -> 1.15s _[Aiming to give melee slightly more wiggle room in Phase 1, and everyone a bit more breathing room during the onslaught of Phase 2.]_
* **Monk Elite:** Now has same HP scaling as every other Elite (700->750)
* **Gargoyle/Bat Elite:** Base Speed 350 -> 365; Phase 1 Initial Cooldown 2s->1s; Phase 1 Circle Size 1000->930; Phase 1 to 2 Switch Timing 30s elapsed -> 25s or 60% HP -> 65% HP (meaning they switch phases sooner); Phase 2 Movement Speed 75% -> 85%; Phase 2 Projectiles 12->24 & Projectile Spread 600->710; Phase 3 Projectiles-per-burst 3->4 & Projectile Speed 200->235; Phase 3 Distance-from-Player 225->270 _[So it's not such a convenient distance to just sit and smack with melee weapons]_; Phase 3 Movement Speed 60% -> 58% (About the same as vanilla given the higher base speed)
* **Rhino Elite:** Base Speed 250 -> 275; Phase 1 Charge Speed 900->1150 (& Charge Duration 1.0->0.95); Phase 2 Charge Speed 1000->1050
* **Chef/Butcher Elite:** Phase 2 Max Range 1200 -> 3500; Phase 3 Max Range 2000 -> 3500 _[These changes make it so you can't get out of range of the slashes, most relevant for Explorer]_; Phase 3 Slice Attack Damage Per Wave 0.75 -> 0.85 _[~1-3 more damage; still less damage than any other Elite attack]_
* **Mantis Elite:** Initial Cooldown 0.75s -> 0.25s; Phase 2 Cooldown 1.33s -> 1.25s; Phase 2 Charge Duration 0.7s -> 0.85s; Phase 2 Charge Speed 800 -> 740 (Total Distance 560 -> 629)

## Wave Spawns
* **Wave 12:** Mummy Spawns 10 -> 16 _[For comparison, Wave 11 averages 32.5 Mummies.]_
* **Wave 14:** Helmet Spawns 108 -> 85 (Helmets have more HP - this is slightly more total HP); Basics spawns earlier (Makes the first ~15s a bit less empty, total 120->130 Basics); Single Magician Spawns 1-2 x6 -> 1-1 x6 _[Removes the variance which removes the chance for an especially unlucky wave, and makes it so _most_ of the fireball hurlers come from the Wizard Hats which you have more control over.]_
* **Wave 15:** Helmet Spawns 114 -> 95 (Helmets have more HP; this is moderately more total HP)
* **Wave 16:** Helmets have more HP but just as many spawn; 2 Flies added to each group of Helmets + Buffers (28 total); Helmet Groups a bit more spread out (500->650) [Aiming to make them less trivially smashed by melee quickly]; 2 additional groups of 1 Bruiser + 1 Armored Bruiser spawn, and they show up 10 seconds earlier (18 -> 22)
* **Wave 20:** Added additional Basics (5 every 5s = 80 total) and Fins (5 every 6s = 65 total), primarily to help out effects which are based on enemy/material counts (but also potentially makes things a bit harder, especially for Ranged builds).
* **Wave 14 & 15 Hordes:** Added 6 single Magician spawns alongside 6 single Wizard Hats (Spawners) spread out over the last 2/3rds of the wave; Reduced some of easier enemy spawns so they're less likely to despawn the more-threatening enemies; Made the added Helmets and Fins in the 2nd half spawn on the edges of the map to make them harder to deal with; Made the Horde additions identical for 14/15. _[Aiming to make these Horde waves feel threatening, rather than often easier and simply more profitable than their non-Horde counterparts like they are in vanilla.]_

## Level-ups
* **Range:** 15/30/45/60 -> 20/40/60/80
* **Luck:** 5/10/15/20 -> 5/11/18/26
* **Harvesting:** 5/8/10/12 -> 4/8/11/15
* **HP Regen** Tier-4: 5->6
* **Engineering** Tier-4: 5->6
* **Crit Chance** Tier-4: 9->10

## Weapon Set Bonuses
* **Blunt:** -2/-4/-6/-8/-10 Speed -> -1/-2/-3/-4/-5 Speed
* **Primitive:** 3HP Per -> 2HP Per
* **Guns:** 10/20/30/40/50 Range -> 2/4/6/8/10 Attack Speed _[Guns having a bunch of free Range is part of why they don't care about the stat much at all. Additionally, they're a strong and flexible archetype, so they don't need as many free stats from a Set as other weapons do.]_

## Items
### Tier-1
* **Alien Tongue**: +30% Pickup Range -> +45%; Price 25->18
* **Baby Gecko**: Price 18->17; Range 10->15; Added 'Range' Tag
* **Bag**: Price 15->16
* **Beanie**: -6 Range -> -8
* **Broken Mouth**: Price 25->26
* **Cake**: Price 15->16
* **Coffee**: +10% Attack Speed -> 9% 
* **Coupon**: Price 15->19
* **Cute Monkey**: Price 25->35; Proc Chance 8%->10%; Limit 13->10
* **Duct Tape**: Price 25->15
* **Fertilizer**: Price 15->19; Harvesting 8->7
* **Glasses**: Price 25->23; Range 20 -> 28
* **Gummy Berserker**: Price 25->23; 15 Range -> 25
* **Head Injury**: Price: 25->24; 6% Damage -> 7%; -8 Range -> -2% Speed _[Swapped with Helmet so that this doesn't mirror Cyclops worm so directly.]_
* **Hedgehog**: Price 30->25
* **Helmet**: Price 25->24; -2% Speed -> -10 Range _[Swapped with Head Injury so that it doesn't mirror Cyclops Worm so directly and so Helmet doesn't mirror Warrior's Helm as directly either.]_
* **Landmines**: Price 15->14
* **Lens**: -5 Range -> -12
* **Lost Duck**: Luck 10->9
* **Lumberjack Shirt**: Price 15->13
* **Mutation**: Price 25->15; -3% Speed -> -2% _[You almost never want both Elemental and Ranged together, and this is nicely cheap when you do; otherwise still kind of expensive-but-occasionally-worth when you just want one.]_
* **Plant**: HP Regeneration 3 -> 2
* **Propeller Hat**: Price 28->25
* **Scar**: Price 30->25; Range -8 -> -11
* **Scared Sausage**: Price 25->16; Tooltip now mentions hidden mechanic of improving natural burn _[Helps encourage mixed builds by being more affordable in so-so situations]_
* **Snake**: Price 25 -> 22
* **Terrified Onion**: Price 15->12; -6 Luck -> -5 Luck
* **Turret**: Price 15->16 _[Almost always better than Landmines, so they get a mild cost difference.]_
* **Weird Food**: Now Tier-2; Price 20->25; -2% Dodge -> -2 HP _[Makes it easier to find in Luck-heavy builds, and now has a more general stat tax rather than only punishing Dodge for an item dodge-builds often really want.]_

### Tier-2
* **Acid**: Price 65->64; -4% Dodge -> 3%
* **Alien Eyes**: Price 50->57; No Downside -> -10 Range
* **Banner**: Range 20 -> 26
* **Black Belt**: Price 50->47
* **Blindfold**: -15 Range -> -20
* **Blood Leech**: Price 45->41; Harvesting -4 -> -3
* **Campfire**: Price 40->46; HP Regen 2 -> 3
* **Cyclops Worm**: -12 Range -> -18
* **Dangerous Bunny**: No Downside -> -2% Dodge; Limit 3 -> 4
* **Energy Bracelet**: Price: 55->52; 4% Crit Chance -> 5%
* **Eyes Surgery**: Price 60->47; New Additional Effect: Also adds +1 duration to all burn effects; -10 Range -> No Downside
* **Gambling Token**: Price 60->52; 8% Dodge -> 10%
* **Garden**: Price 50->47
* **Incendiary Turret**: Price 40->47; Burn Duration 8->7; 33% Engineering Scaling -> 35% _[Makes the rounding less abysmal.]_
* **Leather Vest**: Price 45->51
* **Little Frog**: Price 50->42; +20% Pickup Range -> +35%; -5% Dodge -> -3%
* **Little Muscley Dude**: Range -15 -> -20
* **Lure**: Price 34->39; HP Regeneration 3 -> 2
* **Medal**: Price 55->60; -4% Crit Chance -> -3%
* **Metal Detector**: -5% Damage -> -4%
* **Metal Plate**: Price 40->42
* **Missile**: Price 45->41; 10% Damage -> 11%
* **Padding**: {Reworked} Price: 45->41; -5% Speed -> -2%; Base HP 3 -> 2; New Effect: Instead of scaling with your total materials, Padding now gives you 1 HP for every 15 materials leftover that you didn't collect during the previous wave; Added 'Max HP' Tag _[Now a more dynamic item that actually has value beyond the very limited niche situations it was good in before.]_
* **Piggy Bank**: Price 40->42
* **Pocket Factory**: 2 Engineering -> 3 _[Many people like this item a lot, but if you look at its actual damage output in practice it tends to be very lackluster for its cost outside of its best-case scenarios.]_
* **Pumpkin**: -2% Damage -> No Penalty; Now also gives +15% Bounce damage (only relevant for Ricochet); No Limit -> Limit 8 _[Limit is mostly irrelevant, but will stop it from showing up in deep endless if you've already maxed the possible value.]_
* **Recycling Machine**: No downside -> -2% Attack Speed
* **Riposte**: Price 40->33
* **Ritual**: Price 60->57
* **Scope**: Price 55->52; 25 Range -> 45; -7% Attack Speed -> -6%
* **Shady Potion**: 20 Luck -> 19
* **Snail**: Price 40->36; -5% Enemy Speed -> -6%; Now also gives -6% Enemy Charge Speed; -3% Speed -> -2%
* **Spicy Sauce**: Price 40->42; 25% Proc Chance -> 35%; Limit 4 -> 3; Explosion Size 125% -> 150%; Can now crit for 1.5x damage (base Crit Chance 1%); Clarified effect of having multiple copies
* **Tentacle**: Price 32->35
* **Wheelbarrow**: Price 40->36
* **Whetstone**: Price 40->42
* **White Flag**: 5 Harvesting -> 6

### Tier-3
* **Adrenaline**: Price 60->55
* **Alien Magic**: Price 85->82
* **Alloy**: 3 Melee Damage -> 5 ; Dodge -6% -> -5%; Added 'Elemental Damage' Tag
* **Baby With a Beard**: Price 100->110; Range -50 -> -90
* **Barricade**: Price 75->72
* **Bean Teacher**: Price 70->64
* **Blood Donation**: Price 50->43 _[The biggest 'cost' is the damage, so the material cost should be a bit lower.]_
* **Bowler Hat**: Price 75->72; 15 Luck -> 17
* **Candle**: Price 65->50; Elemental Damage 4 -> 3; -5% Damage -> -4% Attack Speed
* **Chameleon**: Price 70->58; %Damage -4% -> -3%
* **Community Support**: Price 75->72; Added 'Attack Speed' Tag
* **Crown**: Price 70->68
* **Fairy**: Price 85->90; 1 HP Regeneration Per 1 Unique Tier-1 Item -> 2 HP Regeneration Per 3 Unique Tier-1 Items (Tooltip also shows a counter for how many items you need until the next stat increase); -2 HP Regeneration Per 1 Unique Tier-4 Item -> -3% Speed Per 1 Unique Tier-4 Item; Now shows an icon in both the shop and item boxes to indicate items affecting Fairy you don't have yet (like Renegade).
* **Fin**: 10% Speed -> 9%; Luck -8 -> -9 
* **Glass Canon**: Price 75->67
* **Improved Tools**: Added the 'Attack Speed' Tag
* **Lucky Charm**: Price 75->70
* **Plastic Explosive**: Price 60->53
* **Poisonous Tonic**: Price 80->79; 15 Range -> 27
* **Power Generator**: Price 65->72; -5% Damage -> -1 Max HP Per 5% Speed; Added '%Damage' Tag
* **Rip and Tear**: Price: 65->57; Can now crit for 1.5x damage (base Crit Chance 1%); Clarified effect of having multiple copies
* **Shackles**: Price 80->85; Range 80 -> 88
* **Shmoop**: Price 60->65; 2 HP Regen -> 3
* **Silver Bullet**: Added '%Damage' Tag
* **Statue**: Price 60->55
* **Stone Skin**: Price 80->88; -2 Armor -> -4% Speed
* **Strange Book**: Price 70->64
* **Tardigrade**: Price 50->45; Now requires 2+ damage to proc (preventing it from being wasted by Bloody Hand, Blood Donation, or Sick); Added to Dodge Item Tag Pool
* **Toolbox**: Price 55->53; 6 Engineering -> 7; -8% Attack Speed -> -5%
* **Triangle of Power**: Removed 'Armor' Tag
* **Tyler**: 1.0 Engineering Scaling -> 0.8; No Elemental Damage Scaling -> 0.8; Added to Elemental Damage Tag Pool. _[Another item to help enable the mixed Engineering+Elemental build.]_
* **Vigilante Ring**: Price 92->82
* **Wandering Bot**: Price 60->57
* **Wheat**: Price 85->83; Harvesting 10->13
* **Wings**: Range 30 -> 40
* **Wisdom**: Damage -20% -> -16%; Price 85->80
* **Hunting Trophy**: Price 55->52; Proc Chance 33% -> 25%; Limit 3->4

### Tier-4
* **Anvil:** Price 120->125
* **Big Arms:** Price 105->100; 12 Melee Damage -> 13
* **Bloody Hand:** Price 100->110; 12% Lifesteal -> 9%
* **Diploma:** Price 80->85; Engineering 10 -> 12; 20% XP Gain -> 25%
* **Esty's Couch:** {Reworked} Price: 100; +20% Attack Speed; +20% Damage; +70 Range if Speed is negative; -8% Speed; Non-Unique; Tags: Damage%, Attack Speed, Range _[This was previously an overly-niche item and was also a 3rd Red-tier item focused on HP Regen which was excessive. I keep a bonus for negative speed while making it far more generally useful. It also adjusts dynamically, thematically working with Streamer as they may get negative Speed mid-wave.]_
* **Exoskeleton:** Price 90->105; Armor 5 -> 4
* **Explosive Shells:** Explosion Damage +60% -> +50%; Explosion Size +15% -> +20%; -15% Damage -> -7% Damage _[So it fits in more reasonably with mixed builds, and with a little more emphasis on the more-unique size rather than just damage.]_
* **Extra Stomach:** Price 100->105; No Downside -> -1 Consumable Healing
* **Focus:** Price 110->100; Attack Speed penalty per weapon -3% -> -4%
* **Gnome:** 10 Melee Damage -> 12; 10 Elemental Damage -> 8; Range -20 -> -28
* **Heavy Bullets:** Price 100->95; +10 Range -> +5% Crit Chance; -5% Crit Chance -> -35% Accuracy; (Replaced 'Range' tag with 'Crit Chance') _[See Ranged Weapons below for a few weapon Accuracy tweaks that're primarily relevant if you have Heavy Bullets.]_
* **Jet Pack:** Price 100->92; HP -5 -> -3
* **Lucky Coin:** -2 Armor -> No Downside
* **Mammoth:** Melee Damage 20 -> 18; HP Regen 5 -> 4; -3% Speed -> -4%
* **Medikit:** Price: 95 -> 105; Starting HP Regen 10 -> 4
* **Night Goggles:** Price 90->85; Crit Chance 15%->14%; Range 50->80; -3 HP -> -4% Speed _[Now more worthwhile if you mostly care about the range.]_
* **Octopus:** Price 105->110; Added 'HP Regeneration' Tag
* **Potato:** Price 95->100
* **Regeneration Potion:** HP Regeneration 3 -> 4
* **Retromation's Hoodie:** +2% Attack Speed for every 1% Dodge -> +3% Attack Speed for every 2% Dodge; -80 Range -> -100 Range
* **Ricochet:** Damage -25% -> -20%; All weapons that naturally pierce now have a default bounce damage of 70% instead of 50% (Crossbow, Shotgun, Laser Gun, Pistol, Shredder, Minigun, Obliterator, Chain-gun, Gatling Laser, Flamethrower, Laser Turret). _[In vanilla, it's a red-tier item that only works on ranged weapons to begin with, but then still ends up worthless on weapons like Shotgun and Shredder making it overly niche.]_
* **Robot Arm:** {Reworked} Price 87; Adds an additional weapon slot; -3 HP Renegeration; -2 Lifesteal  _[Previously this item was way too similar to Exoskeleton - now it's a fun new effect.]_
* **Sifd's Relic:** Price 100->50
* **Spider:** Price 120->112; 6% Attack Speed Per Different Weapon -> 8%; 12% Damage -> 8% _[Thematic!]_
* **Wolf Helmet:** Price 90->95; Additional Downside of -5 Harvesting

## Weapons
### Melee
* **Cacti Club:** Melee Base Damage 10/20/30/50 -> 10/20/30/45; Melee Scaling 80%(All) -> 80%/88%/95%/100%; Projectile Base Damage 1(All) -> 1/1/2/2; Projectile Damage Scaling: 50%(All) -> 50%/55%/58%/60%; Projectile Count 3/4/5/6 -> 3/4/5/7
* **Chopper:** Range 125/135/150/180 -> 135/150/165/180; HP Scaling 20%(All) -> 20%/20%/25%/25%; Base Damage 6/12/18/30 -> 6/12/16/28 _[Similar damage at medium HP, more damage at high HP.]_
* **Fighting Stick** renamed **Bokken**. _[It should not have "Stick" in the name, and a training sword fits thematically with the weapon's sword-like attack pattern as well as the experience-based scaling.]_
* **Fist:** Price 10/22/45/91 -> 12/26/52/105; Cooldown 0.78/0.73/0.69/0.59 -> 0.79/0.74/0.71/0.61
* **Flaming Brass Knuckles:** Burn 8x5/12x6/15x7 -> 8x3/12x4/15x5; Cooldown 0.73/0.69/0.59 -> 0.74/0.71/0.61 _[More in-line with other Elemental weapons, so it doesn't overshadow them as much while still having its high direct damage and good Melee scaling.]_
* **Ghost Flint:** Tier-1 Damage 6->7; Tier-1 Cooldown 1.23 -> 1.24 _[Helps tier-1 not be so hopelessly behind it can never kill enough enemies to proc on characters that don't have extra damage to start.]_
* **Hammer:** Price 51/95/190 -> 42/80/156
* **Hand:** Price 10/22/45/91 -> 9/19/33/63; Harvesting 3/6/9/18 -> 2/5/10/20 _[This progression makes it worth upgrading past Blue-tier, which is broadly a mistake in vanilla.]_
* **Hatchet:** Range 125->135
* **Lightning Shiv:** Range 150->135; Melee Base Damage 3/6/9/15 -> 3/5/7/10; Projectile Base Damage 5/8/12/15 -> 4/6/9/13; Cooldown increased by 1 (Same cooldown but now at less Range) _[Requires a bit more investment to get to the bananas damage this weapon often achieves.]_; Melee Crit Chance 5%/10%/15%/15% -> 4%/6%/7%/8%; Projectile Crit Chance 3%(All) -> 4%/6%/7%/8% _[Makes crit for projectiles and melee the same now, averaging slightly more crit than vanilla.]_
* **Plank:** Explosion Size 75%(All) -> 80%/90%/100%/110%; Scaling: 50%/55%/60%/65% -> 50%/60%/70%/80%
* **Plasma Sledgehammer:** Explosion Size 100%/125% -> 110%/130%; Explosion Chance 25%/50% -> 33%/50%; Renamed Plasma Sledge _[Makes room to show the weapon's tags.]_
* **Rock:** Price 10/22/45/91 -> 10/20/41/83; Knockback 5/5/5/5 -> 4/6/8/10 _[A weak weapon on the damage side, but doesn't need much of a buff because it provides a good amount of defensive stats via the direct bonuses and set bonuses, so we lean into its utility nature by simply making it a bit cheaper.]_
* **Scissors:** Crit Damage x2/x2/x2/x2 -> x2/x2.15/x2.3/x2.5; Crit Chance 10%/12%/15%/20% -> 8%/11%/15%/20%; Lifesteal 40%/45%/50%/60% -> 35%/42%/50%/60% _[Now fits in more sensibly with Precise builds, and is more worth upgrading to tier-3/4.]_
* **Screwdriver:** Range 125 -> 135; Cooldown 1.05/1.0/0.97/0.87 -> 0.91/0.86/0.80/0.73
* **Spear:** Range 350/375/400/500 -> 325/350/375/450; Cooldown 1.52/1.40/1.28/1.24 -> 1.53/1.41/1.32/1.25 (Accounting for the new lower starting Range)
* **Stick:** Damage Scaling 100%(All) -> 75%/80%/85%/90%; Flat Damager Per Stick 4/6/8/10 -> 3/5/7/9
* **Torch:** Now has 1 Spread at tier 2/3/4 (like Snake, and additive with more Snakes); Larger hitbox _[Now will actually hit enemies right on top of you]_; Melee Damage Scaling 50%(All) -> 75%(All); Base Damage 1(All) -> 1/2/2/4; Burn 3x3/5x4/8x5/12x8 -> 4x4/5x5/10x7/17x9; Knockback 20->25 _[Long burn duration alongside built-in spread gives additional utility and combos somewhat with other burn sources.]_
* **Wrench:** Tier-2 Turret Burn Duration 8->7

### Ranged
- **Chain-gun:** Long Reload Cooldown 2.04s -> 3.71s; Accuracy 80% -> 55% _[For reference, Tier-1 SMG is 70%.]_
- **Crossbow:** Price 18/36/66/140 -> 13/28/60/124; Range 350 -> 325; Crit Damage x1.5/x1.75/x2.0/x2.25 -> x1.6/x1.8/x2.0/x2.3; Range Scaling 10%(All) -> 7%/8%/9%/10%; Cooldown 1.13(All) -> 1.10/1.15/1.20/1.23 _[Lower price helps its early game weakness significantly; worsening cooldowns offset the massive scaling reached at higher tiers given the Range stat being easier to obtain, and also make the weapon more unique in a thematically appropriate way.]_
- **Double-barrel Shotgun:** Knockback 8 -> 5
- **Flamethrower:** Price: 56/103/207 -> 58/103/187; Range 300/350/400 -> 250/275/300; Burn 3x5/4x6/5x8 -> 2x4/3x5/5x6; Cooldown 0.12/0.12/0.09 -> 0.22/0.16/0.09 _[This still leaves the weapon powerful in most Elemental builds, but no longer overshadows other Elemental weapons so drastically.]_
- **Medical Gun:** Cooldown 0.95/0.87/0.78/0.62 -> 0.92/0.85/0.75/0.60; Range 400 -> 375; Tier-3 Damage 20 -> 22
- **Nuclear Launcher:** Cooldown 2.12 -> 2.20; Base Damage 60/120 -> 50/100; Range 800 -> 650; Ranged Scaling 100%/100% -> 125%/125%; Elemental Scaling 100%/100% -> 150%/150% _[Similar strength in Elemental builds, a bit weaker otherwise.]_
- **Pistol:** Price 10/22/45/91 -> 10/20/41/83; Knockback 15 -> 10 _[Leaning into its strength of being cheap; the low price + decent base damage gives it some utility as a temporary weapon, or as a good option in situations where you're primarily gaining Damage% rather than Ranged Damage. Also worth noting that it's now also less damaging to your shop odds to mix into a build as well because of the multi-weapon changes.]_
- **Potato Thrower:** Added to the Blunt Weapon Set; Price 36/69/139 -> 33/65/118; Base Damage 1(All) -> 2/3/4
- **Revolver:** Tier-1 Price 20 -> 18; Range 450 -> 425
- **Rocket Launcher:** Range 500/550/600 -> 500(All)
- **SMG:** Range 400 -> 325; Cooldown ~10% worse (All Tiers)
- **Sniper Gun:** Renamed Sniper Rifle; Range 800/1000 -> 550/550; Ranged Damage Scaling 100%(All) -> 200%/250%; Projectile Base Damage 5->4; Projectile Crit Chance 3%/3% -> 20%/20%; Projectile Crit Damage 2.0/2.0 -> 3.0/4.0 _[Given that it's in the Gun Set, it should at least passably scale from Ranged Damage and fit into a Gun build - even with these scaling amounts it still scales worse than a Pistol. Additionally, the weapon often under-performs for its cost and rarity in vanilla, and one would expect the projectiles to crit the same as the main shot.]_
- **Wand:** Scaling 50%/65%/80%/100% -> 60%/75%/85%/100%; Burn 3x3/5x4/8x5/12x6 -> 3x3/8x3/12x4/16x5; Cooldown 0.87/0.78/0.70/0.53 -> 0.83/0.77/0.68/0.53; Base Damage 1(All) -> 1/2/3/4; Knockback 10 -> 4 _[Relevantly more front-loaded damage. The slight cooldown buff lets you get 1 extra kill on Wave 1.]_

* Bugfixed inaccurate long cooldown tooltip for Revolver & Chain-gun, which shows the cooldown as much higher than it actually is.
* Weapons with very low cooldowns (such as SMG or Minigun) now show an extra decimal place in their cooldown for better accuracy.
* **Chain-gun, Gatling Laser, Tier-4 Minigun:** Fixed cooldown to no longer incorrectly display in red (visual change only).
* **Other Minor Accuracy Tweaks** (mostly only relevant if Accuracy is lowered by Heavy Bullets): Pistol 0.9(Tier1-3)->1.0(All); Medical Gun 0.9(Tier1-3)->1.0(All); SMG 0.7/0.75/0.8/0.85->0.7/0.74/0.77/0.8; Mini-gun 0.85/1.0 -> 0.8/1.0; Shotgun 0.9/0.95/1.0/1.0->0.9(All); Potato Thrower 0.9(All)->1.0(All); Rocket Launcher 0.8/0.9/1.0-> ; 0.9(All) _[For reference, Revolver is 0.9(All), and most other unlisted weapons are 1.0(All).]_


## Characters
* **Artificer:** Tools Have +100% Damage. _[This lets them use Screwdriver/Wrench without their melee hit being stuck at 1 damage hits.]_
* **Brawler:** Unarmed Attack Speed Bonus 50% -> 40%; Now applies their +AttackSpeed Bonus to weapons that scale with Attack Speed (Claw)
* **Bull:** Starting HP Regen 15 -> 10
* **Crazy:** No longer starts with a Knife; Now applies their +Range Bonus to weapons that scale with Range (Crossbow & Sniper Rifle); Starting Dodge -30% -> -15% _[Silly, but if this isn't going to be -100%, it might as well be an amount you can theoretically pull out of the deficit if you really want to, especially with Crossbow Set giving some Dodge]_; Starting Ranged Damage -10 -> -15 _[To prevent Crossbows from being overly strong]_; Starting Engineering -10 -> -15 _[To complete the pattern]_
* **Cryptid:** Bonus XP/Gold Per Living Tree 12 -> 11
* **Cyborg:** No longer favored to find Engineering Items - now favored to find Structure Items specifically.
* **Demon:** Materials to 1 HP Ratio 13 -> 14
* **Doctor:** Harvesting 5 -> 0; Starting HP Regeneration 5 -> 3; HP Regeneration is Doubled -> HP Regeneration modifications are increased by 100% _[This is mostly the same, but makes it much more clear what your HP Regen is actually at.]_
* **Engineer:** No longer starts with a Wrench; Starting Engineering 10 -> 5; Elemental Damage Penalty -50% -> -20% _[Allows Engineer to lean into a mixed Engineering+Elemental build if desired, and makes more sense for Plank as a starting weapon.]_
* **Explorer:** No longer favored to find 'Pickup' Items (Metal Detector, Baby Elephant, Cute Monkey, Pickup Range, Material Attract).
* **Farmer:** Now starts with a Garden; Now also favored to find Gardens in the shop _[A flavorful buff to a character that's more impacted by nerfs to tier-1 Harvesting and Fertilizer than most, and one that is most relevant for their weaker, non-Pruner-based builds.]_
* **Gladiator:** -30 Luck -> -40
* **Glutton:** Now also favored to find Gardens in the shop; Explosion crit chance now properly affected by Crit Chance (base chance is still 3%)
* **Jack:** Bonus to Bosses 75% -> 100% _[Bosses have ~2.8x more HP on Danger-5 (3.5x on D0), so even at 100% they have a lot more effective HP than average characters but with the upside of being easier to focus your fire.]_; Damage from enemies +50% -> +40%; Clarified how their material bonus works (same as vanilla)
* **King:** Now only gives Attack Speed and Damage for every *different* tier-4 weapon; Bonus Attack Speed & Damage 25% -> 20%; now shows an icon for tier-1 and tier-4 items you haven't purchases yet.
* **Knight:** 2 Melee Damage per 1 Armor -> 3 Melee Damage per 2 Armor; Armor 5 -> 4 _[Makes a strong character a bit less 'free', and means that an Armor level-up is no longer *strictly* better than Melee Damage.]_
* **Loud:** -3 Harvesting per Wave -> -4; Now guaranteed to have Horde Waves on 11/12 and 14/15 (Still gets an Elite on 17/18)
* **Lucky:** 100 Starting Luck -> 75; Luck Modifications +25% -> +40%; Attack Speed -60% -> -50%; Now tracks and deals damage independently of Baby Elephant; (Luck stat slightly better and slightly easier to come by)  _[This makes you care more about actually raising Lucky's Luck stat and allows their passive and Baby Elephant to hit different targets. Takes a good while to break even with vanilla Lucky (+130 Luck), so gets slightly better Attack Speed to compensate.]_
* **Mage:** -100% Engineering Mods -> -33% _[Gives the ability to lean into Sausage+Turret combo more, and means Strange Book actually does something.]_; Now starts with a 2nd Sausage when starting with SMG or Shotgun.
* **Masochist:** HP Regen 20 -> 15; Armor 8 -> 5 _[Modest nerfs to a very strong character.]_
* **Mutant:** No longer favored to find XP-Gain Items. _[Because the effect is additive, they get _less_ benefit from these items than anyone else.]_
* **One-armed:** Now gains a 4-Set bonus of whichever weapon they have equipped (except for Legendary). _[A specialized buff to a difficult character that really helps some of their less-viable builds like Shuriken.]_
* **Ranger:** No longer starts with a Pistol.
* **Renegade:** Additional Malus: +2% Items Price at the end of each wave; Now shows reminder icons for item boxes as well.
* **Soldier:** 200% Pickup Range -> 150%
* **Speedy:** Starting Speed 30% -> 25% _[More room to meaningfully increase from where you start]_; Starting Armor -3 -> -2
* **Streamer:** Now gets +2 Armor from Pocket Factory; Now favored to find Stand-still Items and Structure Items (All Structures including Garden, and also including Pocket Factory and Improved Tools).
* **Wildling:** No longer starts with a Stick.
_[Initial weapon removals (Crazy, Ranger, Wildling, Engineer) make those characters more varied by making the starting weapon choice actually matter more, preventing the default fall-back option.]_

### Starting Weapons
* **Apprentice:** Added Medical Gun; Removed Pistol, Wrench
* **Chonky:** Added Taser, Revolver; Removed Hand
* **Crazy:** Added Crossbow
* **Cyborg:** Removed Crossbow
* **Demon:** Added Wrench, Potato Thrower
* **Engineer:** Removed Hammer
* **Entrepreneur:** Added Ghost Flint, Hatchet, Bokken, Crossbow, Claw, Plank; Removed Wand
* **Explorer:** Added Hand, Ghost Axe, Jousting Lance
* **Farmer:** Added Slingshot, Thief Dagger, Bokken
* **Fisher:** Added Plank, Pruner, Scissors; Removed Screwdriver
* **Generalist:** Added Scissors, Ghost Flint, Fist, Shredder, Ghost Scepter; Removed Lighting Shiv, Pistol
* **Gladiator:** Added Hatchet, Lightning Shiv
* **Glutton:** Removed Hatchet
* **Golem:** Added Crossbow, Ghost Scepter
* **Hunter:** Added Scissors, Shotgun
* **Jack:** Added Spiky Shield; Removed Pistol, Wrench, Shuriken
* **King:** Added Jousting Lance, Rocket Launcher
* **Knight:** Added Bokken, Pruner, Plank, Rock, Fist, Knife, Scissors, Cacti Club; Removed Spiky Shield
* **Lich:** Added Lightning Shiv
* **Loud:** Added Screwdriver; Removed Pruner, Revolver, Taser, Wand
* **Lucky:** Added Jousting Lance, Torch, Pruner
* **Mage:** Added Wrench
* **Masochist:** Added Torch; Removed Ghost Scepter
* **Multi-tasker:** Added Rock, Ghost Flint
* **Mutant:** Added Lightning Shiv
* **Old:** Added Revolver
* **One-armed:** Removed Screwdriver, Ghost Flint, Pistol, Fist, Crossbow, Wand, Chopper, Laser Gun; Added Sword, Hammer, Flaming Brass Knuckles
* **Pacifist:** Added Scissors, Rock
* **Ranger:** Added Slingshot
* **Renegade:** Added Shuriken, Slingshot
* **Saver:** Added Fist, Stick, Chopper, Pruner
* **Sick:** Added Cacti Club, Hatchet, Pruner, Ghost Flint; Removed Hand
* **Soldier:** Added Lightning Shiv
* **Speedy:** Added Ghost Flint, Pruner; Removed Wrench
* **Streamer:** Added Ghost Scepter; Removed Bokken, Rock, Jousting Lance, Knife, Lightning Shiv, Claw
* **Well-rounded:** Added Fist, Wrench, Slingshot

# Now Live
These changes were originally made for Balance Mod but are now implemented into the main game:
- Bugfixed Wave 3 shops so they can now sell more than 1 weapon.
- Revolver & Chain-gun: Fixed a bug that caused them to instantly reload (skipping their Long Reload's extended cooldown) when used alongside any effect that checks if you're moving (e.g. Solider).
- Stats now update properly on shop reroll (for Saver).
- Bugfixed Multi-tasker cooldown randomization so it isn't so extreme.
