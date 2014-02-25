require("sprite")
require("goods")

GAME = {}
GAME.level = require("data.level")
math.randomseed(os.time()) 


local opt = {id = 10, name = 'yao', tid = true}

local g = Goods:new():setAttr(opt)

for k, v in pairs(g) do
    print(k, v)
end

