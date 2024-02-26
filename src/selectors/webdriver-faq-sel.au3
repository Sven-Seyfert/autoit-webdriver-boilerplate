Func _FaqToggleBoxSelector($iNumber)
    Return StringFormat('//div[contains(@class, "FAQ%s")]', $iNumber)
EndFunc

Func _FaqContentBoxSelector($iNumber)
    Return StringFormat('//div[contains(@id, "FAQ%s")]', $iNumber)
EndFunc
