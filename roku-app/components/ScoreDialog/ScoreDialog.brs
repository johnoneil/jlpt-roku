

sub init()
    m.top.buttonSelected = invalid

    m.currentButton = "exit"
    m.exitButton = m.top.findNode("exitButton")
    m.exitButtonLabel = m.top.findNode("exitButtonLabel")
    m.playAgainButton = m.top.findNode("playAgainButton")
    m.playAgainButtonLabel = m.top.findNode("playAgainButtonLabel")

    m.scoreLabel = m.top.findNode("SCORE-LABEL")
    m.adviceLabel = m.top.findNode("ADVICE-LABEL")
    m.scoreImgExcellent = m.top.findNode("SCORE-IMG-EXCELLENT")
    m.scoreImgGood = m.top.findNode("SCORE-IMG-GOOD")
    m.scoreImgOK = m.top.findNode("SCORE-IMG-OK")
    m.scoreImgFailed = m.top.findNode("SCORE-IMG-Failed")
end sub

sub setScore(total as Integer, correct as Integer)
    m.numQuestions = total
    m.numCorrect = correct

    goodThreshold = Cint(2 * m.numQuestions / 3)
    okThreshold = Cint(m.numQuestions / 3)

    m.scoreImgExcellent.visible = false
    m.scoreImgGood.visible = false
    m.scoreImgOK.visible = false
    m.scoreImgFailed.visible = false

    if m.numCorrect = m.numQuestions
        m.scoreLabel.text = Substitute("You got {0} out of {1} correct, rated PERFECT!", m.numCorrect.ToStr(), m.numQuestions.ToStr())
        m.adviceLabel.text = "There's not much you don't know in this area!"
        m.scoreImgExcellent.visible = true
    else if m.numCorrect >= goodThreshold
        m.scoreLabel.text = Substitute("You got {0} out of {1} correct, rated GOOD!", m.numCorrect.ToStr(), m.numQuestions.ToStr())
        m.adviceLabel.text = "Your persistence is paying off!"
        m.scoreImgGood.visible = true
    else if m.numCorrect >= okThreshold
        m.scoreLabel.text = Substitute("You got {0} out of {1} correct, rated OK.", m.numCorrect.ToStr(), m.numQuestions.ToStr())
        m.adviceLabel.text = "You need to improve your knowledge in this area."
        m.scoreImgOK.visible = true
    else
        m.scoreLabel.text = Substitute("You got {0} out of {1} correct, rated FAILED.", m.numCorrect.ToStr(), m.numQuestions.ToStr())
        m.adviceLabel.text = "Sadly, You still have your work cut out for you."
        m.scoreImgFailed.visible = true
    end if
end sub

sub updateDisplay()
    m.exitButton.color = "0xafafaf"
    m.exitButtonLabel.color = "0x5b5b5b"
    m.playAgainButton.color = "0xafafaf"
    m.playAgainButtonLabel.color = "0x5b5b5b"
    if m.currentButton = "exit"
        m.exitButton.color = "0xffffff"
        m.exitButtonLabel.color = "0x000000"
    else
        m.playAgainButton.color = "0xffffff"
        m.playAgainButtonLabel.color = "0x000000"
    end if
end sub


function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        if (key = "right") then
            m.currentButton = "again"
            handled = true
        else if (key = "left") then
            m.currentButton = "exit"
            handled = true
        else if (key = "OK") then
            m.top.buttonSelected = m.currentButton
            handled = true
        end if
    end if

    if handled = true
        updateDisplay()
    end if

    return handled
end function

