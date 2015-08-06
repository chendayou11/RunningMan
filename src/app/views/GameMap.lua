--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/2
-- Time: 11:37
-- To change this template use File | Settings | File Templates.
--
local GameMap=class("GameMap",cc.Layer)
function GameMap:ctor()
    local Map_1=cc.TMXTiledMap:create("map00.tmx")
    self:addChild(Map_1,0,100)
    local Map_2=cc.TMXTiledMap:create("map01.tmx")
    Map_2:setPositionX(Map_2:getContentSize().width)
    self:addChild(Map_2,0,100)
    self.Map_1=Map_1 self.Map_2=Map_2
    local timer=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.bg),0.01,false)
end
function GameMap:bg()
    self.Map_1:setPositionX(self.Map_1:getPositionX()-2)
    self.Map_2:setPositionX(self.Map_2:getPositionX()-2)
    if self.Map_1:getPositionX()==-display.width then
        self.Map_1:setPositionX(0)
        self.Map_2:setPositionX(self.Map_2:getContentSize().width)
    end
end
return GameMap

