--local Game=import(".Game")
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
    display.newSprite("helloBG.png")
        :move(display.center)
        :addTo(self)
    local start_btn=cc.MenuItemImage:create("start_n.png","start_s.png")
    :onClicked(function()
        self:getApp():enterScene("Game")
    end)
    --[[local function switchScene(sender)
        local game=Game.create()
        local ts=cc.TransitionCrossFade:create(1.0,game)
        cc.Director:getInstance():pushScene(ts)
    end--]]
    --start_btn:registerScriptTapHandler(switchScene)
    start_btn:setScale(0.5)
    cc.Menu:create(start_btn)
    :move(display.cx,display.cy-100)
    :addTo(self)
    --music
    local music=AudioEngine.preloadMusic("background.ogg")
    AudioEngine.playMusic(music)
end
return MainScene