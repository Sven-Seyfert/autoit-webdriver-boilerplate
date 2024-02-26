#include "..\selectors\github-project-sel.au3"

Func _TakeScreenshotOfChangelogFile()
    _ClickElement(_ChangelogLinkSelector())
    Sleep(250)
    _TakeScreenshot()
EndFunc
