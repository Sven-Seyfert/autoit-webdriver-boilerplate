Func _GetNewestDriver()
    Local Const $sDriverPath = _PathFull('..\driver')
    _WD_UpdateDriver(StringLower($mConfig.Driver), $sDriverPath)
EndFunc

Func _SetLogLevel()
    ; Global constants provided in "wd_core.au3" file.
    ; The following values are provided.
    ; $_WD_DEBUG_None  => no logging
    ; $_WD_DEBUG_Error => logging in case of error
    ; $_WD_DEBUG_Info  => logging with additional information
    ; $_WD_DEBUG_Full  => logging with full details for developers

    $_WD_DEBUG = $_WD_DEBUG_Error
EndFunc

Func _SetLocatorStrategy(ByRef $mConfig)
    ; Global constants provided in "wd_core.au3" file.
    ; The following values are provided.
    ; $_WD_LOCATOR_ByCSSSelector     => css selector
    ; $_WD_LOCATOR_ByXPath           => xpath
    ; $_WD_LOCATOR_ByLinkText        => link text
    ; $_WD_LOCATOR_ByPartialLinkText => partial link text
    ; $_WD_LOCATOR_ByTagName         => tag name

    $mConfig.LocatorStrategy = $_WD_LOCATOR_ByXPath
EndFunc

Func _SetupDriver()
    _SetDriverOptions()

    _WD_Startup()
    _WD_CapabilitiesStartup()

    Local $sCapabilities

    Switch StringLower($mConfig.Driver)
        Case 'chrome'
            $sCapabilities = _BuildChromeDriverCapabilities()
        Case 'firefox'
            $sCapabilities = _BuildFirefoxDriverCapabilities()
        Case 'msedge'
            $sCapabilities = _BuildEdgeDriverCapabilities()
    EndSwitch

    $sSession = _WD_CreateSession($sCapabilities)

    _ResizeBrowser()
EndFunc

Func _SetDriverOptions()
    Local Const $sDriverPath = _PathFull('..\driver')

    Local $mChrome[]
          $mChrome.Exe           = 'chromedriver.exe'
          $mChrome.Port          = 9515
          $mChrome.DriverParams  = '--verbose --log-path="' & _Backslash($sDriverPath) & 'chromedriver.log"'

    Local $mFirefox[]
          $mFirefox.Exe          = 'geckodriver.exe'
          $mFirefox.Port         = 4444
          $mFirefox.DriverParams = '--log trace'

    Local $mEdge[]
          $mEdge.Exe             = 'msedgedriver.exe'
          $mEdge.Port            = 9515
          $mEdge.DriverParams    = '--verbose --log-path="' & _Backslash($sDriverPath) & 'msedgedriver.log"'

    Local $sDriverExeFilePath, $iPort, $sDriverParams

    Switch StringLower($mConfig.Driver)
        Case 'chrome'
            $sDriverExeFilePath = _Backslash($sDriverPath) & $mChrome.Exe
            $iPort              = $mChrome.Port
            $sDriverParams      = $mChrome.DriverParams
        Case 'firefox'
            $sDriverExeFilePath = _Backslash($sDriverPath) & $mFirefox.Exe
            $iPort              = $mFirefox.Port
            $sDriverParams      = $mFirefox.DriverParams
        Case 'msedge'
            $sDriverExeFilePath = _Backslash($sDriverPath) & $mEdge.Exe
            $iPort              = $mEdge.Port
            $sDriverParams      = $mEdge.DriverParams
    EndSwitch

    _WD_Option('Driver', $sDriverExeFilePath)
    _WD_Option('Port', $iPort)
    _WD_Option('DriverParams', $sDriverParams)
EndFunc

Func _BuildChromeDriverCapabilities()
    _WD_CapabilitiesAdd('alwaysMatch', 'chrome')
    _WD_CapabilitiesAdd('w3c', True)
    _WD_CapabilitiesAdd('excludeSwitches', 'enable-automation')
    _WD_CapabilitiesAdd('args', StringFormat('--window-size=%s,%s', $mConfig.BrowserWidth, $mConfig.BrowserHeight))
    If $mConfig.IgnoreSSLAndCerts Then
        _WD_CapabilitiesAdd('acceptInsecureCerts', True)                     ; recommended
        _WD_CapabilitiesAdd('args', '--ignore-ssl-errors')                   ; optional
        _WD_CapabilitiesAdd('args', '--ignore-certificate-errors')           ; optional
        _WD_CapabilitiesAdd('args', '--ignore-certificate-errors-spki-list') ; optional
    EndIf

    If $mConfig.IsHeadlessMode Then
        _WD_CapabilitiesAdd('args', '--headless')
    EndIf

    Return _WD_CapabilitiesGet()
EndFunc

Func _BuildFirefoxDriverCapabilities()
    _WD_CapabilitiesAdd('alwaysMatch', 'firefox')
    _WD_CapabilitiesAdd('browserName', 'firefox')
    _WD_CapabilitiesAdd('acceptInsecureCerts', True)
    _WD_CapabilitiesAdd('binary', $mConfig.FirefoxBinary)
    _WD_CapabilitiesAdd('args', '--width=' & $mConfig.BrowserWidth)
    _WD_CapabilitiesAdd('args', '--height=' & $mConfig.BrowserHeight)

    If $mConfig.IsHeadlessMode Then
        _WD_CapabilitiesAdd('args', '--headless')
    EndIf

    Return _WD_CapabilitiesGet()
EndFunc

Func _BuildEdgeDriverCapabilities()
    _WD_CapabilitiesAdd('alwaysMatch', 'msedge')
    _WD_CapabilitiesAdd('w3c', True)
    _WD_CapabilitiesAdd('excludeSwitches', 'enable-automation')
    _WD_CapabilitiesAdd('args', StringFormat('--window-size=%s,%s', $mConfig.BrowserWidth, $mConfig.BrowserHeight))

    If $mConfig.IsHeadlessMode Then
        _WD_CapabilitiesAdd('args', '--headless')
    EndIf

    Return _WD_CapabilitiesGet()
EndFunc

Func _ResizeBrowser()
    Switch StringLower($mConfig.BrowserMode)
        Case 'maximize', 'fullscreen'
            _WD_Window($sSession, $mConfig.BrowserMode)
    EndSwitch
EndFunc

Func _TeardownDriver()
    If Not $bAlreadyTeardown Then
        _WD_DeleteSession($sSession)
        _WD_Shutdown()

        $bAlreadyTeardown = True
    EndIf
EndFunc
