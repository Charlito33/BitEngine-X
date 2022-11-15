class("Demo", {}, Game.transitions).extends(BitEngine.Transition)

local function newRect(width, height)
    local img = gfx.image.new(width, height)

    gfx.pushContext(img)
        gfx.setColor(gfx.kColorBlack)
        gfx.fillRect(0, 0, width, height)
    gfx.popContext()

    return gfx.sprite.new(img)
end

function Game.transitions.Demo:init()
    self.rectangle1 = newRect(400, 120)
    self.rectangle2 = newRect(400, 120)
end

function Game.transitions.Demo:show()
    self.rectangle1:moveTo(-200, 60)
    self.rectangle2:moveTo(600, 180)

    self.rectangle1:add()
    self.rectangle2:add()
end

function Game.transitions.Demo:hide()
    self.rectangle1:remove()
    self.rectangle2:remove()
end

function Game.transitions.Demo:update()
    self.rectangle1:moveBy(40, 0)
    self.rectangle2:moveBy(-40, 0)

    if self.rectangle1.x >= 200 and self.rectangle2.x <= 200 then
        BitEngine.transitionManager.midTransition()
    end
    if self.rectangle1.x >= 600 and self.rectangle2.x <= -200 then
        BitEngine.transitionManager.endTransition()
    end
end

function Game.transitions.Demo:drawBackground(x, y, width, height)

end