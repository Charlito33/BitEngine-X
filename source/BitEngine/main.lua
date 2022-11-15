import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

_G['pd'] = playdate
_G['gfx'] = pd.graphics

_G['BitEngine'] = {}
_G['Game'] = {}

function playdate.update()
    if BitEngine.transitionManager then
        if BitEngine.transitionManager.currentTransition then
            BitEngine.transitionManager.currentTransition:update()
        end
    end
    if BitEngine.sceneManager then
        if BitEngine.sceneManager.currentScene then
            BitEngine.sceneManager.currentScene:update()
        end
    end

    gfx.sprite.update()
    pd.timer.updateTimers()
end

gfx.sprite.setBackgroundDrawingCallback(function(x, y, width, height)
    if BitEngine.transitionManager then
        if BitEngine.transitionManager.currentTransition then
            BitEngine.transitionManager.currentTransition:drawBackground(x, y, width, height)
        end
    end
    if BitEngine.sceneManager then
        if BitEngine.sceneManager.currentScene then
            BitEngine.sceneManager.currentScene:drawBackground(x, y, width, height)
        end
    end
end)