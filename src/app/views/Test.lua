--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/3
-- Time: 1:53
-- To change this template use File | Settings | File Templates.
--
local Test=class("Test",cc.load("mvc").ViewBase)
function Test:onCreate()
    display.newSprite("Map00.png")
    :move(display.center)
    :addTo(self)
end
return Test
