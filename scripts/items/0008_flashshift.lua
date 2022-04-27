wakaba.COLLECTIBLE_FLASH_SHIFT = Isaac.GetItemIdByName("Flash Shift")
wakaba.KNIFE_FLASH_SHIFT = 4101
wakaba.SUBTYPE_FLASH_SHIFT = 4101
local flashcooldown = 8


function wakaba:hasFlashShift(player)
	if not player then 
		return false 
	end
	if player:GetPlayerType() == wakaba.PLAYER_TSUKASA_B then
    return true
	elseif player:HasCollectible(wakaba.COLLECTIBLE_FLASH_SHIFT) then
		return true
	else
		return false
	end
end


function wakaba:PlayerUpdate_FlashShift(player)
	pData = player:GetData()
	pData.wakaba = pData.wakaba or {}
	if wakaba:hasFlashShift(player) then
		local maxval = (120 * player.MaxFireDelay / 7) // 1
		if player:GetPlayerType() == wakaba.PLAYER_TSUKASA_B then
			maxval = (120 * player.MaxFireDelay / 15) // 1
		end
		
		if not wakaba.sprites.FlashShiftSprite then
			wakaba.sprites.FlashShiftSprite = Sprite()
			wakaba.sprites.FlashShiftSprite:Load("gfx/chargebar_flashshift.anm2", true)
			wakaba.sprites.FlashShiftSprite.Color = Color(1,1,1,1)
		end
		local chargeno = wakaba:GetChargeBarIndex(player, "FlashShift")
		local chargestate = wakaba:GetChargeState(player, "FlashShift")

		if pData.wakaba.fstimer and pData.wakaba.fstimer > 0 then
			if chargestate then
				chargestate.CurrentValue = pData.wakaba.fstimer
				chargestate.Count = pData.wakaba.fscounter
				chargestate.Sprite = wakaba.sprites.FlashShiftSprite
				chargestate.MaxValue = maxval
			else
				chargestate = {
					Index = chargeno,
					Profile = "FlashShift",
					IncludeFinishAnim = true,
					Sprite = wakaba.sprites.FlashShiftSprite,
					MaxValue = maxval,
					MinValue = 1,
					CurrentValue = pData.wakaba.fstimer or 0,
					Count = pData.wakaba.fscounter,
					CountPrefix = "x",
					Reverse = true,
				}
			end
			--chargestate.CurrentValue = pData.wakaba.fstimer
			wakaba:SetChargeBarData(player, chargeno, chargestate)
		else
			--print(chargestate and pData.wakaba.chargestate[chargeno].CurrentValue, chargestate and pData.wakaba.chargestate[chargeno].MinValue)
			if chargestate and pData.wakaba.chargestate[chargeno].checkremove then
				wakaba:RemoveChargeBarData(player, wakaba:GetChargeBarIndex(player, "FlashShift"))
			elseif chargestate and pData.wakaba.chargestate[chargeno].CurrentValue > 0 then
				chargestate.CurrentValue = 0
				wakaba:SetChargeBarData(player, chargeno, chargestate)
			end
		end

		if not pData.wakaba.fscounter then
			pData.wakaba.fscounter = 3
		end
		if pData.wakaba.fseffecttimer and pData.wakaba.fseffecttimer <= 0 then
			local trails = Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.SPRITE_TRAIL, -1)
			for i, trail in ipairs(trails) do
				if trail:GetData().wakaba and trail:GetData().wakaba.flashshift then
					if trail.Parent and GetPtrHash(trail.Parent) == GetPtrHash(player) then
						trail.Parent = nil
					end
				end
			end
		elseif pData.wakaba.fseffecttimer then
			player:SetColor(Color(1,1,1,0,0,0,0), 3, 1, true, true)
			pData.wakaba.fseffecttimer = pData.wakaba.fseffecttimer - 1

		end
		if pData.wakaba.fsfrictiontimer and pData.wakaba.fsfrictiontimer <= 0 then
			if pData.wakaba.fsfriction <= 1.0 then
				player.Friction = 1.0
			else
				player.Friction = pData.wakaba.fsfriction
			end
			pData.wakaba.fsfriction = nil
			pData.wakaba.fsfrictiontimer = nil
		elseif pData.wakaba.fsfrictiontimer then
			pData.wakaba.fsfrictiontimer = pData.wakaba.fsfrictiontimer - 1
		end
		--print(pData.wakaba.fstimer and pData.wakaba.fstimer, (120 * player.MaxFireDelay / 15) // 1)
		if pData.wakaba.fstimer and pData.wakaba.fstimer >= maxval then
			pData.wakaba.fstimer = nil
			pData.wakaba.fscounter = 3
			SFXManager():Play(SoundEffect.SOUND_BATTERYCHARGE)
			local notif = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HEART, 1, Vector(player.Position.X, player.Position.Y - 65), Vector.Zero, nil):ToEffect()
		elseif pData.wakaba.fstimer then
			pData.wakaba.fstimer = pData.wakaba.fstimer + 1
		end
	else
		pData.wakaba.fstimer = nil
		pData.wakaba.fscounter = nil
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, wakaba.PlayerUpdate_FlashShift)


function wakaba:ItemUse_FlashShift(_, rng, player, useFlags, activeSlot, varData)
	local pData = player:GetData()
	pData.wakaba = pData.wakaba or {}
	if player:GetMovementDirection() ~= Direction.NO_DIRECTION and pData.wakaba.fscounter and pData.wakaba.fscounter > 0 then
		--player:UseActiveItem(CollectibleType.COLLECTIBLE_MARS, UseFlag.USE_NOANIM | UseFlag.USE_NOCOSTUME, -1)
		
		local trail = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.SPRITE_TRAIL, 0, player.Position, Vector.Zero, nil):ToEffect()
		trail:GetData().wakaba = {}
		trail:GetData().wakaba.flashshift = true
		trail:FollowParent(player) -- parents the trail to another entity and makes it follow it around
		trail:GetSprite().Color = Color(0.9, 0.8, 1, 0.5) -- sets the color of the trail
		trail.MinRadius = 0.05 -- fade rate, lower values yield a longer trail
		trail:SetTimeout(20)
		trail:Update()
		
		local oldpos = player.Position + Vector.Zero
		local direction = player:GetMovementDirection()
		if pData.wakaba.flashshifttrigger and pData.wakaba.flashshifttrigger & wakaba.dashflags.FLASH_SHIFT_TSUKASA_B == wakaba.dashflags.FLASH_SHIFT_TSUKASA_B and player:GetFireDirection() ~= Direction.NO_DIRECTION then
			direction = player:GetFireDirection()
		end
		local dirVec =  wakaba.DIRECTION_VECTOR[direction]
		player.Velocity = dirVec:Resized(player.MoveSpeed + 1)
		--player.Position = newpos
		--trail.Position = newpos
		if not pData.wakaba.fsfriction then
			--player.Friction = (8.0 + ((player.TearRange / 40) - 5.0)) * player.ShotSpeed * player.MoveSpeed
			--player.Friction = 8.0
			player.Friction = (8.0 + (((player.TearRange / 40) - 5.0) / 2)) * (1 + (player.ShotSpeed) / 8) * (1 + (player.MoveSpeed) / 8)
		end
		pData.wakaba.fsfriction = 1.0
		pData.wakaba.fsfrictiontimer = 3
		pData.wakaba.fseffecttimer = 15

		local ents = Isaac.FindInRadius(player.Position, (player.TearRange / 6.5), EntityPartition.BULLET | EntityPartition.TEAR | EntityPartition.ENEMY | EntityPartition.PICKUP)
		for i, ent in ipairs(ents) do
			--ent:TakeDamage(player.Damage * 3, 0, EntityRef(player), 0)
		end
		if player:GetPlayerType() == wakaba.PLAYER_TSUKASA_B or player:HasCollectible(wakaba.COLLECTIBLE_MURASAME) then
			SFXManager():Play(SoundEffect.SOUND_KNIFE_PULL)
			local familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, wakaba.FAMILIAR_MURASAME, -1)
			for i, e in ipairs(familiars) do
				local familiar = e:ToFamiliar()
				if familiar and GetPtrHash(familiar.Player) == GetPtrHash(player) then
					local fData = familiar:GetData()
					familiar:GetData().wakaba = familiar:GetData().wakaba or {}
					fData.wakaba.dashcountdown = 15
					fData.wakaba.dashvector = dirVec
					fData.wakaba.dashdirection = direction
					if fData.wakaba.murasametear and fData.wakaba.murasametear:Exists() then
						fData.wakaba.murasametear:Remove()
					end
					if fData.wakaba.murasameknife and fData.wakaba.murasameknife:Exists() then
						fData.wakaba.murasameknife:Remove()
					end
					if fData.wakaba.murasamelaser and fData.wakaba.murasamelaser:Exists() then
						fData.wakaba.murasamelaser:Remove()
					end
					if fData.wakaba.murasamexlaser and fData.wakaba.murasamexlaser:Exists() then
						fData.wakaba.murasamexlaser:Remove()
					end
					if fData.wakaba.murasamebrlaser and fData.wakaba.murasamebrlaser:Exists() then
						fData.wakaba.murasamebrlaser:Remove()
					end
					fData.wakaba.murasametear = nil
					fData.wakaba.murasameknife = nil
					fData.wakaba.murasamelaser = nil
					fData.wakaba.murasamexlaser = nil
					fData.wakaba.murasamebrlaser = nil
				end
			end
		end
		pData.wakaba.fscounter = pData.wakaba.fscounter - 1
		player:SetMinDamageCooldown(20)
		SFXManager():Play(SoundEffect.SOUND_HELL_PORTAL1)
		pData.wakaba.elixirinvframes = (pData.wakaba.elixirinvframes and pData.wakaba.elixirinvframes + 20) or 20
		pData.wakaba.flashshifttrigger = nil
		if not pData.wakaba.fstimer then
			pData.wakaba.fstimer = 0
		end
	end
	--[[ if not pData.wakaba.fstimer then
		pData.wakaba.fstimer = 0
	end ]]
end
wakaba:AddCallback(ModCallbacks.MC_USE_ITEM, wakaba.ItemUse_FlashShift, wakaba.COLLECTIBLE_FLASH_SHIFT)


function wakaba:Input_FlashShift(entity, hook, action)
	if not entity then return end
	if not entity:GetData().wakaba then return end
	local data = entity:GetData()
	if data.wakaba.fsfriction then
    if hook == InputHook.GET_ACTION_VALUE then
      if action == ButtonAction.ACTION_LEFT
			or action == ButtonAction.ACTION_RIGHT
			or action == ButtonAction.ACTION_UP
			or action == ButtonAction.ACTION_DOWN
			then
      	return 0
      end
    end
	end
end
wakaba:AddCallback(ModCallbacks.MC_INPUT_ACTION, wakaba.Input_FlashShift)


function wakaba:TakeDmg_FlashShift_Wisp(wisp, amount, flag, source, countdown)
	if wisp.Variant == FamiliarVariant.ITEM_WISP 
	or wisp.Variant == FamiliarVariant.WISP then
		local player = wisp:ToFamiliar().Player
		local pData = player:GetData()
		if pData.wakaba and pData.wakaba.elixirinvframes and pData.wakaba.elixirinvframes >= 0 then
			return false
		end
	end
end
wakaba:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, wakaba.TakeDmg_FlashShift_Wisp, EntityType.ENTITY_FAMILIAR)
