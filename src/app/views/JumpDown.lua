--
-- Created by IntelliJ IDEA.
-- User: lenovo010
-- Date: 2015/8/5
-- Time: 14:46
-- To change this template use File | Settings | File Templates.
--
local JumpDown=class("JumpDown",cc.Layer)
function JumpDown:ctor(Man)
    self.Man=Man
    self:jump()
    self:down()
    self:GameExit()
end
function JumpDown:jump()
    local jump=cc.MenuItemImage:create("button_u.png","button_d.png")
    cc.Menu:create(jump)
    :move(600,20)
    :addTo(self)
    jump:onClicked(function()
        self.Man.man:runAction(cc.JumpTo:create(0.75,cc.p(60,66),120,1))
    end)
end
function JumpDown:down()
    local down=cc.MenuItemImage:create("lightBtn.png","norBtn.png")
    cc.Menu:create(down)
    :move(20,20)
    :addTo(self)
end
function JumpDown:GameExit()
    local exit= cc.MenuItemImage:create("lightBtn.png","norBtn.png")
    :onClicked(function()
        -- secene switch
        local scene = cc.Scene:create()
        local layer=cc.Layer:create()
        local label=cc.LabelTTF:create("GAME VOER","Arial",60)
        label:setPosition(display.cx,display.cy)
        layer:addChild(label)
        scene:addChild(layer)
        cc.Director:getInstance():pushScene( cc.TransitionSlideInT:create(1, scene))
    end)
    cc.Menu:create(exit)
    :move(620,300)
    :addTo(self)
end
return JumpDown