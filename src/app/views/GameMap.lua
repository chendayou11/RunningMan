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
    --self:addChild(Map_1,0,100)
    local Map_2=cc.TMXTiledMap:create("map01.tmx")
    Map_2:setPositionX(Map_1:getMapSize().width*Map_1:getTileSize().width-50-display.width/2)
    print(Map_1:getMapSize().width)
    self:addChild(Map_2,0,100)
    self.Map_1=Map_1
    self.Map_2=Map_2
    --local timer=cc.Director:getInstance():getScheduler():scheduleScriptFunc(handler(self,self.bg),1,false)
end
function GameMap:bg()
    self.Map_1:setPositionX(self.Map_1:getMapSize().width-0.5)
    self.Map_2:setPositionX(self.Map_1:getMapSize().width+display.width-0.5)
    print("fasljf;asjf;lsd")
    if self.Map_1:getPositionX()==-self.Map_1:getMapSize().width then
        print("123123")
        self.Map_1:setPositionX(0)
    end
end
return GameMap

