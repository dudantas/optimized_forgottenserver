local messages = {
	"You could win a beauty contest today!",
	"You rarely looked better.",
	"Well, you can't look good every day.",
	"You should think about a makeover.",
	"Is that the indication of a potbelly looming under your clothes?",
	"You look irresistible.",
	"You look tired.",
	"You look awesome!",
	"You nearly don't recognize yourself.",
	"You look fabulous.",
	"Surprise, surprise, you don't see yourself."
}

local wallmirror = Action()

function wallmirror.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(PlayerStorage.delayWallMirror) <= os.time() then
		player:say(messages[math.random(1, #messages)], TALKTYPE_MONSTER_SAY)
		player:setStorageValue(PlayerStorage.delayWallMirror, os.time() + 20 * 60 * 60)
	else
		player:say("Don't be so vain about your appearance.", TALKTYPE_MONSTER_SAY)
	end
	return true
end

wallmirror:id(2603, 2604, 2630, 2631, 2633, 2634, 2636, 2637)
wallmirror:register()
