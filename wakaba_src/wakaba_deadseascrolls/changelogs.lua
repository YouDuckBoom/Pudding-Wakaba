DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Rira v115",
[[{FSIZE2}general

- vintage threat
-- now eid descriptions show
which item invalidates
damage penalty protection

- maid duet
-- now eid descriptions show
which item is blacklisted
for position swap

- 'inventory description'
code refactor
-- now grid mode is added
-- pressing 'f6' while in list
will switch grid and list mode
-- add functions to add append
entries that shows currently
-- list no longer affected
by eid transparency settings

- added eid icons for
-- wakaba status effects
-- aqua trinkets

- lunatic mode
-- mom's heart is now
mausoleum variant

{FSIZE2}repentogon
- phantom cloak
-- add charge bar render
-- actual effect is not changed

- inventory descriptions
-- add option to show passive
history instead of held passives
-- history list now shows
item pool for specific items

- some items no longer
work with metronome

- maid duet
-- blacklisted following items
(cooldown only)
--- notched axe
--- breath of life

{FSIZE2}balance

- quality, pool weight
has been changed for
some items

- bring me there
-- bring me there spawned
by mausouleum ii no longer
turns into aqua
-- normally spawned one
still has a chance
to be aqua

- easter egg
-- is no longer
eden's starting item

- caramalla pancake
-- reduced overall damage
from caramella flies
-- weapons fire normally
if fly count is exceeded

- lil wakaba
-- fire rate is now fixed
-- now laser has homing
properties by default

{FSIZE2}bug fixes

- fixed some collectibles spawned
from wrong item pool
due to damocles api

- fix majority of eid issues,
caused by default
markup settings

- fix shiori whitelist
not working with
timed items

- fix all pudding n wakaba
items considered as
quality 0 for
bag of crafting

- fix golden aqua trinkets
not being absorbed

- fix invdesc option being
on wrong position
in mod config menu

- fix revival items from
pudding n wakaba teleporting
from beast room

- fix jacob n esau
getting 2 damos each
from enhanced boss dest

- fix damage multiplier up
pills working as normal damage ups

- fix star reversal
not working when smelted
after bitcoin ii fix

- changed extra room
generation logic,
hopefully this fixes
death certificate crash issues
with winter albireo,
or book of shiori

- fix death's heads
outside of boss rooms
not being damaged
during lunatic mode

- fix vintage threat 
damage flag check error,
resulting all damage
triggering damocles fall

- blacklisted rotgut
for executioner

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Rira v114",
[[{FSIZE2}general
- add 'enhanced boss goal'
feature (demo)
-- pressing '=' on keyboard
(not keypad) opens a dialog
that can set extra goal
with uber health values.
--- pressing = again to close

-- following can be set
--- target
--- health (total health
that splits for each middle
major bosses.
mom and mom's heart
is not included)
--- start with damocles
--- lunatic mode (see below)
--- lock target until game clear

- add 'lunatic mode' feature
-- many of pudding n wakaba mod
items are really powerful,
making some players could
make the game trivial
-- lunatic mode significantly
weakens some items from wakaba mod
-- some items do not appear
in lunatic mode, and some
other items requires
repentogon to be appeared
-- currently exclusive to
'enhanced boss goal' feature
-- this invalidates
'godhead unnerf' mod

- add stat swap
option for rira
-- adds tears mult x0.33
and damage mult x3 for rira
-- this can be reduce
difficulty for rira but
can also help to
reduce lags by many tears
-- this option is always
active on lunatic mode

- room name display
-- weight value is shown
as '0.00x' format, rounded


{FSIZE2}repentogon
- clover chest
-- now works with
guppy's eye

- magma blade
-- now the item is
repentogon exclusive
-- now grants
explosive immunity
-- now shoots extra
blade and flame waves
every 20 tears

- maid duet
-- blacklisted
blighted/broken dice
(epiphany, charges only)
-- blacklisted items
by max charges now
preserves charges like 9 volt
-- now fully charges
active item on pickup

- fixed revival items
now shows revival counter
on hud
-- caramella pancake
-- bunny parfait
-- see des bischofs
-- jar of clover
-- vintage threat

{FSIZE2}balance

- lunatic mode changes
are not listed here,
check eid for each item
while on lunatic mode

 shiori
- blacklisted following items
-- leviticus
(milkshake vol1, temp)

bring me there
- now door to mausoleum heart
spawns in dad's note room
if held in case of tmtrainer.
beating mom's heart this way
cancels dad's note route
and continues to corpse

curse of the tower 2
- now bomb pickup
can convert into
golden troll bombs
- taking damage
now spanws 6 troll bombs
- reduced overall pool weight

eat heart
- indirect usage of item
(such as tmtrainer)
now activates metronome instead.
void usage still
spawns pedestal normally.

red corruption
- iteration count
reduced from 3 > 2

caramella pancake
- caramella flies
no longer get
pushed by explosions

self burning
- indirect usage of item
(such as tmtrainer)
now activates only
5 seconds in current room

black bean mochi
- reduced explosion
damage from 60 > 15

chimaki
- now tries to jump
if player is not reachable
on idle state
- no longer targets
friendly enemies

{FSIZE2}bug fixes

- fixed crystal restock
datas not loading in ascent

- (rgon) fix error log
showing for non-generic
difficulty
(such as insane from
community remix)

- fix bring me there
crashing the game
after save and continue

- fix curse of sniper
constantly prints
error message

- fix golden star reversal
overlapping 2
planetarium items

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Rira v113",
[[{FSIZE2}general
- updated compatibility eid
-- some entries from
inventory description is now
available through new item reminder
--- character descriptions
--- curses descriptions
--- soul of shiori effects
--- wakaba's uniform
-- some hidden effects are
now available by enabling
eid's hidden descriptions
--- hidden effects are marked
as grey clover icon
-- repentogon exclusive effects
are marked as wakaba clover icon

- updated compatibility
for epiphany wave 6
-- shiori now has special
active charge interaction with
blighted/broken dice

- now warning will be shown
if not playing as repentogon

- challenges that starts with
tainted wakaba characters
now restart 1 more time
for the first time,
to fix issues with starting condition

- added options to adjust custom sounds
-- volumes for custom items sounds
--- default volume is reduced by 50%
-- custom item sounds for p&w items
-- custom hurt sounds for richer, rira

{FSIZE2}repentogon
- wakaba's double dreams, double invader
-- goad head, eucharist
is now overrided

- added discord rpc compatibility
from catinsurance

{FSIZE2}new items
- book of amplitude

{FSIZE2}balance

jar of clover
- now gives +1 luck
per 120 > 240 seconds

eye of clock
- circle lasers now appear
only if isaac is shooting
- only 1 circle laser
will be pop out initially,
will be increased up to 3
as long as holding shoot buttons

book of conquest
- indirect item
(unknown bookmark, tmtrainter,
or so on)
usage are limit to
40 cost instead of 160

nasa lover
- no longer gives
isaac electric tears

arcane crystal
- extra damage chance
reduced from 70% > 20%,
scales with luck

advanced crystal
- armor-piercing attack
chance reduced from 25% > 5%,
scales with luck

mystic crystal
- holy shield granted
is changed from soul hearts
to per 8 room clears
- max shield cound is
reduced from 5 > 2

maid duet
- blacklisted following items
(cooldown reduction only)
-- blighted/broken dice (epiphany)
-- sand pouch (sacred dreams)

caramella pancake
- flies no longer fly
through walls.
flies targeting enemies
still can fly through.

{FSIZE2}bug fixes

- fixed some elements
not restored by glowing hourglass
-- cunning paper

- esau's wakaba's uniform,
cunning paper now can be shown

- rabbit ribbon/lil richer
-- fix item not working
properly with shiori
-- fix saved charge
not transfering properly
with special cooldown actives

- self burning
-- fixed item description
not matching with its effects

- fix some outdated eid entries

- fix black bean mochi,
sakura mont blanc
affecting fireplaces

- fix tainted richer
prevent other characters
getting collectibles

- fix phd not working
with wakaba pills
after rira update

- fix wakaba's nemesis
armor piercing not working
with other characters

- fix tainted wakaba
not damaging enemies
through red candle

- fix custom pills
not working if
wakaba's uniform
has 1 or more pills

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Rira v112",
[[{FSIZE2}general
- updated compatibility for
epiphany wave 6
-- added blacklist for tr lost
-- updated blacklist for tr eden
-- updated reroll mechanic check,
to make sure no more freezing
if revelations + pnw + epiphany
is active at the same time
- updated eid conditional descriptions
- improved shiori active item handler
-- this fixes potential
issues with lil rira

- chimaki debug hud no longer appears.
can be reshown by editing
debugChimaki value
from wakaba_flags.lua

{FSIZE2}repentogon

- challenge w04 : no longer starts
with notched axe,
but all main weapons
except of notched axe
are disabled

- richer's bra
-- now adds devil room chance +10%

{FSIZE2}balance

shiori
- blacklisted following items
-- everything jar

maid duet
- blacklisted following items (swap only)
-- placebo
-- blank card
-- clear rune
-- perfectly generic object
- blacklisted all epiphany characters (swap only)

range os
- range multiplier
reduced from 55% -> 40%

crisis boost
- overall damage multiplier
reduced from max 1.75x -> 1.45x

rira's bento
- items no longer rerolled into
bento while in full reroll (d4)

lil rira
- timed actives now count
120 second as 1 charge

{FSIZE2}bug fixes
- fixed some elements not
restored by glowing hourglass
-- lunar stone gauge
-- elixir of life max soul cap
-- concentration counter
-- challenge wb2 counter
-- wakaba's nemesis damage
-- crystal restock counter
-- lil richer counter
-- lil rira damage ups

- fix sakura mont blanc
ignoring tears down multiplier
from enemy kills

- fix unknown bookmark/maijima
mythology selecting unused book

- fix w04, w09 unlock not working correctly

- fix wakaba status effect
only apply one effect for bosses

- fix multiple status effect
not working with rira's bra,
and icon rendering

- fix some typos for
korean descriptions
- fix costume protector error
if wakaba characters
get 2+ brimstones
- fix notched axe
not working properly in w04
- fix clover shard
not appearing in w14
- fix shiori + lil rira + bitcoin
making infinite damage ups
- fix shiori + blank card 
+ trial stew making infinite damage ups

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Rira v111",
[[{FSIZE2}v111a patch
rira's bento
- reduced stats increments

bitcoin ii
- no longer noisy sounds
for glitched items
that use bitcoin ii

caramella pancake
- fix caramella pancake converting
normal bomb into ciel flies
- fix caramella flies
not chasing faraway enemies

maid duet
- fix maid duet blacklist
not working
- fix maid duet copying
first item slot if there are
no pocket actives
- maid duet no longer
reduce everything jar cooldown

{FSIZE2}rira update

- new character has been
appeared to basement

{FSIZE2}general stuff
- changed slot callback method
from isaacscript
to retribution/repentogon

- add custom items pools for
clover chest, valut rift

- Updated character portraits

- Bunny Parfait effect now
can be shown in Found HUD

{FSIZE2}repentogon additions

- following familiars from pudding & wakaba
now have higher priority

- completion marks and achievements
are now synced

- wakaba : no longer shows broken hearts
to make heart limit,
uses vanilla heart limit
mechanics instead

- player damage negate callbacks
changed to repentogon callbacks
-- this allows defending holy shields for negate

- global hud elements callbacks
changed to repentogon callbacks

- health type for
t.wakaba, t.shiori, t.richer
changed to repentogon callbacks
-- health type for tainted wakaba
changed to black -> soul
due to this change

{FSIZE2}items
- Kanae Lens : Unlocked by default
- Ancient Catalog : Defeat Isaac as Richer
- Richer's Bra : Unlocked by default
- Richer Ticket : Unlocked by default
- Rira Ticket : Unlocked by default

{FSIZE2}balance
- all items from pudding & wakaba
that grants curse of blind immunity
also changes some negative pills
into another one
-- amnesia -> i can see forever
-- retro vision -> vurp
-- i'm excited!!! -> gulp!
-- social distance -> duality orders

wakaba/wakaba's blessing
- emergency holy shields
now works like boss challenge rooms
- no longer reactivates
emergency holy shields
if already activated
on room enter

tainted wakaba/wakaba's nemesis
- no longer adds chances to
change cards to cracked key,
and guaranteed q3/4
in ultra secret rooms

tsukasa
- cannot concentrate repeatedly
until room clear
- max allowed stacks
are reduced further

richer
- birthright no longer removes
rabbit ribbon curses,
but all penalties from
rabbit ribbon curses are removed
-- curse of sniper : removes
transparent weapon penalty
-- curse of fairy : grants
spelunker hat effect
-- curse of magical girl :
all damage takes health
instead of instakill
-- curse of amnesia : no longer turns
cleared room into uncleared state,
instead, there is a chance to
trigger room clear effect
in already cleared room
- also adds innate extra trinket boost

tainted richer/the winter albireo
- baby plum in richer's planetarium
now immediately leaves when entered

syrup
- now has constant empty charges,
allowing to make some synergies

wakaba's uniform
- now consumes charges in all modes

wakaba's pendant
- increase price, quality

eat heart
- no longer gains overcharge and q4 bonus,
due to boss pools not having
q4 that causes errors
- using eat heart on overcharged
no longer depletes charge completely

book of shiori
- spawn extra library per floor,
previous item spawn is removed

minerva's aura
- gives additional x2.3
fire rate multiplier (does not stack)

shiori's valut
- now is divided into 2 variants
-- library ver that contains library pool
-- blue ver that contains custom pool
with blue themed items
- price is determined by quality and devil price.

concentration
- concentration no longer work
if stacks are 300 or more
- concentration speed is far more
reduced on high stacks

flash shift
- add an option to use health
if no remaining shifts are left
- uses half heart per extra shift
- does not work with tainted tsukasa
or extra high tears stat.
- neptunus gives flash shift
extra 2 shifts per cycle

red corruption
- creation of new rooms are now chance based
46% chance, 100% at 29 luck

question block
- temporarily removed, will be readded

lunar stone
- on gauge depleted,
creates an explosion
on isaac's position
- add some synergies with some items
-- luna : restore lunar gauge
with luna light beam.
-- sol/fragmented card :
drastically reduces lunar gauge
reduction speed
-- firefly lighter : grants chance
to shoot holy light shots

easter egg
- reverted previous change - now shows
all collected eggs on
the hud instead of one.
this is reverted because of genesis

elixir of life
- no longer regains holy shields
while in lost state.
regains holy mantle shields
if no the lost has no holy shields.
inv frames are normal in this state.

richer's necklace
- now has 11 frames of cooldown
- multiple copies of necklace
reduce cooldown

- stackable mantle
- make blanket also activete boss rush rooms

- bring me there
- now changes boss rooms
from mausoleum ii immediately
instead of checking before
entering the floor.
dropping the trinket
reverts the boss room into mom.
(does not work if entered through
polaroid/negative door in depths ii)
- bring me there no longer drops
in mines ii/mausoleum i.
it will drop in mausoleum ii instead.

crane card,
confessional card,
valut rift,
trial stew
- changed type from tarot > tarot r,
making spawn rate reduced.

{FSIZE2}tweaks + fixes

- fix trinkets trying to
convert into aqua every time
the pickup inits

- fix some items not available
from any item pools

- fix extra rooms not appearing
as tainted richer
with curse of labytinth

- fix power bomb explosion
not triggering
broken shovel falling

- lunar stone : fix weird revival
order with vanilla revival items

- library expanded : blacklisted
weird book from shiori

- fix potential issues with ascent
from clover chest/valut rift

- fix speed down not applying
with d-cup icecream + binge eater

- fix wrong order with
detailed respawn compatibility

- fix issues with hidden item
loading with save/continue

- adjust unique birthright
init order to fix errors
with unique items port pack

- fix winter albireo, easter egg
only working with
active side of tainted lazarus

]])
DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v107",
[[{FSIZE2}v107d/e patch
- add chinese eid entries
thanks to youduckboom

- fixed some eid
descriptions not
applying latest
description data

{FSIZE2}v107c patch
- fix minor eid errors

- fix potential major issues with
epiphany compatibility

{FSIZE2}v107b patch
- easter egg now follows isaad
instead of orbiting

- all of wakaba's blessing
synergies are removed

- plumy's tears now follows
isaac's tear effects without
wakaba's blessing

- lunar stone now spawns
luna moonlight on starting of
each floor

- fixed winter albireo not working
on certain situations

- fixed eid error from
all stats down pill

{FSIZE2}v107a patch
- fixed water-flame, winter albireo
not available in any item pools

tainted richer
added shortcut portal that
leads to tainted richer planetarium
for first floor

all tainted richer planetariums
now have white fireplace.
getting winter albireo as tainted richer
or multiple copies of winter albireo
as other characters makes
tainted richer planetariums to spawn
extra collectibles.
(limit 2 extra copies for now)

{FSIZE2}general stuff
changed pickup indexing method
achievement papers for tainted richer
completion marks for
tainted richer now can be recorded

{FSIZE2}items
???
???

{FSIZE2}balance
rabbit ribbon
- curse of labyrinth buffs now only
spawns extra treasure, shops.
-- extra rooms spawned by rabbit ribbon
will only have room layouts from p&w mod.
-- rabbit ribbon treasure rooms
can be appeared normally,
but shops do not.
- curse of magical girl now allows
using blood donation machines,
curse rooms, sacrifice room spikes.
-- this does not protect from
all non-penalty damage sources.

counter
- increased cooldown from 5 > 8 seconds
- now fires 1 laser per activation

wakaba's nemesis
- adjust stats when isaac get items,
instead of constant checking

murasame
- now is a passive item,
removed previous on-use effect
- adds duality effect, multiple copies make
random item free for devil/angel shop,
and remove selection status from
random item for angel room.

phantom cloak
- enemies no longer stay dumb while active.
only get confusion.

soul of richer
- only grants 3 lemegeton wisps
with clear rune

magnet heaven (gold)
- magnetize enemies for 5 secs
on room enter

star reversal
- also allow tainted richer planetariums
- add option to drop pedestals
for smelted ones

{FSIZE2}tweaks + fixes
fixed some achievement papers not appearing

fixed book of shiori room/floor
synergies not resetting

fixed locked cards/runes appearing
through rune bag, book of shiori/fruit cake,
or booster pack.

curse room door images no longer
being converted to
tainted richer planetarium door.

fixed wakaba's blessing shield
not working on starting room.

fixed siren stealing murasame familiar

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v106",
[[{FSIZE2}tainted richer
item pedestals will be
tinted with purple temporarily
if tainted richer is nearby

- this doesn't apply if
tainted richer won't convert into flames

tainted richer planetariums
now can be spawned on first floor

tainted richer planetariums
now replaces golden treasure rooms
on greed mode

{FSIZE2}general stuff
added found hud configuration

{FSIZE2}Epiphany Compatibility
reserved tarnished characters entries

fixed using invalid group
that causing console errors

added golden active synergies
for some items

tr keeper no longer converts
clover chest on touch

added turnover shops layouts for
tainted richer planetariums

tr eden can no longer charge active items
through rabbit ribbon/lil richer

added throwing bag generic synergies
for most items

{FSIZE2}items
soul of richer
eternity cookie

{FSIZE2}balance
duality orders
now guarantees devil/angel room
for current floor (eucharist + duality)
horse variation still spawns 2 items

hellish vomit
original effect is moved to horse variation
now grants brimstone for current room

unholy curse
now breaks 2 mantle shields
for horse variation correctly

self burning
taking hit by projectile while active
will grant 1 second of invincibility,
to prevent continious hit by other sources

bitcoin ii
reduce speed of pickup count shuffling
disappears once dropped

lunar stone
adjust lunar gauge management

{FSIZE2}tweaks + fixes
fixed horse pills not working
after 1.7.9b patch

fixed horse pill descriptions not applying

fixed crystal restocks not working
due to latest update

excluded fireplaces being damaged
by plasma beam, resulting constant
damage sound in water rooms

fixed wakaba's uniform not accounting
for horse pill activation
if any player has anti balance

fixed tainted richer's planetariums
not available for greed mode

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v105",
[[{FSIZE2}general stuff
added some hud stuff
- room name display
- simple hit count

{FSIZE2}balance
lunar stone no longer use
soul heart to heal
and also no longer
is affected by
self damage.
dying through
self damage
still affects
lunar stone

lunar stone gauge is
recovered by room clears,
more room clears
decreases reduction speed

clearing boss rooms
now recovers lunar stone
completely, and
no longer reduces gauge

d6 plus/chaos reverts
item pedestal state
to untouched

increases d6 plus
cooldown from 4 to 6

increase determination ribbon
force-drop rate to
2% > 8% (hard),
0.5% > 2% (normal)

{FSIZE2}tweaks + fixes
blacklisted cursed trinkets
from retribution
to be changed into
aqua trinkets

fix richer's necklace
damaging player
due to errors

]])

DeadSeaScrollsMenu.AddChangelog("Pudding n Wakaba", "Richer v104",
[[{FSIZE2}tainted richer changes
crystal restocks in
winter albireo planetariums
grants more reroll counts
if any player has
more options.

all pedestals in
winter albireo planetariums
can be picked up
without selection.

{FSIZE2}new challenges
[w16] runaway pheromones

{FSIZE2}new items n stuff
richer's necklace

{FSIZE2}balance
rabbit ribbon preserves
charges like lil richer
(max 20)

extra rabbit ribbon
adds 4 extra max charges.

reduced lil richer
max charge counter
from 16 to 12.

{FSIZE2}tweaks + fixes
fix eid korean descs
for modded items
not working properly.

korean names for items
now displayed correctly
for multiple players
like j/e.

fix p&w familiars
not synergized with
marked
(or simmilar synergy).

fix explosions from
valut rift
destroying nearby machines.

fix wakaba's uniform
crashing the game
when showing
pill descriptions.

fix tsukasa reviving
temporarily if
she got damage on
less than 4 perc.

]])


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