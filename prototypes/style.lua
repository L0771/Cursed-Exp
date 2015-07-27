
data.raw["gui-style"]["default"]["cursed-flow"] = 
    {
		type = "flow_style",
		horizontal_spacing = 0,
		vertical_spacing = 0,
		max_on_row = 0,
		resize_row_to_width = false,
		resize_to_row_height = false
    }
data.raw["gui-style"]["default"]["cursed-frame"] = 
    {
	type = "frame_style",
	font = "default-frame",
	font_color = {r=1, g=1, b=1},
	top_padding  = 2,
	right_padding = 2,
	bottom_padding = 2,
	left_padding = 2,
	graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {1, 1},
		position = {3, 3}
		},
	flow_style=
		{
		horizontal_spacing = 0,
		vertical_spacing = 0
		}
    }
data.raw["gui-style"]["default"]["cursed-frame-compass"] = 
	{
	type = "frame_style",
	scalable = true,
	width = 200,
	height = 200,
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/compass.png",
			width = 200,
			height = 200,
			x = 0,
			y = 0
			}
		}
	}
data.raw["gui-style"]["default"]["cursed-table"] = 
    {
		type = "table_style",
		horizontal_spacing = 0,
		vertical_spacing = 0
    }
data.raw["gui-style"]["default"]["cursed-table2"] = 
    {
		type = "table_style",
		horizontal_spacing = 26,
		vertical_spacing = 0
    }
data.raw["gui-style"]["default"]["cursed-button"] = 
    {
	type = "button_style",
	font = "default-button",
	default_font_color={r=1, g=0, b=0},
	align = "center",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 100,
	height = 30,
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_font_color={r=0.68, g=0.60, b=0.97},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_font_color={r=0.68, g=0.60, b=0.97},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
    }
data.raw["gui-style"]["default"]["cursed-buttonVar"] = 
    {
	type = "button_style",
	font = "default-button",
	default_font_color={r=1, g=0, b=0},
	align = "center",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	minimal_width = 100,
	height = 30,
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_font_color={r=0.68, g=0.60, b=0.97},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_font_color={r=0.68, g=0.60, b=0.97},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
    }
data.raw["gui-style"]["default"]["cursed-button-clicked"] = 
    {
	type = "button_style",
	font = "default-button",
	default_font_color={r=0.68, g=0.60, b=0.97},
	align = "center",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 100,
	height = 30,
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_font_color={r=0.68, g=0.60, b=0.97},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_font_color={r=0.68, g=0.60, b=0.97},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
    }
data.raw["gui-style"]["default"]["cursed-buttonInside1"] = 
    {
	type = "button_style",
	font = "default-button",
	default_font_color={r=1, g=0, b=0},
	align = "left",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 200,
	height = 30,
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_font_color={r=0.68, g=0.60, b=0.97},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_font_color={r=0.68, g=0.60, b=0.97},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
    }
data.raw["gui-style"]["default"]["cursed-buttonInside2"] = 
	{
	type = "button_style",
	parent = "cursed-buttonInside1",
	align = "center",
	}
data.raw["gui-style"]["default"]["cursed-buttonInside3"] = 
	{
	type = "button_style",
	parent = "cursed-buttonInside1",
	align = "center",
	width = 170,
	}
data.raw["gui-style"]["default"]["cursed-button-point"] = 
	{
	type = "button_style",
	width = 13,
	height = 13,
	scalable = true,
	default_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/point.png",
			width = 7,
			height = 7,
			x = 0,
			y = 0
			}
		},
	hovered_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/point.png",
			width = 7,
			height = 7,
			x = 0,
			y = 0
			}
		},
	clicked_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/point.png",
			width = 7,
			height = 7,
			x = 0,
			y = 0
			}
		},
	}
data.raw["gui-style"]["default"]["cursed-buttonMini"] = 
    {
	type = "button_style",
	font = "default-button",
	default_font_color={r=1, g=0, b=0},
	align = "center",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 30,
	height = 30,
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_font_color={r=0.68, g=0.60, b=0.97},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_font_color={r=0.68, g=0.60, b=0.97},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
    }
data.raw["gui-style"]["default"]["cursed-buttonMini2"] = 
	{
	type = "button_style",
	parent = "cursed-buttonMini",
	width = 20,
	height = 20,
	default_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/close.png",
			width = 30,
			height = 31,
			x = 0,
			y = 0
			}
		},
	hovered_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/close.png",
			width = 30,
			height = 31,
			x = 0,
			y = 0
			}
		},
	}
data.raw["gui-style"]["default"]["cursed-buttonMini-Off"] = 
	{
	type = "button_style",
	parent = "cursed-buttonMini",
	default_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	hovered_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	clicked_graphical_set =
		{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 16}
		},
	}
data.raw["gui-style"]["default"]["cursed-buttonClosed"] = 
	{
	type = "button_style",
	parent = "cursed-buttonMini",
	align = "center",
	width = 50,
	height = 57,
	default_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/open.png",
			width = 43,
			height = 49,
			x = 0,
			y = 0
			}
		},
	hovered_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/open.png",
			width = 43,
			height = 49,
			x = 0,
			y = 0
			}
		},
	clicked_graphical_set =
		{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
			{
			filename = "__Cursed-Exp__/graphics/gui/open.png",
			width = 43,
			height = 49,
			x = 0,
			y = 0
			}
		},
	}
data.raw["gui-style"]["default"]["cursed-progressbar"] = 
    {
	type = "progressbar_style",
	font = "default",
	font_color = {r=1, g=0, b=0},
	smooth_size = 200,
	smooth_color = {r=1},
	smooth_bar =
		{
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
        width = 1,
        height = 11,
        x = 223,
		},
    }
data.raw["gui-style"]["default"]["cursed-label"] = 
    {
      type = "label_style",
      font = "default",
      font_color = {r=0.68, g=0.60, b=0.97},
    }
data.raw["gui-style"]["default"]["cursed-label-bold"] = 
    {
      type = "label_style",
      font = "default-listbox",
      font_color = {r=0.68, g=0.60, b=0.97},
    }
data.raw["gui-style"]["default"]["cursed-checkbox"] = 
    {
	type = "checkbox_style",
	font = "default",
	font_color = {r=0.68, g=0.60, b=0.97},
	default_background =
		{
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		width = 16,
		height = 16,
		x = 43,
		y = 17
		},
	hovered_background =
		{
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		width = 16,
		height = 16,
		x = 60,
		y = 17
		},
	clicked_background =
		{
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		width = 16,
		height = 16,
		x = 77,
		y = 17
		},
	checked =
		{
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		width = 16,
		height = 16,
		x = 94,
		y = 17
		}
    }