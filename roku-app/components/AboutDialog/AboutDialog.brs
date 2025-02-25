

sub init()
    m.currentButton = "cancel"
    m.okButton = m.top.findNode("okButton")
    m.okButtonLabel = m.top.findNode("okButtonLabel")

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        if (key = "OK") then
            m.top.closed = true
        end if
    end if

    return handled
end function

