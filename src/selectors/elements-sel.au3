Func _CardHeadlineSelector($sText)
    Return StringFormat('//div[@class="card-body"]/h5[contains(text(), "%s")]/parent::div/parent::div', $sText)
EndFunc

Func _ListItemSelector($sText)
    Return StringFormat('//ul[@class="menu-list"]/li/span[text()="%s"]/parent::li', $sText)
EndFunc

Func _UserNameInputSelector()
    Return '//form[@id="userForm"]//input[@id="userName"]'
EndFunc

Func _EmailInputSelector()
    Return '//form[@id="userForm"]//input[@id="userEmail"]'
EndFunc

Func _AddressInputSelector()
    Return '//form[@id="userForm"]//textarea[@id="currentAddress"]'
EndFunc

