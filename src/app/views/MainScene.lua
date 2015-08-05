--local Game=import(".Game")
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    display.newSprite("helloBG.png")
        :move(display.center)
        :addTo(self)
    local start_btn=cc.MenuItemImage:create("start_n.png","start_s.png")
    :onClicked(function()
        self:getApp():enterScene("Game")
    end)
    start_btn:setScale(0.5)
    cc.Menu:create(start_btn)
    :move(display.cx,display.cy-100)
    :addTo(self)
    --music
    local music=AudioEngine.preloadMusic("background.ogg")
    AudioEngine.playMusic(music)
end
return MainScene