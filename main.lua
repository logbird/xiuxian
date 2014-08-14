require("functions")
require("util")
require("sprite")
require("bag")
require("goods")
require("gameCore")
gameCore:init()
math.randomseed(os.time()) 

createPlayers(10)

local fightManager = {}
local team1 = {}
local team2 = {}
table.insert(fightManager, team1)
table.insert(fightManager, team2)



local s = Sprite:new(1, randPlayerName(1), 1)
var_dump(s)

for k,v in pairs(gameCore.players) do
    break
end












--[[
local g = Goods:new()
g:setAttr(gameCore.goods[1])
s.bag:add(g, 10)
s.bag:use(g, s, {s}, 10);
]]
