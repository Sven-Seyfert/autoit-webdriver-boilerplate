Func _NavigateTo($sUrl)
    _WD_Navigate($sSession, $sUrl)
    _WD_LoadWait($sSession, $mConfig.Delay)
EndFunc

Func _ClickElement($sSelector)
    _WaitForVisible($sSelector)
    _WD_ElementAction($sSession, _FindElement($sSelector), 'click')
EndFunc

Func _WaitForVisible($sSelector)
    Local Const $iTimeoutInMilliseconds = 5000
    Local Const $iElementVisibleFlag    = 1

    _WD_WaitElement($sSession, $mConfig.LocatorStrategy, $sSelector, $mConfig.Delay, $iTimeoutInMilliseconds, $iElementVisibleFlag)
EndFunc

Func _FindElement($sSelector)
    Local $sElement = _WD_FindElement($sSession, $mConfig.LocatorStrategy, $sSelector)
    If @error <> $_WD_ERROR_Success Then
        ConsoleWrite('Error for find element with selector ''' & $sSelector & '''.' & @CRLF)
        _TeardownDriver() ; HINT: Shutdown webdriver on error (optional, comment out if necessary).
    EndIf

    Return $sElement
EndFunc

Func _FindElements($sSelector)
    Return _WD_FindElement($sSession, $mConfig.LocatorStrategy, $sSelector, Default, True)
EndFunc

Func _GetElementText($sSelector)
    _WaitForVisible($sSelector)

    Return _WD_ElementAction($sSession, _FindElement($sSelector), 'text')
EndFunc

Func _GetElementsTexts($sSelector)
    Local Const $aListOfElements = _FindElements($sSelector)
    Local Const $iCount          = _GetCount($aListOfElements)

    Local $aListOfElementsTexts[$iCount + 1]

    For $i = 0 To $iCount Step 1
        $aListOfElementsTexts[$i] = _WD_ElementAction($sSession, $aListOfElements[$i], 'text')
    Next

    Return $aListOfElementsTexts
EndFunc

Func _SetElementText($sSelector, $sValue)
    _WaitForVisible($sSelector)
    _WD_ElementAction($sSession, _FindElement($sSelector), 'value', $sValue)
EndFunc

Func _TakeElementScreenshot($sSelector)
    Local Const $sResponse = _WD_ElementAction($sSession, _FindElement($sSelector), 'screenshot')
    _CreateScreenshotFile($sResponse)
EndFunc

Func _TakeScreenshot()
    Local Const $sResponse = _WD_Window($sSession, 'screenshot')
    _CreateScreenshotFile($sResponse)
EndFunc

Func _CreateScreenshotFile($sResponse)
    Local Const $bDecode         = __WD_Base64Decode($sResponse)
    Local Const $sTimestamp      = @YEAR & @MON & @MDAY & '-' & @HOUR & @MIN & @SEC & '.' & @MSEC
    Local Const $sScreenshotPath = _PathFull('..\data\output\')

    ConsoleWrite(_Backslash($sScreenshotPath) & $sTimestamp & '.png' & @CRLF)

    _WriteFileBinary(_Backslash($sScreenshotPath) & $sTimestamp & '.png', $bDecode)
EndFunc

Func _EnterIFrame($sSelector)
    _WD_FrameEnter($sSession, _FindElement($sSelector))
EndFunc

Func _LeaveIFrame()
    _WD_FrameLeave($sSession)
    Sleep($mConfig.Delay)
EndFunc
