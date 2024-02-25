wakaba.CustomHurtSound = {
	[wakaba.Enums.Players.RICHER] = wakaba.Enums.SoundEffects.RICHER_HURT,
	[wakaba.Enums.Players.RICHER_B] = wakaba.Enums.SoundEffects.RICHER_HURT,
	[wakaba.Enums.Players.RIRA] = wakaba.Enums.SoundEffects.RIRA_HURT,
}
wakaba.CustomDeathSound = {
	[wakaba.Enums.Players.RICHER] = wakaba.Enums.SoundEffects.RICHER_DEATH,
	[wakaba.Enums.Players.RICHER_B] = wakaba.Enums.SoundEffects.RICHER_DEATH,
	[wakaba.Enums.Players.RIRA] = wakaba.Enums.SoundEffects.RIRA_DEATH,
}

local hurtReplace = {
	SoundEffect.SOUND_ISAAC_HURT_GRUNT,
}
local deathReplace = {
	SoundEffect.SOUND_ISAACDIES,
}
local sfx = SFXManager()

local checkType = PlayerType.PLAYER_ISAAC
local skipDelay
local checkForDelay

function wakaba:TakeDamage_CustomSound(player)
	checkType = player:ToPlayer():GetPlayerType()
end
wakaba:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, wakaba.TakeDamage_CustomSound, EntityType.ENTITY_PLAYER)

function wakaba:PlayerCollision_CustomSound(player, collider, low)
	if collider.Type == EntityType.ENTITY_FIREPLACE and collider.Variant == 4 then
		checkType = player:ToPlayer():GetPlayerType()
		checkForDelay = player:ToPlayer():GetPlayerType()
	end
end
wakaba:AddCallback(ModCallbacks.MC_PRE_PLAYER_COLLISION, wakaba.PlayerCollision_CustomSound, 0)

function wakaba:TakeDamage_CustomSound_LostSoul(soul)
	if soul.Variant == FamiliarVariant.LOST_SOUL then
		checkType = PlayerType.PLAYER_ISAAC
	end
end
wakaba:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, wakaba.TakeDamage_CustomSound_LostSoul, EntityType.ENTITY_FAMILIAR)

---@param collectibleType CollectibleType
---@param rng RNG
---@return SoundEffect
function wakaba:getCustomHurtSound(collectibleType, rng)
	local sound = wakaba.CustomHurtSound[collectibleType]
	if type(sound) == "table" and #sound > 0 then
		rng = rng or player:GetCollectibleRNG(wakaba.Enums.Collectibles.EASTER_EGG)
		local target = sound[rng:RandomInt(#sound) + 1]
	end
	return sound
end

---@param collectibleType CollectibleType
---@param rng RNG
---@return SoundEffect
function wakaba:getCustomDeathSound(collectibleType, rng)
	local sound = wakaba.CustomDeathSound[collectibleType]
	if type(sound) == "table" and #sound > 0 then
		rng = rng or player:GetCollectibleRNG(wakaba.Enums.Collectibles.EASTER_EGG)
		local target = sound[rng:RandomInt(#sound) + 1]
	end
	return sound
end

---@param player EntityPlayer
function wakaba:PlayerRender_CustomHurtSound(player)
	if player:IsDead() then
		checkType = player:ToPlayer():GetPlayerType()
		skipDelay = true
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PLAYER_RENDER, wakaba.PlayerRender_CustomHurtSound)

function wakaba:Update_CustomItemSound()
	local hitSound = wakaba:getCustomHurtSound(checkType)
	local deathSound = wakaba:getCustomDeathSound(checkType)
	local delayedDeathSound = wakaba:getCustomDeathSound(checkForDelay)
	if hitSound or deathSound or delayedDeathSound then
		if hitSound and sfx:IsPlaying(SoundEffect.SOUND_ISAAC_HURT_GRUNT) then
			wakaba.Log("Hit Sound for ".. tostring(checkType) .. " replaced!")
			sfx:Stop(SoundEffect.SOUND_ISAAC_HURT_GRUNT)
			sfx:Play(hitSound)
		end
		if deathSound or delayedDeathSound then
			wakaba:scheduleForUpdate(function ()
				if sfx:IsPlaying(SoundEffect.SOUND_ISAACDIES) then
					wakaba.Log("Death Sound for ".. tostring(checkType) .. " replaced!")
					sfx:Stop(SoundEffect.SOUND_ISAACDIES)
					sfx:Play(deathSound)
				end
			end, skipDelay and 0 or 16)
			if delayedDeathSound then
				if sfx:IsPlaying(SoundEffect.SOUND_ISAACDIES) then
					wakaba.Log("Death Sound for ".. tostring(checkType) .. " replaced!")
					sfx:Stop(SoundEffect.SOUND_ISAACDIES)
					if not sfx:IsPlaying(delayedDeathSound) then
						sfx:Play(delayedDeathSound)
					end
					checkForDelay = nil
				end
			else
				checkForDelay = nil
			end
		end
	end
	checkType = PlayerType.PLAYER_ISAAC
	skipDelay = nil
end
wakaba:AddCallback(ModCallbacks.MC_POST_RENDER, wakaba.Update_CustomItemSound)