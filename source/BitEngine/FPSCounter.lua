class("FPSCounter", {}, BitEngine).extends(gfx.sprite)

function BitEngine.FPSCounter:init()
    BitEngine.FPSCounter.super.init(self)

    self:setSize(32, 24)
end

function BitEngine.FPSCounter:update()
    self:markDirty()
end

function BitEngine.FPSCounter:draw(x, y, width, height)
    pd.drawFPS(0, 0)
end