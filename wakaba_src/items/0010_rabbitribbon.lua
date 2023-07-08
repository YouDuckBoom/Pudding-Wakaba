local isc = require("wakaba_src.libs.isaacscript-common")

local ribbon_data = {
	run = {

	},
	floor = {

	},
	room = {

	}
}
wakaba:saveDataManager("Rabbit Ribbon", ribbon_data)

function wakaba:hasRibbon(player)
	if not player then 
		return false 
	end
	if player:GetPlayerType() == wakaba.Enums.Players.RICHER then
		return true
	elseif player:GetPlayerType() == wakaba.Enums.Players.RICHER_B then
		return true
	elseif player:HasCollectible(wakaba.Enums.Collectibles.RABBIT_RIBBON) then
		return true
	elseif player:GetEffects():HasCollectibleEffect(wakaba.Enums.Collectibles.RABBIT_RIBBON) then
		return true
	else
		return false
	end
end

-- Curse of Darkness → Curse of Sniper : Cannot shoot from point-blank range, Instakills non-boss enemies afterwards / 근거리에서 적을 맞출 수 없으나 원거리에 있는 일반 적에게 즉사 or 매우 큰 대미지
-- Curse of the Labyrinth : All special rooms are doubled if available, Also creates Devil/Angel room floor / 기존의 생성된 모든 특수방을 2배로 증가 + 그 스테이지에서 일반 악천방 생성
-- Curse of the Lost → Curse of the Fairy : Only able to see Portion of the Map, but all secret rooms are revealed if near / 탄광모자 효과 적용, 단 그 위치에서만 지도를 볼 수 있음
-- Curse of the Unknown → Curse of Magical Girl : All enemies are devolved, but always ‘Lost Curse’ state / 모든 적이 약화형으로 등장, 그 층 내내 로스트 상태
-- Curse of the Maze → Curse of Amnesia : Sometimes cleared rooms are randomly be uncleared / 방 입장 시 확률적으로 클리어한 방을 다시 클리어해야 함


function wakaba:Curse_RabbitRibbon(player)

end
wakaba:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, wakaba.Curse_RabbitRibbon)

function wakaba:Cache_RabbitRibbon(player, cacheFlag)
	if wakaba.curses.CURSE_OF_SNIPER > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_SNIPER) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage * 1.25
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearRange = player.TearRange * 2
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			if player.ShotSpeed < 1.7 then
				player.ShotSpeed = 1.7
			end
		end
	end
end
wakaba:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, wakaba.Cache_RabbitRibbon)

function wakaba:TearUpdate_RabbitRibbon(tear)
	local player = wakaba:getPlayerFromTear(tear)
	if wakaba.curses.CURSE_OF_SNIPER > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_SNIPER) and player then
		tear.Color = Color(1, 1, 1, 0, 0, 0, 0)
		tear.Visible = false
	end
end
wakaba:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, wakaba.TearUpdate_RabbitRibbon)

function wakaba:RabbitSniperOnDamage_Tear(source, target, data, newDamage, newFlags)
	local returndata = {}
	local num = 0
	local player = wakaba:getPlayerFromTear(source.Entity)
	if wakaba.curses.CURSE_OF_SNIPER > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_SNIPER) and player then
		local playerPos = player.Position
		local targetPos = target.Position
		local dist = playerPos:Distance(targetPos)
		if dist >= 160 then
			returndata.newDamage = newDamage * (dist * 2 / 160)
		else
			returndata.newDamage = newDamage * (dist / 200)
		end
		returndata.sendNewDamage = true
	end
	return returndata
end
function wakaba:RabbitSniperOnDamage_Knife(source, target, data, newDamage, newFlags)
	local returndata = {}
	local num = 0
	local player = wakaba:getPlayerFromKnife(source.Entity)
	local knife = source.Entity:ToKnife()
	if wakaba.curses.CURSE_OF_SNIPER > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_SNIPER) and player and knife then
		local dist = knife:GetKnifeDistance()
		if dist >= 160 then
			returndata.newDamage = newDamage * (dist * 2 / 160)
		else
			returndata.newDamage = newDamage * (dist / 480)
		end
		returndata.sendNewDamage = true
	end
	return returndata
end

function wakaba:NewLevel_RabbitRibbon()
	local player = isc:getPlayersWithCollectible(wakaba.Enums.Collectibles.RABBIT_RIBBON)[1] or Isaac.GetPlayer()
	if (isc:anyPlayerHasCollectible(wakaba.Enums.Collectibles.RABBIT_RIBBON) or isc:anyPlayerIs(wakaba.Enums.Players.RICHER))
	and (isc:hasCurse(LevelCurse.CURSE_OF_LABYRINTH) or wakaba.G:GetSeeds():HasSeedEffect(SeedEffect.SEED_PERMANENT_CURSE_LABYRINTH))
	and not wakaba.G:GetLevel():IsAscent() then
		local rooms = isc:getRooms()
		local candidates = {}
		for i, room in ipairs(rooms) do
			local roomType = isc:getRoomType(room.SafeGridIndex)
			local roomShape = isc:getRoomShape(room.SafeGridIndex)
			local allowedDoors = isc:getRoomAllowedDoors(room.SafeGridIndex)
			--print(roomType, roomShape, allowedDoors.size)
			if roomType ~= RoomType.ROOM_DEFAULT
			and roomType ~= RoomType.ROOM_BOSS
			and roomType ~= RoomType.ROOM_SECRET
			and roomType ~= RoomType.ROOM_SUPERSECRET
			and roomShape == RoomShape.ROOMSHAPE_1x1
			and allowedDoors.size == 4
			then
				table.insert(candidates, room)
			end
		end
		for i, room in ipairs(candidates) do
			local rng = player:GetCollectibleRNG(wakaba.Enums.Collectibles.RABBIT_RIBBON)
			local newRoomPoint = isc:newRoom(rng)
			--print(newRoomPoint)
			if newRoomPoint then
				isc:setRoomData(newRoomPoint, room.Data)
			end
		end
		if MinimapAPI then
			MinimapAPI:LoadDefaultMap()
		end
	end

end

wakaba:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, wakaba.NewLevel_RabbitRibbon)

function wakaba:NewRoom_RabbitRibbon()
	if isc:inDeathCertificateArea() then return end
	local player = isc:getPlayersWithCollectible(wakaba.Enums.Collectibles.RABBIT_RIBBON)[1] or Isaac.GetPlayer()
	if wakaba.curses.CURSE_OF_FAIRY > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_FAIRY) then
		for _, room in ipairs(isc:getRoomsInsideGrid()) do
			if room.Data --[[ and room.Data.Type == RoomType.ROOM_DEFAULT ]] then
				local roomGridIndex = room.SafeGridIndex
				if MinimapAPI == nil then
					local roomDescriptor = isc:getRoomDescriptor(nil, roomGridIndex)
					roomDescriptor.DisplayFlags = 0
					local level = wakaba.G:GetLevel()
					level:UpdateVisibility()
				else
					local minimapAPIRoomDescriptor = MinimapAPI:GetRoomByIdx(roomGridIndex)
					if minimapAPIRoomDescriptor then
						minimapAPIRoomDescriptor:SetDisplayFlags(0)
					end
				end
			end
		end
		wakaba.HiddenItemManager:AddForRoom(player, CollectibleType.COLLECTIBLE_SPELUNKER_HAT, 1, 1, "WAKABA_RABBIT_RIBBON")
		if not player:HasCollectible(CollectibleType.COLLECTIBLE_SPELUNKER_HAT) then
			isc:removeCollectibleCostume(player, CollectibleType.COLLECTIBLE_SPELUNKER_HAT)
		end
		if MinimapAPI then
			for _,v in ipairs(MinimapAPI:GetLevel()) do
				--print(v.Descriptor.Data.Type, v.Descriptor.DisplayFlags, v.Descriptor.Clear, v.Descriptor.VisitedCount > 0)
				if v.Descriptor then
					if v.Descriptor.DisplayFlags == 0 then
						v.DisplayFlags = 0
						--v.Visited = false
						--v.Hidden = 1
					else
						v.Clear = v.Descriptor.Clear
						v.Visited = v.Descriptor.VisitedCount > 0
						if v.Descriptor.Data.Type == RoomType.ROOM_SECRET or v.Descriptor.Data.Type == RoomType.ROOM_SUPERSECRET then
							if not v.Visited then
								v:SyncRoomDescriptor()
							end
						end
					end
				end
				--v:UpdateType()
			end
			--MinimapAPI:LoadDefaultMap()
		end
	end
	if wakaba.curses.CURSE_OF_AMNESIA > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_AMNESIA) then
		if StageAPI and StageAPI.InOverriddenStage() then
			return
		else

		end
		local rng = player:GetCollectibleRNG(wakaba.Enums.Collectibles.RABBIT_RIBBON)
		local result = rng:RandomFloat() * 100
		if result <= 46 then
			local rooms = isc:getRooms()
			local roomdesc = rooms[rng:RandomInt(#rooms)]
			if roomdesc and roomdesc.Clear and roomdesc.Data.Type == RoomType.ROOM_DEFAULT and roomdesc.SafeGridIndex ~= 84 then
				local RECOMMENDED_SHIFT_IDX = 35
				local game = Game()
				local seeds = game:GetSeeds()
				local startSeed = seeds:GetStartSeed()
				local roomRng = RNG()
				roomRng:SetSeed(roomdesc.AwardSeed, RECOMMENDED_SHIFT_IDX)
				roomdesc.Clear = false
				roomdesc.NoReward = false
				roomdesc.AwardSeed = roomRng:Next()
				roomdesc.VisitedCount = 0
				roomdesc.PressurePlatesTriggered = false
				roomdesc.DisplayFlags = 5
				if MinimapAPI then
					local mRoom = MinimapAPI:GetRoomByIdx(roomdesc.GridIndex)
					if mRoom then
						mRoom.Clear = false
						mRoom.Visited = false
						--mRoom:SetDisplayFlags(roomdesc.DisplayFlags)
						--mRoom:SyncRoomDescriptor()
						--MinimapAPI:LoadDefaultMap()
					end
				end
			end
		end
	end
	if wakaba.curses.CURSE_OF_MAGICAL_GIRL > 0 and isc:hasCurse(wakaba.curses.CURSE_OF_MAGICAL_GIRL) then
		local usedD10 = false
		for i = 1, wakaba.G:GetNumPlayers() do
			local player = Isaac.GetPlayer(i - 1)
			if not usedD10 then
				player:UseActiveItem(CollectibleType.COLLECTIBLE_D10, UseFlag.USE_NOANIM | UseFlag.USE_NOANNOUNCER | UseFlag.USE_NOCOSTUME, -1)
				usedD10 = true
			end
			player:GetEffects():RemoveNullEffect(NullItemID.ID_LOST_CURSE)
			if not player:IsCoopGhost() and not player:GetEffects():HasNullEffect(NullItemID.ID_LOST_CURSE) then
				player:GetEffects():AddNullEffect(NullItemID.ID_LOST_CURSE)
			end
		end
	end

end
wakaba:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, wakaba.NewRoom_RabbitRibbon)