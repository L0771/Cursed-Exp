data:extend(
{
	boton_apagado=
    {
	type = "button_style",
	font = "letra1",
	default_font_color={r=0.5, g=0.5, b=0.5},
	align = "center",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 200,
	height = 20,
	default_graphical_set =
		{
			type = "composition",
			filename = "__core__/graphics/gui.png",
			priority = "extra-high-no-scale",
			corner_size = {3, 3},
			position = {0, 0}
		},
	hovered_font_color={r=0.5, g=0.5, b=0.5},
	hovered_graphical_set =
	{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 0}
	},
	clicked_font_color={r=0.5, g=0.5, b=0.5},
	clicked_graphical_set =
	{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 0}
	},
	disabled_font_color={r=0.5, g=0.5, b=0.5},
	disabled_graphical_set =
	{
		type = "composition",
		filename = "__core__/graphics/gui.png",
		priority = "extra-high-no-scale",
		corner_size = {3, 3},
		position = {0, 0}
	},
	pie_progress_color = {r=1, g=1, b=1}
    },
	
    button_talents_1 =
    {
      type = "button_style",
      parent = "boton_apagado",

      default_font_color={r=0.5, g=0.5, b=0.5},
      hovered_font_color={r=0.5, g=0.5, b=0.5},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      clicked_font_color={r=0.5, g=0.5, b=0.5},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
    },
	
    talents_bar_button1 =
    {
      type = "button_style",
      font = "letra1",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      hovered_font_color={r=1, g=1, b=1},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 8}
      },
      clicked_font_color={r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 16}
      },
      disabled_font_color={r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      pie_progress_color = {r=1, g=1, b=1}
    },
	
    talents_bar_button2 =
    {
      type = "button_style",
      font = "letra2",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      hovered_font_color={r=1, g=1, b=1},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 8}
      },
      clicked_font_color={r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 16}
      },
      disabled_font_color={r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      pie_progress_color = {r=1, g=1, b=1}
    },
	
    talents_bar_button3 =
    {
      type = "button_style",
      font = "letra3",
      default_font_color={r=1, g=1, b=1},
      align = "center",
      top_padding = 5,
      right_padding = 5,
      bottom_padding = 5,
      left_padding = 5,
      default_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      hovered_font_color={r=1, g=1, b=1},
      hovered_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 8}
      },
      clicked_font_color={r=1, g=1, b=1},
      clicked_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 16}
      },
      disabled_font_color={r=0.5, g=0.5, b=0.5},
      disabled_graphical_set =
      {
        type = "composition",
        filename = "__core__/graphics/gui.png",
        priority = "extra-high-no-scale",
        corner_size = {3, 3},
        position = {0, 0}
      },
      pie_progress_color = {r=1, g=1, b=1}
    },
	
	
  {
    type = "font",
    name = "letra1",
    from = "default-semibold",
    size = 18
  },
  {
    type = "font",
    name = "letra2",
    from = "default",
    size = 18
  },
  {
    type = "font",
    name = "letra3",
    from = "default-bold",
    size = 18
  },
}
)