--[[
	Enhanced Boss Dest
	게임 시작 시 랜덤 보스 설정
	보스 체력 설정
 ]]

local bossTables = {
	["BlueBaby"] = 0,
	["Lamb"] = 1,
	["MegaSatan"] = 2,
	["Delirium"] = 3,
	["Mother"] = 4,
	--["Greed"] = 5,
	["Beast"] = 6,
}

local bossEntities = {
	["BlueBaby"] = {
		{EntityType.ENTITY_ISAAC, 0, Weight = 0.5},
		{EntityType.ENTITY_ISAAC, 1, Weight = 0.5},
	},
	["Lamb"] = {
		{EntityType.ENTITY_SATAN, 0, Weight = 0.25, OnUpdate = true, Filter = function(npc) local sprite = npc:GetSprite(); return sprite:IsPlaying("Change") end},
		{EntityType.ENTITY_SATAN, 10, Weight = 0.25},
		{EntityType.ENTITY_THE_LAMB, 0, Weight = 0.5},
		{EntityType.ENTITY_THE_LAMB, 10, Weight = 0.25},
	},
	["MegaSatan"] = {
		{EntityType.ENTITY_MEGA_SATAN, 0, Weight = 0.5},
		{EntityType.ENTITY_MEGA_SATAN_2, 0, Weight = 0.5, OnUpdate = true, Filter = function(npc) local sprite = npc:GetSprite(); return sprite:IsPlaying("Appear") end},
	},
	["Delirium"] = {
		{EntityType.ENTITY_HUSH, 0, Weight = 0.5},
		{EntityType.ENTITY_DELIRIUM, 0, Weight = 0.5},
	},
	["Mother"] = {
		{EntityType.ENTITY_MOTHER, 0, Weight = 0.5},
		{EntityType.ENTITY_MOTHER, 10, Weight = 0.5, OnUpdate = true, Filter = function(npc) local sprite = npc:GetSprite(); return sprite:IsPlaying("ChargeLoop") end},
	},
	["Greed"] = {
		{EntityType.ENTITY_ULTRA_GREED, 0, Weight = 0.5},
		{EntityType.ENTITY_ULTRA_GREED, 1, Weight = 0.5, OnUpdate = true, Filter = function(npc) local sprite = npc:GetSprite(); return sprite:IsPlaying("Idle") end},
	},
	["Beast"] = {
		{EntityType.ENTITY_DOGMA, 0, Weight = 0.25},
		{EntityType.ENTITY_DOGMA, 1, Weight = 0.25},
		{EntityType.ENTITY_DOGMA, 2, Weight = 0.25, OnUpdate = true, Filter = function(npc) local sprite = npc:GetSprite(); return sprite:IsPlaying("Idle") end},
		{EntityType.ENTITY_BEAST, 10, Weight = 0.1},
		{EntityType.ENTITY_BEAST, 20, Weight = 0.1},
		{EntityType.ENTITY_BEAST, 30, Weight = 0.1},
		{EntityType.ENTITY_BEAST, 40, Weight = 0.1},
		{EntityType.ENTITY_BEAST, 0, Weight = 0.1},
	},
}

function wakaba:GetBossDestinationData()
	local skip = false
	local bossData = {
		Boss = nil,
		Quality = nil,
		ModifyHealth = nil,
	}
	for _, callbackData in pairs(Isaac.GetCallbacks(wakaba.Callback.BOSS_DESTINATION)) do
		local newData = callbackData.Function(callbackData.Mod)
		if type(newData) == "boolean" and newData == false then
			skip = true
			break
		elseif type(newData) == "table" and newData ~= nil then
			bossData.Boss = newData.Boss ~= nil and newData.Boss or bossData.Boss
			bossData.Quality = newData.Quality ~= nil and newData.Quality or bossData.Quality
			bossData.ModifyHealth = newData.ModifyHealth ~= nil and newData.ModifyHealth or bossData.ModifyHealth
			bossData.Lunatic = newData.Lunatic ~= nil and newData.Lunatic or bossData.Lunatic
		end
	end
	if skip then
		return false
	else
		return bossData
	end
end

wakaba:AddCallback(wakaba.Callback.BOSS_DESTINATION, function()
	return {
		Boss = wakaba.runstate.bossdest, --타겟 보스 (HUD 표시용, 50만 챌린지 적용 시 해당 보스 체력 강화)
		Quality = wakaba.runstate.startquality, --시작 아이템 퀄리티 (HUD 표시용)
		ModifyHealth = wakaba.runstate.bossdesthealth, --50만 챌린지 적용
		Lunatic = wakaba.runstate.bossdestlunatic, -- 50만 챌린지 적용 시 대부분 와카바 모드의 방어 무시 효과 무효화, 일부 와카바 모드 아이템 너프
	}
end)

function wakaba:getBossBuffWeight(entity)
	local bossData = wakaba:GetBossDestinationData()
	if not bossData or type(bossData) ~= "table" or not bossData.Boss or not bossEntities[bossData.Boss] then return end
	for _, dict in ipairs(bossEntities[bossData.Boss]) do
		if entity.Type == dict[1] then
			if not dict[2] or entity.Variant == dict[2] then
				if not dict[3] or entity.SubType == dict[3] then
					return dict.Weight, dict.OnUpdate, dict.Filter
				end
			end
		end
	end
end

---@param npc EntityNPC
function wakaba:NPCInit_BossDest(npc)
	local bossData = wakaba:GetBossDestinationData()
	if not (bossData and bossData.ModifyHealth) then return end
	local weight = wakaba:getBossBuffWeight(npc)
	if not weight or npc:GetData().w_destHealthAltered then return end
	local totalHealth = wakaba:getOptionValue("totalbosshealth") or 500000
	npc.MaxHitPoints = math.max(totalHealth * weight, 1)
	npc.HitPoints = npc.MaxHitPoints
end
wakaba:AddPriorityCallback(ModCallbacks.MC_POST_NPC_INIT, 200, wakaba.NPCInit_BossDest)

---@param npc EntityNPC
function wakaba:NPCUpdate_BossDest(npc)
	if npc:GetData().w_destHealthAltered then return end
	local weight, onUpdate, filter = wakaba:getBossBuffWeight(npc)
	if not onUpdate or not filter or type(filter) ~= "function" then return end
	if filter(npc) then
		wakaba:NPCInit_BossDest(npc)
		npc:GetData().w_destHealthAltered = true
	end
end
wakaba:AddCallback(ModCallbacks.MC_NPC_UPDATE, wakaba.NPCUpdate_BossDest)

function wakaba:BossRoll(modifyHealth, lunatic, seed)
	local entries = {}
	for k, _ in pairs(bossTables) do
		table.insert(entries, k)
	end
	seed = seed or wakaba.G:GetSeeds():GetStartSeed()
	local rng = RNG()
	rng:SetSeed(seed, 35)
	local selected = rng:RandomInt(#entries) + 1
	local entry = entries[selected]
	wakaba.runstate.bossdest = entry
	wakaba.runstate.bossdesthealth = modifyHealth
	wakaba.runstate.bossdestlunatic = lunatic
	return entry
end

wakaba:AddPriorityCallback(wakaba.Callback.RENDER_GLOBAL_FOUND_HUD, -2, function(_)
	local bossData = wakaba:GetBossDestinationData()
	if not bossData or type(bossData) ~= "table" or not bossData.Boss or not bossTables[bossData.Boss] then return end
	wakaba.globalHUDSprite:SetFrame("BossDestination", bossTables[bossData.Boss])
	local text = bossData.Text or bossData.Boss
	local textColor = nil
	local prepend = {}
	if bossData.Lunatic then
		table.insert(prepend, "LUN")
		textColor = KColor(1,0.2,0.2,1,0,0,0)
	end
	if bossData.ModifyHealth then
		wakaba.globalHUDSprite:SetOverlayFrame("QualityFlag", 6)
		table.insert(prepend, "EX")
	elseif bossData.Quality and type(bossData.Quality) == "number" then
		wakaba.globalHUDSprite:SetOverlayFrame("QualityFlag", bossData.Quality)
		table.insert(prepend, "Q".. bossData.Quality)
	else
		wakaba.globalHUDSprite:SetOverlayFrame("QualityFlag", 5)
	end
	local tab = {
		Sprite = wakaba.globalHUDSprite,
		Text = text,
		TextColor = textColor,
	}
	return tab
end)