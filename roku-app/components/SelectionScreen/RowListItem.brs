sub init()
    m.itemposter = m.top.findNode("bg") 
    m.itemlabel = m.top.findNode("label")
    m.contents = m.top.findNode("contents")
  end sub

  sub showContent()
    itemContent = m.top.itemContent
    m.itemposter.uri = itemContent.HDPosterUrl
    m.itemlabel.text = itemContent.title
  end sub

  ' sub showFocus()
  '   m.contents.opacity = 0.25 + (m.top.focusPercent * 0.75)
  ' end sub

  sub showRowFocus()
    m.contents.opacity = 0.25 + (m.top.rowFocusPercent * 0.75)
  end sub
