--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/6
-- Time: 7:50
-- To change this template use File | Settings | File Templates.
--
local GameOver=class("GameOver",cc.load("mvc").ViewBase)
function GameOver:onCreate()
    local gameover=cc.LabelTTF:create("GAME OVER","Arial",50)
    gameover:setPosition(display.cx,display.cy)
    self:addChild(gameover)
end
return GameOver

