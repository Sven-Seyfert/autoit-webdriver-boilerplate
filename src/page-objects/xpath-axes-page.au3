#include "..\selectors\xpath-axes-sel.au3"
#include "Array.au3"

Func _GetTableTexts()
    Local Const $aTableCells = _GetElementsTexts(_AxesTableCellsSelector())
    _ArrayDisplay($aTableCells)
EndFunc
