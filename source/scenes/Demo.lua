class("Demo", {}, Game.scenes).extends(BitEngine.Scene)

function Game.scenes.Demo:init()
    Game.scenes.Demo.super.init(self)
end

function Game.scenes.Demo:update()
    
end

function Game.scenes.Demo:show()
    Game.scenes.Demo.super.show(self)
    print("Show Demo Scene #1")
end

function Game.scenes.Demo:drawBackground(x, y, width, height)
    gfx.drawText("Demo Scene #1", 50, 50)
end

function Game.scenes.Demo:AButtonDown()
    print("A Button Pressed in Demo Scene #1 !")
    BitEngine.sceneManager.switchScene(Game.scenes.Demo2, Game.transitions.Demo)
end