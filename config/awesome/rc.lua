-- Standard awesome libraries
require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("shifty")
require("vicious")

-- Load local library
require("calendar2")

-- Load Debian menu entries
require("debian.menu")

--- COLOURS
coldef  = "</span>"
colblk  = "<span color='#1a1a1a'>"
colred  = "<span color='#b23535'>"
colgre  = "<span color='#60801f'>"
colyel  = "<span color='#be6e00'>"
colblu  = "<span color='#1f6080'>"
colmag  = "<span color='#8f46b2'>"
colcya  = "<span color='#73afb4'>"
colwhi  = "<span color='#b2b2b2'>"
colbblk = "<span color='#333333'>"
colbred = "<span color='#ff4b4b'>"
colbgre = "<span color='#9bcd32'>"
colbyel = "<span color='#d79b1e'>"
colbblu = "<span color='#329bcd'>"
colbmag = "<span color='#cd64ff'>"
colbcya = "<span color='#9bcdff'>"
colbwhi = "<span color='#ffffff'>"

-- THEME
beautiful.init("/home/kartik/.config/awesome/themes/kartik/theme.lua")

-- Fancy stuffs (Note: apt-get install unagi)
-- awful.util.spawn_with_shell("xcompmgr -ncF &")
-- awful.util.spawn_with_shell("unagi &")

-- DEFAULTS
terminal = "konsole"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "google-chrome"
modkey = "Mod4"

-- TAGS + TAG MATCHING
-- layouts
layouts = {
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.floating
}

-- shifty: predefined tags
shifty.config.tags = {
	["1-Term"]  = { init = true, position = 1, layout = awful.layout.suit.max, spawn = "konsole" },
	["2-WWW1"]  = { position = 2, layout = awful.layout.suit.max, spawn = "google-chrome"        },
	["3-Talk"]  = { position = 3, layout = awful.layout.suit.max, spawn = "skype"                },
	["4-WWW2"]  = { position = 4, layout = awful.layout.suit.max, spawn = "firefox"              },
	["5-VM"]    = { position = 5, layout = awful.layout.suit.max, spawn = "vmware"               },
	["6-♫♪"]    = { position = 6, layout = awful.layout.suit.max                                 },
	["7-Gimp"]  = { position = 7, layout = awful.layout.suit.floating, spawn = "gimp"            },
	["8-Write"] = { position = 8, layout = awful.layout.suit.floating, spawn = "xpad"            },
}

-- shifty: tags matching and client rules
shifty.config.apps = {
	{ match = { "konsole", "xterm", "st"                              }, tag = "1-Term",                                              },
	{ match = { "Google Chrome"                                       }, tag = "2-WWW1",                                              },
	{ match = { "Skype", "Pidgin", "SFLphone VoIP Client", "sflphone" }, tag = "3-Talk",                                              },
	{ match = { "Iceweasel", "Firefox"                                }, tag = "4-WWW2",                                              },
	{ match = { "VirtualBox OSE", "vmware"                            }, tag = "5-VM",                                                },
	{ match = { "MPlayer", "Vlc"                                      }, tag = "6-♫♪"   ,                                             },
	{ match = { "Gimp"                                                }, tag = "7-Gimp",                                              },
	{ match = { "libreoffice", "xCHM"                                 }, tag = "8-Write",                                             },
	{ match = { "gimp%-image%-window"                                 }, geometry = {175,15,1100,770}, border_width = 0               },
	{ match = { "^gimp%-toolbox$"                                     }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
	{ match = { "^gimp%-dock$"                                        }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },

-- client manipulation
	{ match = { "" },
		honorsizehints = false,
		buttons = awful.util.table.join (
		awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
		awful.button({ modkey }, 1, awful.mouse.client.move),
		awful.button({ modkey }, 3, awful.mouse.client.resize))
	},
}

-- shifty: defaults
shifty.config.defaults = {
	layout = awful.layout.suit.max,
}
shifty.config.layouts = layouts
shifty.init()

-- MENU
Debianmenu = { 
	{ "Debian",      debian.menu.Debian_menu.Debian }
}

networkmenu = {
	{ "Iceweasel",   "iceweasel"                   },
	{ "irssi",       terminal .. " -e irssi"       },
	{ "wicd",        terminal .. " -e wicd-curses" }
}

officemenu = {
	{ "Writer",      "soffice -writer"  },
	{ "Calc",        "soffice -calc"    },
	{ "Impress",     "soffice -impress" }
}

editorsmenu = {
	{ "vim",         terminal .. " -e vim" }
}

graphicsmenu = {
	{ "Gimp",        "gimp" }
}

mediamenu = {
	{ "VLC",         "vlc" }
}

utilitiesmenu = {
	{ "VMware",      "vmware" }
}

systemmenu = {
	{ "Konsole",     "konsole"              },
	{ "htop",        terminal .. " -e htop" },
	{ "kill",        "xkill"                }
}

awesomemenu = {
	{ "Lock",        terminal .. " -e i3lock"   },
	{ "Restart",     awesome.restart            },
	{ "Quit",        awesome.quit               },
	{ "Reboot",      terminal .. " -e reboot"   },
	{ "Shutdown",    terminal .. " -e shutdown" }
}

mainmenu = awful.menu({
	items = {
		{ "awesome",   awesomemenu   },
		{ "Debian",    Debianmenu    },
		{ "Network",   networkmenu   },
		{ "Office",    officemenu    },
		{ "Editors",   editorsmenu   },
		{ "Graphics",  graphicsmenu  },
		{ "Media",     mediamenu     },
		{ "Utilities", utilitiesmenu },
		{ "System",    systemmenu    }
	}
})

-- WIDGETS TOP RIGHT
-- Spacer widget
spacerwidget = widget({ type = "imagebox" })
	spacerwidget.image = image("/home/kartik/.config/awesome/themes/kartik/spacer.png")

-- Calendar widget
calwidget = widget({ type = "textbox" })
	function dayth()
		local osd = os.date("%d")
		if osd == "01" or osd == "21" or osd == "31" then
			return "<span font='proggytiny 7'><sup>st</sup></span>"
		elseif osd == "02" or osd == "22" then
			return "<span font='proggytiny 7'><sup>nd</sup></span>"
		elseif osd == "03" or osd == "23" then
			return "<span font='proggytiny 7'><sup>rd</sup></span>"
		else
			return "<span font='proggytiny 7'><sup>th</sup></span>"
		end
	end
	vicious.register(calwidget, vicious.widgets.date, "" .. colyel .. " %a, %e" .. dayth() .. " %B" .. coldef .. " ")

	calendar2.addCalendarToWidget(calwidget, "" .. colbred .. "%s" .. coldef .. "")

-- Keyboard map indicator and changer
kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { "us", "" }, { "guj", "" } }
kbdcfg.current = 1  -- us is our default layout
kbdcfg.widget = widget({ type = "textbox", align = "left" })
kbdcfg.widget.text = " " .. kbdcfg.layout[kbdcfg.current][1] .. " "
kbdcfg.switch = function ()
	kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
	local t = kbdcfg.layout[kbdcfg.current]
	kbdcfg.widget.text = " " .. colred .. t[1] .. coldef .." "
	os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
end

-- Mouse bindings
kbdcfg.widget:buttons(awful.util.table.join(
	awful.button({ }, 1, function () kbdcfg.switch() end)
))

awful.widget.layout.margins[kbdcfg.widget] = { right = 3 }
awful.widget.layout.margins[kbdcfg.widget] = { left = 3 }

-- End Keyboard map indicator

-- Clock widget
clockwidget = widget({ type = "textbox" })
	vicious.register(clockwidget, vicious.widgets.date, "<span color='#d79b1e'>%l:%M%P</span>")
	function cal_gett()
		local fp = io.popen("remind ~/.reminders")
		local rem = fp:read("*a")
		fp:close()
			rem = string.gsub(rem, "\027%[0m", "</span>")
			rem = string.gsub(rem, "\027%[0;30m", "<span color='#1a1a1a'>") --black
			rem = string.gsub(rem, "\027%[0;31m", "<span color='#b23535'>") --red
			rem = string.gsub(rem, "\027%[0;32m", "<span color='#60801f'>") --green
			rem = string.gsub(rem, "\027%[0;33m", "<span color='#be6e00'>") --yellow
			rem = string.gsub(rem, "\027%[0;34m", "<span color='#1f6080'>") --blue
			rem = string.gsub(rem, "\027%[0;35m", "<span color='#8f46b2'>") --magenta
			rem = string.gsub(rem, "\027%[0;36m", "<span color='#73afb4'>") --cyan
			rem = string.gsub(rem, "\027%[0;37m", "<span color='#b2b2b2'>") --white
			rem = string.gsub(rem, "\027%[1;30m", "<span color='#4c4c4c'>") --br-black
			rem = string.gsub(rem, "\027%[1;31m", "<span color='#ff4b4b'>") --br-red
			rem = string.gsub(rem, "\027%[1;32m", "<span color='#9acd32'>") --br-green
			rem = string.gsub(rem, "\027%[1;33m", "<span color='#d79b1e'>") --br-yellow
			rem = string.gsub(rem, "\027%[1;34m", "<span color='#329bcd'>") --br-blue
			rem = string.gsub(rem, "\027%[1;35m", "<span color='#cd64ff'>") --br-magenta
			rem = string.gsub(rem, "\027%[1;36m", "<span color='#9acdff'>") --br-cyan
			rem = string.gsub(rem, "\027%[1;37m", "<span color='#ffffff'>") --br-white
			return rem
	end
	clockwidget:add_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), timeout = 0, hover_timeout = 0.5 }) } end)
	clockwidget:add_signal('mouse::leave', function () naughty.destroy(cal_remt[1]) end)

	local function time_cet()
		local time = os.time()
		time2 = time - (8*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_utc()
		local time = os.time()
		time2 = time - (5.50*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_pst()
		local time = os.time()
		time2 = time - (13.5*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_est()
		local time = os.time()
		time2 = time - (1.5*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end

-- End Clock widget

-- WIDGETS BOTTOM RIGHT

-- Net icons
dnicon = widget({ type = "imagebox" })
upicon = widget({ type = "imagebox" })
baticon = widget({ type = "imagebox" })
wifiicon = widget({ type = "imagebox" })
dnicon.image = image(beautiful.widget_net)
upicon.image = image(beautiful.widget_netup)
baticon.image = image(beautiful.widget_battery)
wifiicon.image = image(beautiful.widget_wifi)

-- Net widgets
-- eth
neteupwidget = widget({ type = "textbox" })
vicious.cache(vicious.widgets.net)
vicious.register(neteupwidget, vicious.widgets.net, "<span color='#60801f'></span><span color='#9acd32'>${eth0 up_kb} </span>")

netedownwidget = widget({ type = "textbox" })
vicious.register(netedownwidget, vicious.widgets.net, "<span color='#60801f'></span><span color='#9acd32'>${eth0 down_kb} </span>")

netwidget = widget({ type = "textbox" })
vicious.register(netwidget, vicious.widgets.net,
function (widget, args)
	if args["{name}"] == nil then
		netedownwidget.visible = false
		neteupwidget.visible = false
		return ""
	else
		netedownwidget.visible = true
		neteupwidget.visible = true
		return "<span color='#60801f'> eth0 </span><span color='#9acd32'>" .. args["{name}"] .. " </span>"
	end
	end, refresh_delay, "eth0")

-- wlan
netwupwidget = widget({ type = "textbox" })
vicious.register(netwupwidget, vicious.widgets.net, "<span color='#60801f'></span><span color='#9acd32'>${wlan0 up_kb} </span>")

netwdownwidget = widget({ type = "textbox" })
vicious.register(netwdownwidget, vicious.widgets.net, "<span color='#60801f'></span><span color='#9acd32'>${wlan0 down_kb} </span>")

wifiwidget = widget({ type = "textbox" })
vicious.register(wifiwidget, vicious.widgets.wifi,
function (widget, args)
	if args["{link}"] == 0 then
	netwdownwidget.visible = false
	netwupwidget.visible = false
	return ""
	else
	netwdownwidget.visible = true
	netwupwidget.visible = true
	return "<span color='#60801f'></span><span color='#9acd32'>" .. string.format("%s [%i%%]", args["{ssid}"], args["{link}"]/70*100) .. " </span>"
	end
end, refresh_delay, "wlan0" )

-- HDD temp
hddtempwidget = widget({ type = "textbox" })
	vicious.register(hddtempwidget, vicious.widgets.thermal, " <span color='#60802f'>hdd </span>%d  C ", 19)

-- uptime widget
uptimewidget = widget({ type = "textbox" })
	vicious.register(uptimewidget, vicious.widgets.uptime,
	function (widget, args)
	return string.format("<span color='#60801f'> uptime</span><span color='#9acd32'> %2dd %02d:%02d </span>", args[1], args[2], args[3]) end, 61)

-- CPU widget
cputwidget = widget({ type = "textbox" })
	vicious.register(cputwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] == 50 then
			return "<span color='#be6e00'> cpu </span><span color='#d79b1e'>" .. args[1] .. "% </span>"
		elseif args[1] >= 50 then
			return "<span color='#b23535'> cpu </span><span color='#ff4b4b'>" .. args[1] .. "% </span>"
		else
			return "<span color='#60801f'> cpu </span><span color='#9acd32'>" .. args[1] .. "% </span>"
		end
	end )
cputwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- Ram widget
memwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "<span color='#60801f'> ram </span><span color='#9acd32'>$1% </span>", 13)

-- Filesystem widgets
-- root
fsrwidget = widget({ type = "textbox" })
	vicious.register(fsrwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
			return "<span color='#be6e00'> /linux </span><span color='#d79b1e'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
			return "<span color='#b23535'> /linux </span><span color='#ff4b4b'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'> /linux </span><span color='#ff4b4b'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		else
			return "<span color='#60801f'> /linux </span><span color='#9acd32'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		end
	end, 620)

-- windata
fswindatawidget = widget({ type = "textbox" })
	vicious.register(fswindatawidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/media/windows used_p}"] >= 93 and args["{/media/windows used_p}"] < 97 then
			return "<span color='#be6e00'>/win </span><span color='#d79b1e'>" .. args["{/media/windows used_p}"] .. "% (" .. args["{/media/windows avail_gb}"] .. " GiB free) </span>"
		elseif args["{/media/windows used_p}"] >= 97 and args["{/media/windows used_p}"] < 99 then
			return "<span color='#b23535'>/win </span><span color='#ff4b4b'>" .. args["{/media/windows used_p}"] .. "% (" .. args["{/media/windows avail_gb}"] .. " GiB free) </span>"
		elseif args["{/media/windows used_p}"] >= 99 and args["{/media/windows used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on this drive!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'>/win </span><span color='#ff4b4b'>" .. args["{/media/windows used_p}"] .. "% (" .. args["{/media/windows avail_gb}"] .. " GiB free) </span>"
		else
			return "<span color='#60801f'>/win </span><span color='#9acd32'>" .. args["{/media/windows used_p}"] .. "% (" .. args["{/media/windows avail_gb}"] .. " GiB free) </span>"
		end
	end, 620)

-- End File System widget

-- Start icons/images

baticon = widget({ type = "imagebox" })
baticon.image = image(beautiful.widget_battery)

-- End icons/images

-- Battery widget
batwidget = widget({ type = "textbox" })
	vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if  args[2] >= 75 and args[2] < 95 then
			return "<span color='#60801f'></span><span color='#9acd32'>" .. args[2] .. "% </span>"
		elseif args[2] >= 50 and args[2] < 75 then
			return "<span color='#be6e00'></span><span color='#d79b1e'>" .. args[2] .. "% </span>"
		elseif args[2] >= 20 and args[2] < 50 then
			return "<span color='#b23535'></span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		elseif args[2] < 20 and args[1] == "-" then
			naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'></span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		elseif args[2] < 20 then 
			return "<span color='#b23535'></span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		else
		    return "<span color='#60801f'></span><span color='#9acd32'>" .. args[2] .. "% </span>"
		end
	end, 23, "BAT0"	)

-- End

-- Battery bar widget
batbar = awful.widget.progressbar()
	vicious.register(batbar, vicious.widgets.bat, "$2", 23, "BAT0")
	batbar:set_width(8)
	batbar:set_height(18)
	batbar:set_vertical(true)
	batbar:set_background_color("#1a1a1a")
	batbar:set_color("#60801f")

-- End Battery bar widget

-- SYSTRAY
mysystray = widget({ type = "systray" })

-- WIBOXES
mywibox = {}
infobox = {}
mypromptbox = {}
-- taglist
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
	awful.button({ }, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
	)
shifty.taglist = mytaglist
-- tasklist
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if not c:isvisible() then
			awful.tag.viewonly(c:tags()[1])
		end
		client.focus = c
		c:raise()
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
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end)
)
-- Create for each screen
for s = 1, screen.count() do
	mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
	mytasklist[s] = awful.widget.tasklist(function(c)
		return awful.widget.tasklist.label.currenttags(c, s)
	end, mytasklist.buttons)
	-- top box
	mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
	mywibox[s].widgets = { {
		mytaglist[s], spacerwidget,
		mypromptbox[s], layout = awful.widget.layout.horizontal.leftright },
		clockwidget,
		calwidget,
		kbdcfg.widget,
		s == 1 and mysystray or nil,
		mytasklist[s],
		layout = awful.widget.layout.horizontal.rightleft }
	-- bottom box
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
	infobox[s].widgets = {
		batbar.widget, batwidget, baticon,
		spacerwidget,
		neteupwidget, netedownwidget, netwidget,
		netwupwidget, upicon, netwdownwidget, dnicon, wifiwidget,
		wifiicon, spacerwidget,
		fswindatawidget, fsrwidget,
		spacerwidget,
		memwidget,
		spacerwidget,
		uptimewidget,
		spacerwidget,
		cputwidget,
		layout = awful.widget.layout.horizontal.rightleft }
end

-- BINDINGS
-- Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev))
)

-- Key bindings
-- Global
globalkeys = awful.util.table.join(
	-- Tags
	awful.key({ modkey,           }, "Prior",                awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Next",                 awful.tag.viewnext       ),
	awful.key({ modkey, "Shift"   }, "Prior",                shifty.shift_prev        ),
	awful.key({ modkey, "Shift"   }, "Next",                 shifty.shift_next        ),
	awful.key({ modkey            }, "a",                    function() shifty.add({ rel_index = 1 }) end ),
	awful.key({ modkey, "Shift"   }, "a",                    function() shifty.add({ rel_index = 1, nopopup = true }) end ),
	awful.key({ modkey            }, "z",                    shifty.del ),
	awful.key({ modkey,           }, "Escape",               awful.tag.history.restore),
	awful.key({ modkey,           }, "Right",                function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",                 function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),

	-- Programs
	-- launchers
	awful.key({ modkey,           }, "w",                    function () mainmenu:show({keygrabber=true}) end),
	awful.key({ modkey,           }, "Tab",                  function () awful.util.spawn(terminal) end),
	awful.key({ modkey, "Shift"   }, "Tab",                  function () awful.util.spawn(terminal .. " -e su") end),

	-- miscellaneous
	awful.key({ modkey, "Shift"   }, "s",                    function () awful.util.spawn("scrot -s") end),
	awful.key({ modkey, "Shift"   }, "k",                    function () awful.util.spawn("xkill") end),
	awful.key({ modkey,           }, "q",                    function () awful.util.spawn("i3lock") end),

	-- Keyboard switcher
	-- z has no binding in Gujarati inscript, choosen one :)
	awful.key({ modkey,           }, "z",                    function () kbdcfg.switch() end),

	-- timezone
	awful.key({ modkey,           }, "t",                    function ()
	naughty.notify({ text = "<span color='#be6e00'>GMT    : </span><span color='#d79b1e'>" .. time_utc() .. "</span>\n<span color='#be6e00'>PST : </span><span color='#d79b1e'>" .. time_pst() .. "</span>\n<span color='#be6e00'>SPb: </span><span color='#d79b1e'>" .. time_est() .. "</span>", timeout = 20, hover_timeout = 0.5 }) end),

	-- wicd
	awful.key({ modkey,           }, "d",                    function () awful.util.spawn(terminal .. " -e wicd-curses") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                 function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey, "Control" }, "Right",                function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "Left",                 function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                    awful.client.urgent.jumpto),

	-- Awesome
	awful.key({ modkey, "Control" }, "r",                    awesome.restart),
	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit),
	awful.key({ modkey,           }, "space",                function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                function () awful.layout.inc(layouts, -1) end),

	-- Prompts
	awful.key({ modkey,           }, "`",                    function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey, "Shift"   }, "x",                    function ()
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.util.eval, nil,
		awful.util.getdir("cache") .. "/history_eval"))
	end)
)

-- Clients
clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, "o",                    function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",                    function (c) c:kill() end),
	awful.key({ modkey, "Control" }, "space",                awful.client.floating.toggle ),
	awful.key({ modkey, "Control" }, "Return",               function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey, "Control" }, "o",                    awful.client.movetoscreen ),
	awful.key({ modkey,           }, "n",                    function (c) c.minimized = not c.minimized end),
	awful.key({ modkey, "Shift"   }, "n",                    function ()
		local allclients = client.get(mouse.screen)
		for _,c in ipairs(allclients) do
			if c.minimized and c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
				c.minimized = false client.focus = c c:raise()
				return
			end
		end end),
	awful.key({ modkey,           }, "f",                    function (c)
		c.maximized_horizontal = not c.maximized_horizontal
		c.maximized_vertical   = not c.maximized_vertical
	end)
)

-- WORKSPACES
-- shifty:
for i=1,9 do
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey }, i, function ()
		local t = awful.tag.viewonly(shifty.getpos(i))
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control" }, i, function ()
		local t = shifty.getpos(i)
		t.selected = not t.selected
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control", "Shift" }, i, function ()
		if client.focus then
			awful.client.toggletag(shifty.getpos(i))
		end
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Shift" }, i, function ()
		if client.focus then
			local t = shifty.getpos(i)
			awful.client.movetotag(t)
			awful.tag.viewonly(t)
		end
	end))
end

-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys

-- SIGNALS
client.add_signal("manage", function (c, startup)
	if not startup then
		if not c.size_hints.user_position and not c.size_hints.program_position then
			awful.placement.no_overlap(c)
			awful.placement.no_offscreen(c)
		end
	end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
