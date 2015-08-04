--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/3
-- Time: 17:53
-- To change this template use File | Settings | File Templates.
--
local Man=class("Man",cc.load("mvc").ViewBase)
function Man:ctor()
    local frameCache=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
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
local function coins()
    local frameCache=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
    local coin_1=cc.Sprite:createWithSpriteFrameName("coin7.png")
    coin_1:setAnchorPoint(0,0)
    coin_1:setPosition(100,50)
    self:addChild(coin_1)
    local animation=cc.Animation:create()
    for i=1,7 do
        local frameicon=string.format("coin%d.png",i)
        local coin=cc.SpriteFrameCache:getInstance():getSpriteFrame(frameicon)
        animation:addSpriteFrame(coin)
    end
    animation:setDelayPerUnit(0.5)
    animation:setRestoreOriginalFrame(true)
    local action=cc.Animate:create(animation)
    coin_1:runAction(cc.RepeatForever:create(action))
end
return Man

