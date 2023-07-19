

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v103",
[[{FSIZE2}general stuff

added tainted richer. (wip)

added birthright sprites for
pnw characters.
(requires unique items api)

changed rabbit ribbon
curses icon color.

wakaba's double dreams
no longer shows
current pool within hud text,
instead is shown
on the book itself,
wakaba's current dream
from double dreams
is also shown in
eid's item reminder.
(special thanks for
connor for the code)

destiantions now show
correctly for pnw challenges.
(hush, delirium, the beast)

added reference table entries
for fiend folio.

updated isaacscript-common,
hidden item manager,
pause screen completion marks api.

added achievement papers for richer.

completion marks for richer
now can be recorded.

all pnw characters now have own
steven dialouge for the future.

book of shiori code refactor.

{FSIZE2}curse of flames changes

while in curse of flames,
only 'summonable' tag will be
selected from item pool.

actives and non-summonable items
now can be taken normally.

death certificate, and genesis rooms
are not affected by curse of flames.

item wisp from curse of flames
no longer have increased health.

tainted richer is being considered
as curse of flames always active.

{FSIZE2}new challenges
[w15] even or odd
[wb2] super-sensitive richer-chan

{FSIZE2}new items n stuff
the winter albireo
water-flame
richer's flipper
crisis boost
richer's uniform
self burning
pow block
mod block
kuromi card
crystal restock machines

{FSIZE2}balance
vintage threat now can be
activated immediately
by using '0' key
(can be configured)

maijima mythology now only activates
from 5 books per run.
the books are selected
depending on game's seed.

tsukasa no longer shoots
short range of lasers
if she has technology
or brimstone.

richer now has innate
the wafer effect.

richer's sweets catalog
can be moved into pocket active slot
if richer defeats isaac.

adjusted lil moe's
random tear effect selection.

wakaba's uniform now collects
nearest pocket item
instead of held ones.

wakaba's double dreams is
no longer ignored by lawful
(deliverance),
lawful only works if
wakaba's dreams from dd is not set.

wakaba's uniform can no longer
store following cards or pills:
- ancient recall
- wild card (temporary)
- ? card
- vurp!
- any gold pills
- pot of greed (fiend folio)
- small contraband (fiend folio)
- christmas cracker (fiend folio)
- denial dice (samael)

minerva's aura no longer
heals item wisps
if curse of flames is active.

book of the fallen now spawns
hungry soul ghosts
instead of flames.
ow can be used before revival,
but only spawns
3 purgatory ghosts instead of 10.

damage multiplier from
book of the fallen's revival
reduced from 16x to 7x.

power bomb is 4-room charge,
no longer uses/drops bombs
and deal fixed amount of damage.

power bomb also pulls
pickup towards explosion point.

curse of sniper now gives
x2 range multiplier,
x3 damage multiplier,
and can damage enemies at any range,
but richer cannot see her weapons.

curse of amnesia now chance to
force-activates d7
in custom stages
from custom stage api.

prestige pass now spawns
its own(nerfed) crystal restock
that only gives 2 rerolls.

delimiter no longer breaks
super secret rocks,
to fix conflict with
rune rocks for retribution.

neko figure no longer grants
pierce armor for explosion damage.

new year eve's bomb no longer
sets enemy's health to 1,
instead armor-piercing damage
for explosion is granted.
pre-existing armor-piercing
explosions deals 2x damage for enemies.

new year eve's bomb now allows
tainted ??? to use bombs
for 3 poop manas,
but no longer gives poop manas.

plasma beam now deals
1.25x laser damage,
pre-laser attack
pierces enemies' armor.
previous effect was
removed entirely.

trial stew now gives
8 stacks of unique 'trial stack.
each stack gives +1 fire rate,
+25% damage, and bonus +100% damage
if trial stacks remain.
each room clear fully charges
active item and remove 1 trial stack.

return token sets time counter
to 1 sec instead of 0.

various item quality,
charges, item pool changes

{FSIZE2}tweaks + fixes

fixed possible bug within
irregular quality value.
(-1, or 5+)

rabbit ribbon no longer converts
curse of the lost
while in samael's extra rooms.

fixed lil shiva shooting
wave of tears infinitely
on rapid attack button presses.

fixed eat heart charging
with invincible enemies.

fixed some trinket reroll mechanics,
or rock trinket spawning
outside of golem for fiend folio.

fixed some custom special rooms
for minimapi resetting
while in curse of fairy.

fixed wakaba's double dreams
not updating guppy's eye
expectation on use.

fixed curse of amnesia
turning starting room
as uncleared state.

fixed curse of amnesia
using same award seed,
resulting room clear drop
being same per room.

fixed power bomb loop sound
not stopping on room move
before the effect ends.

grimreaper defender now
removes all of damocles
passives instead of 1.

fixed lil mao achievement
paper missing.

fixed see des bischofs,
jar of clover
appearing in challenges.

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v102a", 
[[{FSIZE2}fixes
Fixed some compability issues with some mods deactivated
]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v102", 
[[{FSIZE2}general stuff
added semi-compability 
for library expanded. 
not mainly compatible yet, 
but shouldn't trouble too much.

tweaked some elixir of life 
conversion conditions.

updated general isaacscript module.

{FSIZE2}new items n stuff
trial stew
magma blade (for real)

{FSIZE2}tweaks + fixes
blacklisted some items 
from shiori (for now)
-empty book 
-my story 
(fiend folio)

-blank book 
-kindling book 
-electromagnetism explained 
-cursed book 
(library expanded)

wakaba's nemesis now has a 
50% chance to reroll q3 items

all batteries in shop now will 
be replaced by golden keys, 
and key into 1+1 key 
if playing as shiori.
each golden key 
for shiori costs 5.

obtaining golden keys for shiori 
now converts into 6 keys.

isekai definition no longer 
spawns lil clot if spawned count 
is 10 or more. 
(the count is seperated 
from sumptorium/t.eve, 
but shares with lil clot trinket) 
using it while 10 sets their hp 
into max and increase chance for 
hidden effect from i.d.

removed 'nogreed' tag for 
dimension cutter. 
delirious boss can be spawned 
in greed mode wave by 5%, 
scales with luck, max 25%

aurora gem's purple coin 
drop rate is also affected by 
current held easter eggs

grimreaper defender 
now defends damocles
(not vintage threat) 
while held. 
if the sword falls, 
it immediately disappeares 
with grimreaper defender. 
this ignores charges, 
and grimreaper defender 
is also removed by process. 
this does not apply 
for shiori's book.

changed grimreaper defender's 
defensive effect from 
custom one to wafer effect.

elixir of life no longer removes 
heart containers by chances, 
instead donating 4 times 
will remove max hearts.

lil mao now chases enemies 
automatically with baby bender.

reapplied curse of blind in 
[w98] hyper random challenge.

fixed crashes in multiplayer 
if co-op ghost appears.

fixed wakaba's nemesis 
making collectibles 
on sale requiring 
heart containers for keeper.

fixed crashes 
for epiphany characters 
selection screen 
due to leftover codes

cached maijima mythology
book selections,
hopefully using it
doesn't do lagfest

fixed elixir of life 
not converting soul hearts 
if isaac has no heart containers

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v101a", 
[[{FSIZE2}fixes
Fixed Wakaba's Pendant 
Luck stat not working

Reverted on-take 
damage effect to 
normal priority 
to fix taking double damage 
while holding Eat Heart,
Mistake, and Lunar Stone
]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v101", 
[[{FSIZE2}general stuff
Added missing entries 
for Inventory Descriptions

Added Wakaba's ticket, 
Shiori's Valut, Purple Coin, 
and souls sprite 
for MiniMAPI

Added some failsafe for 
Rabbit Ribbon curses, 
This will prevent character 
turning into The Lost 
sometimes for no reason 
after mod 
enable/disable/update.

{FSIZE2}tweaks + fixes

Firefly Lighter no longer 
spawns fireflies, 
instead grants 
Curse of Darkenss immunity.

Wakaba Duality no longer 
gives stat downs 
granted from 
Wakaba's Nemesis.

Tweaked Wakaba's Pendant 
Luck increments 
with super late priority, 
making Luck adjustment 
after other modded items.

Secret Card now only grants 
only 1 coin per room clear 
on Hard Mode. 
(Not applied in Greedier)

Color Joker now sets 
Broken Hearts to 
half of character's 
Heart Limit

Retrun Postage? 
now removes 
Eternal Fly and 
Eternal Flickerspirit
(Fiend Folio variant).

Book of Trauma 
now explodes 
max 7 of Player's 
tears on screen, 
and Isaac's Position.

Isekai Definition 
now spawns a red clot 
that doesn't drain health, 
and no longer affected 
by Judas' birthright.

Easter Egg damage 
increases more per coin 
if Isaac has 5 
or more Easter eggs

Executioner now grants 
Backstabber effect 
by default

Fixed rare cases 
for Soul of Wakaba 
fails to active

Fixed Book of Silence 
not erasing fires 
from enemies

Fixed allowing 
locked items option 
is absent in config

Fixed Richer's Birthright
not saving selected
weapon on continue

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v100", 
[[{FSIZE2}save data has
{FSIZE2}been reset!!!

{FSIZE2}Richer

New character has
been arrived!

A maid girl visits
the basement.

{FSIZE2}new items n stuff
valut rift
power bomb
magma blade
jar of clover
see des bichofs
caramella pancake
isaac cartridge
afterbirth cartridge
repentance cartridge
minerva ticket
soul of tsukasa
easter egg
aurora gem
flash shift
elixir of life
star reversal
prestige pass
crisis boost

{FSIZE2}general stuff

unlock papers for
tsukasa/t.tsukasa

modified flash shift
effects for t.tsukasa

integrated wakaba's uniform
list into eid reminder

another fortune machine
has been replaced by
shiori's valut

renamed challenge name
to indicate numbers

many room clear rewards
now works in greed mode

t.tsukasa birthright effect
now has been changed
birthright for t.tsukasa
allows her to shoot tears

{FSIZE2}tweaks + fixes

dead cat now turns t.wakaba,
t.shiori's health into 1

wakaba's blessing no longer
rerolls q1 items

wakaba's nemesis no longer
rerolls q3 items

anti balance no longer
rerolls q2 items

curse of flames no longer
turns active items into wisps

Wakaba's Nemesis stats no longer 
applied in abandoned Mines

Beetlejuice also spawn pills 
on room clears, or using the item

Beetlejuice now counts 
towards spun transformation

Wakaba's Pendant now adds 
additional Luck stat after 
setting to 7/10 Luck

Trolled! pill now teleports to 
Boss room instead of I AM ERROR 
in Mausoleum/Gehenna II 
with ascent route

Reduced total reward count for 
Shiori Valut from 
5 > 3 on Normal, 
3 > 2 on Hard Mode

3D Printer now copies one of 
smelted trinkets Isaac isn't 
holding anything. 
Still prioritizes holding ones

Book of the Fallen gets removed 
for Tainted Cain when revived, 
quest tag is removed for this change

Fixed Social Distance prevent opening 
Devil/Angel room when Isaac has Murasame

Fixed Clover Chest not removing 
opposite pickup from Options?

Fixed Red Corruption not 
activating on Sheol/Cathedral

Fixed Wakaba's Double Dreams 
converting Book of Virtues wisps 
into Wakaba's Dream Card

Fixed Lunar Stone, Elixir of Life 
not revealing blind alt-path 
treasure room items

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Tsukasa v99a", 
[[{FSIZE2}General/Misc

Fixed major errors for 
Fiend Folio pills after 
1.7.9b update

Fixed major issue for 
using Active items 
because of 
Character Costume Protector 
included in the mod 
after 1.7.9b update. 
Costume Protector is 
temporarily removed.

]])
DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Tsukasa v99", 
[[{FSIZE2}General/Misc

Applied Dead Sea Scrolls 
menu for mod.

Added Korean Quotes 
for collectibles/Trinkets/Pills.

Updated reroll function
from Pudding n Wakaba 
to sync EID's function properly.

Added Pause Screen 
Completion Marks API.

Updated Damocles API.

{FSIZE2}new items

{CLR3} Firefly Lighter}
Passive
Unlocked by ??? 
(default currently)

{CLR3} Double Invader}
Passive
Unlocked by ???
(default currently)

{CLR3} Beetlejuice}
Active
Defeat Satan as Tsukasa
(not yet)

{CLR3} Red Corruption}
Passive
Defeat ??? as Tsukasa
(not yet)

{CLR3} Plasma Beam}
Passive
Defeat Mega Satan as Tsukasa
(not yet)

{FSIZE2}Balance

Reverted weight values 
for Pudding n Wakaba items.

-Added weight informations 
for Bag of Crafting.

Wakaba's Blessing is now 
available for Tainted Lost again.
-Holy Mantle Shield 
no longer activates for T.Lost.

Wakaba's Birthright effect/Wakaba Duality
now opens Devil/Angel door 
in ???/Home floors.
-The door will be opened 
in starting room 
instead of boss room.

Secret Card no longer gives 
no damage/hidden Wakaba's Blessing bonuses.

Counter no longer gives 
Wakaba's Blessing bonuses.

Soul of Wakaba/Soul of Wakaba? 
now spawns an corresponding(Angel/Devil) 
pool item that cost 15 coins 
if there are no rooms left to convert.

Reduced Book of the Forgotten 
charge to 12 > 6

Isekai Definition no longer 
heals Lil' clots

Lunar Stone gauge no longer 
decreases gradually 
when Isaac cannot get soul hearts. 
(Can be changed later)

Increased general costs for 
Book of Conquest.

Arcane/Advanced/Mystic Crystals 
no longer appear in Boss rooms.

Curse of the Tower 2 
no longer spawns 
Golden troll bombs 
for non-penalty damage.

Anti Balance also turns
all pills into horse variant.

Reduced drop rate for 
Book of Shiori 
+ Book of Sin/Lemegeton combo.

{FSIZE2}Wakaba's Uniform

Wild Card can no longer be placed 
for 1st slot of Uniform.

Using ? Card no longer 
affects Uniform slots.

Voiding Uniform no longer 
alters Uniform slots, 
Using Void again will activate 
stored card/pills in Uniform slots before.

Using Uniform with Car Battery 
also activates stored card/pills 
in Uniform slots 
after switching card/pills.

Changed mimiccharges:

-Queen of Spades : 10 > 8
-Wakaba's Dream Card : 10 > 8
-Soul of Wakaba : 10 > 8
-Soul of Wakaba? : 10 > 8

{FSIZE2}Bug fixes

Fixed infinite loop from 
Wakaba's Uniform for some card/pills.

Fixed Inventory Descriptions list 
render errors for certain situations.

Fixed revival function with Found Soul.

Fixed Shiori giving consumables 
on switching books.

Fixed Soul of Wakaba/Soul of Wakaba? 
converting progerssion rooms.

Fixed potential issues 
from Book of Focus.

Fixed Syrup showing wrong costume 
for non-regular skin color.

Fixed a random console error 
showing from Book of Forgotten.

Fixed Apollyon Crisis not working 
while Void or Abyss is in the room.

Fixed Lunar Stone not consuming 
soul hearts when not playing as Tsukasa.

Fixed Eat Heart charging for ignored 
modded items that gives damage immunities.

Fixed Mystic Crystal not giving 
Holy Mantle shields 
when Isaac isn't in full health.

Fixed Lemegeton indicator 
not working from Inventory Descriptions.

Fixed Curse of the Tower 2 
spawning Golden troll bombs 
when damage is blocked by modded items.

Fixed book switching for Shiori 
giving consumables if available.

Fixed conquered/murasame enemies 
somtimes damaging players. 
(almost) 

Fixed Eye of Clock 
not appearing in any pools.

Fixed crashes for Wakaba's Uniform 
when using with Fiend Folio's pills.

Fixed some revival function.
-Now Tsukasa/Lunar Stone's revival 
works correctly with Fiend Folio mod.

]])