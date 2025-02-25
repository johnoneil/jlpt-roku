sub init()
    ? "fun init() SimpleButton"

    m.label = m.top.findNode("label")

    m.label.color = "0x000000"

    ' There's a significant flaw in the Roku runtime, in that children can't size themselves to
    ' parent data, as parents haven't been initialized yet.
    ' thus we need to listen for when the root note gets its height/width assigned,
    ' and resize our label accordingly.
    m.top.ObserveField("width", "onWidthChanged")
    m.top.ObserveField("height", "onHeightChanged")

end sub

sub onWidthChanged()
    m.label.width = m.top.width
end sub

sub onHeightChanged()
    m.label.height = m.top.height
end sub



function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        if (key = "OK") then
            m.top.buttonSelected = 1
            handled = true
        end if
    end if
    return handled
end function
