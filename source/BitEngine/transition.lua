-- Transition Manager

BitEngine.transitionManager = {}
BitEngine.transitionManager.currentTransition = nil
BitEngine.transitionManager.midTransitionCallback = nil
BitEngine.transitionManager.endTransitionCallback = nil

Game.transitions = {}

function BitEngine.transitionManager.autoImport(path)
    local files = pd.file.listFiles(path)

    for _, v in ipairs(files) do
        local className = v:sub(1, #v - 4)

        pd.file.run(path .. "/" .. v)

        local transitionInstance = Game.transitions[className]()
        Game.transitions[className].instance = transitionInstance
    end
end

function BitEngine.transitionManager.makeTransition(transition, midCallback, endCallback)
    printTable(transition)

    -- Convert "Class" to "Instance"
    if transition.super.className == "Transition" then
        transition = transition.instance
    end

    if BitEngine.transitionManager.currentTransition then
        BitEngine.transitionManager.currentTransition:hide()
    end

    BitEngine.transitionManager.currentTransition = transition
    BitEngine.transitionManager.midTransitionCallback = midCallback
    BitEngine.transitionManager.endTransitionCallback = endCallback

    transition:show()
end

function BitEngine.transitionManager.midTransition()
    if BitEngine.transitionManager.midTransitionCallback then
        BitEngine.transitionManager.midTransitionCallback()
        BitEngine.transitionManager.midTransitionCallback = nil
    end
end

function BitEngine.transitionManager.endTransition()
    if BitEngine.transitionManager.currentTransition then
        BitEngine.transitionManager.currentTransition:hide()
        BitEngine.transitionManager.currentTransition = nil

        if BitEngine.transitionManager.endTransitionCallback then
            BitEngine.transitionManager.endTransitionCallback()
            BitEngine.transitionManager.endTransitionCallback = nil
        end
    end
end

-- Transition Class

class("Transition", {}, BitEngine).extends()

function BitEngine.Transition:init()

end

function BitEngine.Transition:show()

end

function BitEngine.Transition:hide()

end

function BitEngine.Transition:update()

end

function BitEngine.Transition:drawBackground(x, y, width, height)

end