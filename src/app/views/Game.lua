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
function Game:onCreate()
    self.GameMap=GameMap:create()
    self:addChild(self.GameMap)
    self.Man=Man:create()
    self:addChild(self.Man)
end
return Game

