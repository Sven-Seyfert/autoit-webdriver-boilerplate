#####

<p align="center">
    <img src="assets/images/logo.png" width="100" />
    <h2 align="center">Welcome to <code>au3webdriver-boilerplate</code>【ツ】</h2>
</p>

[![license](https://img.shields.io/badge/license-MIT-indianred.svg?style=flat-square&logo=spdx&logoColor=white)](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/main/LICENSE.md)
[![release](https://img.shields.io/github/release/Sven-Seyfert/au3webdriver-boilerplate.svg?color=slateblue&style=flat-square&logo=github)](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/releases/latest)
[![autoit](https://img.shields.io/badge/lang-AutoIt-lightskyblue.svg?style=flat-square&logo=autodesk&logoColor=white)]()
[![last commit](https://img.shields.io/github/last-commit/Sven-Seyfert/au3webdriver-boilerplate.svg?color=darkgoldenrod&style=flat-square&logo=github)](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commits/main)
[![contributors](https://img.shields.io/github/contributors/Sven-Seyfert/au3webdriver-boilerplate.svg?color=darkolivegreen&style=flat-square&logo=github)](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/graphs/contributors)
[![Discord](https://img.shields.io/badge/Discord-AutoIt_Community_Projects-%235865F2.svg?style=flat-square&logo=discord&logoColor=white)](https://discord.gg/5DWTpZK3QN)

---

[Description](#description) | [Features](#features) | [Getting started](#getting-started) | [Configuration](#configuration) | [Contributing](#contributing) | [License](#license) | [Acknowledgements](#acknowledgements)

## Description

The project "au3webdriver-boilerplate" can be used as quick entry point for the awesome [au3WebDriver](https://github.com/Danp2/au3WebDriver/) project by @Danp2 (and @mlipok). The intention is, give people a easy start with WebDriver for AutoIt.

## Features

#### *Branches*

The different kinds of **examples**, are (and will be) separated in different branches of the repository. In this overview you basically can see which branch contains which example of WebDriver actions. Some examples and their code could be implemented in a shorter way, but this is made by design and follows a educational purpose.

| Branch                      | Description of the WebDriver actions                                                                                                                     | Websites in use                                                                                                                                                 | Browser automation<br>flow (steps)                                                                                            |
| ---                         | ---                                                                                                                                                      | ---                                                                                                                                                             | ---                                                                                                                           |
| `main`                      | - open website<br>- confirm cookie consent dialog<br>- navigate between pages<br>- get table texts                                                       | - https://www.w3schools.com/                                                                                                                                    | [link](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/main/src/website-steps-handler.au3)                      |
| `fill-form-take-screenshot` | - open website<br>- confirm cookie consent dialog<br>- navigate to specific area<br>- fill a form<br>- take screenshots                                  | - https://demoqa.com/                                                                                                                                           | [link](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/fill-form-take-screenshot/src/website-steps-handler.au3) |
| `google-search`             | - open website<br>- confirm cookie consent dialog<br>- enter search query<br>- choose specific match by text                                             | - https://www.google.de/                                                                                                                                        | [link](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/google-search/src/website-steps-handler.au3)             |
| `multiple-browser-tabs`     | - open website<br>- open three more websites in separate browser tabs<br>- do actions (screenshots) for each tabs<br>- navigate through tabs, close tabs | - https://github.com/Sven-Seyfert/au3webdriver-boilerplate<br>- https://www.autoitscript.com/wiki/WebDriver#FAQ<br>- https://autoit.de<br>- https://pkg.go.dev  | [link](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/multiple-browser-tabs/src/website-steps-handler.au3)     |

#### *WebDriver actions function list*

In file `src/common/webdriver-actions-handler.au3` you can find the following functions which should help you in terms of browser automation actions. These functions are used in the different branches and especially in the `_Steps()` function and their subfunctions (entry point of the browser automation).

| Function                               | Purpose                                                                                           |
| ---                                    | ---                                                                                               |
| `_NavigateTo($sUrl)`                   | Open the specific URL.                                                                            |
| `_OpenNewTab()`                        | Open new tab and switch to the newly created tab context.                                         |
| `_GetCurrentBrowserTabHandle()`        | Get the active browser tab handle, to deal with tab navigation.                                   |
| `_GetBrowserTabHandles()`              | Get handles of all browser tabs, to deal with tab navigation.                                     |
| `_PreviousTab()`                       | Switch to previous (left) tab with context switch.                                                |
| `_NextTab($bShouldClose = False)`      | Switch to next (right) tab with context switch.                                                   |
| `_SwitchTab($sHandle)`                 | Switch to tab handle context.                                                                     |
| `_CloseTab()`                          | Close current active tab and switch to next (right) tab, with context.                            |
| `_BrowserBack()`                       | Make a browser history back action (backward arrow).                                              |
| `_ClickElement($sSelector)`            | Click DOM element by selector.                                                                    |
| `_WaitForVisible($sSelector)`          | Wait until a element is visible.                                                                  |
| `_FindElement($sSelector)`             | Get element id (UUID) which is necessary to interact with the DOM elements.                       |
| `_FindElements($sSelector)`            | Get a list of elements (of UUIDs) for further interactions (see "_FindElement").                  |
| `_GetElementText($sSelector)`          | Get the text of the specific DOM element.                                                         |
| `_GetElementsTexts($sSelector)`        | Get a list of texts of the specific DOM elements.                                                 |
| `_SetElementText($sSelector, $sValue)` | Set text to a element like an input field.                                                        |
| `_TakeElementScreenshot($sSelector)`   | Create a screenshot of a specific area/element and save this screenshot in the output directory.  |
| `_TakeScreenshot()`                    | Create a screenshot of the whole browser window and save this screenshot in the output directory. |
| `_EnterIFrame($sSelector)`             | Move context to an iFrame.                                                                        |
| `_LeaveIFrame()`                       | Leave the context of the previous entered iFrame (move out).                                      |

## Getting started

#### *Preconditions*

As assumption, your "browser" of choice which should be automated, have to be installed on your system. Not the "driver" (chromedriver.exe, geckodriver.exe etc.), your browser.

#### *Installation*

Fork or clone the repository. Alternatively you can download the [latest release](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/releases/latest) package. That should be all.

#### *Usage*

Open the project in your editor/IDE and navigate to folder `src`. Open `main.au3`, check and adjust the values of function `_SetGlobalValues()` and start the program. By default, in case you fulfill the [preconditions](#preconditions), the driver should start and should execute some simple webdriver actions like described in the [features](#features) section (for the specific branch).

Adjust the `_Steps()` function content in `website-steps-handler.au3` to your requirements and goals, use the prepared wrapper functions in `src\common\webdriver-actions-handler.au3` and in as best case, you also want to follow the POM (page object model) structure like prepared too.

## Configuration

Adjust the content/values of function `_SetGlobalValues()` in `src\main.au3`.

``` autoit
Func _SetGlobalValues(ByRef $mConfig)
    $mConfig.Driver          = 'firefox' ; chrome|firefox|msedge
    $mConfig.IsHeadlessMode  = False     ; False|True
    $mConfig.Delay           = 300       ; delay for supporting a robust waiting behavior (page load, clicks, texts etc.)
    $mConfig.BrowserWidth    = 1920      ; or 1440, etc.
    $mConfig.BrowserHeight   = 1080      ; or 810, etc.
    $mConfig.LocatorStrategy = Null      ; will be set in function "_SetLocatorStrategy()"
    $mConfig.BrowserMode     = 'size'    ; fullscreen|maximize|size (default is 'size' which applies .BrowserWidth and .BrowserHeight)

    ; HINT: This is the default installation path, change this in case it's another on your system.
    $mConfig.FirefoxBinary = 'C:\Program Files\Mozilla Firefox\firefox.exe'

    $bAlreadyTeardown = False
EndFunc
```

## Contributing

To be defined [...]

## License

Distributed under the MIT License. See [LICENSE](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/blob/main/LICENSE.md) for more information.

## Acknowledgements

- Opportunity by [GitHub](https://github.com)
- Badges by [Shields](https://shields.io)
- Thanks to the authors, maintainers and contributers of the various projects and UDFs
  - lib/au3WebDriver/wd_*.au3 by [@Danp2](https://github.com/Danp2) and [@mLipok](https://github.com/mLipok) ([License: MIT](lib/au3WebDriver/MIT.md))
  - lib/json/*.au3 by @Ward, @Jos and @TheXMan ([License: Unlicense](lib/json/Unlicense.md))
  - lib/winHttp/*.au3 by @trancexx/[@dragana-r](https://github.com/dragana-r) ([License: Apache-2.0](lib/winHttp/Apache-2.0.md))

##

[To the top](#)
