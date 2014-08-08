require("util")
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
g:setAttr(gameCore.goods[1])
s.bag:add(g, 10)

s.bag:use(g, s, {s}, 10);

var_dump(s)
