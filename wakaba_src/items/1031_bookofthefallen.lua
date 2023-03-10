function wakaba:AfterRevival_BookOfTheFallen(player)
  local data = player:GetData()
  data.wakaba = data.wakaba or {}
	player:AddBrokenHearts(-18)
	player:AddMaxHearts(-24)
	player:AddBoneHearts(-12)
	player:AddSoulHearts(-24)

	player:AddBlackHearts(12)
	if player:GetPlayerType() == PlayerType.PLAYER_CAIN_B then
		player:RemoveCollectible(wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN)
		return
	end

	player:AddCostume(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT), false)
	player:AddCostume(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_FATE), false)

	local Poof = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, player.Position, Vector.Zero, player):ToEffect()
	Poof.SpriteScale = Vector(1.5, 1.5)
	data.wakaba.shioridevil = true
	player:AddCacheFlags(CacheFlag.CACHE_DAMAGE | CacheFlag.CACHE_FLYING | CacheFlag.CACHE_TEARFLAG)

	player:EvaluateItems()
end

function wakaba:PlayerUpdate_BookOfTheFallen()
	for i = 1, wakaba.G:GetNumPlayers() do
    local player = Isaac.GetPlayer(i - 1)
		wakaba:GetPlayerEntityData(player)
		if player:GetData().wakaba then
			if player:GetPlayerType() ~= 23 and player:GetData().wakaba.shioridevil and (not player:GetData().wakaba.blindfolded or player:CanShoot()) then
				local OldChallenge=wakaba.G.Challenge
				wakaba.G.Challenge=6
				player:UpdateCanShoot()
				player:GetData().wakaba.blindfolded = true
				wakaba.G.Challenge=OldChallenge
				player:AddNullCostume(14)
				--print("Trying Add Blindfold Costume")
			elseif player:GetData().wakaba.blindfolded and not player:GetData().wakaba.shioridevil then
				local OldChallenge=wakaba.G.Challenge
				wakaba.G.Challenge=0
				player:UpdateCanShoot()
				player:GetData().wakaba.blindfolded = false
				wakaba.G.Challenge=OldChallenge
				player:TryRemoveNullCostume(14)
				--print("Trying Remove Blindfold Costume")
			end
		end
		--[[ if player:GetData().wakaba 
		and player:GetData().wakaba.shioridevil 
		and player:GetBrokenHearts() >= 12 then
			player:Die()
		end ]]
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_UPDATE, wakaba.PlayerUpdate_BookOfTheFallen)

function wakaba:GetThreshold(damage)
	local th = math.max(math.ceil(math.sqrt(damage)), wakaba.Enums.Constants.FALLEN_AFTER_BASE_COUNT)
	return th
end

function wakaba:ItemUse_BookOfTheFallen(_, rng, player, useFlags, activeSlot, varData)
	wakaba:GetPlayerEntityData(player)

	if player:GetData().wakaba.shioridevil then
		sfx:Play(SoundEffect.SOUND_FLOATY_BABY_ROAR, 0.6, 0, false, 2)
		local damage = player.Damage
		local tears = wakaba:getTearsStat(player.MaxFireDelay)
		local threshold = wakaba:GetThreshold(damage)
		for i = 1, threshold do
			local ghost = Isaac.Spawn(1000, EffectVariant.HUNGRY_SOUL, 1, player.Position, Vector.Zero, player):ToEffect()
			ghost:GetData().wakaba = {}
			ghost.Parent = player
			ghost:GetData().wakaba.isFallenGhost = true
			ghost:SetTimeout((math.ceil(tears/2.73) * 30 * wakaba.Enums.Constants.FALLEN_AFTER_TIMER) - i + 1)
		end
		if not (useFlags & UseFlag.USE_NOANIM == UseFlag.USE_NOANIM) then
			player:AnimateCollectible(wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN, "HideItem", "PlayerPickup")
		end
		return {
			Discharge = true,
			Remove = false,
			ShowAnim = false,
		}
	else
		for i = 1, wakaba.Enums.Constants.FALLEN_BEFORE_BASE_COUNT do
			local soul = Isaac.Spawn(1000, EffectVariant.PURGATORY, 1, player.Position, Vector.Zero, player):ToEffect()
			soul:GetData().wakaba = {}
			soul.Parent = player
			soul:GetData().wakaba.isFallenGhost = true
			for i = 1, 39 do
				soul:Update()
			end
		end
		return {
			Discharge = true,
			Remove = false,
			ShowAnim = not (useFlags & UseFlag.USE_NOANIM == UseFlag.USE_NOANIM),
		}
	end
end
wakaba:AddCallback(ModCallbacks.MC_USE_ITEM, wakaba.ItemUse_BookOfTheFallen, wakaba.Enums.Collectibles.BOOK_OF_THE_FALLEN)

function wakaba:Cache_BookOfTheFallen(player, cacheFlag)
	if not player:GetData().wakaba then return end
  if player:GetData().wakaba.shioridevil then
    if player:GetPlayerType() ~= 23 and cacheFlag | CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
      player.Damage = player.Damage * 7
    end
    if cacheFlag | CacheFlag.CACHE_TEARFLAG == CacheFlag.CACHE_TEARFLAG then
      player.TearFlags = player.TearFlags | TearFlags.TEAR_HOMING
    end
    if cacheFlag | CacheFlag.CACHE_FLYING == CacheFlag.CACHE_FLYING then
      player.CanFly = true
    end
  end
end
wakaba:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, wakaba.Cache_BookOfTheFallen)


function wakaba:prePickupCollision_BookOfTheFallen(pickup, collider, low)
	if collider:ToPlayer() == nil then return end
	if not collider:GetData().wakaba then return end
	local player = collider:ToPlayer()
	if pickup.SubType ~= 0 and player:GetData().wakaba.shioridevil then
		local id = pickup.SubType
		local config = Isaac.GetItemConfig():GetCollectible(id)
		if config.Type == ItemType.ITEM_ACTIVE then
			return false
		end
	end
end

wakaba:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, wakaba.prePickupCollision_BookOfTheFallen, PickupVariant.PICKUP_COLLECTIBLE)
