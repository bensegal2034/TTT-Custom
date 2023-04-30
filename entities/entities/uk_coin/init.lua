AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
local phys = nil
local timeAlive = 0

max_targets = 2
coins = {}

local function IntToBool(num)
    if num == "1" then return true end
    if num == "0" then return false end
end


concommand.Add("ultrakill_max_coin_targets", function(ply, cmd, args, argStr)
    for k, v in pairs(args) do
        max_targets = tonumber(v)
    end
    end, nil, "Maximum amount of targets that ricoshotted coins can hit. Set to 0 to disable coin functionality.", 32)

function uk_coins_CoinSetContains(t, key)
	--return set[key] ~= nil
	local result = false 
	for k, v in pairs(t) do
		if v:IsValid() and key:IsValid() then
			result = v == key
			if v == key then return true end
		end
	end
	return result
end


function uk_coins_GetTableLength(set)
	local num = 0
	for k, v in pairs(set) do
		num = num + 1
	end
	return num
end

function uk_coins_TryCompleteRicoshot()
    local complete = true
    local length = uk_coins_GetTableLength(coins)
    local count = 0
    local last = nil
    for k, coin in pairs(coins) do
        if coin != nil then
            count = count + 1
            if coin:IsValid() then
                if not coin:GetTable().ricoshotted then
                    complete = false
                end
                
                if coin:GetTable().ricoshotted then
                    last = coin
                end
            end
        end
    end

    if complete then
        if last != nil then
            local zero = last
            local damage = 100
            local radius = 9999999999999
            local victims = ents.FindInSphere(zero:GetPos(), radius)
            local hits = 0
            for k, v in pairs(victims) do
                if v != nil then
                    if v:IsValid() then
                        if v != zero then
                            if v:GetClass() != zero:GetClass() and (v:IsNPC() or v:IsPlayer()) and v != last:GetTable().OwningPlayer and hits < max_targets then
                                v:TakeDamage(damage, last:GetTable().OwningPlayer, last:GetTable().OwningPlayer)
                                hits = hits + 1
                            end
                        end        
                    end
                end
            end
        end
    end
end

function uk_coins_RegisterCoin(ent)
	if not uk_coins_CoinSetContains(coins, ent) then
		table.insert(coins, ent)
	end
end

function ENT:PhysicsCollide(colData, collider)
    self:Remove()
end


--Iterate through all coins
--Check if the coins are "valid" or non-null
--Set the coin's "ricoshotted" table entry to "true". Transfer incoming damage to the coin.
--Continue through all coins that have not been ricoshotted and are also close enough to the coin until there are no more coins.
--Search for an NPC or Player. If the Coin does not belong to the Player, hurt the Player. Otherwise, hurt the NPC with the stored damage.

function SetCoinAsRicoshotted(coi)
    local tbl = coi:GetTable()
    tbl.ricoshotted = true
    coi:SetTable(tbl)
end

local minimumRicoshotDistance = 20
function ENT:OnTakeDamage(dmg)
    PrintTable(coins)
    SetCoinAsRicoshotted(self)
    for k, v in pairs(coins) do
        if v != nil then
            if v != self then
                if v:IsValid() then
                    if not v:GetTable().ricoshotted then
                        local tbl = v:GetTable()
                        tbl.ricoshotted = true
                        tbl.damageToTransfer = dmg
                        v:SetTable(tbl)
                        
                        local spark = EffectData()
                        spark:SetOrigin(v:GetPos())
                        spark:SetMagnitude(1)
                        spark:SetRadius(1.5)
                        spark:SetScale(1.5)
                        util.Effect("Sparks", spark)

                        local explosion = EffectData()
                        explosion:SetOrigin(v:GetPos())
                        explosion:SetMagnitude(50)
                        explosion:SetRadius(15)
                        explosion:SetScale(55)
                        util.Effect("RPGShotDown", explosion)


                        util.ParticleTracer("AR2Tracer", self:GetPos(), v:GetPos(), true)
                    end
                end
            end
        end
    end
    uk_coins_TryCompleteRicoshot()
end

function ENT:Initialize()
    local tbl = self:GetTable()
    tbl.ricoshotted = false
    tbl.damageToTransfer = nil
    tbl.takeDamage = false
    self:SetTable(tbl)
    uk_coins_RegisterCoin(self)
    
    
    self:SetModel("models/weapons/ukcoin.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    
    phys = self:GetPhysicsObject()
    self:SetGravity(200)

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Think()
    local dragAmount = 0.1
    local dragVelocity = Vector(0, 0, -self:GetPhysicsObject():GetVelocity().z)
    self:GetPhysicsObject():AddVelocity(dragVelocity * dragAmount)

    if self:GetTable().takeDamage then
        print("bwehhh!!!!!")
        self:OnTakeDamage(1)
        local tbl = self:GetTable()
        tbl.takeDamage = false
        self.SetTable(tbl)
    end
end