
sub GetRoot(self as Object) as Object
    p = self.GetParent()
    if p <> invalid
        return GetRoot(p)
    else
        return p
    end if
end sub