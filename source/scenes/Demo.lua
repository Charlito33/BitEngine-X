class("Demo", {}, Game.scenes).extends(BitEngine.Scene)

function Game.scenes.Demo:init()
    Game.scenes.Demo.super.init(self)

    self.crankIndicator = BitEngine.CrankIndicator()
end

function Game.scenes.Demo:update()
    
end

function Game.scenes.Demo:show()
    print("Show Demo Scene #1")

    self.crankIndicator:add()
end

function Game.scenes.Demo:remove()
    self.crankIndicator:remove()
end

function Game.scenes.Demo:drawBackground(x, y, width, height)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawText("Demo Scene #1", 50, 50)
end

function Game.scenes.Demo:AButtonDown()
    print("A Button Pressed in Demo Scene #1 !")
    BitEngine.sceneManager.switchScene(Game.scenes.Demo2, BitEngine.transitions.Cards)
end

function Game.scenes.Demo:BButtonDown()
    self.crankIndicator:setDirection(BitEngine.CrankIndicator.COUNTER_CLOCKWISE)
end