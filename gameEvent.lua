-- 事件类
gameEvent = {
    timer = 0
}

function gameEvent:buffHandle()
    for k, v in pairs(gameCore.events.npcs) do
        -- 只处理 buff
    end
end

function gameEvent:fightHandle()
    for k, v in pairs(gameCore.events.fight) do
        -- 只处理 战斗
    end
end

function gameEvent:digestHandle()
    for k, v in pairs(gameCore.events.fight) do
        -- 只处理 digest
    end
end