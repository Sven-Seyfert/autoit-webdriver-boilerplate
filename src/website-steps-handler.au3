#include "common\webdriver-actions-handler.au3"
#include "page-objects\consent-dialog-page.au3"
#include "page-objects\elements-page.au3"

Func _Steps()
    _OpenWebsite()

    _ConfirmConsentDialog()
    _NavigateToTextBoxes()
    _FillFormTextBoxes()
    _TakeScreenhotsOfFormAreas()

    ConsoleWrite('Automation steps completed!' & @CRLF)
    Sleep(1500)
EndFunc

Func _OpenWebsite()
    _NavigateTo('https://demoqa.com/')
EndFunc
