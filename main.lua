require("sprite")
require("bag")
require("goods")

GAME = {}
GAME.level = require("data.level")
math.randomseed(os.time()) 

local b = Bag:new()

for k, v in pairs(b) do
    print(k, v)
end
