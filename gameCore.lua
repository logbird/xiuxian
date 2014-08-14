gameCore = {
    players = {},
    level = {},
    goods = {},
    events = {
        npcs = {},
        fight = {},
    },
    nameDict = {},
}

function gameCore:init()
    self.level = require("data.level")
    self.goods = require("data.goods")
    self.nameDict = require('data.name')
end

function getPlayer(id)
    return self.players[id]
end
