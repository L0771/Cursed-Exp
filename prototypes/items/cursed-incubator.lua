
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-incubator"
obj.icon = "__Cursed-Exp__/graphics/icons/incubator/cursed-incubator.png"
obj.place_result = "cursed-incubator"
obj.subgroup = "cursed-build"
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-incubator",
    -- icon = "__Cursed-Exp__/graphics/icons/incubator/cursed-incubator.png",
    -- flags = {"goes-to-quickbar"},
    -- subgroup = "cursed-build",
    -- order = "g[lab]-a[module]",
    -- place_result = "cursed-incubator",
    -- stack_size = 10
  -- },
 -- })