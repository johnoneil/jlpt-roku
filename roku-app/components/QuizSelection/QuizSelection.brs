sub init()
    ? "fun init() QuizSelection"

    m.screens = m.top.findNode("screens")
    m.highlighted = 0
    m.top.buttonSelected = 0

    m.selections = []
    m.selections.push(m.top.findNode("option0"))
    m.selections.push(m.top.findNode("option1"))
    m.selections.push(m.top.findNode("option2"))
    m.selections.push(m.top.findNode("option3"))

    m.labels = []
    m.labels.push(m.top.findNode("label0"))
    m.labels.push(m.top.findNode("label1"))
    m.labels.push(m.top.findNode("label2"))
    m.labels.push(m.top.findNode("label3"))

    m.img = []
    m.img.push(m.top.findNode("img0"))
    m.img.push(m.top.findNode("img1"))
    m.img.push(m.top.findNode("img2"))
    m.img.push(m.top.findNode("img3"))

    m.imgAnim = []
    m.imgAnim.push(m.top.findNode("img0Anim"))
    m.imgAnim.push(m.top.findNode("img1Anim"))
    m.imgAnim.push(m.top.findNode("img2Anim"))
    m.imgAnim.push(m.top.findNode("img3Anim"))

    m.imgAnimScale = []
    m.imgAnimScale.push(m.top.findNode("img0ScaleAnim"))
    m.imgAnimScale.push(m.top.findNode("img1ScaleAnim"))
    m.imgAnimScale.push(m.top.findNode("img2ScaleAnim"))
    m.imgAnimScale.push(m.top.findNode("img3ScaleAnim"))

    updateDisplay()

end sub

sub setLabels(labels as Object)
    m.labels[0].text = labels[0]
    m.labels[1].text = labels[1]
    m.labels[2].text = labels[2]
    m.labels[3].text = labels[3]
    m.highlighted = 0
    m.correct = invalid
    updateDisplay()
end sub

sub setCorrect(correct as Integer)
    m.correct = correct
    m.imgAnimScale[m.top.buttonSelected].control = "start"
end sub

sub updateDisplay()

    if m.correct = invalid
        m.selections[0].color = "0x888888"
        m.selections[1].color = "0x888888"
        m.selections[2].color = "0x888888"
        m.selections[3].color = "0x888888"
    
        m.labels[0].color = "0xffffff"
        m.labels[1].color = "0xffffff"
        m.labels[2].color = "0xffffff"
        m.labels[3].color = "0xffffff"
    
        m.img[0].uri = ""
        m.img[1].uri = ""
        m.img[2].uri = ""
        m.img[3].uri = ""

        m.imgAnim[0].uri = ""
        m.imgAnim[1].uri = ""
        m.imgAnim[2].uri = ""
        m.imgAnim[3].uri = ""

        m.selections[m.highlighted].color = "0xffffff"
        m.labels[m.highlighted].color = "0x000000"

    else if m.highlighted = m.correct
        m.selections[0].color = "0xA9A9A9"
        m.selections[1].color = "0xA9A9A9"
        m.selections[2].color = "0xA9A9A9"
        m.selections[3].color = "0xA9A9A9"
    
        m.labels[0].color = "0xD3D3D3"
        m.labels[1].color = "0xD3D3D3"
        m.labels[2].color = "0xD3D3D3"
        m.labels[3].color = "0xD3D3D3"
    
        m.selections[m.correct].color = "0x90ee90"
        m.labels[m.correct].color = "0x000000"
        m.img[m.correct].uri = "pkg:/images/correct.50x50.png"
        m.imgAnim[m.correct].uri =  "pkg:/images/correct.50x50.png"
    else
        m.selections[0].color = "0xA9A9A9"
        m.selections[1].color = "0xA9A9A9"
        m.selections[2].color = "0xA9A9A9"
        m.selections[3].color = "0xA9A9A9"
    
        m.labels[0].color = "0xD3D3D3"
        m.labels[1].color = "0xD3D3D3"
        m.labels[2].color = "0xD3D3D3"
        m.labels[3].color = "0xD3D3D3"

        m.selections[m.correct].color = "0x00ff00"
        m.selections[m.highlighted].color = "0xffcccb"
    
        m.labels[m.correct].color = "0x000000"
        m.labels[m.highlighted].color = "0x000000"
        m.img[m.highlighted].uri = "pkg:/images/wrong.50x50.png"
        m.imgAnim[m.highlighted].uri = "pkg:/images/wrong.50x50.png"
    end if

end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        if (key = "down") then
            if m.highlighted < 3
                m.highlighted += 1
            end if
            handled = true
        else if (key = "up") then
            if m.highlighted > 0
                m.highlighted -= 1
            end if
            handled = true
        else if (key = "OK") then
            m.top.buttonSelected = m.highlighted
            handled = true
        end if
    end if

    if handled = true
        updateDisplay()
    end if

    return handled
end function
