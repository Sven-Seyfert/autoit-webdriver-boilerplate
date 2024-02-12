#include "..\selectors\google-search-sel.au3"

Func _EnterSearchQuery()
    _ClickElement(_SearchTextareaSelector())
    _SetElementText(_SearchTextareaSelector(), 'AutoIt WebDriver')
    _ClickElement(_FirstSearchListItemSelector())
EndFunc
