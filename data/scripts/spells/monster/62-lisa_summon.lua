local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

local maxsummons = 4

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 4 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Glooth Anemone2", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end

spell:name("lisa summon")
spell:words("###62")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()
