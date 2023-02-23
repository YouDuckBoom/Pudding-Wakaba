--[[ 
	Wakaba's Broken Hairpin (와카바의 헤어핀) - 알트 패시브(Tainted passive) <> Wakaba's Pendant
	알약 사용 시마다 행운 +0.25 (알트 와카바 : 공격력 +0.35)
 ]]

function wakaba:cacheUpdate23(player, cacheFlag)
	if player:HasCollectible(wakaba.Enums.Collectibles.WAKABAS_HAIRPIN) then
		wakaba:GetPlayerEntityData(player)
		player:GetData().wakaba.statmodify.hairpinluck = player:GetData().wakaba.statmodify.hairpinluck or 0
		local luckbuff = player:GetData().wakaba.statmodify.hairpinluck
		if player:GetPlayerType() == Isaac.GetPlayerTypeByName("WakabaB", true) then
			if cacheFlag & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
				player.Damage = player.Damage + (0.35 * luckbuff * player:GetCollectibleNum(wakaba.Enums.Collectibles.WAKABAS_HAIRPIN))
			end
		else
			if cacheFlag & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
				player.Luck = player.Luck + (0.25 * luckbuff * player:GetCollectibleNum(wakaba.Enums.Collectibles.WAKABAS_HAIRPIN))
			end
		end
	end
end
wakaba:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, wakaba.cacheUpdate23)
