
function var_dump(data, max_level, prefix)
    if type(prefix) ~= "string" then
        prefix = ""
    end
    if type(data) ~= "table" then
        print(prefix .. tostring(data))
    else
        print(data)
        if max_level ~= 0 then
            local prefix_next = prefix .. "    "
            print(prefix .. "{")
            for k,v in pairs(data) do
                io.stdout:write(prefix_next .. k .. " = ")
                if type(v) ~= "table" or (type(max_level) == "number" and max_level <= 1) then
                    print(v)
                else
                    if max_level == nil then
                        var_dump(v, nil, prefix_next)
                    else
                        var_dump(v, max_level - 1, prefix_next)
                    end
                end
            end
            print(prefix .. "}")
        end
    end
end

-- 在字典中随机 一个名字
function randName(type)
    dict = gameCore.nameDict[type]
    return dict[math.random(1, #dict)]
end

-- 随机 玩家名字
function randPlayerName(sex, xing, length)
    sex = sex ~= nil and sex or math.random(1, 2)
    length = length ~= nil and length or math.random(1, 2)
    xing = randName('xing')
    playerName = xing
    nt = sex == 1 and 'nanming' or 'nvming'
    for i = 1, length, 1 do
        playerName = playerName .. randName(nt)
    end
    return playerName
end


function createPlayers(sum)
    for i = 1, sum, 1 do
        local sex = math.random(1, 2)
        gameCore.players[i] = Sprite.new(i, randPlayerName(sex), sex)
    end
end

function gameSave(saveID)
    Dump.new():save(saveID)
end

function gameLoad(saveID)
    Dump.new():load(saveID)
end
