Dump = class('Dump', function()
    local o = {
        module = {},
        restoreModule = {},
    }
    return o
end)
function Dump:ctor()
    self.module = {
        'players',
        'goolds',
        'events',
    }
    self.restoreModule = {
        Sprite = Sprite.new,
        Goods = Sprite.new,
        Map = Map.new,
        Bag = Bag.new,
    }
end

function Dump:getSavePath(saveID)
    path = "save/" .. self:getSaveName(saveID) .. ".lua"
    return path 
end

function Dump:getSaveName(saveID)
    return "save_" .. saveID
end

function Dump:save(saveID)
    saveID = saveID ~= nil and saveID or 1
    local saveinfo = {}
    for k,v in pairs(self.module) do
        saveinfo[v] = gameCore[v]
    end
    saveinfo = self:serialize(saveinfo)
    io.writefile(self:getSavePath(saveID), saveinfo)

end

function Dump:load(saveID)
    saveID = saveID ~= nil and saveID or 1
    local save = io.readfile(self:getSavePath(saveID))
    local save = loadstring(save)()
    for k,v in pairs(self.module) do
        local t = self:restore(save[v])
        var_dump(t)
        break
    end
end

function Dump:restore(tbl)
    if type(tbl) == 'table' then
        if tbl.__cname ~= nil and tbl.class ~= nil then
            print(tbl.__cname)
            local tmp = self.restoreModule[tbl.__cname]()
            for k,v in pairs(tbl) do
                tmp[k] = v
            end
            tbl = tmp
        else
            for k, v in pairs(tbl) do
                tbl[k] = self:restore(v)
            end
        end
    end
    return tbl
end

function Dump:serialize(t)
    local mark={}
    local assign={}
    
    local function ser_table(tbl,parent)
        mark[tbl]=parent
        local tmp={}
        for k,v in pairs(tbl) do
            local key= type(k)=="number" and "["..k.."]" or k
            if type(v)=="table" then
                --[[
                local dotkey= parent..(type(k)=="number" and key or "."..key)
                if mark[v] then
                    table.insert(assign,dotkey.."='"..mark[v] .. "'")
                else
                ]]
                    table.insert(tmp, key.."="..ser_table(v,dotkey))
                --end
            elseif type(v) ~= 'function' then
                table.insert(tmp, key.."='"..v .. "'")
            end
        end
        return "{"..table.concat(tmp,",").."}"
    end
 
    return "do local ret="..ser_table(t,"ret")..table.concat(assign," ").." return ret end"
end
