
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-exchange"
obj.icon = "__Cursed-Exp__/graphics/icons/exchange/cursed-exchange.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-exchange"
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-exchange",
    -- icon = "__Cursed-Exp__/graphics/icons/exchange/cursed-exchange.png",
    -- flags = {"goes-to-quickbar"},
    -- subgroup = "cursed-build",
    -- order = "g[lab]-a[module]",
    -- place_result = "cursed-exchange",
    -- stack_size = 10
  -- },
 -- })