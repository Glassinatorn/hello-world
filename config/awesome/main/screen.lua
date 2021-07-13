local awful = require("awful")
local lain = require("lain")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local bindings = require("main.bindings")
local vars = require("main.variables")

-- connecting tags for each screen
awful.screen.connect_for_each_screen(
    function(s)
        -- workplace labels
        awful.tag.add("   code", {
                layout = lain.layout.centerwork,
                master_fill_policy = "master_width_factor",
                gap_single_client = true,
                screen = s,
                selected = true
            }
        )
        awful.tag.add("   webb", {
                master_fill_policy = "master_width_factor",
                gap_single_client = true,
                screen = s
            }
        )
        awful.tag.add("   music", {
                master_fill_policy = "master_width_factor",
                gap_single_client = true,
                screen = s
            }
        )

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(
            gears.table.join(
                awful.button( {}, 1, function() awful.layout.inc(1) end),
                awful.button( {}, 3, function() awful.layout.inc(-1) end),
                awful.button( {}, 4, function() awful.layout.inc(1) end),
                awful.button( {}, 5, function() awful.layout.inc(-1) end)
            )
        )

        -- taglist widget
        s.mytaglist =
            awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = bindings.taglist_buttons,
            bg = "#000000",
            widget_template = {
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
                            bg = beautiful.bg_normal,--"#ececec",
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
        }

        -- Create the wibox
        s.mywibox =
            awful.wibar(
            {
                screen = s,
                stretch = false,
                height = beautiful.wibar_height,
                width = beautiful.wibar_width,
                bg = beautiful.transparent,
                shape = gears.shape.rectangle
            }
        )

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

-- -- binding keys for each tag
-- for i = 1, 9 do
--     Globalkeys =
--         gears.table.join(
--         Globalkeys,
--         -- View tag only.
--         awful.key({vars.MODKEY}, "#" .. i + 9,
--             function()
--                 local screen = awful.screen.focused()
--                 local tag = screen.tags[i]
--                 if tag then
--                     tag:view_only()
--                 end
--             end,
--             {description = "view tag #" .. i, group = "tag"}
--         ),
--         awful.key({vars.MODKEY, "Shift"}, "#" .. i + 9,
--             function()
--                 if client.focus then
--                     local tag = client.focus.screen.tags[i]
--                     if tag then
--                         client.focus:move_to_tag(tag)
--                     end
--                 end
--             end,
--             {description = "move focused client to tag #" .. i, group = "tag"}
--         )
--     )
-- end
