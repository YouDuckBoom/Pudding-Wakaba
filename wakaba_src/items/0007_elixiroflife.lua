local isc = require("wakaba_src.libs.isaacscript-common")


function wakaba:hasElixir(player)
	if not player then 
		return false 
	end
	if player:GetPlayerType() == wakaba.Enums.Players.TSUKASA_B and not (player:IsDead() and not player:WillPlayerRevive()) then
		return true
	elseif player:HasCollectible(wakaba.Enums.Collectibles.ELIXIR_OF_LIFE) then
		return true
	else
		return false
	end
end

local function getElixirPower(player)
	local power = 0
	if player:GetPlayerType() == wakaba.Enums.Players.TSUKASA_B then
		power = 1
	end
	return power + player:GetCollectibleNum(wakaba.Enums.Collectibles.ELIXIR_OF_LIFE)
end

function wakaba:PlayerUpdate_Elixir(player)
	wakaba:GetPlayerEntityData(player)
	local data = player:GetData()
	if wakaba:hasElixir(player) then
		local keeperSkipped = false
		if (player:GetPlayerType() == PlayerType.PLAYER_KEEPER or player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B) or wakaba:IsLost(player) then
			keeperSkipped = true
			goto KeeperSkip
		end
		if player:GetHearts() < 1 and player:GetPlayerType() ~= PlayerType.PLAYER_THEFORGOTTEN then -- Do this again to check non-red hearts character
			data.wakaba.elixirnonredhearts = true
			data.wakaba.elixirmaxsoulhearts = data.wakaba.elixirmaxsoulhearts or 0
			data.wakaba.elixirmaxsoulhearts = data.wakaba.elixirmaxsoulhearts >= player:GetSoulHearts() and data.wakaba.elixirmaxsoulhearts or player:GetSoulHearts()
		elseif data.wakaba.elixirnonredhearts and (player:GetHearts() > 0) then
			data.wakaba.elixirnonredhearts = false
		end
		::KeeperSkip::
		player:AddEntityFlags(EntityFlag.FLAG_NO_DAMAGE_BLINK)
		if player:GetSprite():GetAnimation() ~= "Death" and player:GetSprite():GetAnimation() ~= "LostDeath" then
			if data.wakaba.elixirinvframes and data.wakaba.elixirinvframes >= 0 then
				--player:AddEntityFlags(EntityFlag.FLAG_NO_DAMAGE_BLINK)
				data.wakaba.elixirinvframes = data.wakaba.elixirinvframes - 1
			elseif not keeperSkipped then
				--player:ClearEntityFlags(EntityFlag.FLAG_NO_DAMAGE_BLINK)
				local power = math.max(getElixirPower(player) + (wakaba.G.Difficulty % 2), 1)
				if player.FrameCount % power == 0 then
					player:ResetDamageCooldown()
				else
					player:SetMinDamageCooldown(1)
				end
			end
		end
		data.wakaba.elixircooldown = data.wakaba.elixircooldown or wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN
		if not player:GetEffects():GetCollectibleEffect(CollectibleType.COLLECTIBLE_BOOK_OF_SHADOWS) then
			if data.wakaba.elixircooldown > 0 then
				data.wakaba.elixircooldown = data.wakaba.elixircooldown - 1
			elseif data.wakaba.elixircooldown == -1 then
				-- do nothing
			elseif wakaba:IsLost(player) then
				if player:AreControlsEnabled() and not player:IsDead() and player:GetEffects():GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_HOLY_MANTLE) == 0 then
					SFXManager():Play(SoundEffect.SOUND_VAMP_GULP)
					player:UseCard(Card.CARD_HOLY, UseFlag.USE_NOANIM | UseFlag.USE_NOANNOUNCER | UseFlag.USE_MIMIC | UseFlag.USE_NOHUD | UseFlag.USE_NOHUD)
					data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN_KEEPER
				end
			elseif (player:GetEffectiveMaxHearts() < 2 
					and (not player:CanPickRedHearts() and player:GetHearts() ~= player:GetEffectiveMaxHearts())
					and player:GetSoulHearts() < 6) 
				or 
				(player:GetPlayerType() ~= PlayerType.PLAYER_THEFORGOTTEN and data.wakaba.elixirmaxsoulhearts and player:GetSoulHearts() < data.wakaba.elixirmaxsoulhearts) 
				then
				SFXManager():Play(SoundEffect.SOUND_VAMP_GULP)
				player:AddSoulHearts(1)
				data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN
			elseif player:CanPickRedHearts() then
				SFXManager():Play(SoundEffect.SOUND_VAMP_GULP)
				player:AddHearts(1)
				data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN
			elseif (player:GetPlayerType() == PlayerType.PLAYER_KEEPER or player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B) and player:GetHearts() < player:GetMaxHearts() then
				SFXManager():Play(SoundEffect.SOUND_VAMP_GULP)
				player:AddHearts(1)
				data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN_KEEPER
			end
		end
	else
		if data.wakaba.elixirinvframes and data.wakaba.elixirinvframes >= 0 then
			--player:AddEntityFlags(EntityFlag.FLAG_NO_DAMAGE_BLINK)
			data.wakaba.elixirinvframes = data.wakaba.elixirinvframes - 1
		end
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, wakaba.PlayerUpdate_Elixir)

function wakaba:PostTakeDamage_Elixir(player, amount, flags, source, cooldown)
	if wakaba:hasElixir(player) and player:GetSprite():GetAnimation() ~= "Death" and player:GetSprite():GetAnimation() ~= "LostDeath" then
		wakaba:GetPlayerEntityData(player)
		local data = player:GetData()
		data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN_DMG
		if (player:GetPlayerType() == PlayerType.PLAYER_KEEPER or player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B) or wakaba:IsLost(player) then
			data.wakaba.elixircooldown = wakaba.Enums.Constants.ELIXIR_MAX_COOLDOWN_KEEPER // math.min(math.max(getElixirPower(player), 1), 6)
		end
		if (source.Type == EntityType.ENTITY_SLOT and source.Variant == 2)
		or (source.Type == EntityType.ENTITY_SLOT and source.Variant == 5)
		or (source.Type == EntityType.ENTITY_SLOT and source.Variant == 15)
		or (source.Type == EntityType.ENTITY_SLOT and source.Variant == 17)
		or flags & DamageFlag.DAMAGE_IV_BAG == DamageFlag.DAMAGE_IV_BAG
		then
			data.wakaba.elixirblooddonationcooldown = data.wakaba.elixirblooddonationcooldown or 0
			data.wakaba.elixirblooddonationcooldown = data.wakaba.elixirblooddonationcooldown + 1
			if data.wakaba.elixirblooddonationcooldown >= 4 then
				if player:GetBoneHearts() > 0 then
					player:AddBoneHearts(-1)
				elseif player:GetMaxHearts() > 0 then
					player:AddMaxHearts(-2)
				elseif data.wakaba.elixirmaxsoulhearts > 0 then
					data.wakaba.elixirmaxsoulhearts = data.wakaba.elixirmaxsoulhearts - 2
				end
				data.wakaba.elixirblooddonationcooldown = 0
			end
		elseif flags & DamageFlag.DAMAGE_CURSED_DOOR > 0 then
			data.wakaba.elixirinvframes = 20
		end
	end
end
wakaba:AddCallback(wakaba.Callback.POST_TAKE_DAMAGE, wakaba.PostTakeDamage_Elixir)
