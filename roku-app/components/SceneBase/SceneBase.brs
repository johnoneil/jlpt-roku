

sub init()
    ? "sub init() SceneBase"
    m.closed = false
    m.top.ObserveField("visible", "OnVisible")

end sub


sub close()
    ? "sub close() SceneBase"
    m.closed = true
end sub