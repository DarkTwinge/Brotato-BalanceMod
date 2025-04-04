# Overview
More items are worth using and fewer choices are overpowered. Range and Luck stats are better. Mixed-weapon builds are easier to manage and more build styles are viable; Tier-4 weapons are cheaper. Several tweaks to make things feel better to use and encourage more varied gameplay. Tooltips are more accurate and detailed. Overall difficulty is similar, with the easiest runs made a bit harder and the hardest runs made a bit easier.

The full list of all changes is here: https://github.com/DarkTwinge/Brotato-BalanceMod/#full-changelog - Below is a summary of the major changes you should know about.

(Dozens of changes from the original Balance Mod have now been implemented directly into the base game. A summary of those prior changes is at the end of the full changelog.)

_Note: Altered/New descriptions will currently not display for non-English languages._ (If anyone wants to help me make a translation set for another language, let me know! ~75 text keys, but most are simply tweaks of vanilla text which already has translations to reference.)

## Change Summary
### Mechanics
* Easier to have mixed-weapon builds: The chances of being offered one of the exact weapons you already have is higher the more weapon types you have. Additionally, shop weapon set favoring is now based on how many of that set you have (so a single off-set weapon doesn't impact your weapon pool as much).
* Armor is slightly less effective (~7% worse).
* Range gained from level-ups & items is ~15% higher (both increases and decreases).
* Other level-ups: Tier 2-4 Luck is stronger; Tier-1 Harvesting dropped to 4; weaker Tier-4 level-ups are more worthwhile.
* Horde Waves give ~8% fewer materials.
* Enemies now drop partial material amounts instead of all or nothing (average amount is the same).
* Several tooltips cleaned up to be more accurate, hidden mechanics are detailed, & character descriptions take up less room. Guaranteed level-ups are now color-coded. Cyborg's transition has unique SFX. Which items are 'structures' now indicated in the shop. Tooltips now show explosion sizes.

### Weapons
* Primitive set bonus is worse; Blunt set bonus is better. Gun set bonus changed to Attack Speed in order to make the Range stat more relevant.
* Tier-4 weapons are cheaper across the board (also a small indirect Luck buff). Other weapon prices slightly tweaked for more logical/consistent progression.
* Hand partially reworked to make Tier-3/4 worth buying.
* Screwdriver partially reworked+buffed so it cares more about Crit.
* Sharp Tooth reworked to only have one Set and to be less awful early.
* Minigun, Hammer, and Sledge now have Knockback Piercing, meaning their Knockback is more effective against resistant enemies like Chargers.
* Sickle removed from the game.
* SMG, Spear & Thief Dagger are nerfed; Mace is buffed.
* Ghost Flint, Hatchet, Laser Gun, Obliterator, Plank, Plasma Sledge, Potato Thrower, Scissors, Sword, Wand, Cacti Club, Hammer, and War Hammer receive minor buffs.
* Fist, Lightning Shiv, Flaming Brass Knuckles, Chain-gun, Nuclear Launcher, and Revolver receive minor nerfs.
* Chopper, Harpoon Gun, and Sniper Gun get minor buffs+nerfs.

### Items
Tons of items receive small buffs or nerfs: overall more items are useful in more situations, and the strongest give less power for their cost. Note that the goal is not to make everything equally strong; there is still plenty of variance and build-specific decision-making. Some highlights:

* Tardigrade is no longer wasted by Bloody Hand/Donation.
* Ricochet is now friendlier with already-piercing weapons.
* Power Generator now reduces your HP as it powers up.
* Fairy gives less HP Regen and gives negative HP for Tier-4s instead of negative HP Regen.
* Utility Crit items (Pile of Books, Eyepatch) come with more Crit Chance to work better as speculative picks.
* Early economy items (Fertilizer, Coupon, Bag, Dangerous Bunny, Recycling Machine) are a little worse (but still strong).
* Purple delayed-value items (Wheat, Blood Donation, Bowler Hat, Vigilante Ring) are better (as you have much less time to profit from them).
* Chameleon, Wandering Bot, and Lucky Coin significantly cheaper. Hedgehog, Mutation, Duct Tape, Sausage, and Bone Dice cheaper. Saltwater more impactful.
* Candle is cheaper and now reduces enemy damage.
* Heavy Bullets now stronger overall but lowers Accuracy.

### Characters
As with items, the goal is not for characters to be equal strength. The focus is instead on making the easiest options less 'free', as well as tweaks to make decisions more interesting and characters more variable.

* (DLC) Druid reworked to care more about poisoned fruit.
* (DLC) Creature reworked to have stronger curses rather than weapon scaling.
* Mage can better run an Engineering build (turrets + Sausage) and also handles Gun builds better (extra Sausage). Engineer can better combo with Elemental Damage.
* Lucky and Speedy now care more about raising their thematic stats. Soldier cares more about Pickup Range.
* Crazy now works with Crossbows properly; Brawler works with Claw properly.
* One-armed and Baby receive moderate buffs. Hiker, Fisher, and Farmer get minor buffs.
* Masochist, Knight, Doctor, Loud, Renegade, Bull, Cryptid, Explorer, Demon, King, Mutant, Gladiator, Engineer, Entrepreneur, and Brawler receive nerfs.
* Most automatic starting weapons (e.g. Wildling, Crazy) are removed, making your chosen starter more meaningful.

### Enemies & Waves
* (DLC) Pufferfish now spawn 4 projectiles when killed by melee (instead of 0).
* (DLC) Stargazers are now stronger when you kill their Incubators first.
* (DLC) Spider Crab Elite summons harder to deal with. Turtle Elite attacks sooner and is tankier.
* (DLC) Guaranteed Seapigs now spawn on the Crash Zone map, letting you opt into Curse.
* Hivemind/Colossus Elite slightly nerfed.
* Mantis Elite tweaked to be more unique and slightly harder. Butcher Elite attacks are harder to run from.
* Crash Zone: Wave 16 harder. Wave 12 slightly harder. Wave 20 has additional small enemies, making it slightly harder and helping enemy/material synergies. Wave 14/15 Horde Waves scarier.
* Knockback a bit more effective against resistant enemies.

# Support Me
Tune into my stream where I play a wide variety of indie games: https://www.twitch.tv/darktwinge

If you'd like to directly support my ability to make and maintain mods like this, you can do so on Patreon: http://www.patreon.com/DarkTwinge or directly: https://paypal.me/DarkTwinge

# Full Changelog
## General Changes
* Armor is about 7% less effective (Each point is +6.25% Effective HP instead of +6.67%). _[This probably still leaves it as the strongest general stat, but now closer to its peers.]_
* Having different weapons will make the shop more likely to offer you an exact-match of a weapon you already have. In vanilla, this is always a 20% chance; now it's 19%/20%/22%/24%/25% for having 1/2/3/4/5+ different types of weapons.
* Mixed Weapon Sets don't hurt your shop odds as much: The calculation that weighs shop weapons to more often match weapon sets you currently have (15% of the time, more often in the first 5 waves) now factors in how many copies of the set you have rather than weighing them all equally. For example, if you have 5 Thief Daggers (Precise set) and 1 Scissors (Precise & Medical sets): when the shop is picking a tier-1 weapon based on sets, in vanilla this would give you a 1 in 7 chance to be offered a Medical Gun -- now the odds of it picking Medical Gun are only 1 in 32. _[This also means multi-set weapons will inherently be favored slightly more, which helps offset the fact they are pulling in a lot of weapons into the pool from being a part of multiple sets to begin with.]_
* When a shop tries to offer you an exact weapon you have but can't, it will now offer you a same-set weapon (instead of a fully random weapon). This makes it a little easier to match up a starting tier-2+ only weapon (e.g. Potato Thrower) with something relevant.
* Tier-4 weapons are significantly cheaper, primarily as an indirect buff to Luck and mixed-weapon builds. Other weapon prices are cleaned up to be more consistent and have a slightly more logical progression.
* The reroll button for level-ups is now color-coded for levels that have a guaranteed rarity. (Level 5, 10, 15, etc.)
* Horde Wave Materials: 65% -> 60% _[This still leaves them as generally more profitable and easier than Elite waves, but now more closely aligned.]_
* All explosion tooltips now list their explosion size (weapons, items, and characters).
* Clarified various tooltips to be more clear & accurate: Detailed hidden mechanics (e.g. Fisher, Spicy Sauce, Scared Sausage); Adjusted wordings of item and stat tooltips to be more correct; Shortened character effect descriptions to fit in the box better; Armor tooltip has an extra decimal place; Knight's tooltip color-coded properly; Fixed Lightning Shiv's bounce count.

## Level-ups
* **Range:** 15/30/45/60 -> 20/35/50/70
* **Luck:** 5/10/15/20 -> 5/11/18/26
* **Harvesting:** 5/8/10/12 -> 4/8/11/15
* **HP Regen** Tier-4: 5->6
* **Engineering** Tier-4: 5->6
* **Crit Chance** Tier-4: 9->10
* **Lifesteal** Tier-4: 4->5
* **Dodge Tier-1: 3->4 [Dodge is very weak until you have a good amount of it, making it especially bad to invest in early; this helps counteract that some.]

## Items
### Tier-1
* **Alien Tongue:** Pickup Range +30% -> +35%; Knockback +1 -> +2; Price 25->23
* **Baby Gecko:** Range 10 -> 12
* **Bag:** Price 15->19
* **Beanie:** Range -6 -> -7
* **Book:** Price 8->7
* **Boxing Glove:** Knockback +3 -> +4
* **Broken Mouth:** Price 25->26
* **Cake:** Price 15->16
* **Coupon:** Price 15->19
* **Cute Monkey:** Price 25->28
* **Duct Tape:** Price 20->16
* **Fertilizer:** Price 15->17; Harvesting 8 -> 7
* **Gentle Alien:** Price 30->31
* **Glasses:** Range 20 -> 22
* **Gummy Berserker:** Range 25 -> 28
* **Head Injury:** Damage 6% -> 7%; -8 Range --> -2% Speed _[Swapped downside with Helmet so that this doesn't mirror Cyclops worm so directly.]_
* **Hedgehog:** Price 30->23
* **Helmet:** Price 15->18; -2% Speed --> -10 Range _[Swapped downside with Head Injury so that Injury doesn't mirror Cyclops Worm so directly and so Helmet doesn't mirror Warrior's Helm.]_
* **Landmines:** Price 15->13
* **Lens:** Range -5 -> -10
* **Lost Duck:** Luck 8 -> 9
* **Lumberjack Shirt:** Price 15->12
* **Mutation:** Price 25->24; Knockback -3 -> -2
* **Pencil:** -1 Crit --> -1 Luck _[Leaning away from Engineering with Crit penalties to work better with Pile of Books and new Screwdriver.]_
* **Propeller Hat:** Price 28->25
* **Scar:** Price 25->23; Range -8 -> -11
* **Scared Sausage:** Price 25->20; Tooltip now mentions hidden mechanic of improving natural burn _[Price reduction helps encourage mixed builds.]_
* **Sharp Bullet:** Knockback -3 -> -2
* **Snake:** Price 25->23; No Limit -> Limit 3 _[Makes it so they no longer show up once you have as many as you need.]_
* **Terrified Onion:** Price 15->12
* **Ugly Tooth:** Slow Per Hit 5% -> 7% (Still maxes at 20%); Speed -3% -> -2%
* **Weird Food:** Price 20->22; Dodge -2% --> Speed -2%
* **Weird Ghost:** Starting HP Next Wave -100% -> -90% (which now also goes down when cursed)
#### DLC
* **Corrupted Shard:** Price 12->15; Curse 1 -> 2; Damage 3% -> 4% _[Now a bit more of an actual entry-point into Curse rather than incidental.]_
* **Feather:** Price 18->19
* **Whistle:** Extra Loot Goblins +50% -> +60% _[This still leaves it as a worse economy item than Coupon or Bag on average.]_

### Tier-2
* **Acid:** Price 65->62
* **Alien Eyes:** Price 50->52; No Downside --> -8 Range
* **Banner:** Range 20 -> 25
* **Blindfold:** Range -15 -> -18
* **Blackbelt:** XP Gain +25% -> +30%
* **Blood Leech:** Price 45->40
* **Campfire:** Price 40->39
* **Celery Tea:** Price 35->33; Extra Enemy HP +100% -> +75%
* **Cog:** Damage -4% -> -2% _[This penalty usually doesn't matter much for an Engineering build anyway, so this makes it less punishing to splash.]_
* **Cyclops Worm:** Range -12 -> -16
* **Dangerous Bunny:** Price 30->34
* **Energy Bracelet:** Price 55->56; Crit Chance 4% -> 5%
* **Gambling Token:** Dodge 8% -> 9%
* **Garden:** Price 50->48
* **Ice Cube:** Price 50->47
* **Leather Vest:** Price 45->47
* **Little Frog:** Price 45->38; Pickup Range +20% -> +30%
* **Little Muscley Dude:** Range -15 -> -18
* **Lure:** Price 34->40
* **Medal:** Price 55->60; Crit Chance -4% -> -3%
* **Metal Detector:** Damage -5% -> -4%
* **Metal Plate:** Price 40->44
* **Missile:** Price 45->44; Damage 10% -> 11%
* **Pocket Factory:** Price 75->70; Now comes with +1 Tree Stat (same as buying one Tree item) _[Makes it less reliant on finding Trees.]_
* **Pumpkin:** -2% Damage --> No Downside; Now also gives +15% Bounce damage (only relevant for Ricochet); No Limit -> Limit 8 _[This item's real effect is less than people expect it to be, so I remove the downside. Limit is mostly irrelevant, but will stop it from showing up in deep endless if you've already maxed the possible value.]_
* **Recycling Machine:** No Downside --> -1 HP Regen
* **Reinforced Steel:** Engineering 3 -> 4
* **Riposte:** Price 40->34
* **Ritual:** Price 60->57
* **Scope:** Range 25 -> 40
* **Shady Potion:** Luck 20 -> 19
* **Snail:** Enemy Speed -8% -> -10%; -3% Speed --> -3% Attack Speed
* **Snowball:** Price 50->46
* **Spicy Sauce:** Explosion Size 125% -> 135%; Now tagged for 'consumables' instead of 'luck'; (Clarified effect of having multiple copies).
* **Tentacle:** Price 35->38
* **Wheelbarrow:** Price 40->38
* **Whetstone:** Price 40->42
* **White Flag:** Price 40->31; Harvesting 5 -> 6; Now also reduces the Enemy Limit before despawning begins (100->85 for single-player) _[Aiming to give another way for reduced enemies to actually be a good thing by making swarms of enemies, especially Hordes, less dense.]_
#### DLC
* **Bait:** Fixed Cursed Bait to only spawn one set of Lampreys
* **Bone Dice:** Price 30->27; Chance to proc +1 Damage% 50% -> 60%
* **Cauldron:** +20 Damage% for 2 seconds -> +25 Damage% for 3 seconds
* **Clockwork Wasp:** Price 45->47
* **Eyepatch:** Price 55->63; Crit Chance 3% -> 6% _[Now works better as an entry point into Crit.]
* **Jerky:** Price 50->53
* **Pearl:** Price 60->55; Chance for free Pearl in crate 3% -> 4%
* **Saltwater:** Extra Speed When Hit 10% -> 20%
* **Spyglass:** Price 30->35
* **Treasure Map:** Now also tagged for 'Exploration' (Cryptid/Explorer/Lucky)

### Tier-3
* **Adrenaline:** 50% Chance to Heal 5 HP -> 50% Chance to Heal 7 HP
* **Alien Magic:** Price 85->83
* **Alloy:** Melee Damage 3 -> 5; Dodge -6% -> -5%
* **Baby With a Beard:** Ranged Damage Scaling 100% -> 75%
* **Barricade:** Price 75->68
* **Blood Donation:** Price 50->42 _[The primary 'cost' is the damage, so the material cost should be lower.]_
* **Bowler Hat:** Price 75->69; Luck 15 -> 20
* **Candle:** Price 65->43; Added Effect: -5% Enemy Damage; Elemental Damage 4 -> 2; -5% Damage --> -4% Attack Speed _[Now more reasonable to take this primarily for the safety benefit.]_
* **Chameleon:** Price 70->48; Damage -4% -> -2% _[The least-reliable and most awkward stand-still item made more accessible.]
* **Community Support:** Price 75->71 _[The amount of actual Attack Speed granted is less than most people expect it to be.]_
* **Crown:** Price 70->68
* **Fairy:** Price 85->90; 1 HP Regen Per 1 Unique Tier-1 Item --> 2 HP Regen Per 3 Unique Tier-1 Items (Tooltip shows a counter for how many items needed for the next stat increase); -3 HP Regen Per 1 Unique Tier-4 Item --> -3 Max HP Per 1 Unique Tier-4 Item
* **Fin:** Speed 10% -> 9%; Luck -8 -> -9 
* **Glass Canon:** Price 75->70
* **Hunting Trophy:** Price 55->60
* **Laser Turret:** Price 65->60; Crit Damage 2.0x -> 2.5x (When you have Pile of Books)
* **Lucky Charm:** Price 75->70
* **Peacock:** Price 50->47
* **Pile of Books:**: Crit Chance 3% -> 5% _[Giving more to start helps it work better as an entry-point into Crit.]_
* **Plastic Explosive:** Price 60->52
* **Poisonous Tonic:** Range 15 -> 27
* **Power Generator:** Price 65->60; -5% Damage --> -1 Max HP Per 5% Speed
* **Rip and Tear:** (Clarified effect of having multiple copies)
* **Shackles:** Price 80->88; Range 80 -> 88
* **Shmoop:** Price 60->61; 2 HP Regen --> 2% Lifesteal; (Now tagged for Lifesteal instead of HP Regen)
* **Statue:** Price 60->55
* **Strange Book:** Price 70->60
* **Tardigrade:** Price 50->40; Now requires 2+ damage to proc (preventing it from being wasted by Bloody Hand, Blood Donation, or Sick); Added to Dodge Item Tag Pool
* **Toolbox:** Engineering 6 -> 7; Attack Speed -8% -> -5%
* **Tyler:** Price 75->68; Range 200 -> 215; Engineering & Elemental Scaling 75% -> 80%
* **Vigilante Ring:** Price 92->75
* **Wandering Bot:** Price 60->40
* **Wheat:** Price 85->82; Harvesting 10 -> 14
* **Wings:** Range 30 -> 33
* **Wisdom:** Price 85->78
#### DLC
* **Crystal:** Price 65->55; Engineering -2 --> Max HP -2 _[Engineering builds often don't care about Attack Speed anyway, so it gets an appropriate real downside while being cheaper to compensate.]_
* **Goblet:** Price 70->75
* **Goldfish:** Price 23->15 _[I'd prefer a more interesting buff if I have time to create one, but this will help a weak item for now.]_
* **Honey:** Price 70->53; Ranged Damage 3 -> 2; Explosion Size 5% -> 10%; -3% Dodge --> No Penalty; -3% Speed --> -20 Range _[Reworked to make it worthwhile when you only care about the Explosion side, and swapped the downside so that it wasn't the same as Reinforced Steel.]_
* **Starfish:** Price 75->70
* **Sunken Bell:** Price 65->42; Explosion Size 600% -> 750%

### Tier-4
* **Big Arms:** Price 105->98
* **Diploma:** XP Gain +50% -> +60%
* **Explosive Shells:** Explosion Damage +60% -> +45%; Explosion Size +15% -> +20%; Damage -15% -> -5% _[Lets it fit in more reasonably with mixed builds, and gives a little more emphasis on the more-unique size factor rather than just damage.]_
* **Extra Stomach:** Now tagged for 'consumables' instead of 'luck'.
* **Focus:** Price 110->100; Attack Speed penalty per weapon -3% -> -4%
* **Gnome:** Melee Damage 10 -> 12; Elemental Damage 10 -> 8; Range -20 -> -25
* **Heavy Bullets:** Price 100->95; +10 Range --> +5% Crit Chance; -5% Crit Chance --> -25% Accuracy; (Replaced 'Range' tag with 'Crit Chance') _[Also see below in the Ranged Weapons section for a few Accuracy tweaks that're primarily relevant if you have Heavy Bullets.]_
* **Jet Pack:** Price 100->92; HP -5 -> -3
* **Lucky Coin:** Price: 105->70; Armor -2 -> -1
* **Mammoth:** Price 110->115; Melee Damage 20 -> 17; HP Regen 5 -> 4; Speed -3% -> -5%
* **Medikit:** Price: 95 -> 105; Starting HP Regen 10 -> 4
* **Night Goggles:** Price 95->87; Crit Chance 15% -> 14%; Range 50 -> 80; -3 HP --> -4% Speed _[Now more worthwhile if you mostly care about the range.]_
* **Octopus:** Price 105->110
* **Potato:** Price 95->100
* **Regeneration Potion:** HP Regen 3 -> 4
* **Retromation's Hoodie:** +2% Attack Speed for every 1% Dodge --> +3% Attack Speed for every 2% Dodge
* **Ricochet:** Damage -25% -> -20%; All weapons that naturally pierce now have a default bounce damage of 70% instead of 50% (Crossbow, Shotgun, Laser Gun, Pistol, Shredder, Minigun, Obliterator, Chain-gun, Gatling Laser, Flamethrower, Icicle, Laser Turret; Blunderbuss, Harpoon Gun, Javelin). _[In vanilla, it's a red-tier item that only works on ranged weapons to begin with, but then still ends up worthless on weapons like Shotgun and Shredder making it overly niche.]_
* **Robot Arm:** Price 100->93
* **Spider:** Attack Speed Per Different Weapon 6% -> 8%; Damage 12% -> 8%
* **Wolf Helmet:** Price 90->95; Additional Downside of -5 Harvesting
#### DLC
* **Kraken's Eye:** Price 110->90

## Weapons
### Set Bonuses
* **Blunt:** -2/-4/-6/-8/-10 Speed -> -1/-2/-3/-4/-5 Speed
* **Primitive:** 3 HP Per -> 2 HP Per
* **Guns:** 10/20/30/40/50 Range -> 2/4/6/8/10 Attack Speed _[Helps Guns care about your Range stat more often.]_

### Melee
* **Cacti Club:** Base Projectile Damage 1->2 (All Tiers)
* **Chopper:** Base Damage 6/12/18/30 -> 7/12/17/27 _[The new vanilla Chopper focuses its power heavily on the Tier-4 version and this smooths out the curve a smidge.]_
* **Excalibur:** -3 Armor Per Weapon -> -2
* **Fist:** Price 10/22/45/91 -> 12/26/52/95; Cooldown 0.78/0.73/0.69/0.59 -> 0.79/0.74/0.71/0.61
* **Flaming Brass Knuckles:** Cooldown 0.78/0.73/0.69/0.59 -> 0.79/0.74/0.71/0.61
* **Ghost Flint:** Range 150/160/170/180 -> 165/175/185/200; Tier-1 Damage 6 -> 7 _[Helps tier-1 not be so behind that it can never kill enough enemies to proc on characters that don't have extra damage to start.]_
* **Hammer:** Price 51/95/190 -> 46/86/151; Range 175(All) -> 180/190/200; Cooldown 1.67/1.59/1.50 -> 1.63/1.55/1.48 (accounts for the increased Range); Now has 10%/15%/20% Knockback Piercing (more effective against resistant enemies); Knockback 30/40/50 -> 25/30/40
* **Hand:** Price 10/22/45/91 -> 9/19/33/60; Harvesting 3/6/9/18 -> 2/5/10/20 _[This progression makes it sometimes worth upgrading past Blue-tier, which is broadly just a mistake in vanilla.]_
* **Hatchet:** Range 125->135; Internal Recoil Duration 0.1 -> 0.05 _[Increases attack animation speed, resulting in ~7% more DPS on average.]_
* **Lightning Shiv:** Cooldown 1.01/0.93/0.86/0.78 -> 1.03/0.96/0.89/0.81; (Fixed tooltip bounce count) _[Most of my Shiv nerfs were implemented into vanilla; I've opted to still keep this small additional cooldown nerf.]_
* **Plank:** Explosion Size 75%(All) -> 80%/90%/100%/110%
* **Plasma Sledge:** Explosion Size 100%/125% -> 120%/140%; Explosion Chance 25%/50% -> 33%/50%; Range 175(All) -> 190/200; Cooldown 1.55/1.49 -> 1.52/1.46 (accounts for the increased Range); Now has 10%(All) Knockback Piercing (more effective against resistant enemies); Knockback 30(All) -> 25(All)
* **Power Fist:** Tier 4 Damage 60 -> 75
* **Scissors:** Crit Chance 10%/12%/15%/20% -> 10%/15%/20%/25%; Tier-3/4 Cooldown 0.94/0.86 -> 0.93/0.83 _[Makes higher tier versions more worth using; Buffing cooldown helps their potential as a healing add-in to a Precise build, and increasing base crit chance helps it fit in better with its Precise peers.]_
* **Screwdriver:** Range 125->135; Cooldown 1.05/1.0/0.97/0.87 -> 0.94/0.89/0.84/0.78; Crit Chance 10%/15%/20%/30% -> 10%/12%/15%/20%; Crit Damage 2x(All) -> 2x/2.25x/2.5x/3.0x; Engineering Scaling 50%(All) -> 50%/60%/70%/80%; Tier-4 Mine Rate 3 seconds -> 4 seconds; _[Landmines max at every 2 seconds which only requires one Wasp, so this gives room to grow.]_ Price 10/22/45/91 -> 11/23/46/84 _[A modest rework+buff: now that Pile of Books exists and Crit can make more sense on Engineering builds, Screwdrivers are a good fit to actually care about that crit.]_
* **Sharp Tooth:** No longer part of the Precise Set (now only Primitive); +1% Lifesteal for every XX% missing health 25%/20%/15%/10% -> 20%/17%/14%/10%; Melee Damage Scaling 50%(All) -> 60%(All); Lifesteal Scaling 50%/65%/80%/100% -> 60%/70%/80%/100%; Cooldown 1.14/1.07/1.00/0.93 -> 1.11/1.04/0.97/0.89 _[Being part of the two biggest Sets when it really wants to be your only weapon made it harder to find (and also polluted the pool for other Precise weapons), so it drops to a single Set. Low-tier Teeth felt awful and struggled to get off the ground, so they kick in the Lifesteal bonuses earlier, and all tiers have slightly less-bad Melee Scaling, making it easier to directly increase their damage (tho still worse than normal weapons).]
* **Spear:** Range 350/375/400/500 -> 325/350/375/450; Cooldown 1.52/1.40/1.28/1.24 -> 1.61/1.48/1.35/1.28 (accounts for the lowered Range)
* **Stick:** Base Damage 8/9/10/12 -> 7/8/10/12
* **Sword:** Tier-4 Cooldown 0.98s -> 0.91s
* **Thief Dagger:** Base Damage 6/12/18/30 -> 5/10/16/26; Knockback 2 -> 0 (All Tiers); Tier-4 Crit Chance 40% -> 35%
#### DLC
* **Brick:** Can no longer break during Wave 1; Breaking SFX are slightly louder
* **Mace:** Cooldown 1.39/1.31/1.23 -> 1.28/1.16/1.06
* **Sickle:** Removed from the game. _[Scaling with Harvesting leads to an item that is going to be overly strong or overly weak with little in-between. May come back in a different form later.]_
* **War Hammer:** Cooldown 2.11/1.95 -> 2.0/1.83; Crit Damage 1.5x -> 1.75x

- **Additional Price Adjustments:** Jousting Lance: 20/36/72/132 -> 20/36/71/128; Lightning Shiv 18/36/66/142 -> 18/36/68/125; Plasma Sledge 136/272 -> 122/218; Mace 46/92/185 -> 43/81/142; Trident: 52/96/200 -> 51/95/168; War Hammer 130/255 -> 119/209
- **Other Tier-4 Price Reductions:** Anchor: 190 -> 168; Brick: 40 -> 36; Cacti Club: 149 -> 133; Captain's Sword: 210 -> 198; Chainsaw: 242 -> 210; Chopper: 122 -> 111; Circular Saw: 173 -> 151; Claw: 110 -> 100; DEX-troyer: 315 -> 285; Drill 250 -> 240; Excalibur: 230 -> 215; Flaming Brass Knuckles: 173 -> 151; Ghost Axe: 149 -> 133; Ghost Flint: 105 -> 95; Hatchet: 122 -> 111; Hiking Pole: 130 -> 120; Knife: 122 -> 111; Lute: 122 -> 111; Plank: 122 -> 111; Power Fist: 221 -> 198; Pruner: 95 -> 93; Quarterstaff: 130 -> 120; Rock: 91 -> 81; Scissors: 122 -> 111; Scythe: 285 -> 260; Sharp Tooth: 105 -> 95; Sickle: 122 -> 111; Spear: 149 -> 133; Spiky Shield: 122 -> 111; Spoon: 122 -> 111; Stick: 91 -> 81; Sword: 190 -> 168; Thief Dagger: 105 -> 95; Thunder Sword: 238 -> 209; Torch: 91 -> 81; Wrench: 149 -> 133

### Ranged
- **Chain-gun:** Long Reload Cooldown 2.04s -> 3.51s; Accuracy 80% -> 65%
- **Crossbow:** Range Scaling 10%(All) -> 9%/10%/11%/12%; Cooldown 1.13(All) -> 1.08/1.13/1.17/1.20; Range 350 -> 325 _[Lower initial cooldown helps its Wave 1-3 performance. Better scaling makes higher tiers actually worth building, while the worsening cooldown offsets this in a thematically appropriate way.]_
- **Laser Gun:** Tier-1 Cooldown 1.98 -> 1.95 _[Allows 1 extra shot during Wave 1, so you're less behind when starting with it.]_
- **Minigun:** Base Damage 1/3 -> 2/4; Now has 25%/35% Knockback Piercing (more effective against resistant enemies) _[Often a more-expensive but worse SMG in vanilla, this gives it some unique utility. Build additional Knockback to really notice the effect.]_
- **Nuclear Launcher:** Cooldown 2.12 -> 2.20; Base Damage 60/120 -> 50/100; Range 800 -> 650; Ranged Scaling 100%/100% -> 125%/125%; Elemental Scaling 100%/100% -> 150%/150% _[Similar strength in Elemental builds, a touch weaker otherwise.]_
- **Obliterator:** Projectile Hitbox Width +25%
- **Potato Thrower:** Added to the Blunt Weapon Set; Base Damage 1(All) -> 2/3/4 _[Blunt Set allows it to find some synergy options when picked as a starting weapon.]_
- **Revolver:** Range 450 -> 425; Price 20/34/70/130 -> 18/36/68/125
- **Rocket Launcher:** Range 500/550/600 -> 500(All)
= **SMG:** Internal Cooldown 4/4/4/3 -> 5/5/5/4 _[In practice, ~8% worse cooldown at 0% Attack Speed, but will end up the same with more Attack Speed. Breakpoint before Attack Speed usefulness plateaus is now 67% for Tiers 1-3 and 51% for Tier-4. (Still also has a spike at 201% for all Tiers.)]_
- **Sniper Gun:** Range 800/1000 -> 550/600; Ranged Damage Scaling 100%(All) -> 200%/250% _[Given that it's in the Gun Set, it should at least passably scale from Ranged Damage and fit into a Gun build - even with these scaling amounts, it still scales worse than a Pistol. Meanwhile it's a weapon that scales off Range, so it shouldn't have so much base Range that adding more is irrelevant.]_
- **Wand:** Cooldown 0.87/0.78/0.70/0.53 -> 0.83/0.77/0.68/0.53 _[The slight cooldown buff lets you get 1 extra kill on Wave 1.]_
#### DLC
- **Blunderbuss:** Tier-3 Damage 50 -> 45
- **Harpoon Gun:** Melee Damage Scaling 100%(All) -> 75%/85%/100%; Piercing 3/4/5 -> 3/4/6; Max Range 800/850/900 -> 750/825/900; Price 50/105/220 -> 46/90/160 _[Better differentiates the tiers while nerfing the powerful lower-tier scaling a bit.]_

* **Additional Price Adjustments:** Crossbow: 16/34/62/132 -> 16/32/61/107; Fireball: 36/66/140 -> 36/68/125; Icicle: 18/36/66/140 -> 18/36/68/125; Minigun: 127/255 -> 122/218; Obliterator 127/255 -> 122/218; Potato Thrower: 36/69/139 -> 33/64/114. Blunderbuss: 45/95/192 -> 46/90/160; Flute: 20/45/80/165 -> 19/41/81/150; Javelin: 18/36/66/140 -> 18/36/68/125
* **Other Tier-4 Price Reductions:** Chain-gun: 300->265; Double Barrel Shotgun: 149 -> 133; Flamethrower: 207 -> 185; Gatling Laser: 290 -> 260; Ghost Scepter: 122 -> 111; Grenade Launcher: 212 -> 191; Laser Gun: 122 -> 111; Medical Gun: 122 -> 111; Nuclear Launcher: 289 -> 251; Particle Accelerator: 289 -> 251; Pistol: 91 -> 81; Rocket Launcher: 207 -> 185; Shredder: 122 -> 111; Shuriken: 105 -> 95; Slingshot: 122 -> 111; SMG: 149 -> 133; Sniper Gun: 245 -> 205; Taser: 122 -> 111; Wand: 105 -> 95
* **Other Minor Accuracy Tweaks** (mostly only relevant if Accuracy is lowered by Heavy Bullets or Eyepatch): Medical Gun 0.9(Tier1-3)->1.0(All); SMG 0.7/0.75/0.8/0.85->0.7/0.74/0.77/0.8; Mini-gun 0.85/1.0 -> 0.8/1.0; Shotgun 0.9/0.95/1.0/1.0->0.9(All); Potato Thrower 0.9(All)->1.0(All); Rocket Launcher 0.8/0.9/1.0 -> 0.9(All) _[For reference, Revolver is 0.9(All), and most other unlisted weapons are 1.0(All).]_

## Characters
* **Baby:** Harvesting 12 -> 15; XP Required to Level Up +130% -> +120%; No longer favored to find XP Gain items _[The extra Harvesting allows them to get their first Level-ups after Waves 1 and 2 much more reliably.]_
* **Brawler:** Range Modifications now reduced by 50%; Range -50 -> -125 (-63); Unarmed Attack Speed Bonus 50% -> 40%; Now applies their +AttackSpeed Bonus to weapons that scale with Attack Speed (Claw) _[In addition to directly nerfing a strong character, the idea here is to make being really close-ranged more of a requirement, giving the character a more unique feel.]_
* **Bull:** Starting HP Regen 15 -> 10
* **Crazy:** No longer starts with a Knife; Now applies their +Range Bonus to weapons that scale with Range (Crossbow & Sniper Rifle); Starting Dodge -30% -> -15% _[If this isn't going to be -100%, it might as well be an amount you can pull out of the deficit if you really want to, especially with Crossbow Set giving some Dodge]_; Starting Ranged Damage -10 -> -15 _[Prevents Crossbows from being overly strong]_; Starting Engineering -10 -> -15 _[To complete the pattern]_
* **Cryptid:** Bonus XP/Gold Per Living Tree 12 -> 11
* **Demon:** Materials to 1 HP Ratio 13 -> 14
* **Doctor:** Harvesting 5 -> 0; Starting HP Regen 5 -> 3
* **Engineer:** No longer starts with a Wrench; Starting Engineering 10 -> 6; Elemental Damage Penalty -50% -> -20% _[Allows Engineer to lean into a mixed Engineering+Elemental build if desired, and makes more sense for Plank as a starting weapon.]_
* **Entrepreneur:** Shop Prices -25% -> -20%
* **Explorer:** Starting Trees: 12 -> 11
* **Farmer:** Now starts with a Garden _[A flavorful buff to a character that's more impacted by nerfs to tier-1 Harvesting and Fertilizer than most, and one that is most relevant for their weaker, non-Pruner-based builds.]_
* **Fisher:** Extra HP 5 -> 8
* **Gladiator:** -30 Luck -> -40
* **King:** Now only gives Attack Speed and Damage for every *different* tier-4 weapon; Bonus Attack Speed & Damage 25% -> 20%
* **Knight:** 2 Melee Damage per 1 Armor -> 3 Melee Damage per 2 Armor
* **Loud:** -3 Harvesting per Wave -> -5; Damage 30% -> 25%
* **Lucky:** 100 Starting Luck -> 70; Luck Modifications +25% -> +40%; Attack Speed -60% -> -50%; (Luck stat slightly better and slightly easier to come by)  _[This makes you care more about actually raising Lucky's Luck stat. Takes a fair bit to break even with vanilla Lucky, so gets slightly better Attack Speed to compensate.]_
* **Mage:** Now starts with a 2nd Sausage when starting with SMG or Shotgun; -50% Engineering Mods -> -33% _[Vanilla partially adapted this change, but -50% is still oppressive for making this alt build work, while -33% is more in the 'hard-but-manageable' range.]_
* **Masochist:** HP Regen 20 -> 15; Armor 8 -> 5
* **Mutant:** XP Needed For Level-up 66% -> 60% _[Evens things back out a bit now that +XP items are actually strong on this character.]_
* **One-armed:** Now gains a 4-Set bonus for whichever weapon they have equipped (except for Legendary) _[A specialized buff to a difficult character that really helps some of their less-viable builds like Shuriken.]_; Can no longer be offered lower-tier versions of the weapon you have equipped _[Very minor; removes completely useless weapons and makes swapping weapons slightly easier.]_
* **Ranger:** No longer starts with a Pistol.
* **Renegade:** Additional Malus: +2% Items Price at the end of each wave. _[Renegade's early game is moderately challenging, while their late game tends to be quite easy. This ramps up the shop costs over time, which leaves the early game fairly similar but makes the later game less trivial.]_
* **Sick:** No longer favored to find Lifesteal items.
* **Soldier:** 200% Pickup Range -> 125% _[Gives them some reason to care about Pickup Range items.]_
* **Speedy:** Starting Speed 30% -> 20% _[More room to meaningfully increase from where you start]_; Starting Armor -3 -> -2
* **Streamer:** Now also favored to find Stand-still items.
* **Wildling:** No longer starts with a Stick.
_[Initial weapon removals (Crazy, Ranger, Wildling, Engineer) make those characters more varied by making the starting weapon choice matter more, preventing the default fall-back option.]_
### DLC
* **Captain:** No longer favored to find XP Gain items.
* **Chef:** Can no longer be offered Eyes Surgery.
* **Creature:** No longer scales weapon damage with Curse; Now increases cursed equipment strength based on how much Curse stat you have; Now has higher minimum curse strength (-20% to +30% instead of -30% to +30%) _[This makes the character less about simply being OP with fast weapons and instead leans into curse in a more unique way.]_
* **Druid:** Max HP +5 -> No Extra HP; 33% Chance for any fruit to give +1 Luck -> 100% Chance for poisoned fruit to give +2 Luck _[This gives a risk/reward element to the poisoned fruit, giving them a more unique aspect to interact with.]_
* **Dwarf:** Can no longer be offered Seashell.
* **Hiker:** Steps Per HP 80 -> 75; Starting Speed -5% -> No Penalty; Speed Modifications +10% -> No Bonus _[Streamlines the awkwardness with Speed, resulting in a minor buff overall.]_

## Enemies
### Elites
#### Crash Zone
* **Hivemind/Colossus:** Phase 2 Cooldown 0.9s -> 1.02s _[Gives a bit more breathing room during the rapid onslaught of Phase 2.]_
* **Mantis:** Time Before First Attack 2s -> 1.75s; Phase 2 Cooldown 1.33s -> 1.25s; Phase 2 Charge Duration 0.7s -> 0.85s; Phase 2 Charge Speed 800 -> 740 (Total Distance 560 -> 629) _[Differentiates Mantis and Rhino more.]_
* **Butcher:** Phase 2 & 3 Max Range increased _[Makes it so you can't so easily get out of range of the slashes; most relevant for Explorer.]_
* **Rhino:** Base Speed 250 -> 275

#### The Abyss
* Spider Crab:**: Phase 1 Crab Summoning Cooldown 2s -> 1.85s; Summoning Radius 600 -> 850; HP to switch to 2nd Phase 85% -> 82%; Time to switch to 2nd Phase 12s -> 13s; Phase 3 Max Range increased _[Aiming to make the initial summoning phase more noticeable and interesting; this causes one extra summoning before switching phases from time.]_
* **Turtle:** Time Before First Attack 2s -> 0.5s; HP Per Wave 700 -> 750; Base Armor 3 -> 1; Armor Per Wave 0.5 -> 0.75 _[Similar armor early, more armor later. Also means its armor is more reasonable if Gangster sees it very early. HP is now the same as normal Elites.]

### Standard Enemies
+ **Fly:** Base HP 15 -> 7; HP Per Wave 4 -> 7 _[Similar HP early, more HP late.]_
+ **Tentacle:** Item Crate Drop Chance 2% -> 3%
+ **Small Charger:** Knockback Resistance 80% -> 75%
+ **Small Viking Charger:** Knockback Resistance 80% -> 75%
+ **Tall Bruiser:** Knockback Resistance 90% -> 87%
+ **Tall Armored Bruiser:** Knockback Resistance 90% -> 87%
+ **Hatched Slasher:** Knockback Resistance 90% -> 87%
+ **Lamprey Fish:** Knockback Resistance 95% -> 93%
_[The base game mostly implemented my tweaks here, but it still felt difficult for Knockback to be impactful so I go a small step further.]_
#### DLC
+ **Pufferfish:** Now fires 4 projectiles when killed by a melee hit _[This was the original behavior in beta. It means they are no longer irrelevant for a melee build, while still giving you safe angles to approach from.]_
+ **Stargazer:** Base Speed 100 -> 115; Boosted HP (When you destroy their Incubator) 150% -> 200%; Boosted Speed 250% -> 280%; SFX is now louder and always plays when a vat is entered (but not when you just destroy a vat) _[Makes it more of a downside to kill the Incubator first, rewarding careful play.]_
+ **Narwhal:** Knockback Resistance 90% -> 87%
+ **Vampire Squid:** Initial Cooldown 1.17s -> 1.05s; Fireballs fired before longer cooldown 3 -> 4; HP Per Wave 5 -> 6; Minimum Spawn Distance From Player +100 _[This is a pretty rare and unique enemy; I want it to feel like a bigger threat while still leaving its HP relatively low.]
+ **Walrus:** Base HP 40 -> 45; Knockback Resistance 90% -> 87%
+ **Goblin Shark:** Fruit Drop Chance 1% -> 2%

### Wave Spawns: Crazh Zone
* **(DLC) Waves 3, 6, and 13:** Now have guaranteed Seapig spawns (similar to Waves 4, 5, and 16 on The Abyss), giving more opportunity to opt into Curse on this map.
* **Wave 12:** Mummy Spawns 10 -> 16 _[For comparison, Wave 11 averages 32.5 Mummies.]_
* **Wave 14:** Helmet Spawns 108 -> 85; Basics spawns earlier (Makes the first ~15s a bit less empty, total 120->130 Basics); Single Magician Spawns 1-2 x6 -> 1-1 x6 _[Removes the variance which removes the chance for an especially unlucky wave, and makes it so _most_ of the fireball hurlers come from the Wizard Hats which you have more control over.]_
* **Wave 15:** Helmet Spawns 114 -> 95
* **Wave 16:** 2 Flies added to each group of Helmets + Buffers (28 total); Helmet Groups a bit more spread out (500->725) _[Aiming to make them less trivially smashed by melee quickly]_; 2 additional groups of 1 Bruiser + 1 Armored Bruiser spawn, and they show up 10 seconds earlier (18 -> 22 total)
* **(DLC) Wave 16:** One of the added Flies is replaced with a Pufferfish.
* **Wave 20:** Added additional Basics (5 every 5s = 80 total) and Fins (5 every 6s = 65 total), primarily to help out effects which are based on enemy/material counts (but also potentially makes things a bit harder, especially for Ranged builds).
* **Wave 14 & 15 Hordes:** Added 4 single Magician spawns alongside 4 single Wizard Hats (Spawners) spread out over the last ~1/2 of the wave; Made the added Helmets in the 2nd half spawn on the edges of the map (with slightly fewer Helmets spawned); Made the Horde additions identical for 14 & 15; Removed one group of Basic Aliens to make more room for the others. _[Aiming to make these Horde waves feel as threatening as Elite fights are.]_
### Wave Spawns: The Abyss
* **Wave 4:** The Lamprey now appears on Danger Level 1+ instead of only DL5. _[This is a way to learn the enemy pattern more safely instead of having to take Bait.]_
* **Wave 13:** Stargazer spawn timing 30s -> 28s; Egglord spawn timing 40s -> 34s _[Spawns the one egg-layer earlier so it shows up soon enough to matter.]_

## Starting Weapons
* **Baby:** Added Ghost Axe; Removed Taser
* **Chunky:** Added Potato Thrower
* **Crazy:** Added Crossbow _[Which now works with their starting Range.]_; Removed Sharp Tooth (as it is no longer Precise)
* **Cryptid:** Added Flute
* **Cyborg:** Added Medical Gun; Removed Crossbow, Pistol
* **Demon:** Added Shuriken, Potato Thrower
* **Engineer:** Removed Hammer
* **Entrepreneur:** Added Screwdriver, Sharp Tooth
* **Explorer:** Added Medical Gun
* **Generalist:** Added Medical Gun; Removed Lighting Shiv
* **Gladiator:** Removed Sharp Tooth
* **Golem:** Added Quarterstaff
* **Hunter:** Added Knife, Screwdriver
* **Jack:** Removed Shuriken
* **King:** Added Cacti Club, Chopper, Flaming Brass Knuckles, Icicle
* **Mage:** Added Wrench, Cacti Club
* **Mutant:** Added Chopper
* **Old:** Added Medical Gun
* **One-armed:** Added Slingshot, Sword, Hammer, Flaming Brass Knuckles, Fireball
* **Pacifist:** Added Scissors, Rock
* **Ranger:** Added Medical Gun; Removed Pistol
* **Saver:** Added Stick, Torch
* **Sick:** Added Chopper
* **Soldier:** Added Medical Gun
* **Vagabond:** Added Medical Gun; Removed Sharp Tooth (as it is now only one-Set)
* **Vampire:** Added Cacti Club
* **Wildling:** Removed Sharp Tooth _[Doesn't benefit from Wildling's ability.]_
#### DLC
* **Baby:** Added Lute, Brick; Removed Flute
* **Buccaneer:** Added Plank, Wrench, Revolver
* **Builder:** Added Icicle
* **Chef:** Removed Plank, Stick
* **Creature:** Added Shuriken, Ghost Axe, Taser; Removed Fist
* **Curious:** Added Medical Gun
* **Demon:** Added Brick, Mace
* **Diver:** Added Lightning Shiv; Removed Sharp Tooth (as it is no longer Precise)
* **Entrepreneur:** Added Brick
* **Explorer:** Added Lute, Javelin
* **Gangster:** Added Claw
* **King:** Added Blunderbuss, Harpoon Gun, Spoon
* **Hiker:** Added Slingshot, Medical Gun
* **Mage:** Added Spoon
* **Multi-tasker:** Added Spoon; Removed Revolver _[Removal just to make room for Spoon.]_
* **Ogre:** Added Knife
* **One-armed:** Added Harpoon Gun
* **Romantic:** Added Jousting Lance, Screwdriver; Removed Fist
* **Sailor:** Added Harpoon Gun
* **Saver:** Added Hiking Pole
* **Sick:** Added Javelin
* **Vampire:** Added Javelin

# Other Resources
Fully unlocked Brotato (& DLC) save file (with blank character completion so you can still track your progress): https://www.darktwinge.com/skip-metaprogression-unlocks/brotato-save-file/

You might also enjoy my FTL Balance Mod: https://www.darktwinge.com/ftl-balance/index.php

### Recommended Quality of Life Mods
* Bait & Wave Reminder: https://steamcommunity.com/sharedfiles/filedetails/?id=3029249900
* Piggy Bank Reminder: https://steamcommunity.com/sharedfiles/filedetails/?id=3005196583
* Revamped Icons: https://steamcommunity.com/sharedfiles/filedetails/?id=3003721761
* Advanced Statistics: https://steamcommunity.com/sharedfiles/filedetails/?id=3025488976

# Thanks To
Inschato, ArosRising, Hyphen-ated, Pasha, WL, Lady Lynn, and everyone else that's assisted with feedback, suggestions, or coding!
Also thanks to Blobfish for being receptive to feedback, implementing many previous Balance Mod changes directly into the base game.

# License
You are free to use Balance Mod concepts & code with attribution. E.g. if you want to make a spin-off mod with only some changes, you are welcome to do so: just link back to the Balance Mod and/or to my Twitch stream.

# Now Included in Vanilla
These changes were originally made for Balance Mod but are now implemented into the main game (either directly or similarly enough to obsolete my version):
- Knockback now always moves the enemy away from the player.
- Over 100 starting weapon changes.
- Bugfixed Wave 3 shops so they can sell more than 1 weapon.
- Fairy & King show icons for relevant items in shops; Renegade now also shows icons for crates.
- Fixed Crit to work properly for: Glutton, Ogre, Spicy Sauce, Rip & Tear.
- Item Nerfs to: Exoskeleton, Coffee, Plant, Tentacle, Bloody Hand, Extra Stomach, Lure
- Item Buffs to: Sifd's Relic, Eyes Surgery, Spicy Sauce, Snail, Wisdom, Gambling Token, Little Frog, Gummy Berserker, Scar, Black Belt, Bean Teacher, Diploma, Big Arms
- Item Tweaks to: Stone Skin, Tyler
- Item Rework of: Robot Arm
- Weapon Nerfs to: Lightning Shiv, Flamethrower, Stick
- Weapon Buffs to: Torch, Sniper Gun, Plank, Cacti Club, Scissors, Chopper, Crossbow, Medical Gun, Wand, Rock, Pistol, Hammer
- Character Buffs to: Artificer, Jack
- Character Nerfs to: Knight
- Character Tweaks to: Doctor, Mutant
- Elite Nerfs to: Croc, Mother
- Elite Buffs to: Rhino
- Elite Buff+Rework of: Gargoyle
- Fixed Tagging/Banning for: Baby Gecko, Riposte, Silver Bullet, Triangle of Power, Improved Tools, Alloy, Community Support, Power Generator, Octopus, Explorer, Streamer, Cyborg, Farmer, Glutton
- Pocket Factory now counts as a Structure. Fixed Incendiary Turret tooltip's incorrect damage rounding.
- HP tweaks to Looter and Helmet enemies. Drop rate tweak to Tentacle enemy. Knockback tweak to Spawned Magician enemy.
- Revolver & Chain-gun: Fixed a bug that caused them to instantly reload when used alongside effects that check if you're moving (e.g. Solider). Also bugfixed inaccurate long cooldown tooltip.
- Garden cooldowns now show a decimal when applicable. Weapons with very low cooldowns (such as SMG or Minigun) now show an extra decimal place in their cooldown for better accuracy. Fixed cooldown visual for the fastest weapons. Bugfixed Multi-tasker cooldown randomization so it isn't so extreme.
- Stats now update properly on shop reroll for Saver.
- Fighting Stick & Plasma Sledgehammer renamed.