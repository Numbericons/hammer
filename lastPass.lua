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
    for i = 1, 20 do
        hs.timer.doAfter(2*i, deleteItem)
    end
end)