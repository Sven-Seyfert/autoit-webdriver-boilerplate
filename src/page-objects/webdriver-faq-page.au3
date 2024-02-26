#include "..\selectors\webdriver-faq-sel.au3"

Func _TakeScreenshotOfFaqNumberEight()
    Local Const $iFaqNumber = 8
    _ClickElement(_FaqToggleBoxSelector($iFaqNumber))
    Sleep(250)
    _TakeElementScreenshot(_FaqContentBoxSelector($iFaqNumber))
EndFunc
