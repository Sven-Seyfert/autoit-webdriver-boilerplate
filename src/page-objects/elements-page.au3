#include "..\selectors\elements-sel.au3"

Func _NavigateToTextBoxes()
    _ClickElement(_CardHeadlineSelector('Elements'))
    _ClickElement(_ListItemSelector('Text Box'))
EndFunc

Func _FillFormTextBoxes()
    _SetElementText(_UserNameInputSelector(), 'John Constantine')
    _SetElementText(_EmailInputSelector(), 'john.constantine@gmail.com')
    _SetElementText(_AddressInputSelector(), StringFormat('Dittrichring 17\n04109 Leipzig'))

    _TakeElementScreenshot(_EmailInputSelector())
    _TakeScreenshot()
EndFunc
