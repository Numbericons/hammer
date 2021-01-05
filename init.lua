hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y - (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

pressReturn = function()
    hs.eventtap.keyStroke({}, "return")
end

deleteItem = function()
    mp = hs.mouse.getAbsolutePosition()
    hs.eventtap.event.newMouseEvent(1, {x=mp.x, y=mp.y},{"ctrl"}):post()
    hs.eventtap.event.newMouseEvent(1, {x=mp.x+30, y=mp.y+35}):post()
    hs.eventtap.event.newMouseEvent(2, {x=mp.x+30, y=mp.y+35}):post()
    hs.mouse.setAbsolutePosition({x=mp.x, y=mp.y})
    hs.timer.doAfter(1, pressReturn)
end

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "I", function()
    for i = 1, 50 do
        hs.timer.doAfter(3*i, deleteItem)
    end
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "X", function()
    hs.eventtap.keyStrokes('&xml=t')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "Z", function()
    hs.eventtap.keyStrokes('console.log(\'Script Finished\');')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "F", function()
    hs.eventtap.keyStrokes('for (let i=0; i<arr.length; i++){}')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "J", function()
    hs.eventtap.keyStrokes('for (let j=0; j<arr.length; j++){}')
end)

hs.hotkey.bind({"ctrl", "cmd", "alt"}, "M", function()
    hs.eventtap.keyStrokes('arr.map(el => el)')
end)