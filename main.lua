require("sprite")
require("bag")
require("goods")

GAME = {}
GAME.level = require("data.level")
GAME.goods = require("data.goods")

math.randomseed(os.time()) 

function debug(b)
    for k, v in pairs(b) do
        print(k, v)
    end
end

local s = Sprite:new(1, '张三', 1)
local g = Goods:new()
g:setAttr(GAME.goods[1])
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)
g:use(s, {s}, 1)

debug(s)
debug(s.baseAttr)
