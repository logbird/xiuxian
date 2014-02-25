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
    for k, v in pairs(self.goods) do
        if v.tid == goods.tid then
            self.goods[k].sum = v.sum + sum
            return true
        end
    end
    table.insert(self.goods, goods)
    return true
end

function Bag:del(goods, sum)
    for k, v in pairs(self.goods) do
        if v.tid == goods.tid then
            if sum == v.sum then
                table.remove(k)
                return true
            elseif sum > goods.sum then
                return false
            else
                self.goods[k].sum = v.sum - sum
            end
        end
    end
    return false
end
