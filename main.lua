require("sprite")
require("bag")
require("goods")
require("gameCore")

gameCore:init()

math.randomseed(os.time()) 

function debug(b)
    for k, v in pairs(b) do
        print(k, v)
    end
end

local s = Sprite:new(1, '张三', 1)
local g = Goods:new()
<<<<<<< HEAD
start = socket.gettime()
g:setAttr(GAME.goods[1])
=======
g:setAttr(gameCore.goods[1])
>>>>>>> add event
g:use(s, {s}, 1)
