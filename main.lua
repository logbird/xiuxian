require("functions")
require("util")
require("class.sprite")
require("class.bag")
require("class.goods")
require("class.dump")
require("class.map")
require("gameCore")
gameCore:init()
math.randomseed(os.time()) 

--[[
createPlayers(10)
local fightManager = {}
local team1 = {}
local team2 = {}
table.insert(fightManager, team1)
table.insert(fightManager, team2)

for k,v in pairs(gameCore.players) do
    print(v.name)
end






local g = Goods.new()
g:setAttr(gameCore.goods[1])
gameCore.players[1].bag:add(g, 10)

gameSave()
]]--

gameLoad()

var_dump(gameCore.players);



--[[
local g = Goods:new()
g:setAttr(gameCore.goods[1])
s.bag:add(g, 10)
s.bag:use(g, s, {s}, 10);
]]
