--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/6
-- Time: 23:23
-- To change this template use File | Settings | File Templates.
--
local ShuXing=class("ShuXing",cc.Layer)
function ShuXing:ctor()
    self.bloods={}
    self:blood()
end
function ShuXing:blood()
    self.x=15
   for i=1,3 do
        local blood=cc.Sprite:create("Star.png")
        blood:setScale(0.3)
        self:addChild(blood)
        blood:setPosition(blood:getPositionX()+self.x*i,300)
        table.insert(self.bloods,blood)
    end
end
function ShuXing:Score()
end
function ShuXing:removeBlood(node)
    self.bloods[node]=nil
    node:removeSelf()
end
return ShuXing

