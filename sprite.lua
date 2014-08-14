-- sprite基类
Sprite = class("Sprite", function()
    local o = {
        id = id,
        name = '',
        sex = '',
        talent = 0,
        exp = 0,
        level = 1,
        __levelShow = gameCore.level.levelMap[1],
        loc = {x = 0, y = 0},
        baseAttr = {hp = 200, mp = 150, speed = 5, sense = 5, strong = 5},
        realAttr = {hp = 200, mp = 150, speed = 5, sense = 5, strong = 5},
        buff = {},
        equip = {},
        -- 炼化
        digest = {},
        bag = Bag.new(100),
    }
    return o
end
)

function Sprite:ctor(id, name, sex)
    self:setName(name)
    self:setSex(sex)
end

function Sprite:setName(name)
    self.name = name
    print(self.name)
end

function Sprite:setLoc(x, y)
    self.loc = {x = x, y = y}
end

function Sprite:setSex(sex)
    self.sex = sex
end

function Sprite:setTalent(talent)
    if talent > 100 then
        self.talent = 100
    else
        self.talent = talent
    end
end

function Sprite:addAttr(attr)
    if attr.talent then
        self:setTalent(self.talent + attr.talent)
    end
    if attr.exp then
        self:addExp(attr.exp)
    end
    if attr.baseAttr then
        self:attrPlus(self.baseAttr, attr.baseAttr)
    end
    if attr.realAttr then
        self:attrPlus(self.realAttr, attr.realAttr)
    end
end

-- 两个table进行相加
function Sprite:attrPlus(old, new)
    for k, v in pairs(old) do
        if new[k] ~= nil then
            old[k] = v + new[k]
        end
    end
end
-- 两个table进行相乘
function Sprite:attrMutiply(old, new)
    for k, v in pairs(old) do
        if new[k] then
            old[k] = v * new[k]
        end
    end
end

function Sprite:addExp(exp)
    local need = gameCore.level.expNeed[self.level]
    if self.level >= gameCore.level.max then
        return False
    end
    self.exp = self.exp + exp
    if self.exp >= need then
        if self:levelUP() then
            self.exp = self.exp - need
            self:addExp(0)
        end
    end
end

function Sprite:levelUP()
    if self.level + 1 > gameCore.level.max then
        return False
    end
    self.level = self.level + 1
    self.__levelShow = gameCore.level.levelMap[self.level]
    local r = self.baseAttr;
    -- 增长因子
    local factor = self:getLevelFactor()
    -- 属性增长
    self:attrMutiply(self.baseAttr, factor)
    -- 回复最佳状态
    self:bestState()
    return true
end

function Sprite:getLevelFactor()
    local hp = self.level % 3 == 1 and 1.8 or 1.2
    local mp = self.level % 3 == 1 and 1.8 or 1.2
    local speed = self.level % 3 == 1 and 1.2 or 1.5
    local sense = self.level % 3 == 1 and 1.8 or 1.1
    local strong = self.level % 3 == 1 and 1.2 or 1.1

    local factor = {
        hp = hp,
        mp = mp,
        speed = speed,
        sense = sense,
        strong = strong,
    }
    return factor
end

function Sprite:addBuff(id, type, buff)
    local buff = {
        type = type,
        effect = buff.role,
        buff = buff,
    }
    self.buff[id] = buff
end

function Sprite:delBuff(id)
    if self.buff[id] then
        self.buff[id] = nil
    end
end

function Sprite:addEquip(equip)
    self.equip[equip.id] = equip
end

function Sprite:delEquip(id)
    if self.equip[id] then
        self.equip[id] = nil
    end
end

function Sprite:addDigest(id, type, digest)
    if self.digest[id] then
        self.digest[id].digest.time = digest.time + self.digest[id].digest.time
    else
        self.digest[id] = {
            digest = digest,
            type = type
        }
    end
end

function Sprite:delDigest(id)
    if self.digest[id] then
        self.digest[id] = nil
    end
end

function Sprite:getRealAttr()
    local real = self.realAttr
    return real
end

function Sprite:getBaseAttr()
    local base = self.baseAttr
    for k, v in pairs(self.equip) do
        if g.baseAttr ~= nil then
            self:attrPlus(base, g.baseAttr)
        end
    end
    return base
end

function Sprite:bestState()
    local base = self:getBaseAttr()
    for k, v in pairs(base) do
        self.realAttr[k] = v
    end
end

function Sprite:setbaseAttr(attr)
    local b = self.baseAttr;
    self.baseAttr['hp'] = attr['hp'] or b['hp'] 
    self.baseAttr['mp'] = attr['mp'] or b['mp']
    self.baseAttr['speed'] = attr['speed'] or b['speed'] 
    self.baseAttr['sense'] = attr['sense'] or b['sense'] 
    self.baseAttr['strong'] = attr['strong'] or b['strong']
end

function Sprite:setRealAttr(attr)
    local r = self.realAttr;
    local b = self:getBaseAttr()
    if attr['hp'] then
        self.realAttr['hp'] = attr['hp'] > b['hp'] and b['hp'] or attr['hp']
    end
    if attr['mp'] then
        self.realAttr['mp'] = attr['mp'] > b['mp'] and b['mp'] or attr['mp']
    end
    if attr['speed'] then
        self.realAttr['speed'] = attr['speed'] > b['speed'] and b['speed'] or attr['speed']
    end
    if attr['sense'] then
        self.realAttr['sense'] = attr['sense'] > b['sense'] and b['sense'] or attr['sense']
    end
    if attr['strong'] then
        self.realAttr['strong'] = attr['strong'] > b['strong'] and b['strong'] or attr['strong']
    end
end









































-- 攻击者 攻击类型(物品、技能、肉身) 攻击数据
function Sprite:defAction(from, type, atk)
end


