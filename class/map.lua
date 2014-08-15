-- Map基类
Map = class('Map', function()
    local o = {
        -- 洲 山 地点
        id = '00000',
        name = '',
        players = {},
        monstor = {},
        buildings = {},
        border = {}
    }
    return o
end)
function Map:ctor()
end
