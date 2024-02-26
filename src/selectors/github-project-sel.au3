Func _ChangelogLinkSelector()
    Return '(//a[@title="CHANGELOG.md" and contains(@href, "CHANGELOG.md")])[last()]'
EndFunc
