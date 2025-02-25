
sub generateRandomAnswerSet(databaseSize as Integer, numAnswers as Integer) as object
    a = []
    v = {}

    if numAnswers > databaseSize
        return a
    end if

    For x = 0 To numAnswers - 1
        while true
            new_value = Rnd(databaseSize) - 1
            if v.DoesExist(stri(new_value)) then
                continue while
            else
                a.Push(new_value)
                v[stri(new_value)] = "true"
                exit while
            end if
        end while
    End for
    'Shuffle(a)
    return a
end sub



sub generateRandomChoicesExcepting(range as Integer, numSelections as Integer, banned as Integer) as Object

    a = []
    v = {}
    v[stri(banned)] = "true"

    For x = 0 To numSelections - 1
        while true
            new_value = Rnd(range) - 1
            if v.DoesExist(stri(new_value)) then
                continue while
            else
                a.Push(new_value)
                v[stri(new_value)] = "true"
                exit while
            end if
        end while
    End For
    
    return a

end sub

function Shuffle(array as Object) as Void
    for i% = array.count()-1 to 1 step -1
        j% = Rnd(i% + 1) - 1 ' pick random j
        t = array[i%] : array[i%] = array[j%] : array[j%] = t  ' swap [i] with [j]
    end for
end function
