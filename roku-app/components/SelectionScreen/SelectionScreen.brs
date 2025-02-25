
  function init()
    ? "sub init() SelectionScreen"

    m.rowlist = m.top.findNode("selectionRowList")
    m.selectedLabel = m.top.findNode("selectedLabel")
    m.selectedDesc = m.top.findNode("selectedDesc")
    m.selectedDiff = m.top.findNode("selectedDiff")
    m.aboutButton = m.top.findNode("aboutButton")

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

    m.rowlist.content = CreateObject("roSGNode", "RowListContent")
    m.rowlist.ObserveField("itemSelected", "onItemSelected")
    m.rowlist.ObserveField("rowItemSelected", "onRowItemSelected")
    m.rowlist.ObserveField("rowItemFocused", "onRowItemFocus")
    m.aboutButton.ObserveField("buttonSelected", "onAboutButton")
    m.aboutButton.ObserveField("focusedChild", "onAboutButtonFocus")

    m.top.ObserveField("visible", "onVisible")

  end function

  ' this works but is EXTREMELY fragile
  ' depends on setting the visible listener above.
  sub onVisible()
    m.rowlist.setFocus(true)

  end sub

  sub onRowItemSelected()
    ? "sub onRowItemSelected() SelectionScreen"
    selection = m.rowlist.rowItemSelected

    ' When the user selects an item, we read the component name from rowlist metadata
    ' and then have the scene manager load that component.
    ' To expand this, make sure the `component` name in rowlist metadata (rowlistcontent)
    ' correctly points to a component folder.
    component = m.rowlist.content.getChild(selection[0]).getChild(selection[1]).component
    m.sceneManager.callFunc("push", component)

  end sub

  sub onRowItemFocus()
    focus = m.rowlist.rowItemFocused
    focusedContent = m.rowlist.content.getChild(focus[0]).getChild(focus[1])

    If focusedContent <> invalid
      m.selectedLabel.text = focusedContent.title
      m.selectedDesc.text = focusedContent.description
      m.selectedDiff.text = Substitute("Difficulty: {0}", focusedContent.difficulty)
      if focusedContent.difficulty = "medium"
        m.selectedDiff.color = "0xffff00"
      else if focusedContent.difficulty = "hard"
        m.selectedDiff.color = "0xff0000"
      else
        m.selectedDiff.color = "0x00ff00"
      end if
		End If

  end sub

  sub onAboutButton()
    m.sceneManager.callFunc("push", "AboutDialog")
  end sub

  sub onAboutButtonFocus()
    if m.aboutButton.hasFocus()
      m.aboutButton.color = "0xffffff"
    else
      m.aboutButton.color = "0x888888"
    end if
  end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false

  if press
    if key = "up" and m.rowlist.hasFocus() and m.rowlist.itemFocused = 0
      m.aboutButton.setFocus(true)
      handled = true
    else if key = "down" and m.aboutButton.hasFocus()
      m.rowlist.setFocus(true)
      handled = true
    else if key = "back"
      m.sceneManager.callFunc("push", "ExitDialog")
      handled = true
    end if
  end if

  return handled
end function
