--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/8/6
-- Time: 14:31
-- To change this template use File | Settings | File Templates.
--
local enemy=class("enemy",cc.Layer)
function enemy:ctor(Man)
    self.birds={}
    self.man=Man
    self:daodan()
    self:bird()
end
function enemy:daodan()
    local dd=cc.Sprite:create("daodan.png")
    dd:setPosition(800,80)
    self:addChild(dd)
    local move=cc.MoveBy:create(3,cc.p(-2*display.width,0))
    dd:runAction(move)
end
function enemy:bird()
    local animation=cc.Animation:create()
    for i=3 ,4 do
        local picpath=string.format("bird_%d.png",i)
        animation:addSpriteFrameWithFile(picpath)
    end
    animation:setDelayPerUnit(0.5)
    animation:setRestoreOriginalFrame(true)
    local animate=cc.Animate:create(animation)
    local bird=cc.Sprite:create("bird_3.png")
    local repet=cc.RepeatForever:create(animate)
    bird:setScale(0.3)
    bird:setPosition(300,80)
    self:addChild(bird)
    bird:runAction(repet)
    self.bird=bird
    self.birds[bird]=bird
    local timerGG=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.moveGG),0.1,false)
end
function enemy:moveGG()
    self.bird:setPositionX(self.bird:getPositionX()-5)
    local manRect=self.man.man:getBoundingBox()
    local rect=self.bird:getBoundingBox()
    if cc.rectIntersectsRect(manRect,rect) then
        local blink=cc.Blink:create(0.5,4)
        self.man.man:runAction(blink)
        --self:removeGG(self.bird)
    end
end
function enemy:removeGG(node)
    self.birds[node]=nil
    node:removeSelf()
end
return enemy
