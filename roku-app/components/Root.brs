

sub init()
    ? "sub init() Root"
    m.sceneManager = m.top.findNode("sceneManager")
    m.sceneManager.callFunc("push", "SelectionScreen")
end sub