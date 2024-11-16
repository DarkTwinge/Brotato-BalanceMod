**!! In-progress updates accounting for new changes to the base game; this list will be inaccurate for the old version (and potentially also the new version) during the transition. !!**

# Overview
(Will be re-added once things are more stable.)

# Support Me
Tune into my stream where I play a wide variety of indie games: https://www.twitch.tv/darktwinge

If you'd like to directly support my ability to make and maintain mods like this, you can do so on Patreon: http://www.patreon.com/DarkTwinge or directly: https://paypal.me/DarkTwinge

# Full Changelog
## General Changes
* Armor is about 7% less effective (Each point is +6.25% Effective HP instead of +6.67%). _[This probably still leaves it as the strongest general stat, but now closer to its peers.]_

* Having multiple different weapon types will make the shop more likely to offer you an exact-match of a weapon you already have. In vanilla, this is always a 20% chance; now it's 19%/20%/22%/24%/25% for having 1/2/3/4/5+ different weapon types.
* When a shop tries to offer you an exact weapon you have but can't, it will now offer you a same-set weapon (previously it just reverted to a random weapon). This makes it a little easier to match-up a starting tier-2+ only weapon (e.g. Potato Thrower or Sword) with something relevant.
* Tier-4 weapons are significantly cheaper, primarily as an indirect buff to Luck and mixed-weapon builds. Other weapon prices are cleaned up and have slightly more logical progression.
* {Explosion tooltips; Items broken}

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
* **Alien Tongue:** +30% Pickup Range -> +40%; +1 Knockback -> +2; Price 25->23
* **Baby Gecko:** Range 10->12
* **Bag:** Price 15->16
* **Beanie:** -6 Range -> -7
* **Book:** Price 8->7
* **Boxing Glove:** +3 Knockback -> +4
* **Broken Mouth:** Price 25->26
* **Cake:** Price 15->16
* **Coupon:** Price 15->19
* **Cute Monkey:** Price 25->34; Proc Chance 8%->10%; Limit 13->10
* **Duct Tape:** Price 20->15
* **Fertilizer:** Price 15->17; Harvesting 8->7
* **Glasses:** Range 20 -> 22
* **Head Injury:** Price: 25->24; 6% Damage -> 7%; -8 Range -> -2% Speed _[Swapped downside with Helmet so that this doesn't mirror Cyclops worm so directly.]_
* **Hedgehog:** Price 30->25
* **Helmet:** Price 15->19; -2% Speed -> -10 Range _[Swapped downside with Head Injury so that Injury doesn't mirror Cyclops Worm so directly and so Helmet doesn't mirror Warrior's Helm.]_
* **Landmines:** Price 15->14
* **Lens:** -5 Range -> -10
* **Lost Duck:** Luck 8->9
* **Lumberjack Shirt:** Price 15->13
* **Mutation:** Price 25->20; -3 Knockback -> -2 _[You rarely want both Elemental and Ranged together, and this is nicely cheap when you do; otherwise still kind of expensive-but-occasionally-worth when you just want one.]_
* **Propeller Hat:** Price 28->25
* **Scared Sausage:** Price 25->20; Tooltip now mentions hidden mechanic of improving natural burn _[Helps encourage mixed builds by being more affordable in so-so situations.]_
* **Snake:** Price 25 -> 23; No Limit -> Limit 3 _[Makes it so they no longer show up once you have as many as you need.]_
* **Terrified Onion:** Price 15->13
* **Turret:** Price 15->16 _[Almost always better than Landmines, so they get a mild cost difference.]_
* **Weird Food:** Price 20->24
#### DLC
* **Corrupted Shard:** Price 12->13; Curse 1->2 _[Now a bit more of an actual entry-point into curse rather than incidental.]_

### Tier-2
* **Acid:** Price 65->63
* **Alien Eyes:** Price 50->53; No Downside -> -8 Range
* **Banner:** Range 20 -> 25
* **Blindfold:** -15 Range -> -18
* **Blood Leech:** Price 45->41
* **Campfire:** Price 40->46; HP Regen 2 -> 3 _[The idea here is to make it buyable for either stat and good if you want both stats.]_
* **Cyclops Worm:** -12 Range -> -16
* **Dangerous Bunny:** Price 30->35 _[Reverting to the price it was in 1.0; it was already quite strong priced at 35.]_
* **Energy Bracelet:** 4% Crit Chance -> 5%
* **Gambling Token:** 8% Dodge -> 9%
* **Incendiary Turret:** Price 40->42; 33% Engineering Scaling -> 35% _[Makes the rounding less abysmal.]_
* **Leather Vest:** Price 45->48
* **Little Frog:** Price 45->43; +20% Pickup Range -> +35%
* **Little Muscley Dude:** Range -15 -> -18
* **Lure:** Price 34->37
* **Medal:** Price 55->60; -4% Crit Chance -> -3%
* **Metal Detector:** -5% Damage -> -4%
* **Metal Plate:** Price 40->42
* **Missile:** Price 45->43; 10% Damage -> 11%
* **Pocket Factory:** 2 Engineering -> 3 _[Many people like this item, but if you look at its actual damage output in practice it tends to be very lackluster for its cost outside of best-case scenarios.]_
* **Pumpkin:** -2% Damage -> No Penalty; Now also gives +15% Bounce damage (only relevant for Ricochet); No Limit -> Limit 8 _[This item's real effect is less than people expect it to be, so I remove the downside. Limit is mostly irrelevant, but will stop it from showing up in deep endless if you've already maxed the possible value.]_
* **Recycling Machine:** No downside -> -2% Attack Speed
* **Riposte:** Price 40->34
* **Ritual:** Price 60->57
* **Scope:** 25 Range -> 40
* **Shady Potion:** 20 Luck -> 19
~~ * **Spicy Sauce:** Price 40->41; 33% Proc Chance -> 35%; Explosion Size 125% -> 135%; Can now crit for 1.5x damage (base Crit Chance 1%); Clarified effect of having multiple copies _[The small bump to 35% removes the 1% chance it fails when you have all 3.]_
* **Wheelbarrow:** Price 40->37
* **Whetstone:** Price 40->42
* **White Flag:** 5 Harvesting -> 6
#### DLC
* **Bone Dice:** Price 30->25; Chance to proc +1 Damage% 50%->60%
* **Cauldron:** +20 Damage% for 2 seconds -> +25 Damage% for 3 seconds
* **Eyepatch:** 3% Crit Chance -> 5%
* **Saltwater:** 10% Extra Speed When Hit -> 20%

### Tier-3
* **Adrenaline:** Price 60->57
* **Alien Magic:** Price 85->82
* **Alloy:** 3 Melee Damage -> 5; Dodge -6% -> -5%
* **Baby With a Beard:** Ranged Damage Scaling 100% -> 75%
* **Blood Donation:** Price 50->43 _[The primary 'cost' is the damage, so the material cost should be a bit lower.]_
* **Bowler Hat:** Price 75->70; 15 Luck -> 17
* **Candle:** Price 65->50; Elemental Damage 4 -> 3; -5% Damage -> -4% Attack Speed _[Now more reasonable to take this primarily for the reduced enemy count.]_
* **Chameleon:** Price 70->55; %Damage -4% -> -2% _[The least-reliable and most awkward stand-still item made more accessible.]
* **Community Support:** Price 75->72
* **Crown:** Price 70->68
* **Fairy:** Price 85->90; 1 HP Regeneration Per 1 Unique Tier-1 Item -> 2 HP Regeneration Per 3 Unique Tier-1 Items; -3 HP Regeneration Per 1 Unique Tier-4 Item -> -3% Speed Per 1 Unique Tier-4 Item
* **Fin:** 10% Speed -> 9%; Luck -8 -> -9 
* **Glass Canon:** Price 75->70
* **Hunting Trophy:** Price 55->60
* **Lucky Charm:** Price 75->70
* **Plastic Explosive:** Price 60->53
* **Poisonous Tonic:** 15 Range -> 27
* **Power Generator:** -5% Damage -> -1 Max HP Per 5% Speed
~~ * **Rip and Tear:** Crit Chance 0% -> 1%; Clarified effect of having multiple copies
* **Shackles:** Price 80->86; Range 80 -> 88
* **Shmoop:** Price 60->65; 2 HP Regen -> 3
* **Statue:** Price 60->55
* **Strange Book:** Price 70->65
* **Tardigrade:** Price 50->42
* **Toolbox:** Engineering 6 -> 7; Attack Speed -8% -> -5%
* **Vigilante Ring:** Price 92->80
* **Wandering Bot:** Price 60->43
* **Wheat:** Price 85->81; Harvesting 10 -> 13
* **Wings:** Range 30 -> 35
* **Wisdom:** Price 85->82
#### DLC
* **Goldfish:** Price 23->17 _[I'd prefer a more interesting buff than this if I have time to create one, but this will help a weak item for now.]_

### Tier-4
* **Diploma:** Price 90->85
* **Explosive Shells:** Explosion Damage +60% -> +45%; Explosion Size +15% -> +20%; -15% Damage -> -7% Damage _[So it fits in more reasonably with mixed builds, and with a little more emphasis on the more-unique size rather than just damage.]_
* **Focus:** Price 110->100; Attack Speed penalty per weapon -3% -> -4%
* **Gnome:** 10 Melee Damage -> 12; 10 Elemental Damage -> 8; Range -20 -> -25
* **Heavy Bullets:** Price 100->95; +10 Range -> +5% Crit Chance; -5% Crit Chance -> -30% Accuracy; (Replaced 'Range' tag with 'Crit Chance') _[Also see below in the Ranged Weapons section for a few Accuracy tweaks that're primarily relevant if you have Heavy Bullets.]_
* **Jet Pack:** Price 100->92; HP -5 -> -3
* **Lucky Coin:** Price: 105->70; -2 Armor -> -1 Armor
* **Mammoth:** Price 110->115; Melee Damage 20 -> 17; HP Regen 5 -> 4; -3% Speed -> -5%
* **Medikit:** Price: 95 -> 105; Starting HP Regen 10 -> 4
* **Night Goggles:** Price 95->87; Crit Chance 15%->14%; Range 50->80; -3 HP -> -4% Speed _[Now more worthwhile if you mostly care about the range.]_
* **Octopus:** Price 105->110
* **Potato:** Price 95->100
* **Regeneration Potion:** HP Regeneration 3 -> 4
* **Retromation's Hoodie:** +2% Attack Speed for every 1% Dodge -> +3% Attack Speed for every 2% Dodge
* **Ricochet:** Damage -25% -> -20%; All weapons that naturally pierce now have a default bounce damage of 70% instead of 50% (Crossbow, Shotgun, Laser Gun, Pistol, Shredder, Minigun, Obliterator, Chain-gun, Gatling Laser, Flamethrower, Icicle, Laser Turret; Blunderbuss, Harpoon Gun, Javelin). _[In vanilla, it's a red-tier item that only works on ranged weapons to begin with, but then still ends up worthless on weapons like Shotgun and Shredder making it overly niche.]_
* **Spider:** Attack Speed Per Different Weapon 6% -> 8%; 12% Damage -> 8%
* **Wolf Helmet:** Price 90->95; Additional Downside of -5 Harvesting
#### DLC
* **Kraken's Eye:** Price 110->90

## Weapons
### Set Bonuses
* **Blunt:** -2/-4/-6/-8/-10 Speed -> -1/-2/-3/-4/-5 Speed
* **Primitive:** 3HP Per -> 2HP Per
* **Guns:** 10/20/30/40/50 Range -> 2/4/6/8/10 Attack Speed _[Guns having a bunch of free Range is part of why they don't care about the stat much at all. Additionally, they're a strong and flexible archetype, so they don't need as many free stats from a Set as other weapons do.]_

### Melee
* **Chopper:** Base Damage 6/12/18/30 -> 7/12/17/27 _[The new vanilla Chopper *heavily* focuses its power on the Tier-4 version; this smooths out the curve a smidge.]_
* **Fist:** Price 10/22/45/91 -> 12/26/52/95; Cooldown 0.78/0.73/0.69/0.59 -> 0.79/0.74/0.71/0.61
* **Ghost Flint:** Tier-1 Damage 6->7; Tier-1 Cooldown 1.23 -> 1.24 _[Helps tier-1 not be so hopelessly behind that it can never kill enough enemies to proc on characters that don't have extra damage to start.]_
* **Hand:** Price 10/22/45/91 -> 9/19/33/60; Harvesting 3/6/9/18 -> 2/5/10/20 _[This progression makes it sometimes worth upgrading past Blue-tier, which is broadly just a mistake in vanilla.]_
* **Hatchet:** Range 125->135
* **Jousting Lance:** Price 20/36/72/132 -> 20/36/71/128
* **Lightning Shiv:** Cooldown 1.01/0.93/0.86/0.78 -> 1.03/0.96/0.89/0.81; Price 18/36/66/142 -> 18/36/68/125; Fixed tooltip bounce count _[Most of my nerfs for this were implemented into vanilla; I've opted to still keep this small additional cooldown nerf.]_
* **Plank:** Explosion Size 75%(All) -> 80%/90%/100%/110%
* **Plasma Sledge:** Explosion Size 100%/125% -> 110%/135%; Explosion Chance 25%/50% -> 33%/50%; Price -/-/136/272 -> -/-/122/218
* **Screwdriver:** Range 125->135; Cooldown 1.05/1.0/0.97/0.87 ->  0.94/0.89/0.84/0.78; Crit Chance 10%/15%/20%/30% -> 10%/12%/15%/20%; Crit Damage 2x(All) -> 2x/2.25x/2.5x/3.0x; Price 10/22/45/91 -> 11/23/46/84 _[A modest rework+buff: now that Pile of Books exists and Crit can make more sense on Engineering builds, it feels like Screwdrivers are a good fit to actually care about that crit.]_
* **Spear:** Range 350/375/400/500 -> 325/350/375/450; Cooldown 1.52/1.40/1.28/1.24 -> 1.53/1.41/1.32/1.25 (Accounting for the lowered starting Range)
* **Thief Dagger:** Tier-4 Crit Chance 40% -> 35%
#### DLC
* **Mace:** Cooldown -/1.39/1.31/1.23 -> -/1.28/1.16/1.06; Price -/46/92/185 -> -/43/81/142
* **Trident:** Price 52/96/200 -> 51/95/168
* **War Hammer:** Crit Damage 1.5x -> 1.75x; Price -/-/130/255 -> -/-/119/209

- **Tier-4 Price Reductions:** Anchor: 190 -> 168; Brick: 40 -> 36; Cacti Club: 149 -> 133; Captain's Sword: 210 -> 198; Chainsaw: 242 -> 210; Chopper: 122 -> 111; Circular Saw: 173 -> 151; Claw: 110 -> 100; Flaming Brass Knuckles: 173 -> 151; Ghost Axe: 149 -> 133; Ghost Flint: 105 -> 95; Hammer: 190 -> 168; Hatchet: 122 -> 111; Hiking Pole: 130 -> 120; Knife: 122 -> 111; Lute: 122 -> 111; Plank: 122 -> 111; Power Fist: 221 -> 198; Pruner: 95 -> 93; Quarterstaff: 130 -> 120; Rock: 91 -> 81; Scissors: 122 -> 111; Sharp Tooth: 105 -> 95; Sickle: 122 -> 111; Spear: 149 -> 133; Spiky Shield: 122 -> 111; Spoon: 122 -> 111; Stick: 91 -> 81; Sword: 190 -> 168; Thief Dagger: 105 -> 95; Thunder Sword: 238 -> 209; Torch: 91 -> 81; Wrench: 149 -> 133 (Fist, Hand, Jousting Lance, Screwdriver, Mace, Trident, War Hammer listed above.)

### Ranged
- **Chain-gun:** Long Reload Cooldown 2.04s -> 3.51s; Accuracy 80% -> 65%; Price 300->280 _[For reference, Tier-1 SMG is 70% Accuracy.]_
- **Crossbow:** Price 16/34/62/132 -> 16/32/61/107
- **Fireball:** Price -/36/66/140 -> -/36/68/125
- **Icicle:** Price 18/36/66/140 -> 18/36/68/125
- **Minigun:** Price -/-/127/255 -> -/-/122/218
- **Obliterator:** Projectile Hitbox Width +25%; Price -/-/127/255 -> -/-/122/218
- **Potato Thrower:** Added to the Blunt Weapon Set; Base Damage 1(All) -> 2/3/4; Price -/36/69/139 -> -/33/64/114 _[Blunt Set allows it to find some synergy options when picked as a starting weapon.]_
- **Revolver:** Range 450 -> 425; Price 20/34/70/130 -> 18/36/68/125
- **Rocket Launcher:** Range 500/550/600 -> 500(All)
- **Sniper Gun:** Range 800/1000 -> 550/600; Ranged Damage Scaling 100%(All) -> 200%/250% _[Given that it's in the Gun Set, it should at least passably scale from Ranged Damage and fit into a Gun build - even with these scaling amounts it still scales worse than a Pistol. Meanwhile it's a weapon that scales off Range, so it shouldn't have so much Range to begin with that more is irrelevant.]_
- **Wand:** Cooldown 0.87/0.78/0.70/0.53 -> 0.83/0.77/0.68/0.53 _[The slight cooldown buff lets you get 1 extra kill on Wave 1.]_
#### DLC
- **Blunderbuss:** Price -/45/95/192 -> -/46/90/160
- **Flute:** Price 20/45/80/165 -> 19/41/81/150
- **Harpoon Gun:** Melee Damage Scaling 100%(All) -> 80%/90%/100%; Piercing 3/4/5 -> 3/4/6; Max Range 800/850/900 -> 750/825/900; Price -/50/105/220 -> -/46/90/160 _[Better differentiates the tiers while nerfing the powerful lower-tier scaling a bit.]_
- **Javelin:** Price 18/36/66/140 -> 18/36/68/125

* **Tier-4 Price Reductions:** Double Barrel Shotgun: 149 -> 133; Flamethrower: 207 -> 185; Ghost Scepter: 122 -> 111; Grenade Launcher: 212 -> 191; Laser Gun: 122 -> 111; Medical Gun: 122 -> 111; Nuclear Launcher: 289 -> 256; Particle Accelerator: 289 -> 256; Pistol: 91 -> 81; Rocket Launcher: 207 -> 185; Shredder: 122 -> 111; Shuriken: 105 -> 95; Slingshot: 122 -> 111; SMG: 149 -> 133; Sniper Gun: 245 -> 205; Taser: 122 -> 111; Wand: 105 -> 95 (Crossbow, Minigun, Obliterator, Potato Thrower, Revolver, Blunderbuss, Fireball, Flute, Harpoon Gun, Icicle, Javelin listed above.)
* **Other Minor Accuracy Tweaks** (mostly only relevant if Accuracy is lowered by Heavy Bullets or Eyepatch): Medical Gun 0.9(Tier1-3)->1.0(All); SMG 0.7/0.75/0.8/0.85->0.7/0.74/0.77/0.8; Mini-gun 0.85/1.0 -> 0.8/1.0; Shotgun 0.9/0.95/1.0/1.0->0.9(All); Potato Thrower 0.9(All)->1.0(All); Rocket Launcher 0.8/0.9/1.0 -> 0.9(All) _[For reference, Revolver is 0.9(All), and most other unlisted weapons are 1.0(All).]_

## Characters
* **Brawler:** Unarmed Attack Speed Bonus 50% -> 40%; Now applies their +AttackSpeed Bonus to weapons that scale with Attack Speed (Claw)
* **Bull:** Starting HP Regen 15 -> 10
* **Crazy:** No longer starts with a Knife; Now applies their +Range Bonus to weapons that scale with Range (Crossbow & Sniper Rifle); Starting Dodge -30% -> -15% _[Silly, but if this isn't going to be -100%, it might as well be an amount you can theoretically pull out of the deficit if you really want to, especially with Crossbow Set giving some Dodge]_; Starting Ranged Damage -10 -> -15 _[To prevent Crossbows from being overly strong]_; Starting Engineering -10 -> -15 _[To complete the pattern]_
* **Cryptid:** Bonus XP/Gold Per Living Tree 12 -> 11
* **Demon:** Materials to 1 HP Ratio 13 -> 14
* **Doctor:** Harvesting 5 -> 0; Starting HP Regeneration 5 -> 3
* **Engineer:** No longer starts with a Wrench; Starting Engineering 10 -> 5; Elemental Damage Penalty -50% -> -20% _[Allows Engineer to lean into a mixed Engineering+Elemental build if desired, and makes more sense for Plank as a starting weapon.]_
* **Explorer:** Starting Trees: 12 -> 11
~~* **Farmer:** Now starts with a Garden; Now also favored to find Gardens in the shop _[A flavorful buff to a character that's more impacted by nerfs to tier-1 Harvesting and Fertilizer than most, and one that is most relevant for their weaker, non-Pruner-based builds.]_
* **Gladiator:** -30 Luck -> -40
~~* **Glutton:** Now also favored to find Gardens in the shop
* **King:** Now only gives Attack Speed and Damage for every *different* tier-4 weapon; Bonus Attack Speed & Damage 25% -> 20%
* **Knight:** 2 Melee Damage per 1 Armor -> 3 Melee Damage per 2 Armor
* **Loud:** -3 Harvesting per Wave -> -4
~~* **Lucky:** 100 Starting Luck -> 75; Luck Modifications +25% -> +40%; Attack Speed -60% -> -50%; (Luck stat slightly better and slightly easier to come by)  _[This makes you care more about actually raising Lucky's Luck stat. Takes a good while to break even with vanilla Lucky (+130 Luck), so gets slightly better Attack Speed to compensate.]_
* **Mage:** Now starts with a 2nd Sausage when starting with SMG or Shotgun; -50% Engineering Mods -> -33% _[Vanilla partially adapted this change, but -50% is still oppressive for making this alt built work, while -33% is more in the 'hard-but-manageable' range.]_
* **Masochist:** HP Regen 20 -> 15; Armor 8 -> 5 _[Moderate nerfs to a very strong character.]_
* **Mutant:** XP Needed For Level-up 66% -> 60% _[Evens things back out a bit now that +XP items are actually strong on this character.]_
* **One-armed:** Now gains a 4-Set bonus for whichever weapon they have equipped (except for Legendary). _[A specialized buff to a difficult character that really helps some of their less-viable builds like Shuriken.]_
* **Ranger:** No longer starts with a Pistol.
* **Renegade:** Additional Malus: +2% Items Price at the end of each wave. _[Renegade's early game is moderately challenging, while their late game tends to be quite easy. This ramps up the shop costs over time, which leaves the early game fairly similar but makes the later game less trivial.]_
* **Soldier:** 200% Pickup Range -> 125% _[Gives Soldier reason to care about Pickup Range items a bit.]_
* **Speedy:** Starting Speed 30% -> 25% _[More room to meaningfully increase from where you start]_; Starting Armor -3 -> -2
* **Streamer:** Now also favored to find Stand-still Items.
* **Wildling:** No longer starts with a Stick.
_[Initial weapon removals (Crazy, Ranger, Wildling, Engineer) make those characters more varied by making the starting weapon choice actually matter more, preventing the default fall-back option.]_
### DLC
~~ * **Druid:**

## Enemies
### Wave Spawns: Crazh Zone
* **Wave 12:** Mummy Spawns 10 -> 16 _[For comparison, Wave 11 averages 32.5 Mummies.]_
* **Wave 14:** Helmet Spawns 108 -> 85 (Helmets have more HP - this is slightly more total HP); Basics spawns earlier (Makes the first ~15s a bit less empty, total 120->130 Basics); Single Magician Spawns 1-2 x6 -> 1-1 x6 _[Removes the variance which removes the chance for an especially unlucky wave, and makes it so _most_ of the fireball hurlers come from the Wizard Hats which you have more control over.]_
* **Wave 15:** Helmet Spawns 114 -> 95 (Helmets have more HP; this is moderately more total HP)
* **Wave 16:** Helmets have more HP but just as many spawn; 2 Flies added to each group of Helmets + Buffers (28 total); Helmet Groups a bit more spread out (500->700) [Aiming to make them less trivially smashed by melee quickly]; 2 additional groups of 1 Bruiser + 1 Armored Bruiser spawn, and they show up 10 seconds earlier (18 -> 22 total)
* **Wave 20:** Added additional Basics (5 every 5s = 80 total) and Fins (5 every 6s = 65 total), primarily to help out effects which are based on enemy/material counts (but also potentially makes things a bit harder, especially for Ranged builds).
~~ * **Wave 14 & 15 Hordes:** Added 6 single Magician spawns alongside 6 single Wizard Hats (Spawners) spread out over the last 2/3rds of the wave; Reduced some of easier enemy spawns so they're less likely to despawn the more-threatening enemies; Made the added Helmets and Fins in the 2nd half spawn on the edges of the map to make them harder to deal with; Made the Horde additions identical for 14/15. _[Aiming to make these Horde waves feel threatening, rather than often easier and simply more profitable than their non-Horde counterparts like they are in vanilla.]_

### Elites
#### Crash Zone
* **Hivemind/Colossus:** Phase 2 Cooldown 0.9s -> 1.02s _[Gives a bit more breathing room during the rapid onslaught of Phase 2.]_
* **Rhino:** Base Speed 250 -> 275
* **Mantis:** Phase 2 Cooldown 1.33s -> 1.25s; Phase 2 Charge Duration 0.7s -> 0.85s; Phase 2 Charge Speed 800 -> 740 (Total Distance 560 -> 629) _[Aiming to differentiate Mantis and Rhino more.]_
* **Butcher:** Phase 2 & 3 Max Range Increased _[Makes it so you can't so easily get out of range of the slashes; most relevant for Explorer.]_
#### The Abyss
* **Turtle:** Time Before First Attack 2s -> 0.5s

### Standard Enemies
+ **Small Charger:** Knockback Resistance 80% -> 75%
+ **Small Viking Charger:** Knockback Resistance 80% -> 75%
+ **Tall Bruiser:** Knockback Resistance 90% -> 87%
+ **Tall Armored Bruiser:** Knockback Resistance 90% -> 87%
+ **Hatched Slasher:** Knockback Resistance 90% -> 87%
+ **Lamprey Fish:** Knockback Resistance 95% -> 93%
_[The base game has mostly implemented my tweaks here, but it still felt difficult for Knockback to be impactful so I go a small step further.]_
#### DLC
+ **Stargazer:** Boosted HP When You Destroy Their Incubator 150% -> 200%; Boosted Speed 250% -> 275%
+ **Narwhal:** HP Per Wave 8.0 -> 8.75; Knockback Resistance 90% -> 87%
+ **Walrus:** Base HP 40 -> 45; Knockback Resistance 90% -> 87%

### Starting Weapons
* **Crazy:** Added Crossbow
* **Cyborg:** Removed Crossbow
* **Demon:** Added Potato Thrower
* **Engineer:** Removed Hammer
* **Generalist:** Removed Lighting Shiv
* **Jack:** Removed Shuriken
* **Mage:** Added Wrench
* **One-armed:** Added Sword, Hammer, Flaming Brass Knuckles, Fireball
* **Pacifist:** Added Scissors, Rock, Spiky Shield
* **Ranger:** Removed Pistol
* **Saver:** Added Stick
#### DLC
* **Explorer:** Added Lute, Javelin
* **Romantic:** Added Jousting Lance; Removed Fist
* **Sick:** Added Javelin
* **Vampire:** Added Javelin

# Other Resources
Fully unlocked Brotato (& DLC) save file (with blank character completion so you can still track your progress): https://www.darktwinge.com/skip-metaprogression-unlocks/brotato-save-file/

You might also enjoy my FTL Balance Mod: https://www.darktwinge.com/ftl-balance/index.php

# Thanks To
Inschato, ArosRising, Hyphen-ated, Pasha, WL, and everyone else that's assisted with feedback, suggestions, or coding help!
Also thanks to Blobfish for being generally receptive to feedback and suggestions, implementing many Balance Mod changes directly into the base game.

# License
You are free to use concepts and code contained within elsewhere, ideally with attribution. E.g. if you want to make a spin-off mod for, say, only the Item changes, you are welcome to do so but I'd appreciate a link back to the Balance Mod and/or to my stream.

# Now Included in Vanilla
These changes were originally made for Balance Mod but are now implemented into the main game (either directly or similarly enough to obsolete my version):
- Knockback now never moves the enemy towards the player.
- Bugfixed Wave 3 shops so they can now sell more than 1 weapon.
- Revolver & Chain-gun: Fixed a bug that caused them to instantly reload when used alongside effects that check if you're moving (e.g. Solider). Also bugfixed inaccurate long cooldown tooltip
- Over 100 starting weapon changes.
- Stats now update properly on shop reroll for Saver.
- Bugfixed Multi-tasker cooldown randomization so it isn't so extreme.
- Weapons with very low cooldowns (such as SMG or Minigun) now show an extra decimal place in their cooldown for better accuracy.
- Fixed cooldown visual for the fastest weapons.
- HP tweaks to Looter and Helmet enemies. Drop rate tweak to Tentacle enemy. Knockback tweak to Spawned Magician enemy.
- Fighting Stick & Plasma Sledgehammer renamed.

Item Nerfs to: Exoskeleton, Coffee, Plant, Tentacle, Bloody Hand
Item Buffs to: Sifd's Relic, Wisdom, Gambling Token, Gummy Berserker, Scar, Black Belt, Bean Teacher, Diploma, Big Arms
Item Tweaks to: Stone Skin, Tyler
Item Rework of: Robot Arm
Weapon Nerfs to: Lightning Shiv
Weapon Buffs to: Torch, Sniper Gun, Plank, Cacti Club, Wand, Chopper, Medical Gun, Rock, Hammer
Character Buffs to: Artificer, Jack, Streamer
Character Tweaks to: Doctor, Mutant
Elite Nerfs to: Croc, Mother
Elite Buffs to: Rhino
Elite Rework of: Gargoyle/Bat

* **Eyes Surgery:** Price 60->47; New Additional Effect: Also adds +1 duration to all burn effects; -10 Range -> No Downside

* **Cyborg:** No longer favored to find Engineering Items - now favored to find Structure Items specifically.



Power gen Added '%Damage' Tag; Alloy elemental tag
Explorer No longer favored to find 'Pickup' Items (Metal Detector, Baby Elephant, Cute Monkey, Pickup Range, Material Attract).


* **Rip and Tear:** Price: 65->59; Harvesting -12 -> -11; Can now crit for 1.5x damage (base Crit Chance 1%); [Does it crit in vanilla now?]
[Test new Lich starter: Spiky, Thief Dagger]
[Test Jack w/ Wrench]
[Test Loud w/ Pruner]
Saver-Torch
Test/Consider Captain-Quarterstaff, Screwdriver, Chopper
Jack-Flute

Try Minigun with low recoil value