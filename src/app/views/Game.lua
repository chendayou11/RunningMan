--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/2
-- Time: 11:40
-- To change this template use File | Settings | File Templates.
--
local Game=class("Game",cc.load("mvc").ViewBase)
local GameMap=import(".GameMap")
local Man=import(".Man")
local Jumpdown=import(".JumpDown")
local enemy=import(".enemy")
local shuxing=import(".ShuXing")
function Game:onCreate()
    self.GameMap=GameMap:create()
    self:addChild(self.GameMap)
    self.shuxing=shuxing:create()
    self:addChild(self.shuxing)
    self.Man=Man:create(self.shuxing)
    self:addChild(self.Man)
    self.enemy=enemy:create(self.Man,self.shuxing)
    self:addChild(self.enemy)
    self.jumpdown=Jumpdown:create(self.Man)
    self:addChild(self.jumpdown)
end
return Game

