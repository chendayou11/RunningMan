--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/3
-- Time: 17:53
-- To change this template use File | Settings | File Templates.
--
local Man=class("Man",cc.load("mvc").ViewBase)
function Man:ctor()
    local frameCache=cc.SpriteFrameCache:getInstance()
    frameCache:addSpriteFrames("parkour.plist")
    local man=cc.Sprite:createWithSpriteFrameName("runner7.png")
    man:setAnchorPoint(0,0)
    man:setPosition(50,60)
    self:addChild(man)
    local animation=cc.Animation:create()
    for i=1,7 do
        local frameName=string.format("runner%d.png",i)
        local spriteFrame=cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
        animation:addSpriteFrame(spriteFrame)
    end
    animation:setDelayPerUnit(0.1)
    animation:setRestoreOriginalFrame(true)
    local action=cc.Animate:create(animation)
    man:runAction(cc.RepeatForever:create(action))
end
return Man

