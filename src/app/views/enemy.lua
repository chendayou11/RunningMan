--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/8/6
-- Time: 14:31
-- To change this template use File | Settings | File Templates.
--
local enemy=class("enemy",cc.Layer)
function enemy:ctor(Man)
    self.man=Man
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
    animation:setDelayPerUnit(0.5)
    animation:setRestoreOriginalFrame(true)
    local animate=cc.Animate:create(animation)
    local picstart=cc.Sprite:create("bird_3.png")
    local repet=cc.RepeatForever:create(animate)
    picstart:setPosition(600,80)
    self:addChild(picstart)
    picstart:runAction(repet)
    self.picstart=picstart
    local timerGG=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.moveGG),0.05,false)
end
function enemy:moveGG()
    self.picstart:setPositionX(self.picstart:getPositionX()-15)
    local manRect=self.man.man:getBoundingBox()
    local rect=self.picstart:getBoundingBox()
    if cc.rectIntersectsRect(manRect,rect) then
        self.man.man:setVisible(false)
    end
end
return enemy
