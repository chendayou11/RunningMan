--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/8/6
-- Time: 14:31
-- To change this template use File | Settings | File Templates.
--
local enemy=class("enemy",cc.Layer)
function enemy:ctor()
    self:daodan()
    self:guai()
end
function enemy:daodan()
    local dd=cc.Sprite:create("daodan.png")
    dd:setPosition(800,80)
    self:addChild(dd)
    local move=cc.MoveBy:create(3,cc.p(-2*display.width,0))
    dd:runAction(move)
end
function enemy:guai()
    local animation=cc.Animation:create()
    for i=3 ,4 do
        local picpath=string.format("bird_%d.png",i)
        animation:addSpriteFrameWithFile(picpath)
    end
    animation:setDelayPerUnit(1)
    animation:setRestoreOriginalFrame(true)
    local animate=cc.Animate:create(animation)
    local picstart=cc.Sprite:create("bird_3.png")
    picstart:setPosition(600,80)
    self:addChild(picstart)
    picstart:runAction(cc.RepeatForever:create(animate))
end
return enemy
