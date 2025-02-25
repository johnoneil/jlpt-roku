sub init()
    ? "fun init() ScreenController"

    ' Initialize the screen stack and find the "screens" node in the XML
    m.screenStack = []
    m.screens = m.top.findNode("screens")

    ' Initialize the first screen (HomeScreen)
    'initScreen()
end sub

sub initScreen()
    ' Create a child screen (HomeScreen) and add it to the screen stack
    'screen = m.screens.createChild("SelectionScreen")
    'push("SelectionScreen")
end sub

sub push(name as string)
    ? "sub push() SceneManager"
    ' Hide the current screen (if any) and observe its "close" field
    current = m.screenStack.peek()
    if current <> invalid then
        current.visible = false
    end if
    ' screen = m.top.createChild(name)
    screen = m.screens.createChild(name)
    screen.observeField("closed", "onScreenClosed")

    ' Add the new screen to the screen stack, make it visible, and set focus
    m.screenStack.push(screen)
    screen.visible = true
    screen.setFocus(true)
end sub

sub onScreenClosed()
    screen = m.screenStack.pop()
    if screen <> invalid then
        ' Remove the screen from the parent node
        m.screens.removeChild(screen)
        ' Get the new current screen
        screen = m.screenStack.peek()
        if screen <> invalid then
            ' Show the new current screen and set focus
            screen.visible = true
            screen.setFocus(true)
        else
            ' screen is empty, handle this acc to your need
        end if
    end if
    ' If we only have the root screen hanging around we can exit entirely
    ' if m.screenStack.Count() = 1
    '     m.screenStack.pop()
    ' end if
end sub

function pop() as boolean
    ? "sub pop() SceneManager"
    ' Pop the current screen from the stack
    screen = m.screenStack.pop()
    if screen <> invalid then
        ' Remove the screen from the parent node
        m.screens.removeChild(screen)
        ' Get the new current screen
        screen = m.screenStack.peek()
        if screen <> invalid then
            ' Show the new current screen and set focus
            screen.visible = true
            screen.setFocus(true)
            return true
        else
            ' screen is empty, handle this acc to your need
        end if
    end if
    return false
end function



' handle back key event to exit app
function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        if key = "back" then
            if not pop() then
               return false
            else
                return true
            end if
        end if
    end if
    return false
end function