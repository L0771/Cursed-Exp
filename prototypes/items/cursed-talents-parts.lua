
for i = 1, 10 do
	local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
	obj.name = "cursed-talent-part-" .. i
	obj.icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-" .. i .. ".png"
	obj.subgroup = "cursed-talent-part"
	obj.order = "a" .. i
	obj.flags = {}
	obj.category = "cursed-talent-part"
	obj.stack_size = 2500
	obj.place_result = nil
	data.raw[obj.type][obj.name] = obj
end


-- data:extend(
-- {
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-1",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-1.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-1]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-2",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-2.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-2]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-3",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-3.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-3]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-4",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-4.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-4]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-5",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-5.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-5]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-6",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-6.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-6]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-7",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-7.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-7]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-8",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-8.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-8]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-9",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-9.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-9]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
  -- {
    -- type = "item",
    -- name = "cursed-talent-part-10",
    -- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-part-10.png",
    -- subgroup = "cursed-talent-part",
    -- order = "a[cursed-talent-10]",
	-- flags = {},
    -- category = "cursed-talent-part",
    -- stack_size = 1000
  -- },
 -- })