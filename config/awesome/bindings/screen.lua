local awful = require("awful")
local lain = require("lain")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local bindings = require("bindings.bindings")

-- tags for wibox
local tags = { 
    code = {
	layout = lain.layout.centerwork,
	master_fill_policy = "master_width_factor",
	gap_single_client = true,
	screen = s,
	selected = true
    },
    webb = {
	master_fill_policy = "master_width_factor",
	gap_single_client = true,
	screen = s
    },
    music = {
	master_fill_policy = "master_width_factor",
	gap_single_client = true,
	screen = s
    }
}

-- template for taglist in the wibox
local taglist_template = {
    {
	{
	    {
		{
		    {
			id = "index_role",
			widget = wibox.widget.textbox
		    },
		    margins = 1,
		    widget = wibox.container.margin
		},
		bg = beautiful.bg_normal,
		shape = gears.shape.square,
		widget = wibox.container.background
	    },
	    {
		id = "text_role",
		widget = wibox.widget.textbox
	    },
	    layout = wibox.layout.fixed.horizontal
	},
	right = 15,
	widget = wibox.container.margin
    },
    id = "background_role",
    widget = wibox.container.background,
    create_callback = function(self, c3, index, objects)
	self:get_children_by_id("index_role")[1].markup = "<b>  " .. index .. "  </b>"
    end
}

-- wibox
local wibar_boxes = {
    screen = s,
    stretch = false,
    height = beautiful.wibar_height,
    width = beautiful.wibar_width,
    bg = beautiful.transparent,
    shape = gears.shape.rectangle
}

-- setup function
local function setup(s)
    -- connecting tags for each screen
    awful.screen.connect_for_each_screen(
	function(s)
	    -- workplace labels
	    awful.tag.add("   code", tags["code"])
	    awful.tag.add("   webb", tags["webb"])
	    awful.tag.add("   music", tags["music"])

	    -- Create a promptbox for each screen
	    s.mypromptbox = awful.widget.prompt()

	    -- taglist widget
	    s.mytaglist =
		awful.widget.taglist {
		    screen = s,
		    filter = awful.widget.taglist.filter.all,
		    buttons = bindings.taglist_buttons,
		    bg = "#000000",
		    widget_template = taglist_template
	    }

	    -- Create the wibox
	    s.mywibox = awful.wibar(wibar_boxes)

	    -- Add widgets to the wibox
	    s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{
		    -- Left widgets
		    layout = wibox.layout.fixed.horizontal,
		    s.mytaglist
		}
	    }
	end
    )
end

return { setup = setup }
