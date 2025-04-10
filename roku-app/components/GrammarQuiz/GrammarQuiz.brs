

sub init()

    m.name = m.top.findNode("Name")
    m.prompt = m.top.findNode("Prompt")
    m.example = m.top.findNode("Example")
    m.meaning = m.top.findNode("Meaning")
    m.form = m.top.findNode("Form")
    m.notes = m.top.findNode("Notes")
    m.questionNumber = -1

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

    ' getDatabase()

    m.examples = generateRandomAnswerSet(m.dictionary.Count(), m.dictionary.Count())

    nextQuestion()

end sub

' sub getDatabase()
'     m.dictionary = N4Grammar_Chapter1_database()
' end sub

sub nextQuestion()
    m.questionNumber += 1
    if m.questionNumber >= m.dictionary.Count()
        m.top.closed = true
    else
        m.showing_answer = false
        word = m.dictionary[m.examples[m.questionNumber]]
        m.example.visible = false
        m.meaning.visible = false
        m.form.visible = false
        m.notes.visible = false
        m.name.uri = word.phrase_image_path
        m.prompt.uri = word.prompt_image_path
        m.example.uri = word.image_path
        m.meaning.text = word.meaning
        m.form.uri = word.form_image_path
        m.notes.text = word.notes
    end if
end sub

sub showAnswer()
    m.showing_answer = true
    m.example.visible = true
    m.meaning.visible = true
    m.form.visible = true
    m.notes.visible = true
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