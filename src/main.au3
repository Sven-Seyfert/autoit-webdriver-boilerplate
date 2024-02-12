#pragma compile(FileVersion, 0.2.0)
#pragma compile(LegalCopyright, © Sven Seyfert (SOLVE-SMART))
#pragma compile(ProductVersion, 0.2.0 - 2024-02-12)

#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 4 -w 5 -w 6 -w 7
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\assets\icons\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\main.exe
#AutoIt3Wrapper_Run_Au3Stripper=y
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y
#Au3Stripper_Parameters=/sf /sv /mo /rm /rsln

Opt('MustDeclareVars', 1)

#include-once
#include <File.au3>
#include "..\lib\au3WebDriver\wd_helper.au3"
#include "..\lib\au3WebDriver\wd_capabilities.au3"

OnAutoItExitRegister('_TeardownDriver')

Global $mConfig[]
Global $sSession
Global $bAlreadyTeardown

#include "common\webdriver-handler.au3"
#include "utils\helper.au3"
#include "website-steps-handler.au3"

_Main()

Func _Main()
    _SetGlobalValues($mConfig)

    _GetNewestDriver()            ; get the current webdriver version of the chosen browser
    _SetLogLevel()                ; set log level to error (switch this in the function directly)
    _SetLocatorStrategy($mConfig) ; set locator strategy to XPath (switch this in the function directly)
    _SetupDriver()                ; create webdriver session (for chrome, firefox or msedge)

    _Steps()                      ; main website steps to automate (website automation flow)

    _TeardownDriver()             ; shutdown webdriver (and browser)
EndFunc

Func _SetGlobalValues(ByRef $mConfig)
    $mConfig.Driver          = 'firefox' ; chrome|firefox|msedge
    $mConfig.IsHeadlessMode  = False     ; False|True
    $mConfig.Delay           = 300       ; delay for supporting a robust waiting behavior (page load, clicks, texts etc.)
    $mConfig.BrowserWidth    = 1920      ; or 1440, etc.
    $mConfig.BrowserHeight   = 1080      ; or 810, etc.
    $mConfig.LocatorStrategy = Null      ; will be set in function "_SetLocatorStrategy()"

    ; HINT: This is the default installation path, change this in case it's another on your system.
    $mConfig.FirefoxBinary = 'C:\Program Files\Mozilla Firefox\firefox.exe'

    $bAlreadyTeardown = False
EndFunc
