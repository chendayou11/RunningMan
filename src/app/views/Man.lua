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
    local frameCache=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
    local man=cc.Sprite:createWithSpriteFrameName("runner7.png")
    man:setAnchorPoint(0,0)
    man:setPosition(50,60)
    self:addChild(man)
    self.coins={}
    self.man=man
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
    self:coinAnimate()
    local timerPengzhuang=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.pengzhuang),0.1,false)
end
function Man:coinAnimate()
    local frameCache=cc.SpriteFrameCache:getInstance():addSpriteFrames("parkour.plist")
    local coin_1=cc.Sprite:createWithSpriteFrameName("coin4.png")
    coin_1:setAnchorPoint(0,0)
    coin_1:setPosition(100,150)
    self:addChild(coin_1)
    local animation=cc.Animation:create()
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
    local addCoinTimer=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.moveAI),0.3,false)
end
function Man:moveAI()
    local coinMove=cc.Sprite:createWithSpriteFrameName("coin1.png")
    self:addChild(coinMove)
    local x=math.random(250,640)
    coinMove:setPosition(600,200)
    self.coins[coinMove]=coinMove
    local move=cc.MoveBy:create(3,cc.p(-display.width,0))
    local fun=cc.CallFunc:create(handler(self,self.removeCoins))
    local seq=cc.Sequence:create(move,fun)
    coinMove:runAction(seq)
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
            print("ffffffgaasf")
            self.shuxing:removeBlood(k1)
            end
            end
        end
end
return Man

