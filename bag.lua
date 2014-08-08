-- Bag基类
Bag = {
}

function Bag:new(space)
    local o = {
        space = space,
        goods = {},
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Bag:add(goods, sum)
    sum = sum or 1
    -- id 和 tid不相等说明 每个物品占用一个空间
    if goods.id ~= goods.tid then
        sum = 1
    end

    if self:checkExists(goods) then
        self.goods[goods.id].sum = goods.sum + sum
    else
        goods.sum = sum
        self.goods[goods.id] = goods
    end
    return true
end

function Bag:checkExists(goods)
    return self.goods[goods.id] ~= nil
end

function Bag:find(goods)
    return self.goods[goods.id]
end

function Bag:del(goods, sum)
    if self:checkExists(goods) == false then
        return false
    end
    g = self:find(goods)
    if sum > g.sum then
        return false
    end
    self.goods[goods.id].sum = g.sum - sum
    if g.sum == 0 then
        table.remove(self.goods, goods.id)
    end

    return true 
end

function Bag:use(g, user, target, sum)
    if self:checkExists(g) == false then
        return false
    end
    g = self:find(g)
    if sum > g.sum then
        return false
    end
    for i=1,sum,1 do
        g:use(user, target)
        self:del(g, 1)
    end
    return true
end
