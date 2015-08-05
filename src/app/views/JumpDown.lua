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
end
function JumpDown:jump()
    local jump=cc.MenuItemImage:create("lightBtn.png","norBtn.png")
    cc.Menu:create(jump)
    :move(600,20)
    :addTo(self)
    jump:onClicked(function()
        self.Man.man:runAction(cc.JumpTo:create(0.5,cc.p(60,60),120,1))
    end)
end
function JumpDown:down()
    local down=cc.MenuItemImage:create("lightBtn.png","norBtn.png")
    cc.Menu:create(down)
    :move(20,20)
    :addTo(self)
end
return JumpDown