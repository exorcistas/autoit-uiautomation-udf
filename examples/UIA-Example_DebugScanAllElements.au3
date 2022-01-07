#include-once
#include <../UIAutomation_Extended.au3>

EXAMPLE_DEBUG()
Func EXAMPLE_DEBUG()
    MsgBox(48, "UIA Debug Scan Example", "Warning! This scanning method can be very disruptive and may result in Stack overflow errors if there are too many elements present in the interface.")
    $oUIA_Interface = _UIA_InitInterface()
    $oRootElement = _UIA_GetRootElement($oUIA_Interface)

    $_iStartTime = TimerInit()
    _UIA_Ext_DebugScanElements($oUIA_Interface, $oRootElement, $TreeScope_Descendants)
    $_iDiff = Round(TimerDiff($_iStartTime) / 1000, 2)
    MsgBox(64, "UIA Debug Scan Elements Example", "Success! Task finished in " & $_iDiff & " seconds.")
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

    MsgBox(16, "_ErrFunc - UIA Debug Scan Examples", "Script has encountered unrecoverable error and will exit to prevent crash.")
    Exit
EndFunc