
for i = 1, 6 do
	local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
	obj.name = "cursed-talent-" .. i
	obj.icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-" .. i .. ".png"
	obj.place_result = nil
	obj.subgroup = "cursed-talent"
	obj.order = "a" .. i
	obj.flags = {}
	obj.category = "cursed-talent"
	obj.stack_size = 2500
	data.raw[obj.type][obj.name] = obj
end

-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-talent-0",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-0.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-0]",
	-- flags = {},
	-- enable = false,
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-1",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-1]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-2",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-2]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-3",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-3]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-4",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-4]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-5",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-5]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-6",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6.png",
    -- subgroup = "cursed-talent",
    -- order = "a[cursed-talent-6]",
	-- flags = {},
    -- category = "cursed-talent",
    -- stack_size = 1000
  -- },
 -- })