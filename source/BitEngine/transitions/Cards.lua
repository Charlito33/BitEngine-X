class("Cards", {}, BitEngine.transitions).extends(BitEngine.Transition)

local size <const> = 40
local delay <const> = 2
local x_speed <const> = 12
local y_speed <const> = 10

local x_count <const> = 400 / size
local y_count <const> = 240 / size
local count <const> = x_count * y_count
local half_size <const> = size / 2

local function f(x, y)
    return y + ((x - 1) * y_count)
end

local function createSprites()
    local sprites = {}
    local img = gfx.image.new(size, size)

    for _ = 1, count do
        table.insert(sprites, gfx.sprite.new(img))
    end

    return sprites
end

local function updateSpritesImages(sprites)
    local screenImg = playdate.graphics.getDisplayImage()

    for x = 1, x_count do
        for y = 1, y_count do
            local img = gfx.image.new(size, size)

            gfx.pushContext(img)
                gfx.setImageDrawMode(gfx.kDrawModeCopy)
                screenImg:draw(-size * (x - 1), -size * (y - 1))
            gfx.popContext()

            sprites[f(x, y)]:setImage(img)
            sprites[f(x, y)].be = {t = 0}

            if y % 3 == 0 then
                coroutine.yield() -- FPS Boost
            end
        end
    end
end

function BitEngine.transitions.Cards:init()
    self.sprites = createSprites()
end

function BitEngine.transitions.Cards:show()
    self.needUpdate = true

    for x = 1, x_count do
        for y = 1, y_count do
            local sprite = self.sprites[f(x, y)]

            sprite:moveTo(half_size + (x - 1) * size, half_size + (y - 1) * size)
            sprite:add()
        end
    end

    self.currentSprite = 1

    BitEngine.transitionManager.midTransition()
end

function BitEngine.transitions.Cards:hide()
    for _, v in ipairs(self.sprites) do
        v:remove()
    end
end

function BitEngine.transitions.Cards:update()
    if self.needUpdate then
        updateSpritesImages(self.sprites)
        self.needUpdate = false
    end

    if self.currentSprite > 0 then
        self.sprites[self.currentSprite].be.t += 1
        if self.sprites[self.currentSprite].be.t == delay then
            self.currentSprite += 1
            if self.currentSprite > count then
                self.currentSprite = -1
            end
        end
    end

    for i, v in ipairs(self.sprites) do
        if v.be.t == delay then
            v:moveBy(x_speed, y_speed)
        end
    end

    if self.sprites[count].y >= 400 + half_size then
        BitEngine.transitionManager.endTransition()
    end
end

function BitEngine.transitions.Tear:drawBackground(x, y, width, height)

end

BitEngine.transitions.Cards.instance = BitEngine.transitions.Cards()