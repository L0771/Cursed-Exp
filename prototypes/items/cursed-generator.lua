
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-generator-0"
obj.icon = "__Cursed-Exp__/graphics/icons/generator/cursed-generator-00.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-generator-0"
obj.stack_size = 1
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-generator-0",
    -- icon = "__Cursed-Exp__/graphics/icons/generator/cursed-generator-00.png",
    -- flags = {"goes-to-quickbar"},
    -- subgroup = "cursed-build",
    -- order = "g[lab]-a[module]",
    -- place_result = "cursed-generator-0",
    -- stack_size = 1
  -- },
 -- })