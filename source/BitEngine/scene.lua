-- Scenes Manager

BitEngine.sceneManager = {}
BitEngine.sceneManager.currentScene = nil

Game.scenes = {}

function BitEngine.sceneManager.autoImport(path)
    local files = pd.file.listFiles(path)

    for _, v in ipairs(files) do
        local className = v:sub(1, #v - 4)

        pd.file.run(path .. "/" .. v)

        local sceneInstance = Game.scenes[className]()
        Game.scenes[className].instance = sceneInstance
    end
end

function BitEngine.sceneManager.switchScene(newScene, transition)
    -- Convert "Class" to "Instance"
    if newScene.super.className == "Scene" then
        newScene = newScene.instance
    end

    if BitEngine.sceneManager.currentScene then
        BitEngine.sceneManager.currentScene:unregisterInputs()
        BitEngine.sceneManager.currentScene:hide()
    end

    local midCallback = function ()
        BitEngine.sceneManager.currentScene = newScene

        newScene:show()

        gfx.sprite.redrawBackground()
    end

    local endCallback = function ()
        BitEngine.sceneManager.currentScene:registerInputs()
    end

    if transition then
        BitEngine.transitionManager.makeTransition(transition, midCallback, endCallback)
    else
        -- Don't do any transition, call directly callback
        midCallback()
        endCallback()
    end
end

-- Scene Class

class("Scene", {}, BitEngine).extends()

function BitEngine.Scene:init()
    self.inputHandler = {
        AButtonDown = function() self:AButtonDown() end,
        AButtonHeld = function() self:AButtonHeld() end,
        AButtonUp = function() self:AButtonUp() end,
        BButtonDown = function() self:BButtonDown() end,
        BButtonHeld = function() self:BButtonHeld() end,
        BButtonUp = function() self:BButtonUp() end,
        downButtonDown = function() self:downButtonDown() end,
        downButtonUp = function() self:downButtonUp() end,
        leftButtonDown = function() self:leftButtonDown() end,
        leftButtonUp = function() self:leftButtonUp() end,
        rightButtonDown = function() self:rightButtonDown() end,
        rightButtonUp = function() self:rightButtonUp() end,
        upButtonDown = function() self:upButtonDown() end,
        upButtonUp = function() self:upButtonUp() end,
        cranked = function (change, acceleratedChange) self:cranked(change, acceleratedChange) end
    }
end

function BitEngine.Scene:registerInputs()
    pd.inputHandlers.push(self.inputHandler)
end

function BitEngine.Scene:unregisterInputs()
    pd.inputHandlers.pop()
end

function BitEngine.Scene:show()
    
end

function BitEngine.Scene:hide()
    
end

function BitEngine.Scene:update()

end

function BitEngine.Scene:drawBackground(x, y, width, height)

end

function BitEngine.Scene:AButtonDown()
    
end

function BitEngine.Scene:AButtonHeld()

end

function BitEngine.Scene:AButtonUp()

end

function BitEngine.Scene:BButtonDown()

end

function BitEngine.Scene:BButtonHeld()

end

function BitEngine.Scene:BButtonUp()

end

function BitEngine.Scene:downButtonDown()

end

function BitEngine.Scene:downButtonUp()

end

function BitEngine.Scene:leftButtonDown()

end

function BitEngine.Scene:leftButtonUp()

end

function BitEngine.Scene:rightButtonDown()

end

function BitEngine.Scene:rightButtonUp()

end

function BitEngine.Scene:upButtonDown()

end

function BitEngine.Scene:upButtonUp()

end

function BitEngine.Scene:cranked(change, acceleratedChange)

end
