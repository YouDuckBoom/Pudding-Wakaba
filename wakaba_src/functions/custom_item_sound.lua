wakaba.CustomItemSound = {
	[wakaba.Enums.Collectibles.RABBIT_RIBBON] = wakaba.Enums.SoundEffects.RICHER_ITEM_RABBIT_RIBBON,
	[wakaba.Enums.Collectibles.CARAMELLA_PANCAKE] = wakaba.Enums.SoundEffects.RICHER_ITEM_CARAMELLA_PANCAKE,
	[wakaba.Enums.Collectibles.SWEETS_CATALOG] = wakaba.Enums.SoundEffects.RICHER_ITEM_SWEETS_CATALOG,
	[wakaba.Enums.Collectibles.RICHERS_UNIFORM] = wakaba.Enums.SoundEffects.RICHER_ITEM_RICHER_UNIFORM,
	[wakaba.Enums.Collectibles.LIL_RICHER] = wakaba.Enums.SoundEffects.RICHER_ITEM_LIL_RICHER,
	[wakaba.Enums.Collectibles.CHIMAKI] = wakaba.Enums.SoundEffects.CHIMAKI_MAIN,
}

local soundToReplace = {
	SoundEffect.SOUND_CHOIR_UNLOCK,
	SoundEffect.SOUND_POWERUP1,
	SoundEffect.SOUND_POWERUP2,
	SoundEffect.SOUND_POWERUP3,
	SoundEffect.SOUND_DEVILROOM_DEAL,
}
local sfx = SFXManager()

local checkForCustomSound = false
local checkID = nil

function wakaba:prePickupCollision_CustomItemSound(pickup, colliders, low)
	if not wakaba:getOptionValue("customitemsound") then return end
	local id = pickup.SubType
	if wakaba.CustomItemSound[id] then
		checkForCustomSound = true
		checkID = pickup.SubType
	end
end
wakaba:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, wakaba.prePickupCollision_CustomItemSound, PickupVariant.PICKUP_COLLECTIBLE)
wakaba:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, wakaba.prePickupCollision_CustomItemSound, PickupVariant.PICKUP_SHOPITEM)

---@param collectibleType CollectibleType
---@param rng RNG
---@return SoundEffect
function wakaba:getCustomSound(collectibleType, rng)
	local sound = wakaba.CustomItemSound[collectibleType]
	if type(sound) == "table" and #sound > 0 then
		rng = rng or player:GetCollectibleRNG(wakaba.Enums.Collectibles.EASTER_EGG)
		local target = sound[rng:RandomInt(#sound) + 1]
	end
	return sound
end

---@param player EntityPlayer
function wakaba:PlayerRender_CustomItemSound(player)
	if not player:IsItemQueueEmpty() and checkForCustomSound then
		local queue = player.QueuedItem.Item
		if queue:IsCollectible() and wakaba.CustomItemSound[queue.ID] then
			if REPENTOGON then
				checkID = queue.ID
			else
				for _, sound in ipairs(soundToReplace) do
					if sfx:IsPlaying(sound) then
						sfx:Stop(sound)
						sfx:Play(wakaba:getCustomSound(queue.ID), wakaba:getOptionValue("customsoundvolume") / 10 or 0.5)
						break
					end
				end
			end
		end
	end
end

function wakaba:Update_CustomItemSound()
	checkForCustomSound = false
	checkID = nil
end
wakaba:AddCallback(ModCallbacks.MC_POST_RENDER, wakaba.Update_CustomItemSound)

if REPENTOGON then
	function wakaba:SoundPlay_CustomItemSound(ID, Volume, FrameDelay, Loop, Pitch, Pan)
		local customSound = wakaba:getCustomSound(checkID)
		local mult = wakaba:getOptionValue("customsoundvolume") / 10 or 0.5
		if customSound then
			checkID = nil
			return {customSound, Volume * mult, FrameDelay, Loop, 1, 0}
		end
	end
	for _, e in ipairs(soundToReplace) do
		wakaba:AddCallback(ModCallbacks.MC_PRE_SFX_PLAY, wakaba.SoundPlay_CustomItemSound, e)
	end
else
	wakaba:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, wakaba.PlayerRender_CustomItemSound)
end