import "BitEngine/main"
import "BitEngine/scene"
import "BitEngine/transition"
import "BitEngine/transitions/Tear"
import "BitEngine/transitions/Cards"
import "BitEngine/FPSCounter"

pd.display.setRefreshRate(50)

BitEngine.sceneManager.autoImport("scenes")
BitEngine.transitionManager.autoImport("transitions")

local fpsCounter = BitEngine.FPSCounter()
fpsCounter:add()

BitEngine.sceneManager.switchScene(Game.scenes.Demo.instance)