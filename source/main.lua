import "BitEngine/main"
import "BitEngine/scene"
import "BitEngine/transition"

BitEngine.sceneManager.autoImport("scenes")
BitEngine.transitionManager.autoImport("transitions")

BitEngine.sceneManager.switchScene(Game.scenes.Demo.instance)