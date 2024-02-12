#include "common\webdriver-actions-handler.au3"
#include "page-objects\consent-dialog-page.au3"
#include "page-objects\google-search-page.au3"
#include "page-objects\search-matches-page.au3"

Func _Steps()
    _OpenWebsite()

    _ConfirmConsentDialog()
    _EnterSearchQuery()
    _ChooseSpecificMatch()

    ConsoleWrite('Automation steps completed!' & @CRLF)
    Sleep(1500)
EndFunc

Func _OpenWebsite()
    _NavigateTo('https://www.google.de/')
EndFunc
