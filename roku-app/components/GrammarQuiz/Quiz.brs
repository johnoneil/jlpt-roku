

sub init()

    m.name = m.top.findNode("Name")
    m.example = m.top.findNode("Example")
    m.meaning = m.top.findNode("Meaning")
    m.questionNumber = -1

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

    getDatabase()

    m.examples = generateRandomAnswerSet(m.dictionary.Count(), m.dictionary.Count())

    nextQuestion()

end sub

sub getDatabase()
    m.dictionary = N4Grammar_database()
end sub

sub nextQuestion()
    m.questionNumber += 1
    if m.questionNumber >= m.dictionary.Count()
        m.top.closed = true
    else
        m.showing_answer = false
        word = m.dictionary[m.examples[m.questionNumber]]
        m.example.visible = false
        m.meaning.visible = false
        m.name.uri = word.phrase_image_path
        m.example.uri = word.image_path
        m.meaning.text = word.meaning
    end if
end sub

sub showAnswer()
    m.showing_answer = true
    m.example.visible = true
    m.meaning.visible = true
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
  
    if press
      if key = "OK"
        handled = true
        if m.showing_answer = false
            showAnswer()
        else
            nextQuestion()
        end if
      end if
    end if
  
    return handled
end function