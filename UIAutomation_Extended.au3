#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7
#cs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Name..................: UIAutomation_Extended
    Description...........: MS UIAutomation Framework library for AutoIt; extended custom functions

	Dependencies..........: UIAutomation environment settings; UIAutomation_Constants.au3; UIAutomation_Core.au3
    Documentation.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation

    Author................: exorcistas@github.com
    Modified..............: 2021-05-11
    Version...............: v0.4.7rc
#ce ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#include-once
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <UIAutomation_Core.au3>
#include <UIAutomation_Constants.au3>


#Region FUNCTIONS_LIST
#cs	===================================================================================================================================
    _UIA_Ext_CreateConditionByPropertyName($_oUIA_Interface, $_sPropertyName, $_sCondition)
	_UIA_Ext_FindFirstElementByProperty($_oUIA_Interface, $_oParentElement, $_sPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId)
	_UIA_Ext_FindFirstElementByNameAndLocalizedControlType($_oUIA_Interface, $_oParentElement, $_sNamePropertyValue, $_sLocalizedControlTypePropertyValue)
	_UIA_Ext_SetValue($_oElement, $_sValue)
	_UIA_Ext_InvokeElement($_oElement)
	_UIA_Ext_ToggleElement($_oElement)
	_UIA_Ext_FindWindowByRegexTitle($_oUIA_Interface, $_oRootElement, $_sRegExTitle, $_bFindFirst = True)
	_UIA_Ext_FindElementByRegexProperty($_oUIA_Interface, $_oWindowElement, $_sRegexPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId, $_bFindFirst = True)
	_UIA_Ext_GetControlNameFromId($_iControlId)
	_UIA_Ext_GetControlIdFromName($_sControlName)
	_UIA_Ext_GetPropertyIdFromName($_sPropertyName)
	_UIA_Ext_SetWindowVisualState($_oWindowElement, $_iWindowVisualState = $WindowVisualState_Normal)
	_UIA_Ext_CloseWindow($_oWindowElement)
	_UIA_Ext_ResizeWindow($_oWindowElement, $_iWidth, $_iHeight)
	_UIA_Ext_GetElementCoordinates($_oElement)
	_UIA_Ext_MouseClick($_aCoord, $_sButton = "primary", $_iClicks = 1, $_bClickCenter = True, $_iXOffset = 0, $_iYOffset = 0)
	_UIA_Ext_GetAllElementPropertyValues($_oElement, $_bOutputArray = True)
	_UIA_Ext_DebugScanElements($_oUIA_Interface, $_oBaseElement, $_iTreeScope = $TreeScope_Descendants)
	_UIA_Ext_HighlightElement($_oElement)
	_UIA_Ext_DrawRectangle($tLeft, $tRight, $tTop, $tBottom, $color = 0xFF, $PenWidth = 3)
#ce	===================================================================================================================================
#EndRegion FUNCTIONS_LIST

#Region UIA_Extended_FUNCTIONS

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_CreateConditionByPropertyName($_oUIA_Interface, $_sPropertyName, $_sCondition)
        Description ...: Creates condition object by supplied property name from $__UIA_SupportedPropertiesArray and condition description string
        Syntax.........: -
        Global vars....: $__UIA_SupportedPropertiesArray
        Parameters.....:
        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
    Func _UIA_Ext_CreateConditionByPropertyName($_oUIA_Interface, $_sPropertyName, $_sCondition)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(100, 0, False)
        Local $_iPropertyIndex = _ArrayBinarySearch($__UIA_SupportedPropertiesArray, $_sPropertyName)
            If @error Then Return SetError(200+@error, @extended, False)

        Local $_sPropertyId = $__UIA_SupportedPropertiesArray[$_iPropertyIndex][0]
        Local $_oPropertyCondition = _UIA_CreatePropertyCondition($_oUIA_Interface, $_sPropertyId, $_sCondition)
            If @error Then Return SetError(300+@error, @extended, False)

        Return $_oPropertyCondition
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_FindFirstElementByProperty($_oUIA_Interface, $_oParentElement, $_sPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId)
        Description ...: Searches for first found element by value in selected property
        Syntax.........: -
        Global vars....: $TreeScope_Descendants, $UIA_AutomationIdPropertyId
        Parameters.....:
		Return values..: Success - returns first found element by property id/value
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_FindFirstElementByProperty($_oUIA_Interface, $_oParentElement, $_sPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId)
		If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oParentElement)) OR ($_sPropertyValue = "") OR (IsNumber($_iPropertyId)) ) Then Return SetError(100+@error, @extended, False)

		Local $_oPropCondition = _UIA_CreatePropertyCondition($_oUIA_Interface, $_iPropertyId, $_sPropertyValue)
			If @error Then Return SetError(200+@error, @extended, False)
		Local $_oElement = _UIA_FindFirst($_oParentElement, $_oPropCondition, $TreeScope_Descendants)
			If @error Then Return SetError(300+@error, @extended, False)

		Return $_oElement
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_FindFirstElementByNameAndLocalizedControlType($_oUIA_Interface, $_oParentElement, $_sNamePropertyValue, $_sLocalizedControlTypePropertyValue)
        Description ...: Searches for first found element by value in both name and localized control type property
        Syntax.........: -
        Global vars....: $TreeScope_Descendants, $UIA_NamePropertyId, $UIA_LocalizedControlTypePropertyId
        Parameters.....:
        Return values..: Success - returns first found element that matches both the name property value and the localized control type property value
					Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2021-05-11
    #ce ===============================================================================================================================
	Func _UIA_Ext_FindFirstElementByNameAndLocalizedControlType($_oUIA_Interface, $_oParentElement, $_sNamePropertyValue, $_sLocalizedControlTypePropertyValue)
		If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oParentElement)) OR ($_sNamePropertyValue = "") OR ($_sLocalizedControlTypePropertyValue = "") ) Then Return SetError(100+@error, @extended, False)

		Local $_oNamePropCondition = _UIA_CreatePropertyCondition($_oUIA_Interface, $UIA_NamePropertyId, $_sNamePropertyValue)
			If @error Then Return SetError(200+@error, @extended, False)
		Local $_oLocalizedControlTypePropCondition = _UIA_CreatePropertyCondition($_oUIA_Interface, $UIA_LocalizedControlTypePropertyId, $_sLocalizedControlTypePropertyValue)
			If @error Then Return SetError(300+@error, @extended, False)
		Local $_oPropCondition = _UIA_CreateAndCondition($_oUIA_Interface, $_oNamePropCondition, $_oLocalizedControlTypePropCondition)
			If @error Then Return SetError(400+@error, @extended, False)
		Local $_oElement = _UIA_FindFirst($_oParentElement, $_oPropCondition, $TreeScope_Descendants)
			If @error Then Return SetError(500+@error, @extended, False)

		Return $_oElement
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_SetValue($_oElement, $_sValue)
        Description ...: Sets element value. If element is window - sets title
        Syntax.........: -
        Global vars....: $UIA_ControlTypePropertyId, $UIA_LegacyIAccessiblePatternId, $UIA_ValuePatternId
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_SetValue($_oElement, $_sValue)
		If NOT (IsObj($_oElement)) Then Return SetError(100+@error, @extended, False)
		Local $_sControlType = _UIA_GetCurrentPropertyValue($_oElement, $UIA_ControlTypePropertyId)
			If @error Then Return SetError(200+@error, @extended, False)

		If ($_scontrolType = $UIA_WindowControlTypeId) Then
			;-- if element is window, get handle
			Local $_iHWnd = _UIA_CurrentNativeWindowHandle($_oElement)
				If @error Then Return SetError(300+@error, @extended+1, False)
			WinSetTitle(HWnd($_iHWnd), "", $_sValue)
				If @error Then Return SetError(300+@error, @extended+2, False)
		Else
			_UIA_SetFocus($_oElement)
				If @error Then Return SetError(300+@error, @extended+3, False)

			Local $_oPattern = _UIA_GetCurrentPattern($_oElement, $UIA_LegacyIAccessiblePatternId)
			If NOT IsObj($_oPattern) Then
				$_oPattern = _UIA_GetCurrentPattern($_oElement, $UIA_ValuePatternId)
			EndIf

			If NOT IsObj($_oPattern) Then Return SetError(400+@error, @extended+4, False)
			$_oPattern.SetValue($_sValue)
		EndIf

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_InvokeElement($_oElement)
        Description ...: Sets Invoke action (pattern) on element if it's available
        Syntax.........: -
        Global vars....: $UIA_InvokePatternId
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_InvokeElement($_oElement)
	    If NOT IsObj($_oElement) Then Return SetError(1, 0, False)

		Local $_oPattern = _UIA_GetCurrentPattern($_oElement, $UIA_InvokePatternId)
			If NOT IsObj($_oPattern) Then Return SetError(2, 0, False)
		$_oPattern.Invoke()

		Return True
	EndFunc

	 #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_ToggleElement($_oElement)
        Description ...: Changes the ToggleState of the element if the toggle pattern is available.
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtogglepattern-toggle
        Global vars....: $UIA_TogglePatternId
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2021.03.25
    #ce ===============================================================================================================================
	Func _UIA_Ext_ToggleElement($_oElement)
        If NOT IsObj($_oElement) Then Return SetError(1, 0, False)

		Local $_oPattern = _UIA_GetCurrentPattern($_oElement, $UIA_TogglePatternId)
			If NOT IsObj($_oPattern) Then Return SetError(2, 0, False)
		$_oPattern.Toggle()

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_FindWindowByRegexTitle($_oUIA_Interface, $_oRootElement, $_sRegExTitle, $_bFindFirst = True)
        Description ...: Searches for window by Regular Expressions title
        Syntax.........: -
        Global vars....: $TreeScope_Children, $UIA_NamePropertyId
        Parameters.....:
		Return values..: Success - element object or array of element objects
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_FindWindowByRegexTitle($_oUIA_Interface, $_oRootElement, $_sRegExTitle, $_bFindFirst = True)
		If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oRootElement)) OR ($_sRegExTitle="") ) Then Return SetError(100+@error, @extended, False)

		Local $_oTRUECondition = _UIA_CreateTrueCondition($_oUIA_Interface)
		Local $_oElementArray = _UIA_FindAll($_oRootElement, $_oTRUECondition, $TreeScope_Children)
			If @error Then Return SetError(200+@error, @extended, False)

		Local $_iLength = 0
		$_oElementArray.Length($_iLength)
		Local $_oElement, $_sElementName, $_aElementsFound
		For $i = 0 To $_iLength-1
			$_oElement = _UIA_GetElement($_oElementArray, $i)
			$_sElementName = _UIA_GetCurrentPropertyValue($_oElement, $UIA_NamePropertyId)
			If StringRegExp($_sElementName, $_sRegExTitle) Then
				If $_bFindFirst Then Return $_oElement
			Else
				_ArrayAdd($_aElementsFound, $_oElement)
			EndIf
		Next

		If Ubound($_aElementsFound) > 0 Then Return $_aElementsFound
		Return SetError(300+@error, @extended, False)
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_FindElementByRegexProperty($_oUIA_Interface, $_oWindowElement, $_sRegexPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId, $_bFindFirst = True)
        Description ...: Searches for element by Regular Expressions value in selected property
        Syntax.........: -
        Global vars....: $TreeScope_Descendants, $UIA_AutomationIdPropertyId
        Parameters.....:
		Return values..: Success - element object or array of element objects
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_FindElementByRegexProperty($_oUIA_Interface, $_oWindowElement, $_sRegexPropertyValue, $_iPropertyId = $UIA_AutomationIdPropertyId, $_bFindFirst = True)
		If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oWindowElement)) OR ($_sRegexPropertyValue="") OR (IsNumber($_iPropertyId)) ) Then Return SetError(100+@error, @extended, False)

		Local $_oTRUECondition = _UIA_CreateTrueCondition($_oUIA_Interface)
		Local $_oElementArray = _UIA_FindAll($_oWindowElement, $_oTRUECondition, $TreeScope_Descendants)
			If @error Then Return SetError(200+@error, @extended, False)

		Local $_iLength = 0
		$_oElementArray.Length($_iLength)
		Local $_oElement, $_sElementProperty, $_aElementsFound
		For $i = 0 To $_iLength-1
			$_oElement = _UIA_GetElement($_oElementArray, $i)
				If @error Then Return SetError(300+@error, @extended+1, False)
			$_sElementProperty = _UIA_GetCurrentPropertyValue($_oElement, $_iPropertyId)
				If @error Then Return SetError(300+@error, @extended+2, False)

			If StringRegExp($_sElementProperty, $_sRegexPropertyValue) Then
				If $_bFindFirst Then Return $_oElement
			Else
				_ArrayAdd($_aElementsFound, $_oElement)
			EndIf
		Next

		If Ubound($_aElementsFound) > 0 Then Return $_aElementsFound
		Return SetError(400+@error, @extended, False)
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_GetControlNameFromId($_iControlId)
        Description ...: Gets control type name from $__UIA_ControlArray
        Syntax.........: -
        Global vars....: $__UIA_ControlArray
        Parameters.....:
		Return values..: Success - returns control type name
						 Failure - returns FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_GetControlNameFromId($_iControlId)
		If NOT IsNumber($_iControlId) Then Return SetError(100, 0, False)

		Local $_index = _ArrayBinarySearch($__UIA_ControlArray, $_iControlId, 0, 0, 1)
			If @error Then Return SetError(200+@error, @extended, False)

		Return $__UIA_ControlArray[$_index][0]
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_GetControlIdFromName($_sControlName)
        Description ...: Gets control type id from $__UIA_ControlArray
        Syntax.........: -
        Global vars....: $__UIA_ControlArray
        Parameters.....:
		Return values..: Success - returns control type id
						 Failure - returns FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_GetControlIdFromName($_sControlName)
		If NOT IsString($_sControlName) Then Return SetError(100, 0, False)
		Local $_tempString = StringUpper($_sControlName)

		If StringLeft($_tempString, 4) <> "UIA_" Then $_tempString = "UIA_" & $_tempString	 & "Button" & "ControlTypeId"	;-- if string does not start with "UIA_"
		If StringRight($_tempString, 7) = "CONTROL" Then $_tempString = $_tempString & "CONTROLTYPEID"	;-- if string ends with "CONTROL"
		If StringRight($_tempString, 13) <> "CONTROLTYPEID" Then $_tempString = $_tempString & "CONTROLTYPEID"	;-- if string does not end with "CONTROLTYPEID"

		Local $_index = _ArrayBinarySearch($__UIA_ControlArray, $_tempString, 0, 0, 0)
			If @error Then Return SetError(200+@error, @extended, False)

		Return $__UIA_ControlArray[$_index][1]
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_GetPropertyIdFromName($_sPropertyName)
        Description ...: Gets property id from $__UIA_SupportedPropertiesArray
        Syntax.........: -
        Global vars....: $__UIA_SupportedPropertiesArray
        Parameters.....:
		Return values..: Success - returns property id
						 Failure - returns FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_GetPropertyIdFromName($_sPropertyName)
		If NOT IsString($_sPropertyName) Then Return SetError(100, 0, False)
			Local $_tempString = StringUpper($_sPropertyName)

		Local $_index = _ArrayBinarySearch($__UIA_SupportedPropertiesArray, $_tempString, 0, 0, 0)
			If @error Then Return SetError(200+@error, @extended, False)
		Local $_iPropertyId = $__UIA_SupportedPropertiesArray[$_index][1]

		Return $_iPropertyId
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_SetWindowVisualState($_oWindowElement, $_iWindowVisualState = $WindowVisualState_Normal)
        Description ...: Sets window state (normal, minimized, maximized) and focuses on it
        Syntax.........: -
        Global vars....: $UIA_WindowPatternId, $WindowVisualState_Normal
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_SetWindowVisualState($_oWindowElement, $_iWindowVisualState = $WindowVisualState_Normal)
		If NOT (IsObj($_oWindowElement)) Then Return SetError(100, 0, False)

		Local $_oPattern = _UIA_GetCurrentPattern($_oWindowElement, $UIA_WindowPatternId)
			If NOT IsObj($_oPattern) Then Return SetError(200, 0, False)
		$_oPattern.SetWindowVisualState($_iWindowVisualState)
		_UIA_SetFocus($_oWindowElement)
			If @error Then Return SetError(300+@error, @extended, False)

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_CloseWindow($_oWindowElement)
        Description ...: Closes window
        Syntax.........: -
        Global vars....: $UIA_WindowPatternId
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_CloseWindow($_oWindowElement)
		If NOT (IsObj($_oWindowElement)) Then Return SetError(1, 0, False)

		Local $_oPattern = _UIA_GetCurrentPattern($_oWindowElement, $UIA_WindowPatternId)
			If NOT IsObj($_oPattern) Then Return SetError(2, 0, False)
		$_oPattern.Close()

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_ResizeWindow($_oWindowElement, $_iWidth, $_iHeight)
        Description ...: Sets window resolution
        Syntax.........: -
        Global vars....: $UIA_TransformPatternId
        Parameters.....:
		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_ResizeWindow($_oWindowElement, $_iWidth, $_iHeight)
		If NOT ( (IsObj($_oWindowElement)) OR (IsNumber($_iWidth)) OR (IsNumber($_iWidth)) ) Then Return SetError(100, 0, False)

		Local $_oPattern = _UIA_GetCurrentPattern($_oWindowElement, $UIA_TransformPatternId)
			If NOT IsObj($_oPattern) Then Return SetError(200+@error, @extended, False)
		$_oPattern.Resize($_iWidth, $_iHeight)

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_GetAllElementPropertyValues($_oElement, $_bOutputArray = True)
        Description ...: Extracts all element properties values available
        Syntax.........: -
        Global vars....: $__UIA_SupportedPropertiesArray
        Parameters.....:
        Return values..: Success - returns formatted string or array of element properties values
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_GetAllElementPropertyValues($_oElement, $_bOutputArray = True)
		If NOT IsObj($_oElement) Then Return SetError(1, 0, False)
        Local $_sPropertyValue
		Local $_sOutputString = @CRLF
		Local $_aElementProperties

        For $i = 0 To UBound($__UIA_SupportedPropertiesArray) - 1
            ;-- exclude the special ones:
            If $__UIA_SupportedPropertiesArray[$i][1] <> $__UIA_SpecialProperty Then
				$_sPropertyValue = _UIA_GetCurrentPropertyValue($_oElement, $__UIA_SupportedPropertiesArray[$i][1])
					If @error Then Return SetError(2, 0, False)
				If $_sPropertyValue <> "" Then
					If $_bOutputArray Then
						_ArrayAdd($_aElementProperties, "UIA_" & $__UIA_SupportedPropertiesArray[$i][0] & "|" & $_sPropertyValue)
					Else
						$_sOutputString = $_sOutputString & @TAB & @TAB & "UIA_" & $__UIA_SupportedPropertiesArray[$i][0] & ":=	<" & $_sPropertyValue & ">" & @CRLF
					EndIf
				EndIf
            EndIf
        Next

		If $_bOutputArray Then Return $_aElementProperties
		Return $_sOutputString
    EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_DebugScanElements($_oUIA_Interface, $_oBaseElement, $_iTreeScope = $TreeScope_Descendants)
        Description ...: Scans for element tree and returns formatted string or 2D array. Useful for debugging
        Syntax.........: -
        Global vars....: $TreeScope_Descendants
        Parameters.....:
		Return values..: Success - returns formatted string or 2D array of element tree
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_DebugScanElements($_oUIA_Interface, $_oBaseElement, $_iTreeScope = $TreeScope_Descendants)
		If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oBaseElement)) OR (IsNumber($_iTreeScope)) ) Then Return SetError(1, 0, False)

		Local $_oElement, $_sOutputString, $_sAllProperties
		Local $_oTRUECondition = _UIA_CreateTrueCondition($_oUIA_Interface)
			If NOT IsObj($_oTRUECondition) Then Return SetError(2, 0, False)

		Local $_oElementArray = _UIA_FindAll($_oBaseElement, $_oTRUECondition, $_iTreeScope)
			If NOT IsObj($_oElementArray) Then Return SetError(3, 0, False)

		Local $_iLength = 0
		$_oElementArray.Length($_iLength)
		For $i = 0 To $_iLength - 1
			$_oElement = _UIA_GetElement($_oElementArray, $i)
			$_sAllProperties = _UIA_Ext_GetAllElementPropertyValues($_oElement, False)
			$_sOutputString = $_sOutputString & "<elementinfo>" & $_sAllProperties & "</elementinfo>"
			ConsoleWrite("["& $i &"] >> " & @TAB & $_sAllProperties & @CRLF)
		Next

		Return $_sOutputString
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_GetElementCoordinates($_oElement)
        Description ...: Retrieves coordinates array for element position
        Syntax.........: -
        Global vars....: $UIA_BoundingRectanglePropertyId
        Parameters.....:
		Return values..: Success - returns coordinates array for element position
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_GetElementCoordinates($_oElement)
		If NOT (IsObj($_oElement)) Then Return SetError(1, 0, False)
		Local $_aCoord = StringSplit(_UIA_GetCurrentPropertyValue($_oElement, $UIA_BoundingRectanglePropertyId), ";")
			If NOT IsArray($_aCoord) Then Return SetError(2, 0, False)

		Return $_aCoord
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_MouseClick($_aCoord, $_sButton = "primary", $_iClicks = 1, $_bClickCenter = True, $_iXOffset = 0, $_iYOffset = 0)
        Description ...: Send mouse clicks to specified coordinates
        Syntax.........: -
        Global vars....: -
		Parameters.....: $_aCoord - use outout from _UIA_Ext_GetElementCoordinates()

		Return values..: Success - TRUE
						 Failure - FALSE, sets @error + @extended

        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
	Func _UIA_Ext_MouseClick($_aCoord, $_sButton = "primary", $_iClicks = 1, $_bClickCenter = True, $_iXOffset = 0, $_iYOffset = 0)
		If NOT ( (IsArray($_aCoord)) OR ($_sButton="primary") OR ($_sButton="left") OR ($_sButton="right") OR ($_sButton="middle") OR ($_sButton="main") OR ($_sButton="menu") OR ($_sButton="secondary") ) Then Return SetError(100, @extended, False)

		Local $x, $y
		If $_bClickCenter Then
			;-- find center:
			$x = Int($_aCoord[1] + ($_aCoord[3] / 2))
			$y = Int($_aCoord[2] + $_aCoord[4] / 2)
		Else
			;-- use provided coordinates with optional offset:
			$x = Int($_aCoord[1] + $_iXOffset)
			$y = Int($_aCoord[2] + $_iYOffset)
		EndIf
		MouseMove($x, $y, 1)
		MouseClick($_sButton, $x, $y, $_iClicks, 1)
			If @error Then Return SetError(200+@error, @extended, False)

		Return True
	EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_HighlightElement($_oElement)
        Description ...: Creates visual highlight on element boundaries. Useful for debugging
        Syntax.........: -
        Global vars....: $UIA_BoundingRectanglePropertyId
        Parameters.....:
        Return values..: -
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
    Func _UIA_Ext_HighlightElement($_oElement)
        Local $_aCoords = StringSplit(_UIA_GetCurrentPropertyValue($_oElement, $UIA_BoundingRectanglePropertyId), ";")
        _UIA_Ext_DrawRectangle($_aCoords[1], $_aCoords[3] + $_aCoords[1], $_aCoords[2], $_aCoords[4] + $_aCoords[2])
    EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_Ext_DrawRectangle($tLeft, $tRight, $tTop, $tBottom, $color = 0xFF, $PenWidth = 3)
        Description ...: Help function for _UIA_Ext_HighlightElement()
        Syntax.........: -
        Global vars....: -
        Parameters.....:
        Return values..: -
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-31
    #ce ===============================================================================================================================
    Func _UIA_Ext_DrawRectangle($tLeft, $tRight, $tTop, $tBottom, $color = 0xFF, $PenWidth = 3)
        Local $hDC, $hPen, $obj_orig, $x1, $x2, $y1, $y2
        $x1 = $tLeft
        $x2 = $tRight
        $y1 = $tTop
        $y2 = $tBottom
        $hDC = _WinAPI_GetWindowDC(0) ; DC of entire screen (desktop)
        $hPen = _WinAPI_CreatePen($PS_SOLID, $PenWidth, $color)
        $obj_orig = _WinAPI_SelectObject($hDC, $hPen)

        _WinAPI_DrawLine($hDC, $x1, $y1, $x2, $y1) ; horizontal to right
        _WinAPI_DrawLine($hDC, $x2, $y1, $x2, $y2) ; vertical down on right
        _WinAPI_DrawLine($hDC, $x2, $y2, $x1, $y2) ; horizontal to left right
        _WinAPI_DrawLine($hDC, $x1, $y2, $x1, $y1) ; vertical up on left

		; refresh desktop (clear drawing)
		_WinAPI_RedrawWindow(_WinAPI_GetDesktopWindow(), 0, 0, $RDW_INVALIDATE + $RDW_ALLCHILDREN)

        ; clear resources
        _WinAPI_SelectObject($hDC, $obj_orig)
        _WinAPI_DeleteObject($hPen)
        _WinAPI_ReleaseDC(0, $hDC)
    EndFunc

#EndRegion UIA_Extended_FUNCTIONS