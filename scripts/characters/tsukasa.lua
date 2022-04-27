
local playerType = Isaac.GetPlayerTypeByName("Tsukasa", false)
local removed = false
local isWakabaContinue = true



--some mods force the players cache update to happen every frame, triggering costume application
--this prevents costume from being applied repeatedly
function wakaba:GetTsukasaCostume(player)
	--print("wakaba.costumecurrframe ",wakaba.costumecurrframe)
	if wakaba.costumecurrframe == 0 then
		wakaba.costumecurrframe = wakaba.costumecooldown
		player:AddNullCostume(wakaba.COSTUME_TSUKASA)
		player:RemoveCostume(Isaac.GetItemConfig():GetCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY))
	end
end

--[[ if Poglite then
	local pogCostume = Isaac.GetCostumeIdByPath("gfx/characters/wakaba_pog.anm2")
	Poglite:AddPogCostume("TsukasaPog",playerType,pogCostume)
end ]]

--Costume currently not working in Knife Piece 2 area. Needs to be fixed.
function wakaba:PostTsukasaUpdate(player)
	if player:GetPlayerType() == wakaba.PLAYER_TSUKASA
	then
		--player:ResetDamageCooldown()
		if not player:HasCurseMistEffect() and not (player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY)) then
			player:AddCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY, 0, false, -1, 0)
		end
		wakaba:GetPlayerEntityData(player)
		local data = player:GetData()
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, wakaba.PostTsukasaUpdate)

--Broken Heart Rendering
function wakaba:PostTsukasaRender()
end
--wakaba:AddCallback(ModCallbacks.MC_POST_RENDER, wakaba.PostTsukasaRender)


function wakaba:TakeDamage_Tsukasa(entity, amount, flags, source, cooldown)
	-- If the player is Wakaba
	--print(entity.Type)
	local player = entity:ToPlayer()
	if player and player:GetPlayerType() == wakaba.PLAYER_TSUKASA then
		if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then

		end
	end
end
wakaba:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, wakaba.TakeDamage_Tsukasa, EntityType.ENTITY_PLAYER)
--[[ 
function wakaba:TearUpdate_Tsukasa(tear)
	local parent = tear.SpawnerEntity
	if not parent or not parent:ToPlayer() then return end
	local player = parent:ToPlayer()
	if player:GetPlayerType() == wakaba.PLAYER_TSUKASA then
		local laser = player:FireTechLaser(player.Position, LaserOffset.LASER_TECH1_OFFSET, player:GetAimDirection(), false, true, player, 1)
		tear:Remove()
		laser:SetMaxDistance(player.TearRange)
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, wakaba.TearUpdate_Tsukasa)
 ]]
function wakaba:LaserUpdate_Tsukasa(laser)
	if laser.SubType ~= LaserSubType.LASER_SUBTYPE_LINEAR then return end
	local parent = laser.SpawnerEntity
	if not parent or not parent:ToPlayer() then return end
	local player = parent:ToPlayer()
	if player:GetPlayerType() == wakaba.PLAYER_TSUKASA then
		--print("laser", laser.LaserLength, laser.MaxDistance)
		--laser.LaserLength = 5000
		laser:SetMaxDistance(105 + (player.TearRange / 5.85))
	end
end

wakaba:AddCallback(ModCallbacks.MC_POST_LASER_INIT, wakaba.LaserUpdate_Tsukasa)
wakaba:AddCallback(ModCallbacks.MC_POST_LASER_UPDATE, wakaba.LaserUpdate_Tsukasa)


-- TearFlags.TEAR_ICE is not working due to bugs. Planned in next patch
local TsukasaChar = { 
    DAMAGE = 0.65,
    SPEED = 0.1,
    SHOTSPEED = 1.0,
    TEARRANGE = 0.0,
		TEARS = 1.2,
    LUCK = 0,
    FLYING = false,                                 
    TEARFLAG = TearFlags.TEAR_SPECTRAL | TearFlags.TEAR_PERSISTENT,
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0)  -- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}
 
function wakaba:onTsukasaCache(player, cacheFlag)
  if player:GetPlayerType() == wakaba.PLAYER_TSUKASA then
		--wakaba:GetTsukasaCostume(player)
    if cacheFlag & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage * TsukasaChar.DAMAGE
    end
    if cacheFlag & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then
        player.ShotSpeed = player.ShotSpeed * TsukasaChar.SHOTSPEED
    end
    if cacheFlag & CacheFlag.CACHE_RANGE == CacheFlag.CACHE_RANGE then
        player.TearRange = player.TearRange
    end
    if cacheFlag & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
        player.MoveSpeed = player.MoveSpeed + TsukasaChar.SPEED
    end
    if cacheFlag & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
        player.Luck = player.Luck + TsukasaChar.LUCK
    end
    if cacheFlag & CacheFlag.CACHE_FLYING == CacheFlag.CACHE_FLYING and TsukasaChar.FLYING then
        player.CanFly = true
    end
    if cacheFlag & CacheFlag.CACHE_FIREDELAY == CacheFlag.CACHE_FIREDELAY then
			if player:HasCollectible(CollectibleType.COLLECTIBLE_POLYPHEMUS) then
        player.MaxFireDelay = wakaba:TearsUp(player.MaxFireDelay, TsukasaChar.TEARS)
			else
        player.MaxFireDelay = player.MaxFireDelay * 1.5
			end
    end
    if cacheFlag & CacheFlag.CACHE_TEARFLAG == CacheFlag.CACHE_TEARFLAG then
        player.TearFlags = player.TearFlags | TsukasaChar.TEARFLAG
    end
    if cacheFlag & CacheFlag.CACHE_TEARCOLOR == CacheFlag.CACHE_TEARCOLOR then
        player.TearColor = TsukasaChar.TEARCOLOR
    end
	else
		--player:TryRemoveNullCostume(wakaba.COSTUME_TSUKASA)
  end
	
end
 
wakaba:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, wakaba.onTsukasaCache)

function wakaba:NewRoom_Tsukasa()
	local isTreasure = Game():GetRoom():GetType() == RoomType.ROOM_TREASURE
	local isTsukasa = false
	for i = 0, Game():GetNumPlayers() - 1 do
		local player = Isaac.GetPlayer(i)
		if player:GetPlayerType() == wakaba.PLAYER_TSUKASA then
			isTsukasa = true
		end
	end
	if isTreasure and isTsukasa then 
		Game():ShowHallucination(0, BackdropType.PLANETARIUM)
		SFXManager():Stop(SoundEffect.SOUND_DEATH_CARD)
	end
end
--wakaba:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, wakaba.NewRoom_Tsukasa)

function wakaba:AfterTsukasaInit(player)
  local player = player or Isaac.GetPlayer()
	--print("Tsukasa event passed")
	if player:GetPlayerType() == playerType then
		if wakaba.state.options.cp_tsukasa then
      --player:ClearCostumes()
		else
			wakaba.costumecurrframe = 0
			wakaba:GetTsukasaCostume(player)
		end
    local data = player:GetData()
    data.wakaba = data.wakaba or {}
		data.wakaba.lunargauge = 1000000
		data.wakaba.lunarregenrate = 0
	end
end

function wakaba:PostTsukasaInit(player)
	if player:GetPlayerType() == playerType then
		wakaba:GetTsukasaCostume(player)
		player:EvaluateItems()
	end
  if not isWakabaContinue then
		wakaba:AfterTsukasaInit(player)
  end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, wakaba.PostTsukasaInit)

function wakaba:TsukasaInit(continue)
  if (not continue) then
    isWakabaContinue = false
    wakaba:AfterTsukasaInit()
  end
	--wakaba:TsukasaRoomInit()
end
wakaba:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, wakaba.TsukasaInit)

function wakaba:TsukasaExit()
  isWakabaContinue = true
end
wakaba:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, wakaba.TsukasaExit)

--[[ if Poglite then
	if wakaba.state.pog ~= nil then
		if wakaba.state.pog then
			-- Tsukasa POG
			local pogCostume = Isaac.GetCostumeIdByPath("gfx/characters/wakabapog.anm2")
			Poglite:AddPogCostume("TsukasaPog",playerType,pogCostume)
		else
			-- Origin POG
			local pogCostume = Isaac.GetCostumeIdByPath("gfx/characters/wakabapog.anm2")
			Poglite:AddPogCostume("TsukasaPog",playerType,pogCostume)
		end
	end
end ]]



