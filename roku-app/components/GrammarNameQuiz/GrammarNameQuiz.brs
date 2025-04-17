

sub init()

    m.word = m.top.findNode("Word")
    ' m.furigana = m.top.findNode("Furigana")
    m.meaning = m.top.findNode("Meaning")
    m.meaning.font.size = 60

    m.example0 = m.top.findNode("Example0")
    m.example1 = m.top.findNode("Example1")
    m.example2 = m.top.findNode("Example2")
    m.example3 = m.top.findNode("Example3")
    m.example4 = m.top.findNode("Example4")
    
    m.exampleEnglish0 = m.top.findNode("ExampleEnglish0")
    m.exampleEnglish1 = m.top.findNode("ExampleEnglish1")
    m.exampleEnglish2 = m.top.findNode("ExampleEnglish2")
    m.exampleEnglish3 = m.top.findNode("ExampleEnglish3")
    m.exampleEnglish4 = m.top.findNode("ExampleEnglish4")

    m.questionNumber = -1

    root = m.top.getScene()
    m.sceneManager = root.findNode("sceneManager")

    getDatabase()

    m.words = generateRandomAnswerSet(m.dictionary.Count(), m.dictionary.Count())

    nextQuestion()

end sub

sub getDatabase()
    m.dictionary = N3Grammar_Section1_database()
end sub

sub nextQuestion()
    m.questionNumber += 1
    if m.questionNumber >= m.dictionary.Count()
        m.top.closed = true
    else
        m.showing_answer = false
        word = m.dictionary[m.words[m.questionNumber]]
        ' m.furigana.visible = false
        m.meaning.visible = false
        m.example0.visible = false
        m.exampleEnglish0.visible = false
        m.example1.visible = false
        m.exampleEnglish1.visible = false
        m.example2.visible = false
        m.exampleEnglish2.visible = false
        m.example3.visible = false
        m.exampleEnglish3.visible = false
        m.example4.visible = false
        m.exampleEnglish4.visible = false
        m.word.uri = word.image_path
        'm.furigana.uri = word.furigana_image_path

        if word.examples.Count() > 0
            m.example0.uri = word.examples[0].image_path
            m.exampleEnglish0.text = word.examples[0].e
        else
            m.example0.uri = ""
            m.exampleEnglish0.text = ""
        end if

        if word.examples.Count() > 1
            m.example1.uri = word.examples[1].image_path
            m.exampleEnglish1.text = word.examples[1].e
        else
            m.example1.uri = ""
            m.exampleEnglish1.text = ""
        end if

        if word.examples.Count() > 2
            m.example2.uri = word.examples[2].image_path
            m.exampleEnglish2.text = word.examples[2].e
        else
            m.example2.uri = ""
            m.exampleEnglish2.text = ""
        end if

        if word.examples.Count() > 3
            m.example3.uri = word.examples[3].image_path
            m.exampleEnglish3.text = word.examples[3].e
        else
            m.example3.uri = ""
            m.exampleEnglish3.text = ""
        end if

        if word.examples.Count() > 4
            m.example4.uri = word.examples[4].image_path
            m.exampleEnglish4.text = word.examples[4].e
        else
            m.example4.uri = ""
            m.exampleEnglish4.text = ""
        end if
       
        m.meaning.text = word.meaning
    end if
end sub

sub showAnswer()
    m.showing_answer = true
    ' m.furigana.visible = true
    m.meaning.visible = true
    word = m.dictionary[m.words[m.questionNumber]]
    if word.examples.Count() > 0
        m.example0.visible = true
        m.exampleEnglish0.visible = true
    else
        m.example0.visible = false
        m.exampleEnglish0.visible = false

    end if

    if word.examples.Count() > 1
        m.example1.visible = true
        m.exampleEnglish1.visible = true

    else
        m.example1.visible = false
        m.exampleEnglish1.visible = false

    end if

    if word.examples.Count() > 2
        m.example2.visible = true
        m.exampleEnglish2.visible = true

    else
        m.example2.visible = false
        m.exampleEnglish2.visible = false

    end if

    if word.examples.Count() > 3
        m.example3.visible = true
        m.exampleEnglish3.visible = true

    else
        m.example3.visible = false
        m.exampleEnglish3.visible = false

    end if

    if word.examples.Count() > 4
        m.example4.visible = true
        m.exampleEnglish4.visible = true

    else
        m.example4.visible = false
        m.exampleEnglish4.visible = false

    end if
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