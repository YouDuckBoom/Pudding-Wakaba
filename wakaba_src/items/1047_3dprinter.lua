local isc = require("wakaba_src.libs.isaacscript-common")
function wakaba:ItemUse_3dPrinter(_, rng, player, useFlags, activeSlot, varData)

	--get the trinkets they're currently holding
	local trinket0 = player:GetTrinket(0)
	local trinket1 = player:GetTrinket(1)

	player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, UseFlag.USE_NOANIM | UseFlag.USE_NOCOSTUME | UseFlag.USE_VOID, -1) --smelt it

	--give their trinkets back
	if trinket0 ~= 0 then
		player:AddTrinket(trinket0)
	end
	if trinket1 ~= 0 then
		player:AddTrinket(trinket1)
	end

	if trinket0 == 0 and trinket1 == 0 --[[ and wakaba.state.unlock.aquatrinkets > 0 ]] then
		local aqua = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, wakaba.G:GetItemPool():GetTrinket(), Isaac.GetFreeNearPosition(player.Position, 0.0), Vector(0,0), nil):ToPickup()
		wakaba:TryTurnAquaTrinket(aqua)
	end

	if not (useFlags & UseFlag.USE_NOANIM == UseFlag.USE_NOANIM) then
		player:AnimateCollectible(wakaba.Enums.Collectibles._3D_PRINTER, "UseItem", "PlayerPickup")
	end
end
wakaba:AddCallback(ModCallbacks.MC_USE_ITEM, wakaba.ItemUse_3dPrinter, wakaba.Enums.Collectibles._3D_PRINTER)
