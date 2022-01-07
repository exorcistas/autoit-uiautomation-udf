#include-once
#include <../UIAutomation_Extended.au3>

;# Example with findfirst, core function
CALC_EXAMPLE_1()
Func CALC_EXAMPLE_1()
    Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

    Run("calc.exe")
    WinWait("Calculator")
    WinActivate("Calculator")
    WinWaitActive("Calculator")

    Local $oUIA_Interface = _UIA_InitInterface()
    Local $oRootElement = _UIA_GetRootElement($oUIA_Interface)

    Local $_iStartTime = TimerInit()

    ;-- find window element
    Local $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_NamePropertyId, "Calculator")
    Local $oWindowElement = _UIA_FindFirst($oRootElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_SetFocus($oWindowElement)
        _UIA_Ext_HighlightElement($oWindowElement)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oFoundElement, False)
        ;ConsoleWrite($sProperties & @CRLF)

    ;-- find button 1 in Calculator
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "num1Button")
    Local $oButtonOne = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oButtonOne)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oButtonOne, False)
        ;ConsoleWrite($sProperties & @CRLF)
    Local $oPattern = _UIA_GetCurrentPattern($oButtonOne, $UIA_InvokePatternId)
        $oPattern.Invoke

    ;-- find button 0 in Calculator
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "num0Button")
    Local $oButtonZero = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oButtonZero)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oButtonZero, False)
        ;ConsoleWrite($sProperties & @CRLF)
    $oPattern = _UIA_GetCurrentPattern($oButtonZero, $UIA_InvokePatternId)
        $oPattern.Invoke

    ;-- find button + in Calculator
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "plusButton")
    Local $oButtonPlus = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oButtonPlus)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oButtonPlus, False)
        ;ConsoleWrite($sProperties & @CRLF)
    $oPattern = _UIA_GetCurrentPattern($oButtonPlus, $UIA_InvokePatternId)
        $oPattern.Invoke

    ;-- find button 9 in Calculator
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "num9Button")
    Local $oButtonNine = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oButtonNine)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oButtonNine, False)
        ;ConsoleWrite($sProperties & @CRLF)
    $oPattern = _UIA_GetCurrentPattern($oButtonNine, $UIA_InvokePatternId)
        $oPattern.Invoke

    ;-- find button equal in Calculator
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "equalButton")
    Local $oButtonEqual = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oButtonEqual)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oButtonEqual, False)
        ;ConsoleWrite($sProperties & @CRLF)
    $oPattern = _UIA_GetCurrentPattern($oButtonEqual, $UIA_InvokePatternId)
        $oPattern.Invoke

    ;-- find results element
    $oPropCondition = _UIA_CreatePropertyCondition($oUIA_Interface, $UIA_AutomationIdPropertyId, "CalculatorResults")
    Local $oResults = _UIA_FindFirst($oWindowElement, $oPropCondition, $TreeScope_Descendants)
        _UIA_Ext_HighlightElement($oResults)
    Local $sProperties = _UIA_GetCurrentPropertyValue($oResults, $UIA_NamePropertyId)
        $sProperties = StringStripWS(StringRegExpReplace($sProperties, "Display is|" & Chr(160), ""), 8)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oResults, False)

    $_iDiff = Round(TimerDiff($_iStartTime) / 1000, 4)
    ConsoleWrite("UIA Calculator Example 1 >> output = " & $sProperties & "; operation completed in: " & $_iDiff & " seconds" & @CRLF)
    MsgBox(64, "UIA Calculator Example 1", "Success! Result is: " & $sProperties & @CRLF & @CRLF & "Operation completed in: " & $_iDiff & " seconds")
EndFunc


;# Example with findfirst, extended function
CALC_EXAMPLE_2()
Func CALC_EXAMPLE_2()
    Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

    Run("calc.exe")
    WinWait("Calculator")
    WinActivate("Calculator")
    WinWaitActive("Calculator")

    Local $oUIA_Interface = _UIA_InitInterface()
    Local $oRootElement = _UIA_GetRootElement($oUIA_Interface)

    Local $_iStartTime = TimerInit()

    Local $oWindowElement = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oRootElement, "Calculator", $UIA_NamePropertyId)
    _UIA_Ext_SetWindowVisualState($oWindowElement, $WindowVisualState_Normal)
    _UIA_Ext_HighlightElement($oWindowElement)

    Local $oButtonOne = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "num1Button")
    _UIA_Ext_HighlightElement($oButtonOne)
    _UIA_Ext_InvokeElement($oButtonOne)

    Local $oButtonZero = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "num0Button")
    _UIA_Ext_HighlightElement($oButtonZero)
    _UIA_Ext_InvokeElement($oButtonZero)

    Local $oButtonPlus = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "plusButton")
    _UIA_Ext_HighlightElement($oButtonPlus)
    _UIA_Ext_InvokeElement($oButtonPlus)
    
    Local $oButtonNine = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "num9Button")
    _UIA_Ext_HighlightElement($oButtonNine)
    _UIA_Ext_InvokeElement($oButtonNine)

    Local $oButtonEqual = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "equalButton")
    _UIA_Ext_HighlightElement($oButtonEqual)
    _UIA_Ext_InvokeElement($oButtonEqual)

    Local $oResults = _UIA_Ext_FindFirstElementByProperty($oUIA_Interface, $oWindowElement, "CalculatorResults")
    _UIA_Ext_HighlightElement($oResults)

    Local $sProperties = _UIA_GetCurrentPropertyValue($oResults, $UIA_NamePropertyId)
        $sProperties = StringStripWS(StringRegExpReplace($sProperties, "Display is|" & Chr(160), ""), 8)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oResults, False)

    Local $_iDiff = Round(TimerDiff($_iStartTime) / 1000, 4)
    ConsoleWrite("UIA Calculator Example 2 >> output = " & $sProperties & "; operation completed in: " & $_iDiff & " seconds" & @CRLF)
    MsgBox(64, "UIA Calculator Example 2", "Success! Result is: " & $sProperties & @CRLF & @CRLF & "Operation completed in: " & $_iDiff & " seconds")
EndFunc


;# Example with RegEx findfirst extended function
CALC_EXAMPLE_3()
Func CALC_EXAMPLE_3()
    Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

    Run("calc.exe")
    WinWait("Calculator")
    WinActivate("Calculator")
    WinWaitActive("Calculator")

    Local $oUIA_Interface = _UIA_InitInterface()
    Local $oRootElement = _UIA_GetRootElement($oUIA_Interface)

    Local $_iStartTime = TimerInit()

    Local $oWindowElement = _UIA_Ext_FindWindowByRegexTitle($oUIA_Interface, $oRootElement, "Calc.*")
    _UIA_Ext_SetWindowVisualState($oWindowElement, $WindowVisualState_Normal)
    _UIA_Ext_HighlightElement($oWindowElement)

    Local $oButtonOne = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, "num1")
    _UIA_Ext_HighlightElement($oButtonOne)
    _UIA_Ext_InvokeElement($oButtonOne)

    Local $oButtonZero = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, "0")
    _UIA_Ext_HighlightElement($oButtonZero)
    _UIA_Ext_InvokeElement($oButtonZero)

    Local $oButtonPlus = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, "plus")
    _UIA_Ext_HighlightElement($oButtonPlus)
    _UIA_Ext_InvokeElement($oButtonPlus)
    
    Local $oButtonNine = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, "n..9")
    _UIA_Ext_HighlightElement($oButtonNine)
    _UIA_Ext_InvokeElement($oButtonNine)

    Local $oButtonEqual = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, "equal")
    _UIA_Ext_HighlightElement($oButtonEqual)
    _UIA_Ext_InvokeElement($oButtonEqual)

    Local $oResults = _UIA_Ext_FindElementByRegexProperty($oUIA_Interface, $oWindowElement, ".esults")
    _UIA_Ext_HighlightElement($oResults)

    Local $sProperties = _UIA_GetCurrentPropertyValue($oResults, $UIA_NamePropertyId)
        $sProperties = StringStripWS(StringRegExpReplace($sProperties, "Display is|" & Chr(160), ""), 8)
        ;$sProperties = _UIA_Ext_GetAllElementPropertyValues($oResults, False)

    Local $_iDiff = Round(TimerDiff($_iStartTime) / 1000, 4)
    ConsoleWrite("UIA Calculator Example 3 >> output = " & $sProperties & "; operation completed in: " & $_iDiff & " seconds" & @CRLF)
    MsgBox(64, "UIA Calculator Example 3", "Success! Result is: " & $sProperties & @CRLF & @CRLF & "Operation completed in: " & $_iDiff & " seconds")
EndFunc



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;# Function to prevent unexpected crashes. Used as last resort security measure
Func _ErrFunc($oError)
    ConsoleWrite(@ScriptName & " (" & $oError.scriptline & ") : ==> COM Error intercepted !" & @CRLF & _
            @TAB & "err.number is: " & @TAB & @TAB & "0x" & Hex($oError.number) & @CRLF & _
            @TAB & "err.windescription:" & @TAB & $oError.windescription & @CRLF & _
            @TAB & "err.description is: " & @TAB & $oError.description & @CRLF & _
            @TAB & "err.source is: " & @TAB & @TAB & $oError.source & @CRLF & _
            @TAB & "err.helpfile is: " & @TAB & $oError.helpfile & @CRLF & _
            @TAB & "err.helpcontext is: " & @TAB & $oError.helpcontext & @CRLF & _
            @TAB & "err.lastdllerror is: " & @TAB & $oError.lastdllerror & @CRLF & _
            @TAB & "err.scriptline is: " & @TAB & $oError.scriptline & @CRLF & _
            @TAB & "err.retcode is: " & @TAB & "0x" & Hex($oError.retcode) & @CRLF & @CRLF)

    MsgBox(16, "_ErrFunc - UIA Calculator Examples", "Script has encountered unrecoverable error and will exit to prevent crash.")
    Exit
EndFunc