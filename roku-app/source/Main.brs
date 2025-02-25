sub Main(args)
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)

    ' https://developer.roku.com/docs/developer-program/certification/certification.md#5-deep-linking.
    m.input = CreateObject("roInput")
    m.input.SetMessagePort(m.port)

    scene = screen.CreateScene("Root")

    m.global = screen.getGlobalNode()
    ? "args= "; formatjson(args)      'pretty print AA'
    deeplink = getDeepLinks(args)
    ? "deeplink= "; deeplink
    m.global.addField("deeplink", "assocarray", false)
    m.global.deeplink = deeplink

    'https://community.roku.com/t5/Roku-Developer-Program/AppDialogInitiate-and-AppDialogComplete-help-needed/td-p/800281
    scene.signalBeacon("AppDialogInitiate")
    scene.signalBeacon("AppDialogComplete")

    screen.show()
    scene.findNode("sceneManager").observeField("appExit", m.port)

    ' https://developer.roku.com/docs/developer-program/certification/certification.md#3-performance.
    scene.signalBeacon("AppLaunchComplete")

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        ' This check supports exit via a confirmation dialog.
        else if msgType = "roSGNodeEvent" then
            field = msg.getField()
            if field = "appExit" then
              return
            end if
        else if type(msg) = "roInputEvent"
            if msg.IsInput()
                info = msg.GetInfo()
                ' TODO: possible handling of deep liking.
                print "Received input: "; FormatJSON(info)
            end if
        end if
    end while
end sub

Function getDeepLinks(args) as Object
    deeplink = Invalid
    if args.contentid <> Invalid and args.mediaType <> Invalid
        deeplink = {
            id: args.contentId
            type: args.mediaType
        }
    end if
    return deeplink
end Function

