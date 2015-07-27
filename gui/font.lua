
data.raw["font"]["default"]["cursed-font"] = 
	{
	type = "font",
	name = "cursed-font",
	from = "__Cursed-Exp__/gui/cursed.ttf",
	size = 14
	}
	
	
	game.player.gui["left"].direction = 'vertical'
    local frame = game.player.gui["left"].add{type="frame", name="AI_main_frame", style="naked_frame_style", caption = '', direction='vertical'}
    local direction_container = frame.add{type="frame", name="direction_container", caption = '', direction='vertical'}
    local direction_selector = direction_container.add{type="frame", name="direction_selector", caption = '', direction='horizontal', style="naked_frame_style"}
    local radial = direction_selector.add{type="frame", name="radial", caption = '', style="AI_compass_frame_style", direction='vertical'}
    local dot_container = radial.add{type="frame", name="dot_container", caption = '', style="naked_frame_style", direction='horizontal'}
    dot_container.add{type="button", name="ai_dot", caption = '', style="AI_dot"}
    local dot_style = dot_container.style
    dot_style.toppadding = 100
    dot_style.leftpadding = 100
	
	
	
	
data.raw["gui-style"]["default"]["AI_radiobutton"] = 
{
  type = "button_style",
  parent = "button_style",
  width = 17,
  height = 17,
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
      filename = "__core__/graphics/gui.png",
      width = 10,
      height = 10,
      x = 43,
      y = 34
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
      filename = "__core__/graphics/gui.png",
      width = 10,
      height = 10,
      x = 54,
      y = 34
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
      filename = "__core__/graphics/gui.png",
      width = 10,
      height = 10,
      x = 65,
      y = 34
    }
  },
}

data.raw["gui-style"]["default"]["AI_dot"] = 
{
  type = "button_style",
  parent = "AI_radiobutton",
  width = 8,
  height = 8,
  scalable = false,
  
  default_graphical_set =
  {
    type = "monolith",
    top_monolith_border = 0,
    right_monolith_border = 0,
    bottom_monolith_border = 0,
    left_monolith_border = 0,
    monolith_image =
    {
      filename = "__core__/graphics/gui.png",
      width = 10,
      height = 10,
      x = 54,
      y = 34
    }
  },
}


data.raw["gui-style"]["default"]["AI_compass_frame_style"] =
{
  type = "frame_style",
  scalable = false, -- if changed to true then the bug is triggered immediately after resize, see Note #2
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
      filename = "__AdvancedIllumination__/graphics/compass.png",
      width = 200,
      height = 200,
      x = 0,
      y = 0
    }
  }
}
