

sub init()

    m.MapPoster = m.top.findNode("MapPoster")
    m.Sprite = m.top.findNode("Sprite")
    m.Flag = m.top.findNode("FLAG")

    m.name = m.top.findNode("NAME")
    m.capital = m.top.findNode("CAPITAL")
    m.selections = m.top.findNode("SELECTIONS")

    m.selections.ObserveField("itemFocused", "onCountryFocus")

    getDatabase()

    countrySelections = createObject("RoSGNode","ContentNode")
    for index = 0 to m.stateData.Count() - 1
        childSelection = countrySelections.createChild("ContentNode")
        childSelection.title = m.stateData[index].name
    end for
    m.selections.content = countrySelections

    populate(0)

end sub

sub getDatabase()
    m.stateData = europe_database()
end sub

sub setFlag(index as integer)
    m.Flag.uri = m.stateData[index].flag_url
end sub


sub setAtlasImage(index as integer)
    ' And the highlighted country state (a clipped section of an atlas)
    ' placed at the correct offset, noting the 'Sprite' element is a child 
    ' of the 'MapPoster` element.
    a = m.stateData[index].atlas
    m.Sprite.uri = a
    ' the offset of the sprit against its parent (i.e. the position of the country/state)
    bb = m.stateData[index].bb
    
    ' the offset/size in the atlas for the correct state image.
    altas_rect = m.stateData[index].atlas_rect

    x = altas_rect.x
    y = altas_rect.y
    w = altas_rect.width
    h = altas_rect.height
    m.Sprite.width = altas_rect.atlas_width.ToStr()
    m.Sprite.height = altas_rect.atlas_height.ToStr()
    map_offset_x = bb[0] - x
    map_offset_y = bb[1] - y
    m.Sprite.translation = Substitute("[{0}, {1}]", map_offset_x.ToStr(), map_offset_y.ToStr())
    m.Sprite.clippingRect = Substitute("[{0}, {1}, {2}, {3}]", x.ToStr(), y.ToStr(), w.ToStr(), h.ToStr())
end sub

sub onCountryFocus()
    index = m.selections.itemFocused
    populate(index)
end sub

sub populate(index as integer)

    ' country = m.stateData[index]
    ' txt = Substitute("{0}&#xA;Capital: {1}", m.stateData[index].name, m.stateData[index].capital)
    ' txt = "first line" + chr(10) + "second line"
    ' m.description.text = txt
    m.name.text = m.stateData[index].name
    m.capital.text = Substitute("Capital: {0}", m.stateData[index].capital)
    m.MapPoster.uri = m.stateData[index].map_url
    setAtlasImage(index)
    setFlag(index)

end sub