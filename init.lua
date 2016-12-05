-- local application  = require "mjolnir.application"
-- local hotkey       = require "mjolnir.hotkey"
-- local window       = require "mjolnir.window"
-- local fnutils      = require "mjolnir.fnutils"
-- local grid         = require "mjolnir.sd.grid"
-- install stuff: luarocks install mjolnir.fnutils
-- info http://thume.ca/howto/2014/12/02/using-mjolnir-an-extensible-osx-window-manager/
--      https://groups.google.com/forum/#!searchin/hammerspoon/all$20apps|sort:relevance/hammerspoon/VabaeIBw9qw/Jqh_zfR6AwAJ
--      https://groups.google.com/forum/#!searchin/hammerspoon/all$20apps|sort:relevance/hammerspoon/BffebXiLQRE/-uuYbfTBCQAJ


-------------------------------------------------------------------------------
-- testing/non-functioning/undocumented stuff
-------------------------------------------------------------------------------
--launches two apps in sequence
--hs.hotkey.bind({ 'cmd', 'ctrl' }, 'b', function() ext.app.smartLaunchOrFocus({ 'Safari', 'Google Chrome' }) end) 

-------------------------------------------------------------------------------
-- minimise all windows
-- does not work -> https://groups.google.com/forum/#!topic/hammerspoon/GWPPyQrV_k4
-------------------------------------------------------------------------------
--hs.hotkey.bind(mash, "d", function()
-- win = hs.window.allWindows()
-- for w,_,_ in win do
--    w:minimize()
-- end
--end)




-- App vars
local browser   = hs.appfinder.appFromName("Google Chrome")
local iterm     = hs.appfinder.appFromName("iTerm2")
local subl      = hs.appfinder.appFromName("Sublime Text")
local phpstorm  = hs.appfinder.appFromName("PhpStorm")
local finder    = hs.appfinder.appFromName("Finder")
local slack     = hs.appfinder.appFromName("Slack")

local main_monitor = "Color LCD"
local second_monitor = "LG ULTRAWIDE"

-------------------------------------------------------------------------------
-- real configuration
-------------------------------------------------------------------------------
-- variable config
hs.window.animationDuration = 0
hs.window.setShadows(false)

-- extensions, available in hammerspoon console
ext = {
  frame    = {},
  win      = {},
  app      = {},
  utils    = {},
  cache    = {},
  watchers = {}
}

local mash      = {"cmd", "alt", "ctrl"}
local mash_apps = {"cmd", "alt"}

-------------------------------------------------------------------------------
-- positioning windows on screen
-- https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-------------------------------------------------------------------------------
hs.hotkey.bind(mash,"Z", function() push(0,0,0.3,1) end)             -- left side
hs.hotkey.bind(mash,"X", function() push(0,0,(1/3*2),1) end)         -- left two third
hs.hotkey.bind(mash,"M", function() push((1/3*2),0,(1/3),1) end)     -- right
hs.hotkey.bind(mash,"N", function() push((1/3),0,(1/3*2),1) end)     -- right two third
hs.hotkey.bind(mash,"V", function() push((1/3),0,(1/3),1) end)       -- middle
hs.hotkey.bind(mash,"space", function() push(0,0,1,1) end)           -- full screen
hs.hotkey.bind(mash, "f", function() push(0.05,0.05,0.9,0.9) end)

-------------------------------------------------------------------------------
-- reload configuration
-------------------------------------------------------------------------------
hs.hotkey.bind(mash, "R", function()
  hs.reload()
  print('config reloaded')
end)


-- launch and focus applications with below shortkey
hs.fnutils.each({
  { key = "f", app = "Fantastical" },
  { key = "c", app = "Google Chrome" },
  { key = "s", app = "slack" },
  { key = "p", app = "PhpStorm" },
  { key = "i", app = "iTerm" },
  { key = "m", app = "Mailplane 3" }
}, function(object)
    hs.hotkey.bind(mash_apps, object.key, function() ext.app.forceLaunchOrFocus(object.app) end) 
end)

-- functions below

-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
function push(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w*x)
  f.y = max.y + (max.h*y)
  f.w = max.w*w
  f.h = max.h*h
  win:setFrame(f)
end


-- https://github.com/szymonkaliski/Dotfiles/blob/b5a640336efc9fde1e8048c2894529427746076f/Dotfiles/hammerspoon/init.lua#L411-L440
function ext.app.forceLaunchOrFocus(appName)
  -- first focus with hammerspoon
  hs.application.launchOrFocus(appName)

  -- clear timer if exists
  if ext.cache.launchTimer then ext.cache.launchTimer:stop() end

  -- wait 500ms for window to appear and try hard to show the window
  ext.cache.launchTimer = hs.timer.doAfter(0.5, function()
    local frontmostApp     = hs.application.frontmostApplication()
    local frontmostWindows = hs.fnutils.filter(frontmostApp:allWindows(), function(win) return win:isStandard() end)

    -- break if this app is not frontmost (when/why?)
    if frontmostApp:title() ~= appName then
      print('Expected app in front: ' .. appName .. ' got: ' .. frontmostApp:title())
      return
    end

    if #frontmostWindows == 0 then
      -- check if there's app name in window menu (Calendar, Messages, etc...)
      if frontmostApp:findMenuItem({ 'Window', appName }) then
        -- select it, usually moves to space with this window
        frontmostApp:selectMenuItem({ 'Window', appName })
      else
        -- otherwise send cmd-n to create new window
        hs.eventtap.keyStroke({ 'cmd' }, 'n')
      end
    end
  end)
end

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        cur_window = window.focusedwindow()
        hs.grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

-- smart app launch or focus or cycle windows
function ext.app.smartLaunchOrFocus(launchApps)
  local frontmostWindow = hs.window.frontmostWindow()
  local runningApps     = hs.application.runningApplications()
  local runningWindows  = {}

  -- filter running applications by apps array
  local runningApps = hs.fnutils.map(launchApps, function(launchApp)
    return hs.application.get(launchApp)
  end)

  -- create table of sorted windows per application
  hs.fnutils.each(runningApps, function(runningApp)
    local standardWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
      return win:isStandard()
    end)

    table.sort(standardWindows, function(a, b) return a:id() < b:id() end)

    runningWindows = standardWindows
  end)

  if #runningApps == 0 then
    -- if no apps are running then launch first one in list
    ext.app.forceLaunchOrFocus(launchApps[1])
  elseif #runningWindows == 0 then
    -- if some apps are running, but no windows - force create one
    ext.app.forceLaunchOrFocus(runningApps[1]:title())
  else
    -- check if one of windows is already focused
    local currentIndex = hs.fnutils.indexOf(runningWindows, frontmostWindow)

    if not currentIndex then
      -- if none of them is selected focus the first one
      runningWindows[1]:focus()
    else
      -- otherwise cycle through all the windows
      local newIndex = currentIndex + 1
      if newIndex > #runningWindows then newIndex = 1 end

      runningWindows[newIndex]:focus()
    end
  end
end
