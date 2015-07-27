
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-vault"
obj.icon = "__Cursed-Exp__/graphics/icons/vault/cursed-vault.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-vault"
obj.stack_size = 1
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-vault",
    -- icon = "__Cursed-Exp__/graphics/icons/vault/cursed-vault.png",
    -- flags = {"goes-to-quickbar"},
    -- subgroup = "storage",
    -- order = "c[cursed]-v[vault]",
    -- place_result = "cursed-vault",
    -- stack_size = 1
  -- },
-- }
-- )