#####

# Changelog

All notable changes to "au3webdriver-boilerplate" will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Go to [legend](#legend---types-of-changes) for further information about the types of changes.

## [Unreleased]

## [0.9.0] - 2024-09-15

### Added

- IgnoreSSLAndCerts option to global values configuration. [b954b0e](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/b954b0eee43a6ca014a9e7e69fe7c0adafa15846)
- Restore option to _WD_Window function (restore window size). [e46a6ad](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/e46a6ad73a6873ff682707fae44b45b31fc07049)

### Changed

- Apply upcoming au3WebDriver release changes (v1.4.0). [28f7fc1](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/28f7fc18737ca7fa0108682737443b00f7dc210a)
- Port handling in _SetDriverOptions function. [627d223](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/627d223a21de0ab19e96e84fcc98982d572ddae1)
- Reduce the navigation actions in '_NavigateBetweenPages()'. [d0ab3f6](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/d0ab3f69f4528710892b38acb8aae164aad4334b)

### Documented

- Extend README.md file by browser testing information. [ba57870](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/ba578703f2f2ca1154300e328cd9fbb6c45fd729)

## [0.8.0] - 2024-03-04

### Added

- Function '_ExistsElement' which wraps the '_FindElement' result as boolean. [30aa238](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/30aa238fd0bf42d35f5f33ac9118516643e97d9e)
- Helper function '_Print' to utils functions. [fb0b672](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/fb0b672c4b86b3030883bb4c0fe00641c4639ea5)
- New config setting for 'find element error' handling. [6a260fe](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/6a260fe7c4b283a4b4defa25250f94803a583dc7)

### Changed

- Set new default value 'maximize' to browser mode variable. [7b28668](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/7b28668a22098901bce7fe4d98c7c3c4798a5659)

### Documented

- Update README.md file by new function '_ExistsElement'. [34c782f](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/34c782fd2b08653864206accb6fcfb0bdd43c19b)

## [0.7.0] - 2024-02-29

### Documented

- Add Discord link. [c1fee37](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/c1fee37bbbeb235d238a93f92319b0cbff366365)
- Add webdriver actions function list. [5c736b5](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/5c736b537b7e9de33a2c58234d8858e8ef36f2bc)
- Fix typos. [e75dcbe](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/e75dcbe4c4fc52b7199c0026e2cf08c48a6692ba)
- Update README.md file. [b37f3d8](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/b37f3d808916619441a31cc47eea8d8872343051)

### Styled

- Reorder functions in file to get a better context overview. [591fb29](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/591fb29cb7190e53b1a3bbb188ba4d1505e3f570)

## [0.6.0] - 2024-02-27

### Added

- New functions in 'webdriver-actions-handler.au3' file for handling multiple browser tabs. [70ac8d3](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/70ac8d3de39e8dbc406671e723dedfedd3c763a3)
- New steps functions which represents the multiple tab handling examples. [c75278f](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/c75278fec37e4caf825fb17fdef60ce133f83b30)

### Changed

- Extend .gitignore file. [98da771](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/98da771ccebb6190b0dc9d62fbabb6d36ec84e76)

### Documented

- Add new example (branch content) to the README.md file. [41aafe1](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/41aafe12ad10991a13416be225e0539d0b33a4be)

## [0.5.0] - 2024-02-26

### Added

- BrowserMode as option to resize the browser to a maximized window or a fullscreen window. [39904d3](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/39904d3232c1c515a94901ac8de1731c28445f77)

## [0.4.0] - 2024-02-18

### Changed

- Renew 'chrome for testing' driver url in wd_core.au3 file. [ff52e04](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/ff52e04cf0fcd80a29f1a2d545caf384d6010a33)

### Documented

- Add example of function '_SetGlobalValues()' in README.md file. [133a200](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/133a200613ea1c3a42086c638cd06fcc2245ce10)
- Extend README.md file by more instructions. [f7aeea5](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/f7aeea598145d76855337695e2687fce78358369)

## [0.3.0] - 2024-02-13

### Changed

- Get rid of initial example code and apply new default main branch example. [a076d07](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/a076d074aea2bdfb2e8614adffa0c2388a427e41)
- Get rid of main branch example code and apply new goole-search example. [9ce1b0e](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/9ce1b0e331fcb862ff09974f5b14b0c92bc8f785)

### Documented

- Added Discord server to README.md file (not linked yet). [d59527b](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/d59527b803cbb72f88a67ee4d2e524f88872d749)
- Extend feature overview table in README.md file by additional column. [c6c0294](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/c6c02947ac43cf35986f465add2003e8e03131fa)

### Styled

- Minor adjustment (remove empty line). [b60d8dc](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/b60d8dc0bd833383bc36587cf594ea35ca150d65)

## [0.2.0] - 2024-02-12

### Changed

- Extract 'take screenshot' actions into separate function. [84d84a2](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/84d84a201cebed17943feabefc3899a1726837f0)

### Documented

- Add feature overview table in README.md file. [a8f0856](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/a8f0856eee3c6bafdd4f444b2a5fac7345ed9662)
- Mention authors in acknowledgements section of the README.md file and add licenses. [b784abb](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/b784abbd26987f16163416efbf8752dc65707ff6)

### Removed

- Unnecessary logging to console. [25b2802](https://github.com/Sven-Seyfert/au3webdriver-boilerplate/commit/25b2802d001781a691b7b3ec0fdc5ddb0f340f2d)

## [0.1.0] - 2024-02-11

### Added

- Initial commit with all repository data and dependencies.

[Unreleased]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.9.0...HEAD
[0.9.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/Sven-Seyfert/au3webdriver-boilerplate/releases/tag/v0.1.0

---

### Legend - Types of changes

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Documented` for documentation only changes.
- `Fixed` for any bug fixes.
- `Refactored` for changes that neither fixes a bug nor adds a feature.
- `Removed` for now removed features.
- `Security` in case of vulnerabilities.
- `Styled` for changes like whitespaces, formatting, missing semicolons etc.

##

[To the top](#)