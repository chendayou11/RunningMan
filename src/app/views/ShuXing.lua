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
    local blood_1=cc.Sprite:create("stars.png")
    local blood_2=cc.Sprite:create("stars.png")
    local blood_3=cc.Sprite:create("stars.png")
    blood_1:setPosition(20,300)
    blood_2:setPosition(50,300)
    blood_3:setPosition(80,300)
    self:addChild(blood_1)
    self:addChild(blood_2)
    self:addChild(blood_3)
    self.bloods={"blood_1","blood_2","blood_3" }
    self.blood_1=blood_1
    self.blood_2=blood_2
    self.blood_3=blood_3
end
function ShuXing:Score()
end
function ShuXing:removeBlood(node)
    self.bloods[node]=nil
    self.blood_1:removeSelf()
    print("blood")
end
return ShuXing

