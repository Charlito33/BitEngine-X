import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

_G['pd'] = playdate
_G['gfx'] = pd.graphics

_G['BitEngine'] = {}
_G['Game'] = {}

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end