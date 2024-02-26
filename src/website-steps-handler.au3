#include "common\webdriver-actions-handler.au3"
#include "page-objects\autoit-de-page.au3"
#include "page-objects\github-project-page.au3"
#include "page-objects\golang-page.au3"
#include "page-objects\webdriver-faq-page.au3"

Func _Steps()
    _OpenWebsite()
    _TakeScreenshotOfChangelogFile()

    _OpenWebsiteInNewTab('https://www.autoitscript.com/wiki/WebDriver#FAQ')
    _TakeScreenshotOfFaqNumberEight()

    _OpenWebsiteInNewTab('https://autoit.de')
    _OpenWebsiteInNewTab('https://pkg.go.dev')

    ; walk forwards through the tabs (show case)
    For $i = 1 To 6 Step 1
        _NextTab()
        Sleep(300)
    Next

    ; walk backwards through the tabs (show case)
    For $i = 1 To 7 Step 1
        _PreviousTab()
        Sleep(300)
    Next

    _TakeScreenshotOfAutoItDashboard()

    _NextTab()

    _TakeScreenshotOfSearchResult()

    ; handle close tab action (show case)
    _NextTab()
    _NextTab()
    _CloseTab()
    _BrowserBack()
    _CloseTab()
    _CloseTab()

    ; HINT: Close action will only be performed in case
    ; there is more than one tab available.
    _CloseTab()
    _CloseTab()
    _CloseTab()

    ConsoleWrite('Automation steps completed!' & @CRLF)
    Sleep(1500)
EndFunc

Func _OpenWebsite()
    _NavigateTo('https://github.com/Sven-Seyfert/au3webdriver-boilerplate')
EndFunc

Func _OpenWebsiteInNewTab($sUrl)
    _OpenNewTab()
    _NavigateTo($sUrl)
EndFunc
