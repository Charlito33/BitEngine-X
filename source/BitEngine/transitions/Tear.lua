class("Tear", {}, BitEngine.transitions).extends(BitEngine.Transition)

local width <const> = 10
local speed <const> = 8

local count <const> = 400 / width

local function createSprites()
    local sprites = {}
    local img = gfx.image.new(width, 240)

    for _ = 1, count do
        table.insert(sprites, gfx.sprite.new(img))
    end

    return sprites
end

local function updateSpritesImages(sprites)
    local screenImg = playdate.graphics.getDisplayImage()

    for i, v in ipairs(sprites) do
        local img = gfx.image.new(width, 240)

        gfx.pushContext(img)
            gfx.setImageDrawMode(gfx.kDrawModeCopy)
            screenImg:draw(-width * (i - 1), 0)
        gfx.popContext()

        v:setImage(img)
    end
end

local function f(x)
    if x % 2 == 0 then
        return speed
    else
        return -speed
    end
end

function BitEngine.transitions.Tear:init()
    self.sprites = createSprites()
end

function BitEngine.transitions.Tear:show()
    updateSpritesImages(self.sprites)

    for i, v in ipairs(self.sprites) do
        v:moveTo((width / 2) + width * (i - 1), 120)
        v:add()
    end

    BitEngine.transitionManager.midTransition()
end

function BitEngine.transitions.Tear:hide()
    for _, v in ipairs(self.sprites) do
        v:remove()
    end
end

function BitEngine.transitions.Tear:update()
    for i, v in ipairs(self.sprites) do
        v:moveBy(0, f(i))
    end

    if self.sprites[1].y < -200 then
        BitEngine.transitionManager.endTransition()
    end

    -- TODO : End Animation

    --[[
    self.rectangle1:moveBy(40, 0)
    self.rectangle2:moveBy(-40, 0)

    if self.rectangle1.x >= 200 and self.rectangle2.x <= 200 then
        BitEngine.transitionManager.midTransition()
    end
    if self.rectangle1.x >= 600 and self.rectangle2.x <= -200 then
        BitEngine.transitionManager.endTransition()
    end
    ]]--
end

function BitEngine.transitions.Tear:drawBackground(x, y, width, height)

end