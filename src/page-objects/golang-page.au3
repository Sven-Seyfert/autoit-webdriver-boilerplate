#include "..\selectors\golang-sel.au3"

Func _TakeScreenshotOfSearchResult()
    _SetElementText(_SearchInputSelector(), 'sven-seyfert crypt')
    _ClickElement(_SearchButtonSelector())
    Sleep(250)
    _TakeElementScreenshot(_SearchResultBoxSelector())
EndFunc

