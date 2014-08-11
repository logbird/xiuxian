-- Map基类
Map = {
}

function Map:new(space)
    local o = {
        -- 洲 山 地点
        id = '00000',
        name = '',
        players = {},
        monstor = {},
        buildings = {},
        border = {}
    }
    setmetatable(o, self)
    self.__index = self
    return o
end
