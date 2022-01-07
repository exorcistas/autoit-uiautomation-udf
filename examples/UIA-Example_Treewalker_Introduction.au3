#include-once
#include <../UIAutomation_Extended.au3>

EXAMPLE_TREEWALKER(1)  ;--_UIA_GetRawViewWalker
EXAMPLE_TREEWALKER(2)   ;--_UIA_GetControlViewWalker
EXAMPLE_TREEWALKER(3)  ;--_UIA_GetContentViewWalker


Func EXAMPLE_TREEWALKER($t)
    Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

    Local $oUIA_Interface = _UIA_InitInterface()
    Local $oRootElement = _UIA_GetRootElement($oUIA_Interface)
    Local $oTreeWalker, $oElementChild, $oElementSubChild
    
    Local $_iStartTime = TimerInit()

	If $t = 1 Then $oTreeWalker = _UIA_GetRawViewWalker($oUIA_Interface)
	If $t = 2 Then $oTreeWalker = _UIA_GetControlViewWalker($oUIA_Interface)
	If $t = 3 Then $oTreeWalker = _UIA_GetContentViewWalker($oUIA_Interface)

    ;-- Get Desktop Element:
    Local $oElement = _UIA_GetFirstChildElement($oTreeWalker, $oRootElement)
    ConsoleWrite(@CRLF & "//******************//" & @CRLF & @CRLF)

    Local $i = 0
    While IsObj($oElement) = True
        _UIA_SetFocus($oElement)
        ;_UIA_Ext_HighlightElement($oElement)
        $_title = _UIA_GetCurrentPropertyValue($oElement, $UIA_NamePropertyId)
        $_handle = _UIA_GetCurrentPropertyValue($oElement, $UIA_NativeWindowHandlePropertyId)
        $_class = _UIA_GetCurrentPropertyValue($oElement, $UIA_ClassNamePropertyId)
        $_controltype = _UIA_Ext_GetControlNameFromId( _UIA_GetCurrentPropertyValue($oElement, $UIA_ControlTypePropertyId) )
        $_position = _UIA_GetCurrentPropertyValue($oElement, $UIA_BoundingRectanglePropertyId)
        $_automationid = _UIA_GetCurrentPropertyValue($oElement, $UIA_AutomationIdPropertyId)

        ConsoleWrite("<" & $i & "> MAIN" & @CRLF & _
                    "Title=" & $_title & @CRLF & _
                    "Handle=" & $_handle & @CRLF & _
                    "Class=" & $_class & @CRLF & _
                    "ControlType=" & $_controltype & @CRLF & _
                    "Position=" & $_position & @CRLF  & _
                    "AutomationId=" & $_automationid & @CRLF & _
                    "******************" & @CRLF & @CRLF)

                    ;-- Second layer deep:
                    $oElementChild = _UIA_GetFirstChildElement($oTreeWalker, $oElement)
                    While IsObj($oElementChild) = True
                        _UIA_SetFocus($oElementChild)
                        ;_UIA_Ext_HighlightElement($oElementChild)
                        $_title = _UIA_GetCurrentPropertyValue($oElementChild, $UIA_NamePropertyId)
                        $_handle = _UIA_GetCurrentPropertyValue($oElementChild, $UIA_NativeWindowHandlePropertyId)
                        $_class = _UIA_GetCurrentPropertyValue($oElementChild, $UIA_ClassNamePropertyId)
                        $_controltype = _UIA_Ext_GetControlNameFromId( _UIA_GetCurrentPropertyValue($oElementChild, $UIA_ControlTypePropertyId) )
                        $_position = _UIA_GetCurrentPropertyValue($oElementChild, $UIA_BoundingRectanglePropertyId)
                        $_automationid = _UIA_GetCurrentPropertyValue($oElementChild, $UIA_AutomationIdPropertyId)
                
                        ConsoleWrite(@TAB & @TAB & "<" & $i & "> CHILD" & @CRLF & @TAB & @TAB & _
                                    "Title=" & $_title & @CRLF & @TAB & @TAB & _
                                    "Handle=" & $_handle & @CRLF & @TAB & @TAB & _
                                    "Class=" & $_class & @CRLF & @TAB & @TAB & _
                                    "ControlType=" & $_controltype & @CRLF & @TAB & @TAB & _
                                    "Position=" & $_position & @CRLF & @TAB & @TAB & _
                                    "AutomationId=" & $_automationid & @CRLF & @TAB & @TAB & _
                                    "******************" & @CRLF & @CRLF)

                                    ;-- Third layer deep:
                                    $oElementSubChild = _UIA_GetFirstChildElement($oTreeWalker, $oElementChild)
                                    While IsObj($oElementSubChild) = True
                                        _UIA_SetFocus($oElementSubChild)
                                        ;_UIA_Ext_HighlightElement($oElementSubChild)
                                        $_title = _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_NamePropertyId)
                                        $_handle = _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_NativeWindowHandlePropertyId)
                                        $_class = _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_ClassNamePropertyId)
                                        $_controltype = _UIA_Ext_GetControlNameFromId( _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_ControlTypePropertyId) )
                                        $_position = _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_BoundingRectanglePropertyId)
                                        $_automationid = _UIA_GetCurrentPropertyValue($oElementSubChild, $UIA_AutomationIdPropertyId)
                                
                                        ConsoleWrite(@TAB & @TAB & @TAB & @TAB & "<" & $i & "> SUBCHILD" & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "Title=" & $_title & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "Handle=" & $_handle & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "Class=" & $_class & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "ControlType=" & $_controltype & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "Position=" & $_position & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "AutomationId=" & $_automationid & @CRLF & @TAB & @TAB & @TAB & @TAB & _
                                                    "******************" & @CRLF & @CRLF)
                                            
                                        $oElementSubChild = _UIA_GetNextSiblingElement($oTreeWalker, $oElementSubChild)
                                    WEnd
                                    $oElementSubChild = 0
                            
                        $oElementChild = _UIA_GetNextSiblingElement($oTreeWalker, $oElementChild)
                    WEnd
                    $oElementChild = 0
            
        $oElement = _UIA_GetNextSiblingElement($oTreeWalker, $oElement)
		$i = $i + 1
    WEnd
    
    ConsoleWrite(@CRLF & "//******************//" & @CRLF & @CRLF)
	Local $_iDiff = Round(TimerDiff($_iStartTime) / 1000, 4)
    Consolewrite("Example Treewalker " & $t & " operation completed in: " & $_iDiff & " seconds" & @CRLF & @CRLF)
    MsgBox(64, "Example Treewalker " & $t, "Operation completed in: " & $_iDiff & " seconds")
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

    MsgBox(16, "_ErrFunc - UIA Treewalker Examples", "Script has encountered unrecoverable error and will exit to prevent crash.")
    Exit
EndFunc