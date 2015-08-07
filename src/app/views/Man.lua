--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/3
-- Time: 17:53
-- To change this template use File | Settings | File Templates.
--
local Man=class("Man",cc.Layer)
function Man:ctor(shuxing)
    self.shuxing=shuxing
    local animation=cc.Animation:create()
    local frameCache=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
    local man=cc.Sprite:createWithSpriteFrameName("runner7.png")
    man:setAnchorPoint(0,0)
    man:setPosition(50,60)
    self:addChild(man)
    self.coins={}
    self.man=man
    for i=1,7 do
        local frameName=string.format("runner%d.png",i)
        local spriteFrame=cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
        animation:addSpriteFrame(spriteFrame)
    end
    animation:setDelayPerUnit(0.1)
    animation:setRestoreOriginalFrame(true)
    local action=cc.Animate:create(animation)
    man:runAction(cc.RepeatForever:create(action))
    local timerPengzhuang=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.coinAnimate),5,false)
    local timerPengzhuang=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.pengzhuang),0.1,false)
end

function Man:coinAnimate()
    local fc=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
    local coin_1=cc.Sprite:createWithSpriteFrameName("coin4.png")
    local animation=cc.Animation:create()
    coin_1:setAnchorPoint(0,0)
    coin_1:setPosition(800,200)
    self:addChild(coin_1)
    self.coins[coin_1]=coin_1
    for i=1,7 do
        local frameicon=string.format("coin%d.png",i)
        local coin=cc.SpriteFrameCache:getInstance():getSpriteFrame(frameicon)
        animation:addSpriteFrame(coin)
    end
    animation:setDelayPerUnit(0.1)
    animation:setRestoreOriginalFrame(true)
    local action=cc.Animate:create(animation)
    coin_1:runAction(cc.RepeatForever:create(action))
    self.coin_1=coin_1
    local addCoinTimer=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.coinMove),1,false)
end

function Man:coinMove()
    local move=cc.MoveBy:create(40,cc.p(-display.width*2,0))
    local fun=cc.CallFunc:create(handler(self,self.removeCoins))
    local seq=cc.Sequence:create(move,fun)
    self.coin_1:runAction(seq)
end

function Man:removeCoins(node)
    self.coins[node]=nil
    node:removeSelf()
end

function Man:pengzhuang()
    for k,v in pairs(self.coins) do
        for k1,v1 in  pairs(self.shuxing.bloods) do
        if cc.rectIntersectsRect(v:getBoundingBox(),self.man:getBoundingBox()) then
            self:removeCoins(v)
            end
            end
        end
end
return Man

