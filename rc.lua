-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- require("utility")
-- Load Debian menu entries
-- require("debian.menu")
require("utility")
require("weather")
require("calendar2")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
 do
     local in_error = false
     awesome.add_signal("debug::error", function (err)
         -- Make sure we don't go into an endless error loop
         if in_error then return end
         in_error = true
 
         naughty.notify({ preset = naughty.config.presets.critical,
                          title = "Oops, an error happened!",
                          text = err })
         in_error = false
     end)
 end

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/sp/.config/awesome/themes/current/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "sakura"
browser  = "firefox"
filemanager  = "thunar"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "Common"," Inet   ", " p2p  ", " Mail ", "  IM  ", "Music ", "Video ", "Graphics", "Other0 ", "Other1 ", "Other2 ", "Other3 " }, s, layouts[2])
end
-- }}}
 awful.tag.setncol(2, tags[1][5])
 awful.tag.setnmaster (1, tags[1][5])
 awful.tag.setmwfact (0.2, tags[1][5])
-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart awesome", awesome.restart },
   { "quit ", awesome.quit },
   { "reboot ", "sudo /sbin/reboot" },
   { "reboot to win", "sudo /usr/sbin/reboot-to-win" }
}

mymainmenu = awful.menu({ items = { 
                                    -- { "Debian", debian.menu.Debian_menu.Debian },
                                    { "Xterm", terminal },
                                    { "Browser", browser },
                                    { "File manager", filemanager },
                                    {"     ", },
                                    { "Awesome", myawesomemenu, beautiful.awesome_icon },

                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

local util = require('awful.util')
 
 -- Quick launch bar widget BEGINS
 function find_icon(icon_name, icon_dirs)
    if string.sub(icon_name, 1, 1) == '/' then
       if util.file_readable(icon_name) then
          return icon_name
       else
          return nil
       end
    end
    if icon_dirs then
       for _, v in ipairs(icon_dirs) do
          if util.file_readable(v .. "/" .. icon_name) then
             return v .. '/' .. icon_name
          end
       end
    end
    return nil
 end
 
 function getValue(t, key)
    _, _, res = string.find(t, key .. " *= *([^%c]+)%c")
    return res
 end
 
 launchbar = { layout = awful.widget.layout.horizontal.leftright }
 filedir = "/home/sp/.config/awesome/launchbar/" -- Specify your folder with shortcuts here
 local items = {}
 local files = io.popen("ls " .. filedir .. "*.desktop")
 for f in files:lines() do
     local t = io.open(f):read("*all")
     table.insert(items, { image = find_icon(getValue(t,"Icon"), 
                                             { "/usr/share/icons/hicolor/22x22/apps" }),
                           command = getValue(t,"Exec"),
                           tooltip = getValue(t,"Name"),
                           position = tonumber(getValue(t,"Position")) or 255 })
 end
 table.sort(items, function(a,b) return a.position < b.position end)
 for i = 1, table.getn(items) do
 --   local txt = launchbar[i].tooltip
    launchbar[i] = awful.widget.launcher(items[i])
 --     local tt = awful.tooltip ({ objects = { aunchbar[i] } })
 --       tt:set_text (txt)
 --     tt:set_timeout (0)
 end
 
 -- Quick launch bar widget ENDS


-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })
calendar2.addCalendarToWidget(mytextclock, "<span color='green'>%s</span>")

-- Create a systray
mysystray = widget({ type = "systray" })

weatherwidget = widget({ type = "textbox" })
pcall(weather.addWeather, weatherwidget, "Saint Petersburg", 7200)

-- Create a wibox for each screen and add it
mywibox = {}
-- mywibox[s] = awful.wibox({ position = "bottom", screen = s })
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox Hello, world!widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "bottom", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            launchbar,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        weatherwidget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings



root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({  "Mod1"    }, "F4",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     size_hints_honor = false,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
     { rule = { class = "Deluge" },
      properties = { tag = tags[1][3] } },
     { rule = { class = "ktorrent" },
      properties = { tag = tags[1][3] } },
     { rule = { class = "Ktorrent" },
      properties = { tag = tags[1][3] } },
     { rule = { class = "Clementine" },
      properties = { tag = tags[1][6] } },
     { rule = { class = "Spotify" },
      properties = { tag = tags[1][6] } },
     { rule = { class = "spotify" },
      properties = { tag = tags[1][6] } },
     { rule = { class = "Firefox" },
      properties = { border_width = 0 } },
     { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][4] } },
     { rule = { class = "thunderbird" },
      properties = { tag = tags[1][4] } },
     { rule = { class = "Digikam" },
      properties = { tag = tags[1][8] } },
     { rule = { class = "telegram"},
      properties = { tag = tags[1][5], floating = false, border_width = beautiful.border_width }, callback = awful.titlebar.add },
     { rule = { class = "Telegram"},
      properties = { tag = tags[1][5], floating = false, border_width = beautiful.border_width }, callback = awful.titlebar.add },
     { rule = { name = "Media viewer" },
      properties = { floating = true }, callback = awful.titlebar.add  },
     { rule = { class = "Vlc" },
      properties = { tag = tags[1][7] } },
     { rule = { class = "Spotify" },
      properties = { tag = tags[1][6], floating = false, border_width = beautiful.border_width }, callback = awful.titlebar.add },
     { rule = { class = "spotify" },
      properties = { tag = tags[1][6], floating = false, border_width = beautiful.border_width }, callback = awful.titlebar.add },
     { rule = { instance = "plugin-container" },
      properties = { floating = true,
                     focus = yes } },

      
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.

client.add_signal("manage", function (c, startup)
    -- Add a titlebar
       
    --      awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)
    
    --Show titlebar on floating windows
     -- if awful.client.floating.get(c) 
     --   then
     --     awful.titlebar.add(c, { modkey = modkey }) 
      --  else
       --   awful.titlebar.remove(c, { modkey = modkey }) 
       -- end
   -- Show titlebar on some types of windows

      if (c.class ~= "Firefox") 
        then
          awful.titlebar.add(c, { modkey = modkey }) 
        else
          awful.titlebar.remove(c, { modkey = modkey }) 
        end
--
--
--awful.titlebar.add(c, { modkey = modkey }) 

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) 
    c.border_color = beautiful.border_focus  
end)


client.add_signal("unfocus", function(c) 
    c.border_color = beautiful.border_normal 
    -- if   c.titlebar 
    --    then awful.titlebar.remove(c)    
    -- end    
end)



-- }}}

autorun = true
 
autorunApps = --Приложения, которым нужен перезапуск при перезапуске AwesomeWM
   {
}
 
runOnceApps = --Приложения, при перезапуске которых появляется нежелательная вторая копия
   {
    "clementine",
    "spotify",
    "icedove",
    --"psi-plus",
    "/usr/local/bin/telegram",
    "thunar --daemon",
}
 
if autorun then
   for app = 1, #autorunApps do
      awful.util.spawn(autorunApps[app])
   end
   for app = 1, #runOnceApps do
      utility.run_once(runOnceApps[app])
   end
end

