
local isc = require("wakaba_src.libs.isaacscript-common")

local ffReplaced = false
local leReplaced = false

local throwingBagSynergyLinks = {
	["book_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_FORGOTTEN,
		wakaba.Enums.Collectibles.BOOK_OF_SILENCE,
		wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN,
		wakaba.Enums.Collectibles.BOOK_OF_TRAUMA,
		wakaba.Enums.Collectibles.GRIMREAPER_DEFENDER,
		wakaba.Enums.Collectibles.ISEKAI_DEFINITION,
		wakaba.Enums.Collectibles.MICRO_DOPPELGANGER,
		wakaba.Enums.Collectibles.MAIJIMA_MYTHOLOGY,
	},
	["angel_bagged"] = {
		wakaba.Enums.Collectibles.WAKABAS_BLESSING,
		wakaba.Enums.Collectibles.MINERVA_AURA,
	},
	["devil_bagged"] = {
		wakaba.Enums.Collectibles.WAKABAS_NEMESIS,
	},
	["boss_bagged"] = {
		wakaba.Enums.Collectibles.WAKABAS_NEMESIS,
		wakaba.Enums.Collectibles.NEKO_FIGURE,
		wakaba.Enums.Collectibles.D_CUP_ICECREAM,
		wakaba.Enums.Collectibles.EXECUTIONER,
		wakaba.Enums.Collectibles.NEW_YEAR_BOMB,
		wakaba.Enums.Collectibles.BOOK_OF_FOCUS,
		wakaba.Enums.Collectibles.ADVANCED_CRYSTAL,
	},
	["generic_milk_bagged"] = {
		wakaba.Enums.Collectibles.MYSTERIOUS_GAME_CD,
	},
	["charm_bagged"] = {
		wakaba.Enums.Collectibles.MYSTERIOUS_GAME_CD,
		wakaba.Enums.Collectibles.RETURN_POSTAGE,
		wakaba.Enums.Collectibles.BOOK_OF_CONQUEST,
		wakaba.Enums.Collectibles.RICHERS_UNIFORM,
	},
	["luck_bagged"] = {
		wakaba.Enums.Collectibles.WAKABAS_PENDANT,
	},
	["flies_bagged"] = {
		wakaba.Enums.Collectibles.PLUMY,
	},
	["golden_bagged"] = {
		wakaba.Enums.Collectibles.SECRET_CARD,
	},
	["brimstone_bagged"] = {
		wakaba.Enums.Collectibles.REVENGE_FRUIT,
		wakaba.Enums.Collectibles.LIL_MAO,
	},
	["death_certificate_bagged"] = {
		wakaba.Enums.Collectibles.EATHEART,
		wakaba.Enums.Collectibles.DOUBLE_DREAMS,
	},
	--[[ ["dice_bagged"] = {
		wakaba.Enums.Collectibles.D6_PLUS,
		wakaba.Enums.Collectibles.D6_CHAOS,
	}, ]]
	["explorer_bagged"] = {
		wakaba.Enums.Collectibles.RED_CORRUPTION,
	},
	["medical_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_CONQUEST,
		wakaba.Enums.Collectibles.MINERVA_AURA,
	},
	["bone_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_FORGOTTEN,
	},
	["mystic_bagged"] = {
		wakaba.Enums.Collectibles.UNIFORM,
		wakaba.Enums.Collectibles.BOTTLE_OF_RUNES,
		wakaba.Enums.Collectibles.LUNAR_STONE,
		wakaba.Enums.Collectibles.WATER_FLAME,
	},
	["techx_bagged"] = {
		wakaba.Enums.Collectibles.EYE_OF_CLOCK,
		wakaba.Enums.Collectibles.LIL_WAKABA,
		wakaba.Enums.Collectibles.COUNTER,
	},
	["lost_contact_bagged"] = {
		wakaba.Enums.Collectibles.COUNTER,
		wakaba.Enums.Collectibles.BOOK_OF_SILENCE,
	},
	["fruitcake_bagged"] = {
		wakaba.Enums.Collectibles.LIL_MOE,
		wakaba.Enums.Collectibles.SWEETS_CATALOG,
		wakaba.Enums.Collectibles.RIRAS_BRA,
	},
	["playdoughcookie_bagged"] = {
		wakaba.Enums.Collectibles.LIL_MOE,
		wakaba.Enums.Collectibles.SWEETS_CATALOG,
		wakaba.Enums.Collectibles.RIRAS_BRA,
	},
	["damocles_bagged"] = {
		wakaba.Enums.Collectibles.VINTAGE_THREAT,
	},
	["godhead_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_THE_GOD,
		wakaba.Enums.Collectibles.MYSTIC_CRYSTAL,
	},
	["devil_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN,
	},
	["purgatory_bagged"] = {
		wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN,
	},
	["homing_bagged"] = {
		wakaba.Enums.Collectibles.MINERVA_AURA,
		wakaba.Enums.Collectibles.ARCANE_CRYSTAL,
		wakaba.Enums.Collectibles.PRESTIGE_PASS,
	},
	["lachryphagy_bagged"] = {
		wakaba.Enums.Collectibles.LIL_SHIVA,
	},
	["guppy_bagged"] = {
		wakaba.Enums.Collectibles.NEKO_FIGURE,
	},
	["blackhole_bagged"] = {
		wakaba.Enums.Collectibles.WINTER_ALBIREO,
	},
	["glitched_bagged"] = {
		wakaba.Enums.Collectibles.D6_CHAOS,
	},
	["echo_chamber_bagged"] = {
		wakaba.Enums.Collectibles.DEJA_VU,
	},
	["tool_bagged"] = {
		wakaba.Enums.Collectibles.BALANCE,
	},
	["lunch_bagged"] = {
		wakaba.Enums.Collectibles.MOE_MUFFIN,
	},
	["battery_bagged"] = {
		wakaba.Enums.Collectibles.CONCENTRATION,
		wakaba.Enums.Collectibles.RABBIT_RIBBON,
	},
	["drug_bagged"] = {
		wakaba.Enums.Collectibles.BEETLEJUICE,
		wakaba.Enums.Collectibles.ANTI_BALANCE,
	},
	["fire_bagged"] = {
		wakaba.Enums.Collectibles.MAGMA_BLADE,
		wakaba.Enums.Collectibles.SELF_BURNING,
	},
	["piercing_bagged"] = {
		wakaba.Enums.Collectibles.MAGMA_BLADE,
	},
	--[[ ["sanctum_spiritus_bagged"] = {
		wakaba.Enums.Collectibles.MINERVA_AURA,
		wakaba.Enums.Collectibles.MURASAME,
	}, ]]
	["moms_knife_bagged"] = {
		wakaba.Enums.Collectibles.MURASAME,
	},
	["jacob_bagged"] = {
		wakaba.Enums.Collectibles.NASA_LOVER,
	},
	["confusion_bagged"] = {
		wakaba.Enums.Collectibles.PHANTOM_CLOAK,
	},
	["poison_bagged"] = {
		wakaba.Enums.Collectibles.LUNAR_STONE,
		wakaba.Enums.Collectibles.CLENSING_FOAM,
	},
	["fate_bagged"] = {
		wakaba.Enums.Collectibles.JAR_OF_CLOVER,
		wakaba.Enums.Collectibles.SEE_DES_BISCHOFS,
		wakaba.Enums.Collectibles.BUNNY_PARFAIT,
	},
	["bait_bagged"] = {
		wakaba.Enums.Collectibles.WATER_FLAME,
	},
	["tough_bagged"] = {
		wakaba.Enums.Collectibles.CRISIS_BOOST,
	},
	["spirit_bagged"] = {
		wakaba.Enums.Collectibles.ONSEN_TOWEL,
	},
	["paper_bagged"] = {
		wakaba.Enums.Collectibles.CUNNING_PAPER,
	},
	["curse_of_tower_bagged"] = {
		wakaba.Enums.Collectibles.CURSE_OF_THE_TOWER_2,
	},
	["techzero_bagged"] = {
		wakaba.Enums.Collectibles.RICHERS_NECKLACE,
	},
}

-- INITIALIZE EPIPHANY MENU CHARACTER
function wakaba:Epiphany_AddTarnishedDatas()
	-- DO NOT RUN IF THE API IS NOT LOADED
	if Epiphany and Epiphany.API then
		local Mod = Epiphany
		local api = Mod.API
		local KEEPER = Mod.Character.KEEPER

		if not ffReplaced then

			-- Cache unlock check
			-- Wakaba Duality is considered as the last item from Pudding & Wakaba, which is fixed between updates.
			Mod.UnlockChecker:AddModdedItems("wakaba", wakaba.Enums.Collectibles.WAKABAS_BLESSING, wakaba.Enums.Collectibles.WAKABA_DUALITY, function(item_id)
				-- Pudding & Wakaba double checks item unlocks : at the starting of each run, and item pool's GetCollectibles function.
				return wakaba:IsCompletionItemUnlockedTemp(item_id)
			end)
			Mod:AddExtraCallback(Mod.ExtraCallbacks.PRE_UNLOCK_CACHE, function(cardUnlocks)
				for _, card in pairs(wakaba.Enums.Cards) do
					cardUnlocks.Cards[card] = wakaba:IsCompletionItemUnlockedTemp(card, "card")
				end
			end)

			wakaba:AddCallback(wakaba.Callback.WAKABA_COLLECTIBLE_REROLL, function(_, rerollProps, selected, selectedItemConf, itemPoolType, decrease, seed, isCustom)
				if isCustom and (selected >= Mod.Item.BLIGHTED_DICE.ID and selected <= Mod.Item.WOOLEN_CAP.ID) then
					local achName = Epiphany.CollectibleToAchievement[selected]
					if not (achName and Mod:GetAchievement(achName) > 0) then
						return true
					end
				end
			end)

			-- TR characters for Pudding & Wakaba not available yet, just for reserve
			api.AddCharacter({
				charName = "WAKABA", --Internal character name (REQUIRED)
				charID = wakaba.Enums.Players.WAKABA_T, -- Character ID (REQUIRED)
				charStats = wakaba.playerstats.WAKABA_T, -- Stat array
				costume = "gfx/characters/character_wakaba_t.anm2", -- Main costume (REQUIRED)
				--extraCostume = {Isaac.GetCostumeIdByPath("gfx/characters/character_wakaba_t_extra.anm2")}, -- Extra costume (e.g. Maggy's Hair)
				menuGraphics = "gfx/ui/wakaba_epiphany_menu_wakaba.anm2", -- Character menu graphics (portrait, text) (REQUIRED)
				coopMenuSprite = "gfx/ui/wakaba_epiphany_coop_wakaba.anm2", -- Co-op menu icon (REQUIRED)
				pocketItem = CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, -- Pocket active
				pocketItemPersistent = true, -- Should the pocket active always be re-given when not present? (false is vanilla behaviour)
				unlockChecker = function()
					--return wakaba.state.unlock.trwakaba
					return false
				end, -- function that returns whether the character is unlocked. Defaults to always returning true.
				floorTutorial = "gfx/ui/wakaba/tutorial_placeholder.anm2"
			})
			api.AddCharacter({
				charName = "SHIORI", --Internal character name (REQUIRED)
				charID = wakaba.Enums.Players.SHIORI_T, -- Character ID (REQUIRED)
				charStats = wakaba.playerstats.SHIORI_T, -- Stat array
				costume = "gfx/characters/character_shiori_t.anm2", -- Main costume (REQUIRED)
				--extraCostume = {Isaac.GetCostumeIdByPath("gfx/characters/character_wakaba_t_extra.anm2")}, -- Extra costume (e.g. Maggy's Hair)
				menuGraphics = "gfx/ui/wakaba_epiphany_menu_shiori.anm2", -- Character menu graphics (portrait, text) (REQUIRED)
				coopMenuSprite = "gfx/ui/wakaba_epiphany_coop_shiori.anm2", -- Co-op menu icon (REQUIRED)
				pocketItem = CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, -- Pocket active
				pocketItemPersistent = true, -- Should the pocket active always be re-given when not present? (false is vanilla behaviour)
				unlockChecker = function()
					--return wakaba.state.unlock.trwakaba
					return false
				end, -- function that returns whether the character is unlocked. Defaults to always returning true.
				floorTutorial = "gfx/ui/wakaba/tutorial_placeholder.anm2"
			})
			api.AddCharacter({
				charName = "TSUKASA", --Internal character name (REQUIRED)
				charID = wakaba.Enums.Players.TSUKASA_T, -- Character ID (REQUIRED)
				charStats = wakaba.playerstats.TSUKASA_T, -- Stat array
				costume = "gfx/characters/character_tsukasa_t.anm2", -- Main costume (REQUIRED)
				--extraCostume = {Isaac.GetCostumeIdByPath("gfx/characters/character_wakaba_t_extra.anm2")}, -- Extra costume (e.g. Maggy's Hair)
				menuGraphics = "gfx/ui/wakaba_epiphany_menu_tsukasa.anm2", -- Character menu graphics (portrait, text) (REQUIRED)
				coopMenuSprite = "gfx/ui/wakaba_epiphany_coop_tsukasa.anm2", -- Co-op menu icon (REQUIRED)
				pocketItem = CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, -- Pocket active
				pocketItemPersistent = true, -- Should the pocket active always be re-given when not present? (false is vanilla behaviour)
				unlockChecker = function()
					--return wakaba.state.unlock.trwakaba
					return false
				end, -- function that returns whether the character is unlocked. Defaults to always returning true.
				floorTutorial = "gfx/ui/wakaba/tutorial_placeholder.anm2"
			})
			api.AddCharacter({
				charName = "RICHER", --Internal character name (REQUIRED)
				charID = wakaba.Enums.Players.RICHER_T, -- Character ID (REQUIRED)
				charStats = wakaba.playerstats.RICHER_T, -- Stat array
				costume = "gfx/characters/character_richer_t.anm2", -- Main costume (REQUIRED)
				--extraCostume = {Isaac.GetCostumeIdByPath("gfx/characters/character_wakaba_t_extra.anm2")}, -- Extra costume (e.g. Maggy's Hair)
				menuGraphics = "gfx/ui/wakaba_epiphany_menu_richer.anm2", -- Character menu graphics (portrait, text) (REQUIRED)
				coopMenuSprite = "gfx/ui/wakaba_epiphany_coop_richer.anm2", -- Co-op menu icon (REQUIRED)
				pocketItem = CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, -- Pocket active
				pocketItemPersistent = true, -- Should the pocket active always be re-given when not present? (false is vanilla behaviour)
				unlockChecker = function()
					--return wakaba.state.unlock.trwakaba
					return false
				end, -- function that returns whether the character is unlocked. Defaults to always returning true.
				floorTutorial = "gfx/ui/wakaba/tutorial_placeholder.anm2"
			})
	--[[
			api.AddCharacter({
				charName = "RIRA", --Internal character name (REQUIRED)
				charID = wakaba.Enums.Players.RIRA_T, -- Character ID (REQUIRED)
				charStats = wakaba.playerstats.RIRA_T, -- Stat array
				costume = "gfx/characters/character_rira_t.anm2", -- Main costume (REQUIRED)
				--extraCostume = {Isaac.GetCostumeIdByPath("gfx/characters/character_wakaba_t_extra.anm2")}, -- Extra costume (e.g. Maggy's Hair)
				menuGraphics = "gfx/ui/wakaba/menu_placeholder.anm2", -- Character menu graphics (portrait, text) (REQUIRED)
				coopMenuSprite = "gfx/ui/wakaba/coop_menu_placeholder.anm2", -- Co-op menu icon (REQUIRED)
				pocketItem = CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, -- Pocket active
				pocketItemPersistent = true, -- Should the pocket active always be re-given when not present? (false is vanilla behaviour)
				unlockChecker = function()
					--return wakaba.state.unlock.trwakaba
					return false
				end, -- function that returns whether the character is unlocked. Defaults to always returning true.
				floorTutorial = "gfx/ui/wakaba/tutorial_placeholder.anm2"
			})
			]]

			wakaba:Epiphany_AddThrowingBagSynergies()

			wakaba:BulkAppend(wakaba.Weights.CloverChest, {
				{Epiphany.Item.DEBUG.ID, 1.00},
				{Epiphany.Item.EMPTY_DECK.ID, 1.00},
				{Epiphany.Item.WARM_COAT.ID, 1.00},
				{Epiphany.Item.BROKEN_HALO.ID, 1.00},
				{Epiphany.Item.KINS_CURSE.ID, 1.00},
				{Epiphany.Item.COIN_CASE.ID, 1.00},
			})
			wakaba:BulkAppend(wakaba.Weights.ShioriValut, {
				{Epiphany.Item.D5.ID, 1.00},
				{Epiphany.Item.CHANCE_CUBE.ID, 1.00},
			})

			-- TR Eden Blacklist
			api:AddItemsToEdenBlackList(
				-- Items that combine into single quest item
				wakaba.Enums.Collectibles.WAKABAS_BLESSING,
				wakaba.Enums.Collectibles.WAKABAS_NEMESIS,
				-- Items whose effect persists after losing them
				-- Items that just removing Blind curse are not added, it's just intended ;)
				wakaba.Enums.Collectibles.MURASAME, -- Devil/Angel chance modifier lasts entire floor
				wakaba.Enums.Collectibles.BOOK_OF_SHIORI, -- Tear effect lasts entire run unless player uses Soul of Shiori
				wakaba.Enums.Collectibles.RED_CORRUPTION, -- Compass effect lasts entire floor
				wakaba.Enums.Collectibles.CURSE_OF_THE_TOWER_2, -- Golden Bomb lasts entire floor
				wakaba.Enums.Collectibles.DOUBLE_INVADER, -- Disables Devil/Angel rooms for entire floor
				wakaba.Enums.Collectibles.DOUBLE_DREAMS, -- Disables Devil/Angel rooms for entire floor
				-- Items considered too confusing on a constantly rerolling character
				wakaba.Enums.Collectibles.UNIFORM,
				wakaba.Enums.Collectibles.ELIXIR_OF_LIFE, -- Constant health refill
				wakaba.Enums.Collectibles.QUESTION_BLOCK,
				-- Items that can't be filled, or has no effect before they get rerolled away
				wakaba.Enums.Collectibles.EATHEART, -- Requires 7500 dmg, and can't be debugged
				wakaba.Enums.Collectibles.SECRET_CARD, -- Useless when given for 1 room
				wakaba.Enums.Collectibles.WINTER_ALBIREO, -- Useless when given for 1 room
				wakaba.Enums.Collectibles.DEJA_VU, -- Useless when given for 1 room
				-- Items that revive the player as another character
				wakaba.Enums.Collectibles.VINTAGE_THREAT, -- Tainted Shiori
				wakaba.Enums.Collectibles.SEE_DES_BISCHOFS, -- Tainted Tsukasa
				wakaba.Enums.Collectibles.JAR_OF_CLOVER, -- Wakaba
				wakaba.Enums.Collectibles.BUNNY_PARFAIT, -- Rira
				wakaba.Enums.Collectibles.CARAMELLA_PANCAKE, -- Richer
				-- Bomb modifiers
				wakaba.Enums.Collectibles.NEW_YEAR_BOMB,
				-- Items that give soul or black hearts
				wakaba.Enums.Collectibles.ONSEN_TOWEL,
				wakaba.Enums.Collectibles.SUCCUBUS_BLANKET,
				wakaba.Enums.Collectibles.MINT_CHOCO_ICECREAM,
				-- Items considered too bad for the run as a whole
				wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN -- Must NOT lose the active
			)

			-- prevents "item pool does not exist" warning
			Mod.CustomItemPools.RicherShopPool_Treasure = {} -- Richer's Planetarium shop - Odd floors
			Mod.CustomItemPools.RicherShopPool_Planetarium = {} -- Richer's Planetarium shop - Even floors
			Mod.CustomItemPools.RicherShopPool_Secret = {} -- Richer's Planetarium shop - Hush floor
			Mod.CustomItemPools.RicherShopPool_Devil = {} -- Richer's Planetarium shop - Sheol
			Mod.CustomItemPools.RicherShopPool_Angel = {} -- Richer's Planetarium shop - Cathedral
			Mod.CardGroups.RicherTicket = {} -- Pudding & Wakaba cards for Epiphany card group
			Mod.SlotGroups.CrystalRestock = {} -- Crystal Restocks for Turnover

			-- Epiphany Turnover Shop pools
			api:AddItemsToCustomPool("VaultShop", {
				wakaba.Enums.Collectibles.SECRET_CARD,
			})
			api:AddItemsToCustomPool("DiceShop", {
				wakaba.Enums.Collectibles.SECRET_CARD,
			})
			api:AddItemsToCustomPool("BedroomShop", {
				wakaba.Enums.Collectibles.SECRET_CARD,
			})
			api:AddItemsToCustomPool("SacRoomShop", {
				wakaba.Enums.Collectibles.SECRET_CARD,
			})

			-- Epiphany Beggar/slots pools
			api:AddItemsToCustomPool("PainPool", {
				wakaba.Enums.Collectibles.BOOK_OF_TRAUMA,
			})
			api:AddItemsToCustomPool("ConverterBeggarPool", {
				wakaba.Enums.Collectibles.BOOK_OF_FORGOTTEN,
				{wakaba.Enums.Collectibles.ELIXIR_OF_LIFE, Weight = 0.1},
			})
			api:AddItemsToCustomPool("GlitchSlotPool", {
				{wakaba.Enums.Collectibles.ELIXIR_OF_LIFE, Weight = 0.1},
			})

			-- Epiphany Surprise box Won items pools
			api:AddItemsToCustomPool("SurpriseBox_Heart", {
				wakaba.Enums.Collectibles.BOOK_OF_FORGOTTEN,
				{wakaba.Enums.Collectibles.GRIMREAPER_DEFENDER, Weight = 0.1},
				{wakaba.Enums.Collectibles.ELIXIR_OF_LIFE, Weight = 0.1},
			})
			api:AddItemsToCustomPool("SurpriseBox_Coin", {
				wakaba.Enums.Collectibles.SECRET_CARD,
			})
			api:AddItemsToCustomPool("SurpriseBox_Bomb", {
				wakaba.Enums.Collectibles.BOOK_OF_TRAUMA,
				wakaba.Enums.Collectibles.POW_BLOCK,
				wakaba.Enums.Collectibles.MOD_BLOCK,
				{wakaba.Enums.Collectibles.POWER_BOMB, Weight = 0.5},
				{wakaba.Enums.Collectibles.NEW_YEAR_EVE_BOMB, Weight = 0.5},
			})
			api:AddItemsToCustomPool("SurpriseBox_Battery", {
				{wakaba.Enums.Collectibles.RABBIT_RIBBON, Weight = 0.2},
				{wakaba.Enums.Collectibles.LIL_RICHER, Weight = 0.4},
			})
			api:AddItemsToCustomPool("SurpriseBox_Pill", {
				wakaba.Enums.Collectibles.BEETLEJUICE,
				wakaba.Enums.Collectibles.ANTI_BALANCE,
			})

			api:AddSlotsToSlotGroup("Slots", wakaba.Enums.Slots.SHIORI_VALUT)

			api:AddSlotsToSlotGroup("CrystalRestock", wakaba.Enums.Slots.CRYSTAL_RESTOCK)

			api:AddCardsToCardGroup("Tarot", {
				wakaba.Enums.Cards.CARD_CRANE_CARD,
				wakaba.Enums.Cards.CARD_CONFESSIONAL_CARD,
				wakaba.Enums.Cards.CARD_VALUT_RIFT,
				wakaba.Enums.Cards.CARD_MINERVA_TICKET,
				wakaba.Enums.Cards.CARD_UNKNOWN_BOOKMARK,
				wakaba.Enums.Cards.CARD_TRIAL_STEW,
			})

			api:AddCardsToCardGroup("Suit", {
				wakaba.Enums.Cards.CARD_BLACK_JOKER,
				wakaba.Enums.Cards.CARD_WHITE_JOKER,
				wakaba.Enums.Cards.CARD_QUEEN_OF_SPADES,
				wakaba.Enums.Cards.CARD_COLOR_JOKER,
			})

			api:AddCardsToCardGroup("Soul", {
				wakaba.Enums.Cards.SOUL_SHIORI,
				wakaba.Enums.Cards.SOUL_WAKABA,
				wakaba.Enums.Cards.SOUL_WAKABA2,
				{wakaba.Enums.Cards.SOUL_TSUKASA, Weight = 0.5},
			})

			api:AddCardsToCardGroup("Holy", {
				wakaba.Enums.Cards.CARD_MINERVA_TICKET,
				wakaba.Enums.Cards.CARD_CONFESSIONAL_CARD,
				wakaba.Enums.Cards.CARD_DREAM_CARD,
			})

			api:AddCardsToCardGroup("DiceCapsule", {
				{wakaba.Enums.Cards.CARD_RETURN_TOKEN, Weight = 0.05},
			})

			api:AddCardsToCardGroup("Object", {
				{wakaba.Enums.Cards.CARD_RETURN_TOKEN, Weight = 0.2},
			})

			api:AddCardsToCardGroup("RicherTicket", {
				wakaba.Enums.Cards.CARD_CRANE_CARD,
				wakaba.Enums.Cards.CARD_BLACK_JOKER,
				wakaba.Enums.Cards.CARD_COLOR_JOKER,
				wakaba.Enums.Cards.CARD_WHITE_JOKER,
				wakaba.Enums.Cards.CARD_CONFESSIONAL_CARD,
				{wakaba.Enums.Cards.CARD_DREAM_CARD, Weight = 0.5},
				wakaba.Enums.Cards.CARD_MINERVA_TICKET,
				wakaba.Enums.Cards.CARD_TRIAL_STEW,
				wakaba.Enums.Cards.CARD_UNKNOWN_BOOKMARK,
				{wakaba.Enums.Cards.CARD_VALUT_RIFT, Weight = 0.2},
				{wakaba.Enums.Cards.CARD_QUEEN_OF_SPADES, Weight = 0.2},
			})

			-- Blacklist items to check within Use Item func, will be used inside same use function instead
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.D6_CHAOS)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.BOOK_OF_TRAUMA)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.RICHERS_FLIPPER)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles._3D_PRINTER)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.GRIMREAPER_DEFENDER)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.BALANCE)
			api:BlacklistGoldActive(wakaba.Enums.Collectibles.BEETLEJUICE)

			-- Whitelist Keeper pickups
			wakaba:DictionaryBulkAppend(KEEPER.DisallowedPickUpVariants[100], {
				[wakaba.Enums.Collectibles.SECRET_CARD] = 1,
			})
			wakaba:DictionaryBulkAppend(KEEPER.DisallowedPickUpVariants[350], {
				[wakaba.Enums.Trinkets.BRING_ME_THERE] = 1,
				[wakaba.Enums.Trinkets.BITCOIN] = 1,
			})
			wakaba:DictionaryBulkAppend(KEEPER.DisallowedPickUpVariants, {
				[wakaba.Enums.Pickups.CLOVER_CHEST] = 0,
			})
			wakaba:DictionaryBulkAppend(KEEPER.CollectibleSpawnedPickups, {
				[wakaba.Enums.Collectibles.BEETLEJUICE] = {
					{ PickupVariant.PICKUP_PILL, 1 },
				},
			})

			--#region Multitool
			--[[
			local multitool = Mod.Pickup.MULTITOOL.ChestOpenFunctions

			wakaba:DictionaryBulkAppend(multitool, {
				[wakaba.Enums.Pickups.CLOVER_CHEST] = function (chest)

				end,
			})
			]]
			--#endregion

			local ShopItemType = Mod.Item.TURNOVER.ShopItemType
			local Get = Mod.PickupGetter
			local Groups = Mod.GROUP_ENUM

			--Cards
			local Rune =				 {"Rune"}
			local Soul =				 {"Soul"}
			local Holy = 				 {"Holy"}
			local Essence = 			 {"Essence"}
			--Hearts
			local HeartsAll = 			 {"Red", "Rotten","Black", "Soul","Eternal","Special","Bone", "Greedy"}
			local Red = 				 {"Red", "Rotten", "Special"}
			local Angel = 				 {"Soul", "Eternal"}
			local Devil = 				 {"Black", "Bone"}

			local turnover_layouts = {}

			turnover_layouts["WAKABA_WINTER_ALBIREO_TREASURE"] =	{
				SetUpPrice = 20,
				[0] = {
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
				},
				[1] = {
					{ Vector(240, 320), ShopItemType.Pickup },
					{ Vector(320, 320), ShopItemType.Collectible },
					{ Vector(400, 320), ShopItemType.Pickup },
				},
				[2] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[3] = {
					{ Vector(200, 320), ShopItemType.Collectible },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[4] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[5] = {
					{ Vector(240, 240), ShopItemType.Collectible },
					{ Vector(400, 240), ShopItemType.Collectible },
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
					{ Vector(450, 170), ShopItemType.RestockMachine },
				},
			}

			turnover_layouts["WAKABA_WINTER_ALBIREO_PLANETARIUM"] =	{
				SetUpPrice = 20,
				[0] = {
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
				},
				[1] = {
					{ Vector(240, 320), ShopItemType.Pickup },
					{ Vector(320, 320), ShopItemType.Collectible },
					{ Vector(400, 320), ShopItemType.Pickup },
				},
				[2] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[3] = {
					{ Vector(200, 320), ShopItemType.Collectible },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[4] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[5] = {
					{ Vector(240, 240), ShopItemType.Collectible },
					{ Vector(400, 240), ShopItemType.Collectible },
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
					{ Vector(450, 170), ShopItemType.RestockMachine },
				},
			}

			turnover_layouts["WAKABA_WINTER_ALBIREO_SECRET"] =	{
				SetUpPrice = 20,
				[0] = {
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
				},
				[1] = {
					{ Vector(240, 320), ShopItemType.Pickup },
					{ Vector(320, 320), ShopItemType.Collectible },
					{ Vector(400, 320), ShopItemType.Pickup },
				},
				[2] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[3] = {
					{ Vector(200, 320), ShopItemType.Collectible },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[4] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[5] = {
					{ Vector(240, 240), ShopItemType.Collectible },
					{ Vector(400, 240), ShopItemType.Collectible },
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
					{ Vector(450, 170), ShopItemType.RestockMachine },
				},
			}

			turnover_layouts["WAKABA_WINTER_ALBIREO_DEVIL"] =	{
				SetUpPrice = 20,
				[0] = {
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
				},
				[1] = {
					{ Vector(240, 320), ShopItemType.Pickup },
					{ Vector(320, 320), ShopItemType.Collectible },
					{ Vector(400, 320), ShopItemType.Pickup },
				},
				[2] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[3] = {
					{ Vector(200, 320), ShopItemType.Collectible },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[4] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[5] = {
					{ Vector(240, 240), ShopItemType.Collectible },
					{ Vector(400, 240), ShopItemType.Collectible },
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
					{ Vector(450, 170), ShopItemType.RestockMachine },
				},
			}

			turnover_layouts["WAKABA_WINTER_ALBIREO_ANGEL"] =	{
				SetUpPrice = 20,
				[0] = {
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
				},
				[1] = {
					{ Vector(240, 320), ShopItemType.Pickup },
					{ Vector(320, 320), ShopItemType.Collectible },
					{ Vector(400, 320), ShopItemType.Pickup },
				},
				[2] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[3] = {
					{ Vector(200, 320), ShopItemType.Collectible },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[4] = {
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
				},
				[5] = {
					{ Vector(240, 240), ShopItemType.Collectible },
					{ Vector(400, 240), ShopItemType.Collectible },
					{ Vector(200, 320), ShopItemType.Pickup },
					{ Vector(280, 320), ShopItemType.Pickup },
					{ Vector(360, 320), ShopItemType.Pickup },
					{ Vector(440, 320), ShopItemType.Pickup },
					{ Vector(450, 170), ShopItemType.RestockMachine },
				},
			}

			local turnover_pools = {}

			turnover_pools["WAKABA_WINTER_ALBIREO_TREASURE"] = {
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_NORMAL, 									minTier = 0, maxTier = 3 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK, 							minTier = 2, maxTier = 5 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA, 								minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, 								minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_NORMAL,											minTier = 0, maxTier = 3 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_DOUBLEPACK,									minTier = 2, maxTier = 5 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, 								minTier = 1, maxTier = 3 }},
				{{ PickupVariant.PICKUP_KEY, Mod.Pickup.MULTITOOL.ID, 								minTier = 2, maxTier = 5, }, Weight = 0.06}, --multitool
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_GOLDEN,									minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MICRO,					minTier = 1, maxTier = 2 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL,					minTier = 3, maxTier = 5 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA,					minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN,					minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 1, maxTier = 4, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 2, maxTier = 5, }, Weight = 1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlaying),	 		minTier = 1, maxTier = 2 }}, -- only normal and playing cards
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlayingReverse),	minTier = 3, maxTier = 4 }},
				{{ PickupVariant.PICKUP_PILL, 0, 													minTier = 1, maxTier = 4 }},
				{{ PickupVariant.PICKUP_PILL, Get.GetHorsePill,										minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_PILL, PillColor.PILL_GOLD, 									minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Rune),						minTier = 0, maxTier = 3}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.RuneSoul),				minTier = 2, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Soul),						minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Essence, Rune),				minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Card.CARD_CRACKED_KEY,							minTier = 3, maxTier = 5, }, Weight = 0.8},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetGoldTrinket, 							minTier = 4, maxTier = 5 }, Weight = 0.02},
			}

			turnover_pools["WAKABA_WINTER_ALBIREO_PLANETARIUM"] = {
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_NORMAL, 									minTier = 0, maxTier = 3 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK, 							minTier = 2, maxTier = 4 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA, 								minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, 								minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_NORMAL,											minTier = 0, maxTier = 3 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_DOUBLEPACK,									minTier = 2, maxTier = 4 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, 								minTier = 1, maxTier = 3 }},
				{{ PickupVariant.PICKUP_KEY, Mod.Pickup.MULTITOOL.ID, 								minTier = 2, maxTier = 5, }, Weight = 0.06}, --multitool
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_GOLDEN,									minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MICRO,					minTier = 1, maxTier = 2 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL,					minTier = 3, maxTier = 4 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA,					minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN,					minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 1, maxTier = 4, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 2, maxTier = 5, }, Weight = 1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlaying),	 		minTier = 1, maxTier = 2 }}, -- only normal and playing cards
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlayingReverse),	minTier = 3, maxTier = 5 }},
				{{ PickupVariant.PICKUP_PILL, 0, 													minTier = 1, maxTier = 4 }},
				{{ PickupVariant.PICKUP_PILL, Get.GetHorsePill,										minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_PILL, PillColor.PILL_GOLD, 									minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Rune),						minTier = 0, maxTier = 3}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.RuneSoul),				minTier = 2, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Soul),						minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Essence, Rune),				minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Card.CARD_CRACKED_KEY,							minTier = 3, maxTier = 5, }, Weight = 0.8},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetGoldTrinket, 							minTier = 4, maxTier = 5 }, Weight = 0.02},
			}

			turnover_pools["WAKABA_WINTER_ALBIREO_SECRET"] = {
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA, 								minTier = 0, maxTier = 5, }, Weight = 0.5},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, 								minTier = 2, maxTier = 5, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, 								minTier = 0, maxTier = 5 }},
				{{ PickupVariant.PICKUP_KEY, Mod.Pickup.MULTITOOL.ID, 								minTier = 2, maxTier = 5, }, Weight = 0.4}, --multitool
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_GOLDEN,									minTier = 2, maxTier = 5, }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA,					minTier = 0, maxTier = 5, }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN,					minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 1, maxTier = 4, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 2, maxTier = 4, }, Weight = 1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlaying),	 		minTier = 1, maxTier = 2 }}, -- only normal and playing cards
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlayingReverse),	minTier = 3, maxTier = 4 }},
				{{ PickupVariant.PICKUP_PILL, Get.GetHorsePill,										minTier = 0, maxTier = 5 }, Weight = 0.3},
				{{ PickupVariant.PICKUP_PILL, PillColor.PILL_GOLD, 									minTier = 2, maxTier = 5, }, Weight = 0.1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Rune),						minTier = 0, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.RuneSoul),				minTier = 2, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Soul),						minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Essence, Rune),				minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetGoldTrinket, 							minTier = 4, maxTier = 5 }, Weight = 0.1},
			}

			turnover_pools["WAKABA_WINTER_ALBIREO_DEVIL"] = {
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK, 							minTier = 0, maxTier = 4 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA, 								minTier = 2, maxTier = 4, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, 								minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_DOUBLEPACK,									minTier = 0, maxTier = 4 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, 								minTier = 1, maxTier = 5 }},
				{{ PickupVariant.PICKUP_KEY, Mod.Pickup.MULTITOOL.ID, 								minTier = 2, maxTier = 5, }, Weight = 0.1}, --multitool
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL,					minTier = 1, maxTier = 4 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA,					minTier = 2, maxTier = 5, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN,					minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 1, maxTier = 4, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_PILL, Get.GetHorsePill,										minTier = 0, maxTier = 5, }, Weight = 0.4},
				{{ PickupVariant.PICKUP_PILL, PillColor.PILL_GOLD, 									minTier = 4, maxTier = 5, }, Weight = 0.1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.CardRune),				minTier = 0, maxTier = 5, }, Weight = 0.5}, -- include runes
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.Playing),				minTier = 0, maxTier = 1, }, Weight = 0.6},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 4, }, Weight = 0.4},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.ReversedRune),			minTier = 2, maxTier = 4, }, Weight = 0.8},
				{{ PickupVariant.PICKUP_GRAB_BAG, SackSubType.SACK_NORMAL,							minTier = 0, maxTier = 4,}},
				{{ PickupVariant.PICKUP_HEART, Get.MakeHeartGetter(Devil), 							minTier = 0, maxTier = 4 }},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Rune),						minTier = 0, maxTier = 3}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.RuneSoul),				minTier = 2, maxTier = 4}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 4}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Soul),						minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Essence, Rune),				minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Card.CARD_CRACKED_KEY,							minTier = 3, maxTier = 5, }, Weight = 0.8},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetGoldTrinket, 							minTier = 4, maxTier = 5 }, Weight = 0.1},
			}

			turnover_pools["WAKABA_WINTER_ALBIREO_ANGEL"] = {
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK, 							minTier = 0, maxTier = 4 }},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA, 								minTier = 2, maxTier = 4, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN, 								minTier = 2, maxTier = 5, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_DOUBLEPACK,									minTier = 0, maxTier = 4 }},
				{{ PickupVariant.PICKUP_KEY, KeySubType.KEY_CHARGED, 								minTier = 1, maxTier = 5 }},
				{{ PickupVariant.PICKUP_KEY, Mod.Pickup.MULTITOOL.ID, 								minTier = 2, maxTier = 5, }, Weight = 0.1}, --multitool
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL,					minTier = 3, maxTier = 4 }},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MEGA,					minTier = 2, maxTier = 4, }, Weight = 0.06},
				{{ PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN,					minTier = 2, maxTier = 4, }, Weight = 0.03},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 1, maxTier = 4, }, Weight = 0.2},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 2, maxTier = 4, }, Weight = 1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlaying),	 		minTier = 1, maxTier = 2 }}, -- only normal and playing cards
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.TarotPlayingReverse),	minTier = 3, maxTier = 4 }},
				{{ PickupVariant.PICKUP_PILL, Get.GetHorsePill,										minTier = 0, maxTier = 5, }, Weight = 0.4},
				{{ PickupVariant.PICKUP_PILL, PillColor.PILL_GOLD, 									minTier = 4, maxTier = 5, }, Weight = 0.1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Rune),						minTier = 0, maxTier = 3}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.RuneSoul),				minTier = 2, maxTier = 4}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Groups.PlayingReverse),		minTier = 1, maxTier = 4}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Soul),						minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Essence, Rune),				minTier = 5, maxTier = 5}},
				{{ PickupVariant.PICKUP_HEART, Get.MakeHeartGetter(Angel), 							minTier = 1, maxTier = 5 }},
				{{ PickupVariant.PICKUP_HEART, Get.MakeHeartGetter(Angel), 							minTier = 1, maxTier = 5 }}, --we do this to have a chance of 2 different hearts
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetTrinket, 								minTier = 0, maxTier = 2, }, Weight = 0.1},
				{{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter(Holy, Rune),					minTier = 3, maxTier = 5 }},
				{{ PickupVariant.PICKUP_TAROTCARD, Card.CARD_HOLY,							minTier = 0, maxTier = 5, }, Weight = 2},
				{{ PickupVariant.PICKUP_TRINKET,	Get.GetGoldTrinket, 							minTier = 4, maxTier = 5 }, Weight = 0.1},
			}

			local extraSlotLayout_WinterAlbireo = {
				[-1] = { Vector(80, 0), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- default crystal restock position
				[41007] = { Vector(80, 0), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- Rira level
				[41009] = { Vector(320, 240), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- center position
				[41010] = { Vector(400, 0), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- right position
				[41011] = { Vector(400, 0), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- right position
				[41017] = { Vector(320, 80), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- center position
				[41026] = { Vector(400, 0), ShopItemType.Slot , Get.MakeSlotGetter({ "CrystalRestock" }) }, -- right position
			}

			function Get.GetWinterAlbireoTreasureItem(_, rng)
				return Get.GetItem("RicherShopPool_Treasure", rng)
			end
			function Get.GetWinterAlbireoPlanetariumItem(_, rng)
				return Get.GetItem("RicherShopPool_Planetarium", rng)
			end
			function Get.GetWinterAlbireoSecretItem(_, rng)
				return Get.GetItem("RicherShopPool_Secret", rng)
			end
			function Get.GetWinterAlbireoDevilItem(_, rng)
				return Get.GetItem("RicherShopPool_Devil", rng)
			end
			function Get.GetWinterAlbireoAngelItem(_, rng)
				return Get.GetItem("RicherShopPool_Angel", rng)
			end

			api:AddTurnoverShop({
				Name = "WAKABA_WINTER_ALBIREO_TREASURE",
				Checker = function()
					return wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) == RoomType.ROOM_TREASURE
				end,
				ShopLayout = turnover_layouts["WAKABA_WINTER_ALBIREO_TREASURE"],
				PickupPool = turnover_pools["WAKABA_WINTER_ALBIREO_TREASURE"],
			})

			api:AddTurnoverShop({
				Name = "WAKABA_WINTER_ALBIREO_PLANETARIUM",
				Checker = function()
					return wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) == RoomType.ROOM_PLANETARIUM
				end,
				ShopLayout = turnover_layouts["WAKABA_WINTER_ALBIREO_PLANETARIUM"],
				PickupPool = turnover_pools["WAKABA_WINTER_ALBIREO_PLANETARIUM"],
			})

			api:AddTurnoverShop({
				Name = "WAKABA_WINTER_ALBIREO_SECRET",
				Checker = function()
					return wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) == RoomType.ROOM_SECRET
				end,
				ShopLayout = turnover_layouts["WAKABA_WINTER_ALBIREO_SECRET"],
				PickupPool = turnover_pools["WAKABA_WINTER_ALBIREO_SECRET"],
			})

			api:AddTurnoverShop({
				Name = "WAKABA_WINTER_ALBIREO_DEVIL",
				Checker = function()
					return wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) == RoomType.ROOM_DEVIL
				end,
				ShopLayout = turnover_layouts["WAKABA_WINTER_ALBIREO_DEVIL"],
				PickupPool = turnover_pools["WAKABA_WINTER_ALBIREO_DEVIL"],
			})

			api:AddTurnoverShop({
				Name = "WAKABA_WINTER_ALBIREO_ANGEL",
				Checker = function()
					return wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) == RoomType.ROOM_ANGEL
				end,
				ShopLayout = turnover_layouts["WAKABA_WINTER_ALBIREO_ANGEL"],
				PickupPool = turnover_pools["WAKABA_WINTER_ALBIREO_ANGEL"],
			})
			local TURNOVER = Mod.Item.TURNOVER
			TURNOVER.ExtraRoomTypePools[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_TREASURE] = ItemPoolType.POOL_TREASURE
			TURNOVER.ExtraRoomTypePools[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_PLANETARIUM] = ItemPoolType.POOL_PLANETARIUM
			TURNOVER.ExtraRoomTypePools[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_SECRET] = ItemPoolType.POOL_SECRET
			TURNOVER.ExtraRoomTypePools[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_DEVIL] = ItemPoolType.POOL_DEVIL
			TURNOVER.ExtraRoomTypePools[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_ANGEL] = ItemPoolType.POOL_ANGEL

			TURNOVER.RoomToShopkeeperAnimName[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_TREASURE] = "Planetarium0"
			TURNOVER.RoomToShopkeeperAnimName[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_PLANETARIUM] = "Planetarium0"
			TURNOVER.RoomToShopkeeperAnimName[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_SECRET] = "Planetarium0"
			TURNOVER.RoomToShopkeeperAnimName[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_DEVIL] = "Planetarium0"
			TURNOVER.RoomToShopkeeperAnimName[TURNOVER.ExtraRoomTypes.WAKABA_WINTER_ALBIREO_ANGEL] = "Planetarium0"

			Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
				if wakaba:IsValidWakabaRoom(Game():GetLevel():GetCurrentRoomDesc(), wakaba.RoomTypes.WINTER_ALBIREO) and Game():GetRoom():IsFirstVisit() and IsPlayerPresent(Mod.PlayerType["KEEPER"]) then
					for _, ent in ipairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE)) do
						local pickup = ent:ToPickup()
						pickup.ShopItemId = -1
						pickup.Price = 20
					end
				end
			end)

			local function Turnover_WinterAlbireoSlots(layout, tier, room)
				local roomDesc = Game():GetLevel():GetCurrentRoomDesc()
				if wakaba:IsValidWakabaRoom(roomDesc, wakaba.RoomTypes.WINTER_ALBIREO) then
					local extra = extraSlotLayout_WinterAlbireo[roomDesc.Variant] or extraSlotLayout_WinterAlbireo[-1]
					layout[#layout + 1] = extra
				end
				return layout
			end
			Epiphany:AddExtraCallback(Epiphany.ExtraCallbacks.TURNOVER_GET_LAYOUT_INFO, Turnover_WinterAlbireoSlots)

			local function Turnover_WinterAlbireoCoins(pool, tier, _)
				local roomDesc = Game():GetLevel():GetCurrentRoomDesc()
				if wakaba:IsValidWakabaRoom(roomDesc, wakaba.RoomTypes.WINTER_ALBIREO) and wakaba.state.unlock.easteregg then
					pool[#pool + 1] = {{ PickupVariant.PICKUP_COIN, wakaba.Enums.Coins.EASTER_EGG,}, Weight = 10e9, WeightDecreaseFactor = 0}
					pool[#pool + 1] = {{ PickupVariant.PICKUP_TAROTCARD, Get.MakeCardGetter({"RicherTicket"}), 		minTier = 1, maxTier = 5 }}
					return pool
				end
			end
			Epiphany:AddExtraCallback(Epiphany.ExtraCallbacks.TURNOVER_GET_PICKUP_POOL, Turnover_WinterAlbireoCoins)











			-- Golden Item descriptions for EID
			if EID then
				EID:addDescriptionModifier("Wakaba_Epiphany Golden Actives", function(descObj)
					return descObj.ObjType == 5
					and descObj.ObjVariant == PickupVariant.PICKUP_COLLECTIBLE
					and descObj.ObjSubType > 0
					and wakaba:isActiveItem(descObj.ObjSubType)
					and wakaba:IsGoldenItem(descObj.ObjSubType)
				end, function(descObj)
					local wakabaBuff = wakaba:getWakabaDesc("epiphany_golden", descObj.ObjSubType)
					if wakabaBuff then
						local desc = wakabaBuff.description
						if wakabaBuff.isReplace then
							descObj.Description = desc
						else
							EID:appendToDescription(descObj, "#".. desc .. "{{CR}}")
						end
					end
					return descObj
				end)
			end
			ffReplaced = true
		end

	--[[
		api:AddTurnoverShop({
			Name = "WAKABA_TURNOVER",		 -- shop name, is used internally
			Checker = function ()			-- takes 0 arguments, return true if this shop pool should be used
				return isc:anyPlayerIs(wakaba.Enums.Players.WAKABA)
			end,
			{
				--ShopKeeperPosition = Vector(320,180), -- optional, defaults to Vector(320, 200)
				SetUpPrice = 35,											-- optional, defaults to 10

				-- tables at numeric indexes starting from 0 are shop tiers
				-- it's possible to have any amount of shop tiers, as long as their indexes are sequential
				[0] =
				{
					SetUpPrice = 5, -- optional, overrides SetUpPrice in outer scope

					-- first index is always position, second is the item type
					-- pickups are chosen from PickupPool table
					{Vector(280, 320), ShopItemType.Pickup},

					-- collectibles are picked from current room's item pool
					-- unless a getter function is specified at index [3]
					{Vector(360, 320), ShopItemType.Collectible},
					{Vector(360, 360), ShopItemType.Collectible, function (itemPoolType, rng)
						local itemID = rng:RandomInt(CollectibleType.NUM_COLLECTIBLES) + 1
						return itemID
					end},

					-- slots are picked from Slots SlotGroup
					-- unless a getter function is specified at index [3]
					{Vector(360, 400), ShopItemType.Slot},
					{Vector(360, 440), ShopItemType.Slot, function (rng)
						local slotID = rng:RandomInt(9) + 1
						return slotID
					end},

					-- restock machine only spawns if turnover is used by TR Keeper with Birthright
					{Vector(360, 400), ShopItemType.RestockMachine}
				},
				[1] =
				{
					-- ...
				},
				-- PICKUP POOL ENTRY INFO
				-- [1] =
				-- {
				--		[1]				- Pickup variant
				--		[2]				- Pickup subtype
				--										 * may be an int or a function
				--									* that takes 0 arguments and returns the subtype
				--
				--		minTier - Lowest tier at which a pickup can appear
				--		maxTier - Highest tier at which a pickup can appear
				-- },
				-- Weight	- Pickup's weight
				--								* Higher weight pickups are more likely to spawn
				--								* Pickup's weight is reduced by 4 times for the current shop tier when it spawns
				--
				-- Pickup variant/subtype are required
				-- minTier, maxTier are optional, checks for them pass by default
				-- Weight is optional and defaults to 1.0
				PickupPool =
				{
					{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_NORMAL,																	 minTier = 0, maxTier = 3 }},
					{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_DOUBLEPACK,														 minTier = 2, maxTier = 4 }},
					{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GIGA,																		 minTier = 2, maxTier = 4 },	Weight = 0.06},
					{{ PickupVariant.PICKUP_BOMB, BombSubType.BOMB_GOLDEN,																	 minTier = 2, maxTier = 4 },	Weight = 0.03},
					{{ PickupVariant.PICKUP_KEY,	KeySubType.KEY_NORMAL,																	minTier = 0, maxTier = 3 }},
				}
			}
		})
	 ]]












	end
	if LibraryExpanded then
		if not leReplaced then
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID0, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID1, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID2, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID3, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID4, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.KINDLING_BOOK.ID2, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.ELECTROMAGNETISM_EXPLAINED.ID, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.CURSED_BOOK.ID, wakaba.bookstate.BOOKSHELF_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.WEIRD_BOOK.ID, wakaba.bookstate.BOOKSHELF_SHIORI)
			--wakaba:BlacklistBook(LibraryExpanded.Item.CERTIFICATE.ID, wakaba.bookstate.BOOKSHELF_SHIORI)

			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID0, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID1, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID2, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID3, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID4, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)
			wakaba:BlacklistBook(LibraryExpanded.Item.KINDLING_BOOK.ID2, wakaba.bookstate.BOOKSHELF_SHIORI_DROP)

			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID0, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID1, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID2, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID3, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID4, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.KINDLING_BOOK.ID2, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.ELECTROMAGNETISM_EXPLAINED.ID, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.CURSED_BOOK.ID, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			wakaba:BlacklistBook(LibraryExpanded.Item.WEIRD_BOOK.ID, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)
			--wakaba:BlacklistBook(LibraryExpanded.Item.CERTIFICATE.ID, wakaba.bookstate.BOOKSHELF_UNKNOWN_BOOKMARK)

			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID0, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID1, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID2, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID3, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.BLANK_BOOK.ID4, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.KINDLING_BOOK.ID2, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.ELECTROMAGNETISM_EXPLAINED.ID, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.CURSED_BOOK.ID, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			wakaba:BlacklistBook(LibraryExpanded.Item.WEIRD_BOOK.ID, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
			--wakaba:BlacklistBook(LibraryExpanded.Item.CERTIFICATE.ID, wakaba.bookstate.BOOKSHELF_PURE_SHIORI)
		end
		leReplaced = true
	end

end

function wakaba:Epiphany_AddThrowingBagSynergies()
	for synergyName, collectibleType in pairs(throwingBagSynergyLinks) do
		Epiphany.API:AddCollectibleToCainBagSynergy(synergyName, collectibleType)
	end
end

function wakaba:IsGoldenItem(itemID)
	if not (Epiphany and Epiphany.API) then return false end
	return Epiphany.Pickup.GOLDEN_ITEM:IsGoldenItem(itemID)
end

















wakaba:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, wakaba.Epiphany_AddTarnishedDatas)