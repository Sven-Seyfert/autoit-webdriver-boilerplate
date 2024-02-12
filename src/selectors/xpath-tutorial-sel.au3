Func _LeftMenuLink($sText)
    Return StringFormat( _
        '//div[@id="leftmenuinnerinner"]//h2/span[text()="XPath"]' & _
        '/parent::h2[contains(text(), "Tutorial")]/following-sibling::a[text()="%s"]', $sText)
EndFunc
