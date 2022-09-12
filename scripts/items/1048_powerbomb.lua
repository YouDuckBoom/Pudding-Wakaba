wakaba.COLLECTIBLE_POWER_BOMB = Isaac.GetItemIdByName("Power Bomb")
wakaba.EFFECT_POWER_BOMB = Isaac.GetEntityVariantByName("Wakaba Power Bomb Explosion")
wakaba.SFX_POWER_BOMB_EXPLOSION = Isaac.GetSoundIdByName("pb_explosion")
wakaba.SFX_POWER_BOMB_CHARGE = Isaac.GetSoundIdByName("pb_charge")
wakaba.SFX_POWER_BOMB_LOOP = Isaac.GetSoundIdByName("pb_loop")
wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_1 = Isaac.GetSoundIdByName("pb_after_explosion1")
wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_2 = Isaac.GetSoundIdByName("pb_after_explosion2")
wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_3 = Isaac.GetSoundIdByName("pb_after_explosion3")
wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_4 = Isaac.GetSoundIdByName("pb_after_explosion4")
wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_5 = Isaac.GetSoundIdByName("pb_after_explosion5")
local sfx = SFXManager()

function wakaba:UsePowerBomb(player, position, bombs)
  player = player or Isaac.GetPlayer()
  position = position or player.Position
  bombs = bombs or player:GetNumBombs()
  local explosion = Isaac.Spawn(EntityType.ENTITY_EFFECT, wakaba.EFFECT_POWER_BOMB, 0, position, Vector.Zero, nil):ToEffect()
  explosion:GetData().wakaba = {}
  explosion:GetData().wakaba.damage = bombs
  sfx:Play(wakaba.SFX_POWER_BOMB_EXPLOSION)
  sfx:Play(wakaba.SFX_POWER_BOMB_LOOP, 1, 2, true)
end

function wakaba:EffectInit_PowerBomb(effect)
  local effectsprite = effect:GetSprite()
  effectsprite.Scale = Vector(3, 3)
end
wakaba:AddCallback(ModCallbacks.MC_POST_EFFECT_INIT, wakaba.EffectInit_PowerBomb, wakaba.EFFECT_POWER_BOMB)

function wakaba:EffectUpdate_PowerBomb(effect)
  effect:GetData().wakaba = effect:GetData().wakaba or {}
  local damage = effect:GetData().wakaba.damage or 5
  local state = 0
  local effectsprite = effect:GetSprite()
  if effectsprite:IsFinished("Explode") then
    local room = Game():GetRoom()
    for i = 0, room:GetGridSize() do
      if room:GetGridEntity(i) then
        if room:GetGridEntity(i):GetType() == GridEntityType.GRID_DOOR then
          local door = room:GetGridEntity(i):ToDoor()
          door:TryBlowOpen(true, effect)
          if door:IsLocked() or (door.TargetRoomType == RoomType.ROOM_CHALLENGE)then
            door:TryUnlock(Isaac.GetPlayer(), true)
          end
        end
        room:GetGridEntity(i):Destroy()
      end
    end
    effectsprite:Play("Exploding")
    effectsprite:Update()
  elseif effectsprite:IsFinished("Exploding") then
    --sfx:Play(SoundEffect.SOUND_REVERSE_EXPLOSION)
    sfx:Stop(wakaba.SFX_POWER_BOMB_LOOP)
    sfx:Play(wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_1)
    sfx:Play(wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_2)
    sfx:Play(wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_3)
    sfx:Play(wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_4)
    sfx:Play(wakaba.SFX_POWER_BOMB_AFTER_EXPLOSION_5)
    effectsprite:Play("Fading")
    effectsprite:Update()
  elseif effectsprite:IsPlaying("Fading") then
    --local scalept = ((48 - effectsprite:GetFrame()) / 48) * 3
    --effectsprite.Scale = Vector(scalept, scalept)
    --effectsprite:Update()
  elseif effectsprite:IsFinished("Fading") then
    effect:Remove()
  end
  local enemies = Isaac.FindInRadius(effect.Position, 1600, EntityPartition.ENEMY)
  for i, entity in pairs(enemies) do
    if entity:IsEnemy() then
      --print("Enemy Taking Damage")
      entity:TakeDamage(damage * 0.4, DamageFlag.DAMAGE_EXPLOSION | DamageFlag.DAMAGE_IGNORE_ARMOR, EntityRef(effect), 0)
    end
  end
end
wakaba:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, wakaba.EffectUpdate_PowerBomb, wakaba.EFFECT_POWER_BOMB)

function wakaba:EffectRender_PowerBomb(effect)
  if sfx:IsPlaying(SoundEffect.SOUND_UNLOCK00) then
    sfx:Stop(SoundEffect.SOUND_UNLOCK00)
  end
  local effectsprite = effect:GetSprite()
  if effectsprite:IsPlaying("Fading") then
    local scalept = ((48 - effectsprite:GetFrame()) / 48) * 3
    effectsprite.Scale = Vector(scalept, scalept)
    effectsprite:Update()
  end
end
wakaba:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, wakaba.EffectRender_PowerBomb, wakaba.EFFECT_POWER_BOMB)

function wakaba:NPCDeath_PowerBomb(entity)
  for i = 1, Game():GetNumPlayers() do
		local player = Isaac.GetPlayer(i - 1)
    if player:HasCollectible(wakaba.COLLECTIBLE_POWER_BOMB) then
      local rng = RNG()
      local luck = player.Luck
      luck = math.max(math.min(luck, 0), 7)
      rng:SetSeed(entity.DropSeed, 35)
      local number = (rng:RandomInt(10000) / 100)
      if (3+luck) < number then
        local bomb = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_BOMB, 0, entity.Position, wakaba:RandomVelocity(), nil):ToPickup()
        bomb.Timeout = 45
      end
    end
  end
end
wakaba:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, wakaba.NPCDeath_PowerBomb)

function wakaba:PlayerUpdate_PowerBomb(player)
  --wakaba:GetPlayerEntityData(player)
  --local data = player:GetData()
	if player:HasCollectible(wakaba.COLLECTIBLE_POWER_BOMB) then
    local bombs = player:GetNumBombs()
    if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == wakaba.COLLECTIBLE_POWER_BOMB then
      player:SetActiveCharge(bombs, ActiveSlot.SLOT_PRIMARY)
    end
    if player:GetActiveItem(ActiveSlot.SLOT_SECONDARY) == wakaba.COLLECTIBLE_POWER_BOMB then
      player:SetActiveCharge(bombs, ActiveSlot.SLOT_SECONDARY)
    end
    if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == wakaba.COLLECTIBLE_POWER_BOMB then
      player:SetActiveCharge(bombs, ActiveSlot.SLOT_POCKET)
    end
  else
    --[[ if data.wakaba.haspb then 
      data.wakaba.haspb = nil 
    end ]]
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, wakaba.PlayerUpdate_PowerBomb)


function wakaba:InputAction_PowerBomb(entity, hook, action)
	if not entity then return end
  if not entity:ToPlayer() then return end
  local player = entity:ToPlayer()
	if player:HasCollectible(wakaba.COLLECTIBLE_POWER_BOMB) then
    if action == ButtonAction.ACTION_BOMB then return false end
  end
end
wakaba:AddCallback(ModCallbacks.MC_INPUT_ACTION, wakaba.InputAction_PowerBomb)

function wakaba:ItemUse_PowerBomb(_, rng, player, useFlags, activeSlot, varData)
  local bombs = player:GetNumBombs()
  bombs = bombs // 2

  wakaba:UsePowerBomb(player, player.Position, bombs)
  if player:HasGoldenBomb() then
    bombs = bombs // 1.75
  end
  player:AddBombs(-bombs)
	if not (useFlags & UseFlag.USE_NOANIM == UseFlag.USE_NOANIM) then
		player:AnimateCollectible(wakaba.COLLECTIBLE_POWER_BOMB, "UseItem", "PlayerPickup")
	end
end
wakaba:AddCallback(ModCallbacks.MC_USE_ITEM, wakaba.ItemUse_PowerBomb, wakaba.COLLECTIBLE_POWER_BOMB)
