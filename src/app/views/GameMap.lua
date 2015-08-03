--
-- Created by IntelliJ IDEA.
-- User: chend
-- Date: 2015/8/2
-- Time: 11:37
-- To change this template use File | Settings | File Templates.
--
local _tileMap
local GameMap=class("GameMap",cc.Layer)
function GameMap:ctor()
    local _tileMap=cc.TMXTiledMap:create("map00.tmx")
    self:addChild(_tileMap,0,100)
    local frameCache=cc.SpriteFrameCache:getInstance()
    frameCache:addSpriteFrames("parkour.plist")
    local man=cc.Sprite:createWithSpriteFrameName("runner0.png")
    man:setAnchorPoint(0,0)
    self:addChild(man)
end
return GameMap

