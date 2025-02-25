

sub init()
    m.currentButton = "cancel"
    m.exitButton = m.top.findNode("exitButton")
    m.exitButtonLabel = m.top.findNode("exitButtonLabel")
    m.cancelButton = m.top.findNode("cancelButton")
    m.cancelButtonLabel = m.top.findNode("cancelButtonLabel")

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

    updateDisplay()

end sub

sub updateDisplay()
    m.exitButton.color = "0xafafaf"
    m.exitButtonLabel.color = "0x5b5b5b"
    m.cancelButton.color = "0xafafaf"
    m.cancelButtonLabel.color = "0x5b5b5b"
    if m.currentButton = "exit"
        m.exitButton.color = "0xffffff"
        m.exitButtonLabel.color = "0x000000"
    else
        m.cancelButton.color = "0xffffff"
        m.cancelButtonLabel.color = "0x000000"
    end if
end sub


function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        if (key = "right") then
            m.currentButton = "cancel"
            handled = true
        else if (key = "left") then
            m.currentButton = "exit"
            handled = true
        else if (key = "OK") then
            if m.currentButton = "exit"
                m.sceneManager.appExit = true
            else
                m.top.closed = true
            end if
        end if
    end if

    if handled = true
        updateDisplay()
    end if

    return handled
end function

