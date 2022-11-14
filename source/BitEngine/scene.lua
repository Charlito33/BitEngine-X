-- Scenes Manager

BitEngine.sceneManager = {}

Game.scenes = {}

function BitEngine.sceneManager.autoImport(path)
    local files = pd.file.listFiles(path)

    for i, v in ipairs(files) do
        local classname = v:sub(1, #v - 4)

        pd.file.run(path .. "/" .. v)

        local sceneInstance = Game.scenes[classname]()
        Game.scenes[classname].instance = sceneInstance
    end
end

class("Scene", {}, BitEngine).extends()

function BitEngine.Scene:init()

end

function BitEngine.Scene:show()

end

function BitEngine.Scene:hide()

end