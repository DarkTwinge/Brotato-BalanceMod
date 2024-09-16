**!! In-progress updates accounting for new changes to the base game; this list will be inaccurate for the old version (and potentially also the new version) during the transition. !!**

# Overview
(Will be re-added once things are more stable.)

# Support Me
Tune into my stream where I play a wide variety of indie games: https://www.twitch.tv/darktwinge

If you'd like to financially support my ability to make and maintain mods like this, you can do so on Patreon: http://www.patreon.com/DarkTwinge or directly: https://paypal.me/DarkTwinge

# Full Changelog
## General Changes
* Clarified various tooltips to be more clear. Shortened several character effect descriptions to fit in the box better. Tooltips for Armor and Improved Tools + Gardens are more precise. Knight's tooltip color-coded properly. Fixed Lightning Shiv's bounce count. Fixed Incendiary Turret tooltip's incorrect damage rounding.
* {Explosion tooltips}

_Other general changes have not been ported yet, as they require more complex code changes to be updated with the beta version — but should be coming soon._

## Level-ups
* **Range:** 15/30/45/60 -> 20/35/50/70
* **Luck:** 5/10/15/20 -> 5/11/18/26
* **Harvesting:** 5/8/10/12 -> 4/8/11/15
* **HP Regen** Tier-4: 5->6
* **Engineering** Tier-4: 5->6
* **Crit Chance** Tier-4: 9->10

## Items
### Tier-1
* **Alien Tongue**: +30% Pickup Range -> +40%; +1 Knockback -> +2; Price 25->23
* **Baby Gecko**: Range 10->14
* **Bag**: Price 15->16
* **Beanie**: -6 Range -> -7
* **Boxing Glove**: +3 Knockback -> +4
* **Broken Mouth**: Price 25->26
* **Cake**: Price 15->16
* **Coupon**: Price 15->19
* **Cute Monkey**: Price 25->34; Proc Chance 8%->10%; Limit 13->10
* **Duct Tape**: Price 20->15
* **Fertilizer**: Price 15->19; Harvesting 8->7
* **Glasses**: Price 25->23; Range 20 -> 26
* **Head Injury**: Price: 25->24; 6% Damage -> 7%; -8 Range -> -2% Speed _[Swapped downside with Helmet so that this doesn't mirror Cyclops worm so directly.]_
* **Hedgehog**: Price 30->25
* **Helmet**: Price 15->20; -2% Speed -> -10 Range _[Swapped downside with Head Injury so that Injury doesn't mirror Cyclops Worm so directly and so Helmet doesn't mirror Warrior's Helm.]_
* **Landmines**: Price 15->14
* **Lens**: -5 Range -> -10
* **Lost Duck**: Luck 8->9
* **Lumberjack Shirt**: Price 15->13
* **Mutation**: Price 25->19; -3 Knockback -> -2 _[You rarely want both Elemental and Ranged together, and this is nicely cheap when you do; otherwise still kind of expensive-but-occasionally-worth when you just want one.]_
* **Propeller Hat**: Price 28->25
* **Scared Sausage**: Price 25->20; Tooltip now mentions hidden mechanic of improving natural burn _[Helps encourage mixed builds by being more affordable in so-so situations.]_
* **Snake**: Price 25 -> 23; No Limit -> Limit 3 _[Makes it so they no longer show up once you have as many as you need.]_
* **Terrified Onion**: Price 15->12
* **Turret**: Price 15->16 _[Almost always better than Landmines, so they get a mild cost difference.]_
* **Weird Food**: Now Tier-2; Price 20->27; -2% Dodge -> -2 HP _[Makes it easier to find in Luck-heavy builds, and now has a more general stat tax rather than only punishing Dodge for an item dodge-builds often really want.]_

### Tier-2
* **Acid**: Price 65->64
* **Alien Eyes**: Price 50->55; No Downside -> -8 Range
* **Banner**: Range 20 -> 25
* **Blindfold**: -15 Range -> -18
* **Blood Leech**: Price 45->41
* **Campfire**: Price 40->46; HP Regen 2 -> 3 _[The idea here is to make it buyable for either stat and good if you want both stats.]_
* **Cyclops Worm**: -12 Range -> -16
* **Dangerous Bunny**: No Downside -> -2% Dodge; Limit 3 -> 4
* **Energy Bracelet**: 4% Crit Chance -> 5%
* **Garden**: Price 50->47
* **Incendiary Turret**: Price 40->47; 33% Engineering Scaling -> 35% _[Makes the rounding less abysmal.]_
* **Leather Vest**: Price 45->50
* **Little Frog**: Price 45->43; +20% Pickup Range -> +35%
* **Little Muscley Dude**: Range -15 -> -18
* **Lure**: Price 34->37
* **Medal**: Price 55->60; -4% Crit Chance -> -3%
* **Metal Detector**: -5% Damage -> -4%
* **Metal Plate**: Price 40->42
* **Missile**: Price 45->41; 10% Damage -> 11%
* **Piggy Bank**: Price 40->45
* **Pocket Factory**: 2 Engineering -> 3 _[Many people like this item a lot, but if you look at its actual damage output in practice it tends to be very lackluster for its cost outside of its best-case scenarios.]_
* **Pumpkin**: -2% Damage -> No Penalty; Now also gives +15% Bounce damage (only relevant for Ricochet); No Limit -> Limit 8 _[This item's real effect is less than people expect it to be, so I remove the downside. Limit is mostly irrelevant, but will stop it from showing up in deep endless if you've already maxed the possible value.]_
* **Recycling Machine**: No downside -> -2% Attack Speed
* **Riposte**: Price 40->33
* **Ritual**: Price 60->57
* **Scope**: Price 55->52; 25 Range -> 40; -7% Attack Speed -> -6%
* **Shady Potion**: 20 Luck -> 19
* **Spicy Sauce**: Price 40->41; 33% Proc Chance -> 35%; Explosion Size 125% -> 140%; Can now crit for 1.5x damage (base Crit Chance 1%); Clarified effect of having multiple copies _[35% is just so it will have a full 100% proc chance if you have all 3.]_
* **Wheelbarrow**: Price 40->37
* **Whetstone**: Price 40->42
* **White Flag**: 5 Harvesting -> 6

### Tier-3
* **Adrenaline**: Price 60->55
* **Alien Magic**: Price 85->82
* **Alloy**: 3 Melee Damage -> 5 ; Dodge -6% -> -5%; Added 'Elemental Damage' Tag
* **Baby With a Beard**: Price 100->110; Range -50 -> -70
* **Blood Donation**: Price 50->45 _[The primary 'cost' is the damage, so the material cost should be a bit lower.]_
* **Bowler Hat**: Price 75->72; 15 Luck -> 17
* **Candle**: Price 65->50; Elemental Damage 4 -> 3; -5% Damage -> -4% Attack Speed _[Now more reasonable to take this primarily for the reduced enemy count.]_
* **Chameleon**: Price 70->56; %Damage -4% -> -3% _[The least-reliable and most awkward stand-still item made more accessible.]
* **Community Support**: Price 75->72
* **Crown**: Price 70->68
* **Fairy**: Price 85->90; 1 HP Regeneration Per 1 Unique Tier-1 Item -> 2 HP Regeneration Per 3 Unique Tier-1 Items -2 HP Regeneration Per 1 Unique Tier-4 Item -> -3% Speed Per 1 Unique Tier-4 Item
* **Fin**: 10% Speed -> 9%; Luck -8 -> -9 
* **Glass Canon**: Price 75->70
* **Hunting Trophy**: Price 55->52; Proc Chance 33% -> 25%; Limit 3->4
* **Lucky Charm**: Price 75->70
* **Plastic Explosive**: Price 60->55
* **Poisonous Tonic**: 15 Range -> 27
* **Power Generator**: Price 65->72; -5% Damage -> -1 Max HP Per 5% Speed; Added '%Damage' Tag
* **Rip and Tear**: Price: 65->59; Harvesting -12 -> -11; Can now crit for 1.5x damage (base Crit Chance 1%); Clarified effect of having multiple copies
* **Shackles**: Price 80->86; Range 80 -> 88
* **Shmoop**: Price 60->65; 2 HP Regen -> 3
* **Statue**: Price 60->55
* **Tardigrade**: Price 50->45
* **Toolbox**: 6 Engineering -> 7; -8% Attack Speed -> -5%
* **Vigilante Ring**: Price 92->82
* **Wandering Bot**: Price 60->53
* **Wheat**: Price 85->83; Harvesting 10->13
* **Wings**: Range 30 -> 35

### Tier-4
* **Bloody Hand:** Price 100->110
* **Explosive Shells:** Explosion Damage +60% -> +50%; Explosion Size +15% -> +20%; -15% Damage -> -7% Damage _[So it fits in more reasonably with mixed builds, and with a little more emphasis on the more-unique size rather than just damage.]_
* **Focus:** Price 110->100; Attack Speed penalty per weapon -3% -> -4%
* **Gnome:** 10 Melee Damage -> 12; 10 Elemental Damage -> 8; Range -20 -> -25
* **Heavy Bullets:** Price 100->95; +10 Range -> +5% Crit Chance; -5% Crit Chance -> -35% Accuracy; (Replaced 'Range' tag with 'Crit Chance') _[Also see below in the Ranged Weapons section for a few Accuracy tweaks that're primarily relevant if you have Heavy Bullets.]_
* **Jet Pack:** Price 100->92; HP -5 -> -3
* **Lucky Coin:** Price: 100->70; -2 Armor -> -1 Armor
* **Mammoth:** Melee Damage 20 -> 18; HP Regen 5 -> 4; -3% Speed -> -4%
* **Medikit:** Price: 95 -> 105; Starting HP Regen 10 -> 4
* **Night Goggles:** Price 90->85; Crit Chance 15%->14%; Range 50->80; -3 HP -> -4% Speed _[Now more worthwhile if you mostly care about the range.]_
* **Octopus:** Price 105->110
* **Potato:** Price 95->100
* **Regeneration Potion:** HP Regeneration 3 -> 4
* **Retromation's Hoodie:** +2% Attack Speed for every 1% Dodge -> +3% Attack Speed for every 2% Dodge; -80 Range -> -90 Range
* **Ricochet:** Damage -25% -> -20%; All weapons that naturally pierce now have a default bounce damage of 70% instead of 50% (Crossbow, Shotgun, Laser Gun, Pistol, Shredder, Minigun, Obliterator, Chain-gun, Gatling Laser, Flamethrower, Icicle, Laser Turret). _[In vanilla, it's a red-tier item that only works on ranged weapons to begin with, but then still ends up worthless on weapons like Shotgun and Shredder making it overly niche.]_
* **Spider:** Price 120->112; Attack Speed Per Different Weapon 6% -> 8%; 12% Damage -> 8%
* **Wolf Helmet:** Price 90->95; Additional Downside of -5 Harvesting

## Weapons
### Set Bonuses
* **Blunt:** -2/-4/-6/-8/-10 Speed -> -1/-2/-3/-4/-5 Speed
* **Primitive:** 3HP Per -> 2HP Per
* **Guns:** 10/20/30/40/50 Range -> 2/4/6/8/10 Attack Speed _[Guns having a bunch of free Range is part of why they don't care about the stat much at all. Additionally, they're a strong and flexible archetype, so they don't need as many free stats from a Set as other weapons do.]_

### Melee
* **Fist:** Price 10/22/45/91 -> 12/26/52/105; Cooldown 0.78/0.73/0.69/0.59 -> 0.79/0.74/0.71/0.61
* **Ghost Flint:** Tier-1 Damage 6->7; Tier-1 Cooldown 1.23 -> 1.24 _[Helps tier-1 not be so hopelessly behind it can never kill enough enemies to proc on characters that don't have extra damage to start.]_
* **Hand:** Price 10/22/45/91 -> 9/19/33/63; Harvesting 3/6/9/18 -> 2/5/10/20 _[This progression makes it worth upgrading past Blue-tier, which is broadly a mistake in vanilla.]_
* **Hatchet:** Range 125->135
* **Plank:** Explosion Size 75%(All) -> 80%/90%/100%/110%; Scaling: 50%/55%/60%/65% -> 50%/60%/70%/80%
* **Plasma Sledgehammer:** Explosion Size 100%/125% -> 110%/130%; Explosion Chance 25%/50% -> 33%/50%
* **Spear:** Range 350/375/400/500 -> 325/350/375/450; Cooldown 1.52/1.40/1.28/1.24 -> 1.53/1.41/1.32/1.25 (Accounting for the new lower starting Range)
* **Torch:** Larger hitbox _[Now will actually hit enemies right on top of you.]_

### Ranged
- **Chain-gun:** Long Reload Cooldown 2.04s -> 3.71s; Accuracy 80% -> 55% _[For reference, Tier-1 SMG is 70%.]_
- **Potato Thrower:** Added to the Blunt Weapon Set; Price 36/69/139 -> 33/65/118; Base Damage 1(All) -> 2/3/4 _[Allows it to find some synergy options when picked as a starting weapon.]_
- **Revolver:** Tier-1 Price 20 -> 18; Range 450 -> 425
- **Rocket Launcher:** Range 500/550/600 -> 500(All)
- **SMG:** Range 400 -> 350
- **Sniper Gun:** Range 800/1000 -> 550/550; Ranged Damage Scaling 100%(All) -> 200%/250%; Projectile Base Damage 5->4 _[Given that it's in the Gun Set, it should at least passably scale from Ranged Damage and fit into a Gun build - even with these scaling amounts it still scales worse than a Pistol.]_

* **Other Minor Accuracy Tweaks** (mostly only relevant if Accuracy is lowered by Heavy Bullets): Medical Gun 0.9(Tier1-3)->1.0(All); SMG 0.7/0.75/0.8/0.85->0.7/0.74/0.77/0.8; Mini-gun 0.85/1.0 -> 0.8/1.0; Shotgun 0.9/0.95/1.0/1.0->0.9(All); Potato Thrower 0.9(All)->1.0(All); Rocket Launcher 0.8/0.9/1.0-> ; 0.9(All) _[For reference, Revolver is 0.9(All), and most other unlisted weapons are 1.0(All).]_

## Characters
* **Brawler:** Unarmed Attack Speed Bonus 50% -> 40%; Now applies their +AttackSpeed Bonus to weapons that scale with Attack Speed (Claw)
* **Bull:** Starting HP Regen 15 -> 10
* **Crazy:** No longer starts with a Knife; Starting Dodge -30% -> -15% _[Silly, but if this isn't going to be -100%, it might as well be an amount you can theoretically pull out of the deficit if you really want to, especially with Crossbow Set giving some Dodge]_; Starting Ranged Damage -10 -> -15 _[To prevent Crossbows from being overly strong]_; Starting Engineering -10 -> -15 _[To complete the pattern]_
* **Cryptid:** Bonus XP/Gold Per Living Tree 12 -> 11
* **Demon:** Materials to 1 HP Ratio 13 -> 14
* **Doctor:** Harvesting 5 -> 0; Starting HP Regeneration 5 -> 3; HP Regeneration is Doubled -> HP Regeneration modifications are increased by 100% _[This is mostly the same, but makes it much more clear what your HP Regen is actually at.]_
* **Engineer:** No longer starts with a Wrench; Starting Engineering 10 -> 5; Elemental Damage Penalty -50% -> -20% _[Allows Engineer to lean into a mixed Engineering+Elemental build if desired, and makes more sense for Plank as a starting weapon.]_
* **Explorer:** No longer favored to find 'Pickup' Items (Metal Detector, Baby Elephant, Cute Monkey, Pickup Range, Material Attract).
* **Farmer:** Now starts with a Garden; Now also favored to find Gardens in the shop _[A flavorful buff to a character that's more impacted by nerfs to tier-1 Harvesting and Fertilizer than most, and one that is most relevant for their weaker, non-Pruner-based builds.]_
* **Gladiator:** -30 Luck -> -40
* **Glutton:** Now also favored to find Gardens in the shop
* ~~~Jack~~~ -75% Enemies -> -70% [Probably will change in upcoming beta updates]
* **Knight:** 2 Melee Damage per 1 Armor -> 3 Melee Damage per 2 Armor; Armor 3 -> 4 _[Means that an Armor level-up is no longer *strictly* better than Melee Damage.]_
* **Loud:** -3 Harvesting per Wave -> -4
* **Lucky:** 100 Starting Luck -> 75; Luck Modifications +25% -> +40%; Attack Speed -60% -> -50%; (Luck stat slightly better and slightly easier to come by)  _[This makes you care more about actually raising Lucky's Luck stat and allows their passive and Baby Elephant to hit different targets. Takes a good while to break even with vanilla Lucky (+130 Luck), so gets slightly better Attack Speed to compensate.]_
* **Mage:** -50% Engineering Mods -> -33% _[Vanilla partially adapted this change, but 50% is still oppressive for making this alt built work, while 33% is more in the hard-but-manageable range.]_
* **Masochist:** HP Regen 20 -> 15; Armor 8 -> 5 _[Modest nerfs to a very strong character.]_
* **Ranger:** No longer starts with a Pistol.
* **Renegade:** Additional Malus: +2% Items Price at the end of each wave. _[Renegade's early game is moderately challenging, while their late game tends to be quite easy. This ramps up the shop costs over time, which leaves the early game fairly similar but makes the later game less trivial.]_
* **Soldier:** 200% Pickup Range -> 150% _[Gives Soldier reason to care about Pickup Range items a bit.]_
* **Speedy:** Starting Speed 30% -> 25% _[More room to meaningfully increase from where you start]_; Starting Armor -3 -> -2
* **Streamer:** Now also favored to find Stand-still Items.
* **Wildling:** No longer starts with a Stick.
_[Initial weapon removals (Crazy, Ranger, Wildling, Engineer) make those characters more varied by making the starting weapon choice actually matter more, preventing the default fall-back option.]_

### Starting Weapons
My goal with starting weapon tweaks is to add more variety where possible while removing options that just don't make sense for the character (e.g., weapons with bad scaling on characters all about damage stats) or are especially unfun to hit from a random weapon selection. I also aim to _mostly_ stick with items that feel somewhat thematically appropriate.
* **Apprentice:** Added Medical Gun; Removed Pistol
* **Chonky:** Added Taser, Revolver; Removed Hand
* **Cyborg:** Removed Crossbow
* **Demon:** Added Wrench, Potato Thrower
* **Engineer:** Removed Hammer
* **Entrepreneur:** Added Ghost Flint, Crossbow, Claw, Plank; Removed Wand
* **Explorer:** Added Ghost Axe, Thief Dagger
* **Farmer:** Added Slingshot, Thief Dagger
* **Fisher:** Added Plank, Pruner, Scissors; Removed Screwdriver
* **Generalist:** Added Scissors, Ghost Flint, Fist, Shredder, Ghost Scepter; Removed Lighting Shiv, Pistol
* **Gladiator:** Added Hatchet, Lightning Shiv
* **Glutton:** Removed Hatchet
* **Golem:** Added Crossbow, Ghost Scepter
* **Hunter:** Added Scissors, Shotgun
* **Jack:** Added Spiky Shield; Removed Pistol, Shuriken
* **King:** Added Jousting Lance, Rocket Launcher, Fireball
* **Knight:** Added Quarterstaff, Pruner, Plank, Rock, Fist, Knife, Scissors, Cacti Club; Removed Spiky Shield
* **Lich:** Added Lightning Shiv, Rock
* **Loud:** Added Screwdriver; Removed Revolver, Taser, Wand
* **Lucky:** Added Jousting Lance, Torch, Pruner
* **Mage:** Added Wrench
* **Masochist:** Added Torch; Removed Ghost Scepter
* **Multi-tasker:** Added Ghost Flint
* **Mutant:** Added Lightning Shiv
* **Old:** Added Revolver
* **One-armed:** Removed Screwdriver, Ghost Flint, Pistol, Fist, Crossbow, Wand, Chopper, Laser Gun; Added Sword, Hammer, Flaming Brass Knuckles, Fireball
* **Pacifist:** Added Scissors, Rock, Spiky Shield
* **Ranger:** Added Shotgun, Slingshot; Removed Pistol
* **Renegade:** Added Shuriken, Slingshot
* **Saver:** Added Fist, Stick, Chopper, Pruner
* **Sick:** Added Cacti Club, Hatchet, Pruner, Ghost Flint; Removed Hand
* **Soldier:** Added Lightning Shiv
* **Speedy:** Added Ghost Flint, Pruner; Removed Wrench
* **Streamer:** Added Ghost Scepter; Removed Quarterstaff, Rock, Jousting Lance, Knife, Lightning Shiv, Claw
* **Vagabond:** Added Ghost Flint
* **Well-rounded:** Added Slingshot

## Enemies
### Wave Spawns
* **Wave 12:** Mummy Spawns 10 -> 16 _[For comparison, Wave 11 averages 32.5 Mummies.]_
* **Wave 14:** Helmet Spawns 108 -> 85 (Helmets have more HP - this is slightly more total HP); Basics spawns earlier (Makes the first ~15s a bit less empty, total 120->130 Basics); Single Magician Spawns 1-2 x6 -> 1-1 x6 _[Removes the variance which removes the chance for an especially unlucky wave, and makes it so _most_ of the fireball hurlers come from the Wizard Hats which you have more control over.]_
* **Wave 15:** Helmet Spawns 114 -> 95 (Helmets have more HP; this is moderately more total HP)
* **Wave 16:** Helmets have more HP but just as many spawn; 2 Flies added to each group of Helmets + Buffers (28 total); Helmet Groups a bit more spread out (500->700) [Aiming to make them less trivially smashed by melee quickly]; 2 additional groups of 1 Bruiser + 1 Armored Bruiser spawn, and they show up 10 seconds earlier (18 -> 22 total)
* **Wave 20:** Added additional Basics (5 every 5s = 80 total) and Fins (5 every 6s = 65 total), primarily to help out effects which are based on enemy/material counts (but also potentially makes things a bit harder, especially for Ranged builds).
* **Wave 14 & 15 Hordes:** Added 6 single Magician spawns alongside 6 single Wizard Hats (Spawners) spread out over the last 2/3rds of the wave; Reduced some of easier enemy spawns so they're less likely to despawn the more-threatening enemies; Made the added Helmets and Fins in the 2nd half spawn on the edges of the map to make them harder to deal with; Made the Horde additions identical for 14/15. _[Aiming to make these Horde waves feel threatening, rather than often easier and simply more profitable than their non-Horde counterparts like they are in vanilla.]_

### Elites
* **Hivemind/Colossus Elite:** Phase 2 Cooldown 0.9s -> 1.05s _[Gives a bit more breathing room during the rapid onslaught of Phase 2.]_
* **Rhino Elite:** Base Speed 250 -> 275; Phase 1 Charge Speed 900->1150 (& Charge Duration 1.0->0.95); Phase 2 Charge Speed 1000->1050
* **Mantis Elite:** Phase 2 Cooldown 1.33s -> 1.25s; Phase 2 Charge Duration 0.7s -> 0.85s; Phase 2 Charge Speed 800 -> 740 (Total Distance 560 -> 629) _[Aiming to differentiate Mantis and Rhino more while making both a bit harder.]_
* **Chef/Butcher Elite:** Phase 2 Max Range 1200 -> 3500; Phase 3 Max Range 2000 -> 3500 _[These changes make it so you can't get out of range of the slashes, most relevant for Explorer]_; Phase 3 Slice Attack Damage Per Wave 0.75 -> 0.85 _[~1-3 more damage; still less damage than any other Elite attack]_

### Standard Enemies
+ **Small Charger:** Knockback Resistance 80% -> 75%
+ **Small Viking Charger:** Knockback Resistance 80% -> 75%
+ **Tall Bruiser:** Knockback Resistance 90% -> 85%
+ **Tall Armored Bruiser:** Knockback Resistance 90% -> 85%
+ **Hatched Slasher:** Knockback Resistance 90% -> 85%
+ **Lamprey Fish:** Knockback Resistance 95% -> 90%
_[The base game has mostly implemented my tweaks here, but it still felt too difficult for Knockback to be impactful so I go a small step further.]_


# Other Resources
Fully unlocked pre-Beta Brotato save file (with blank character completion so you can still track your progress): https://www.darktwinge.com/skip-metaprogression-unlocks/brotato-save-file/

You might also enjoy my FTL Balance Mod: https://www.darktwinge.com/ftl-balance/index.php

# Thanks To
Inschato, ArosRising, Hyphen-ated, Pasha, and everyone else that's assisted with feedback, suggestions, or coding help!
Also thanks to Blobfish for being generally receptive to feedback and suggestions, implementing many Balance Mod changes directly into the base game.

# License
You are free to use concepts and code contained within elsewhere, ideally with attribution. E.g. if you want to make a spin-off mod for, say, only the Elite changes, you are welcome and encouraged to do so but I'd appreciate a link back to the Balance Mod and/or to my stream.


# Now Included in Vanilla
These changes were originally made for Balance Mod but are now implemented into the main game:
- Bugfixed Wave 3 shops so they can now sell more than 1 weapon.
- Revolver & Chain-gun: Fixed a bug that caused them to instantly reload (skipping their Long Reload's extended cooldown) when used alongside any effect that checks if you're moving (e.g. Solider).
- Stats now update properly on shop reroll for Saver.
- Bugfixed Multi-tasker cooldown randomization so it isn't so extreme.
- Knockback now never moves the enemy towards the player.
- Bugfixed inaccurate long cooldown tooltip for Revolver & Chain-gun.
- Weapons with very low cooldowns (such as SMG or Minigun) now show an extra decimal place in their cooldown for better accuracy.


* **Loot Goblin:** Base HP  50->2; HP/wave 25->30 _[Makes early Loot Goblins far more reasonable to kill and late-game ones slightly harder to kill.]_
* **Helmet Enemy:** Base HP 8->4; HP/wave 3->4.5  _[Aim is to make them feel like a more meaningful presence on the field, especially for Wave 16 where, when buffed (red outline), they go from 185hp in vanilla to 250hp in Balance Mod.]_
* **Tentacles:** Fruit Drop Chance 1% -> 2%; Convert-to-Item-Crate Chance 1% -> 4%
+ **Spawned Magician:** Knockback Resistance 0% -> 40% _[Makes them a little easier to kill with high-knockback weaponry.]_
* **Gargoyle/Bat Elite:** Base Speed 350 -> 365; Phase 1 Initial Cooldown 2s->1s; Phase 1 Circle Size 1000->930; Phase 1 to 2 Switch Timing 30s elapsed -> 25s or 60% HP -> 65% HP (meaning they switch phases sooner); Phase 2 Movement Speed 75% -> 85%; Phase 2 Projectiles 12->24 & Projectile Spread 600->710; Phase 3 Projectiles-per-burst 3->4 & Projectile Speed 200->235; Phase 3 Distance-from-Player 225->270 _[So it's not such a convenient distance to just sit and smack with melee weapons]_; Phase 3 Movement Speed 60% -> 58% (About the same as vanilla given the higher base speed)

* **Coffee**: +10% Attack Speed -> 9% 
* **Gummy Berserker**: Price 25->23; 15 Range -> 25
* **Scar**: Price 30->25; Range -8 -> -11
* **Plant**: HP Regeneration 3 -> 2

* **Black Belt**: Price 50->47
* **Eyes Surgery**: Price 60->47; New Additional Effect: Also adds +1 duration to all burn effects; -10 Range -> No Downside
* **Gambling Token**: Price 60->52; 8% Dodge -> 10%
* **Tentacle**: Price 32->35

* **Bean Teacher**: Price 70->64
* **Stone Skin**: Price 80->88; -2 Armor -> -4% Speed
* **Tyler**: 1.0 Engineering Scaling -> 0.8; Elemental Damage Scaling -> 0.8; Added to Elemental Damage Tag Pool. _[Another item to help enable the mixed Engineering+Elemental build.]_
* **Wisdom**: Damage -20% -> -16%; Price 85->80

* **Big Arms:** Price 105->100; 12 Melee Damage -> 13
* **Diploma:** Price 80->85; Engineering 10 -> 12; 20% XP Gain -> 25%
* **Exoskeleton:** Price 90->105; Armor 5 -> 4
* **Sifd's Relic:** Price 100->50
Robot Arm Rework


* **Chain-gun, Gatling Laser, Tier-4 Minigun:** Fixed cooldown to no longer incorrectly display in red (visual change only).

* **Artificer:** Tools Have +100% Damage.
* **Cyborg:** No longer favored to find Engineering Items - now favored to find Structure Items specifically.
* **Mutant:** No longer favored to find XP-Gain Items. (Obsoleted by a minor rework that actually makes XP items worthwhile instead.)
* **Jack:** Bonus to Bosses 75% -> 100% _[Bosses have ~2.8x more HP on Danger-5 (3.5x on D0), so even at 100% they have a lot more effective HP than average characters but with the upside of being easier to focus your fire.]_; Damage from enemies +50% -> +40%; Clarified how their material bonus works (same as vanilla)
* **Streamer:** Now gets +2 Armor from Pocket Factory
[Various starting weapons were added to vanilla]

* **Fighting Stick** renamed.
* **Plasma Sledgehammer:** Renamed Plasma Sledge _[Makes room to show the weapon's tags.]_

- **Sniper Gun:** Projectile Crit Chance 3%/3% -> 20%/20%; Projectile Crit Damage 2.0/2.0 -> 3.0/4.0


* **Smiley/Croc Elite:** Contact Damage Per Wave 1.5 -> 1.3 _[~2-5 less damage]_; Phase 2 Circle Size 450->480; Phase 2 Cooldown 0.75s -> 0.85s
* **Mother Elite:** Phase 1 Initial Cooldown 2s->1.67s; Phase 2 now switches between a) summoning rapidly (9 Fins per second, vanilla behavior) but slicing half the time, and b) summoning slowly (3 Fins per second) and slicing constantly (vanilla behavior)