gameCore = {
    level = {},
    goods = {},
    events = {
        npcs = {},
        fight = {},
    },
}

function gameCore:init()
    self.level = require("data.level")
    self.goods = require("data.goods")
end
