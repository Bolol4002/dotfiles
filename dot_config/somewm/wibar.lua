local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local modkey = "Mod4"

local colors = {}
local fc = io.popen("cat ~/.cache/wal/colors")
if fc then
    for line in fc:lines() do
        table.insert(colors, line)
    end
    fc:close()
end

local bg = colors[1] or "#090404"
local fg = colors[8] or "#c1c0c0"

local function separator()
    return wibox.widget {
        {
            orientation = "vertical",
            forced_width = 1,
            color = fg .. "80",
            widget = wibox.widget.separator,
        },
        top = 6,
        bottom = 6,
        left = 8,
        right = 8,
        widget = wibox.container.margin,
    }
end

return function(s)
    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(-1) end),
            awful.button({}, 5, function() awful.layout.inc(1) end),
        },
    }

    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
        },
    }

    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({}, 1, function(c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({}, 3, function()
                awful.menu.client_list { theme = { width = 250 } }
            end),
            awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({}, 5, function() awful.client.focus.byidx(1) end),
        },
    }

    local wibar = awful.wibar {
        position = "top",
        screen = s,
        height = 28,
        bg = bg,
        fg = fg,
        widget = {
            { -- Left section
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                separator(),
                s.mypromptbox,
            },
            { -- Center section
                s.mytasklist,
                layout = wibox.layout.flex.horizontal,
            },
            { -- Right section
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                separator(),
                awful.widget.keyboardlayout(),
                separator(),
                wibox.widget.textclock(" %a %b %d, %H:%M "),
                separator(),
                s.mylayoutbox,
            },
            layout = wibox.layout.align.horizontal,
        },
    }

    return wibar
end