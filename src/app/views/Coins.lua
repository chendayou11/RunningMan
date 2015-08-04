--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/8/4
-- Time: 15:25
-- To change this template use File | Settings | File Templates.
--
local Coins=class(cc.Layer)
function Coins:ctor()
    local coinFrame=cc.SpriteFrameCache:getInstance()
    coinFrame:addSpriteFrame("")
end
return Coins

