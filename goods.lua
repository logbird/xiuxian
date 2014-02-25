-- goods基类
Goods = {}

function Goods.add()
    print(Goods.index)
end

function Goods:new()
    local o = {
        id = '',
        -- 用于分组
        tid = '',
        name = '',
        type = '',
        role = '',
        sum = 1,
        exp = nil,
        baseAttr = {hp = nil, mp = nil, speed = nil, sense = nil, strong = nil},
        realAttr = {hp = nil, mp = nil, speed = nil, sense = nil, strong = nil},
        useHook = nil,
        otherAttr = nil
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Goods:setAttr(opt)
    if opt == nil then
        return False
    end
    self.id = opt.id or self.id
    self.name = opt.name or self.name
    self.type = opt.type or self.type
    self.role = opt.role or self.role
    self.sum = opt.sum or self.sum
    self.exp = opt.exp or self.exp
    self.useHook = opt.useHook or self.useHook

    -- 用于分组 opt.tid 为True 则随机生成tid
    if opt.tid  == nil then
        self.tid = self.id
    else
        self.tid = self.id + math.random(100000, 200000) + math.random(100000, 200000)
    end

    if opt.base then
        self.baseAttr['hp'] = opt.base['hp'] or self.baseAttr['hp'] 
        self.baseAttr['mp'] = opt.base['mp'] or self.baseAttr['mp']
        self.baseAttr['speed'] = opt.base['speed'] or self.baseAttr['speed'] 
        self.baseAttr['sense'] = opt.base['sense'] or self.baseAttr['sense'] 
        self.baseAttr['strong'] = opt.base['strong'] or self.baseAttr['strong']
    end

    if opt.real then
        self.realAttr['hp'] = opt.real['hp'] or self.realAttr['hp'] 
        self.realAttr['mp'] = opt.real['mp'] or self.realAttr['mp']
        self.realAttr['speed'] = opt.real['speed'] or self.realAttr['speed'] 
        self.realAttr['sense'] = opt.real['sense'] or self.realAttr['sense'] 
        self.realAttr['strong'] = opt.real['strong'] or self.realAttr['strong']
    end
    self.otherAttr = opt.other or self.otherAttr
end

function Goods:use(user, target, sum)
    local action = self.type..'_'..self.role 
    self.Actions[action](self, user, target, sum)
    if self.useHook then
        self.useHook(self, user, target, sum)
    end
end

Goods.Actions = {
    equip_buff = function()
    end,
}
