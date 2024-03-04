Func _NavigateTo($sUrl)
    _WD_Navigate($sSession, $sUrl)
    _WD_LoadWait($sSession, $mConfig.Delay)
EndFunc

Func _OpenNewTab()
    _WD_Window($sSession, 'new', '{"type":"tab"}')

    Local Const $aListOfBrowserTabHandles = _GetBrowserTabHandles()
    Local Const $iCount  = _GetCount($aListOfBrowserTabHandles)
    Local Const $sHandle = $aListOfBrowserTabHandles[$iCount]

    _SwitchTab($sHandle)
EndFunc

Func _PreviousTab()
    Local Const $sCurrentBrowserTabHandle = _GetCurrentBrowserTabHandle()
    Local Const $aListOfBrowserTabHandles = _GetBrowserTabHandles()
    Local Const $iCount = _GetCount($aListOfBrowserTabHandles)

    Local $sHandle = Null

    For $i = 0 To $iCount Step 1
        If $aListOfBrowserTabHandles[$i] <> $sCurrentBrowserTabHandle Then
            ContinueLoop
        EndIf

        If $i > 0 Then
            $sHandle = $aListOfBrowserTabHandles[$i - 1]
        EndIf

        If $i == 0 Then
            $sHandle = $aListOfBrowserTabHandles[$iCount]
        EndIf

        _SwitchTab($sHandle)

        ExitLoop
    Next
EndFunc

Func _NextTab($bShouldClose = False)
    Local Const $sCurrentBrowserTabHandle = _GetCurrentBrowserTabHandle()
    Local Const $aListOfBrowserTabHandles = _GetBrowserTabHandles()
    Local Const $iCount = _GetCount($aListOfBrowserTabHandles)

    Local $sHandle = Null

    For $i = 0 To $iCount Step 1
        If $aListOfBrowserTabHandles[$i] <> $sCurrentBrowserTabHandle Then
            ContinueLoop
        EndIf

        If $i < $iCount Then
            $sHandle = $aListOfBrowserTabHandles[$i + 1]
        EndIf

        If $i == $iCount Then
            $sHandle = $aListOfBrowserTabHandles[0]
        EndIf

        If $bShouldClose And $iCount > 0 Then
            _WD_Window($sSession, 'close')
        EndIf

        _SwitchTab($sHandle)

        ExitLoop
    Next
EndFunc

Func _CloseTab()
    _NextTab(True)
EndFunc

Func _BrowserBack()
    _WD_Action($sSession, 'back')
EndFunc

Func _GetCurrentBrowserTabHandle()
    Return _WD_Window($sSession, 'window')
EndFunc

Func _GetBrowserTabHandles()
    Return _WD_Window($sSession, 'handles')
EndFunc

Func _SwitchTab($sHandle)
    _WD_Window($sSession, 'switch', '{"handle":"' & $sHandle & '"}')
EndFunc

Func _FindElement($sSelector)
    Local $sElement = _WD_FindElement($sSession, $mConfig.LocatorStrategy, $sSelector)
    If @error <> $_WD_ERROR_Success Then
        If $mConfig.TeardownOnFindElementError Then
            _TeardownDriver()
        EndIf
    EndIf

    Return $sElement
EndFunc

Func _FindElements($sSelector)
    Return _WD_FindElement($sSession, $mConfig.LocatorStrategy, $sSelector, Default, True)
EndFunc

Func _ClickElement($sSelector)
    _WaitForVisible($sSelector)
    _WD_ElementAction($sSession, _FindElement($sSelector), 'click')
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

Func _WaitForVisible($sSelector)
    Local Const $iTimeoutInMilliseconds = 5000
    Local Const $iElementVisibleFlag    = 1

    _WD_WaitElement($sSession, $mConfig.LocatorStrategy, $sSelector, $mConfig.Delay, $iTimeoutInMilliseconds, $iElementVisibleFlag)
EndFunc

Func _TakeScreenshot()
    Local Const $sResponse = _WD_Window($sSession, 'screenshot')
    _CreateScreenshotFile($sResponse)
EndFunc

Func _TakeElementScreenshot($sSelector)
    Local Const $sResponse = _WD_ElementAction($sSession, _FindElement($sSelector), 'screenshot')
    _CreateScreenshotFile($sResponse)
EndFunc

Func _CreateScreenshotFile($sResponse)
    Local Const $bDecode         = __WD_Base64Decode($sResponse)
    Local Const $sTimestamp      = @YEAR & @MON & @MDAY & '-' & @HOUR & @MIN & @SEC & '.' & @MSEC
    Local Const $sScreenshotPath = _PathFull('..\data\output\')

    _WriteFileBinary(_Backslash($sScreenshotPath) & $sTimestamp & '.png', $bDecode)
EndFunc

Func _EnterIFrame($sSelector)
    _WD_FrameEnter($sSession, _FindElement($sSelector))
EndFunc

Func _LeaveIFrame()
    _WD_FrameLeave($sSession)
    Sleep($mConfig.Delay)
EndFunc
