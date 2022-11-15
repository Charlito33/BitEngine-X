class("Demo2", {}, Game.scenes).extends(BitEngine.Scene)

function Game.scenes.Demo2:init()
    Game.scenes.Demo2.super.init(self)
end

function Game.scenes.Demo2:update()
    
end

function Game.scenes.Demo2:show()
    Game.scenes.Demo2.super.show(self)
    print("Show Demo Scene #2")
end

function Game.scenes.Demo2:drawBackground(x, y, width, height)
    gfx.drawText("Demo Scene #2", 50, 50)
end

function Game.scenes.Demo2:AButtonDown()
    print("A Button Pressed in Demo Scene #2 !")
    BitEngine.sceneManager.switchScene(Game.scenes.Demo, Game.transitions.Demo)
end