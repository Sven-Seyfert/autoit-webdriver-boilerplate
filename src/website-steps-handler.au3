#include "common\webdriver-actions-handler.au3"
#include "page-objects\consent-dialog-page.au3"
#include "page-objects\xpath-tutorial-page.au3"
#include "page-objects\xpath-axes-page.au3"

Func _Steps()
    _OpenWebsite()

    _ConfirmConsentDialog()
    _NavigateBetweenPages()
    _GetTableTexts()

    ConsoleWrite('Automation steps completed!' & @CRLF)
    Sleep(1500)
EndFunc

Func _OpenWebsite()
    _NavigateTo('https://www.w3schools.com/xml/xpath_intro.asp')
EndFunc
