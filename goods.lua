-- goods基类
Goods = {
    name = 'goods',
}

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
        time = 0,
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
    self.exp = opt.exp or self.exp
    self.type = opt.type or self.type
    self.role = opt.role or self.role
    self.sum = opt.sum or self.sum
    self.time = opt.time or self.time
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
    -- 执行常规操作
    if self.Actions[action] then
        self.Actions[action](self, user, target, sum)
    end
    -- 钩子操作
    if self.useHook then
        for k, func in pairs(self.useHook) do
            func(self, user, target, sum)
        end
    end
end

Goods.Actions = {
    equip_buff = function(g, user, target, sum)
        if g.time > 0 then
            Goods.buffAction(g, user, target)
        else
            user:addEquip(g);
        end
        return true
    end,
    equip_debuff = function(g, user, target, sum)
        if g.time > 0 then
            Goods.buffAction(g, user, target)
        else
            user:addEquip(g);
        end
        return true
    end,
    equip_hurt = function(g, user, target, sum)
        if g.time > 0 then
            Goods.buffAction(g, user, target)
        else
            self:hurtAction(g, user, target)
        end
        return true
    end,
    equip_def = function(g, user, target, sum)
        if g.time > 0 then
            Goods.buffAction(g, user, target)
        else
            user:addEquip(g);
        end
        return true
    end,
    medicine_buff = function(g, user, target, sum)
        sum = sum or 1
        if g.sum < sum then
            return false
        elseif g.sum == sum then
            g.sum = 0
        elseif g.sum > sum then
            g.sum = g.sum - sum
        end
        if g.time > 0 then
            Goods.buffAction(g, user, target)
        else
            for k, v in pairs(target) do
                v:addAttr(g)
            end
        end
    end
}

function Goods.buffAction(g, user, target)
    local buffID = g.id .. "_" .. g.tid;
    for k, v in pairs(target) do
        v:addBuff(buffID, Goods.name, g)
    end
end

function Goods.hurtAction(g, user, target)
    for k, v in pairs(target) do
        v:defAction(user, Goods.name, g)
    end
end
