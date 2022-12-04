class("CrankIndicator", {}, BitEngine).extends(gfx.sprite)

local imageTable <const> = gfx.imagetable.new("BitEngine/images/crankindicator")

BitEngine.CrankIndicator.CLOCKWISE = 1
BitEngine.CrankIndicator.COUNTER_CLOCKWISE = -1

function BitEngine.CrankIndicator:init()
    BitEngine.CrankIndicator.super.init(self)

    self:setSize(83, 48)
    self:moveTo(353, 211)

    self.frame = 1
    self.dir = 1
    self.showIntro = true

    local timer = pd.timer.new(1000, function ()
        self.showIntro = not self.showIntro
    end)
    timer.repeats = true
end

function BitEngine.CrankIndicator:update()
    if not self.showIntro then
        self.frame += self.dir

        if self.frame < 1 then
            self.frame = 35
        end
        if self.frame > 35 then
            self.frame = 1
        end
    end
    
    self:markDirty()
end

function BitEngine.CrankIndicator:draw(x, y, width, height)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    if self.showIntro then
        imageTable:getImage(1):draw(0, 0)
    else
        imageTable:getImage(1 + self.frame):draw(0, 0)
    end
end

function BitEngine.CrankIndicator:setDirection(value)
    self.dir = value
    self:markDirty()
end
