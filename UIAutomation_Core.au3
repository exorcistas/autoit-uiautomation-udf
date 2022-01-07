#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7
#cs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Name..................: UIAutomation_Core
    Description...........: UIAutomation Framework library for AutoIt
    
    Dependencies..........: UIAutomation environment; UIAutomation_Constants.au3
    Documentation.........: https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-msaa
                            https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32
                            https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation
                            https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiautocore-ref

    Author................: exorcistas@github.com
    Modified..............: 2021-03-25
    Version...............: v0.4.1rc
#ce ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#include-once
#include <Constants.au3>
#include <Array.au3>
#include <UIAutomation_Constants.au3>

#Region FUNCTIONS_LIST
#cs	===================================================================================================================================
    _UIA_InitInterface()
    _UIA_GetRootElement($_oUIA_Interface)
    _UIA_GetControlViewWalker($_oUIA_Interface)
    _UIA_GetRawViewWalker($_oUIA_Interface)
    _UIA_GetContentViewWalker($_oUIA_Interface)

    _UIA_CreateTrueCondition($_oUIA_Interface)
    _UIA_CreateFalseCondition($_oUIA_Interface)
    _UIA_CreateNotCondition($_oUIA_Interface, $_oCondition)
    _UIA_CreateAndCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
    _UIA_CreateOrCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
    _UIA_CreatePropertyCondition($_oUIA_Interface, $_iPropertyId, $_sCondition)
    _UIA_CreatePropertyConditionEx($_oUIA_Interface, $_iPropertyId, $_sCondition, $_iPropertyConditionFlag = $PropertyConditionFlags_IgnoreCase)

    _UIA_FindFirst($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
    _UIA_FindAll($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
    _UIA_GetElement($_oElementArray, $_index = 0)
    _UIA_GetCurrentPropertyValue($_oElement, $_iPropertyId)
    _UIA_GetFirstChildElement($_oTreeWalker, $_oElement)
    _UIA_GetNextSiblingElement($_oTreeWalker, $_oElement)
    _UIA_GetCurrentPattern($_oElement, $_iPatternId)
    _UIA_GetFocusedElement($_oUIA_Interface)
    _UIA_GetParentElement($_oTreeWalker, $_oElement)
    _UIA_CurrentNativeWindowHandle($_oElement)
    _UIA_SetFocus($_oElement)
    _UIA_ElementFromHandle($_oUIA_Interface, $_iHWnd)
#ce	===================================================================================================================================
#EndRegion FUNCTIONS_LIST

#Region UIA_CORE_FUNCTIONS

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_InitInterface()
        Description ...: Creates main object for UIAutomation (implements the IUIAutomation interface)
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-creatingcuiautomation
                         https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/ff384838(v=vs.85)?redirectedfrom=MSDN

        Global vars....: $__UIA_sCLSID_CUIAutomation, $__UIA_sIID_IUIAutomation, $__UIA_dtagIUIAutomation
        Parameters.....: -
        Return values..: Success - returns object interface
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_InitInterface()
        Local $_oUIA_Interface = ObjCreateInterface($__UIA_sCLSID_CUIAutomation, $__UIA_sIID_IUIAutomation, $__UIA_dtagIUIAutomation)
            If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)

        Return $_oUIA_Interface
    Endfunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetRootElement($_oUIA_Interface)
        Description ...: Retrieves the UI Automation element that represents the desktop
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns object value
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetRootElement($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_oRootElement

        $_oUIA_Interface.GetRootElement($_oRootElement)
        $_oRootElement = ObjCreateInterface($_oRootElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oRootElement) Then Return SetError(2, 0, False)

        Return $_oRootElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetControlViewWalker($_oUIA_Interface)
        Description ...: Retrieves an IUIAutomationTreeWalker interface used to discover control elements
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewwalker

        Global vars....: $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns object value
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetControlViewWalker($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_oTreeWalker

        $_oUIA_Interface.ControlViewWalker($_oTreeWalker)
        $_oTreeWalker = ObjCreateInterface($_oTreeWalker, $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker)
            If NOT IsObj($_oTreeWalker) Then Return SetError(2, 0, False)

        Return $_oTreeWalker
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetRawViewWalker($_oUIA_Interface)
        Description ...: Retrieves a tree walker object used to traverse an unfiltered view of the Microsoft UI Automation tree
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewwalker

        Global vars....: $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns object value
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetRawViewWalker($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_oTreeWalker

        $_oUIA_Interface.RawViewWalker($_oTreeWalker)
        $_oTreeWalker = ObjCreateInterface($_oTreeWalker, $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker)
            If NOT IsObj($_oTreeWalker) Then Return SetError(2, 0, False)

        Return $_oTreeWalker
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetContentViewWalker($_oUIA_Interface)
        Description ...: Retrieves an IUIAutomationTreeWalker interface used to discover content elements
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewwalker

        Global vars....: $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns object value
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetContentViewWalker($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_oTreeWalker

        $_oUIA_Interface.ContentViewWalker($_oTreeWalker)
        $_oTreeWalker = ObjCreateInterface($_oTreeWalker, $__UIA_sIID_IUIAutomationTreeWalker, $__UIA_dtagIUIAutomationTreeWalker)
            If NOT IsObj($_oTreeWalker) Then Return SetError(2, 0, False)

        Return $_oTreeWalker
    EndFunc

#EndRegion UIA_CORE_FUNCTIONS

#Region UIA_CONDITION_FUNCTIONS

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreateTrueCondition($_oUIA_Interface)
        Description ...: Retrieves a predefined condition that selects all elements
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtruecondition

        Global vars....: $__UIA_sIID_IUIAutomationCondition, $__UIA_dtagIUIAutomationCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_CreateTrueCondition($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_ptrTrueCondition

        $_oUIA_Interface.CreateTrueCondition($_ptrTrueCondition)
        Local $_oTrueCondition = ObjCreateInterface($_ptrTrueCondition, $__UIA_sIID_IUIAutomationCondition, $__UIA_dtagIUIAutomationCondition)
            If NOT IsObj($_oTrueCondition) Then Return SetError(2, 0, False)

        Return $_oTrueCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreateFalseCondition($_oUIA_Interface)
        Description ...: Creates a condition that is always false
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createfalsecondition

        Global vars....: $__UIA_sIID_IUIAutomationCondition, $__UIA_dtagIUIAutomationCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_CreateFalseCondition($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_ptrFalseCondition

        $_oUIA_Interface.CreateFalseCondition($_ptrFalseCondition)
        Local $_oFalseCondition = ObjCreateInterface($_ptrFalseCondition, $__UIA_sIID_IUIAutomationCondition, $__UIA_dtagIUIAutomationCondition)
            If NOT IsObj($_oFalseCondition) Then Return SetError(2, 0, False)

        Return $_oFalseCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreateNotCondition($_oUIA_Interface, $_oCondition)
        Description ...: Creates a condition that is the negative of a specified condition
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createnotcondition

        Global vars....: $__UIA_sIID_IUIAutomationNotCondition, $__UIA_dtagIUIAutomationNotCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object
        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.02.01
    #ce ===============================================================================================================================
    Func _UIA_CreateNotCondition($_oUIA_Interface, $_oCondition)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_ptrNotCondition

        $_oUIA_Interface.CreateNotCondition($_oCondition, $_ptrNotCondition)
        Local $_oNotCondition = ObjCreateInterface($_ptrNotCondition, $__UIA_sIID_IUIAutomationNotCondition, $__UIA_dtagIUIAutomationNotCondition)
            If NOT IsObj($_oNotCondition) Then Return SetError(2, 0, False)

        Return $_oNotCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreateAndCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
        Description ...: Creates a condition that selects elements that match both of two conditions
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandcondition

        Global vars....: $__UIA_sIID_IUIAutomationAndCondition, $__UIA_dtagIUIAutomationAndCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object;
                         $_oCondition1, $_oCondition2 - see: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition

        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.02.01
    #ce ===============================================================================================================================
    Func _UIA_CreateAndCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
        If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oCondition1)) OR (IsObj($_oCondition2)) ) Then Return SetError(1, @extended, False)
        Local $_ptrAndCondition

        $_oUIA_Interface.CreateAndCondition($_oCondition1, $_oCondition2, $_ptrAndCondition)
        Local $_oAndCondition = ObjCreateInterface($_ptrAndCondition, $__UIA_sIID_IUIAutomationAndCondition, $__UIA_dtagIUIAutomationAndCondition)
            If NOT IsObj($_oAndCondition) Then Return SetError(2, 0, False)

        Return $_oAndCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreateOrCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
        Description ...: Creates a combination of two conditions where a match exists if either of the conditions is true
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorcondition

        Global vars....: $__UIA_sIID_IUIAutomationOrCondition, $__UIA_dtagIUIAutomationOrCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object;
                         $_oCondition1, $_oCondition2 - see: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition

        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.02.01
    #ce ===============================================================================================================================
    Func _UIA_CreateOrCondition($_oUIA_Interface, $_oCondition1, $_oCondition2)
        If NOT ( (IsObj($_oUIA_Interface)) OR (IsObj($_oCondition1)) OR (IsObj($_oCondition2)) ) Then Return SetError(1, @extended, False)
        Local $_ptrOrCondition

        $_oUIA_Interface.CreateOrCondition($_oCondition1, $_oCondition2, $_ptrOrCondition)
        Local $_oOrCondition = ObjCreateInterface($_ptrOrCondition, $__UIA_sIID_IUIAutomationOrCondition, $__UIA_dtagIUIAutomationOrCondition)
            If NOT IsObj($_oOrCondition) Then Return SetError(2, 0, False)

        Return $_oOrCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreatePropertyCondition($_oUIA_Interface, $_iPropertyId, $_sCondition)
        Description ...: Creates a condition that selects elements that have a property with the specified value
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertycondition

        Global vars....: $__UIA_sIID_IUIAutomationPropertyCondition, $__UIA_dtagIUIAutomationPropertyCondition
        Parameters.....: $_oUIA_Interface - UIA Interface object;
                         $_iPropertyId, $_sCondition - see: https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-entry-propids

        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_CreatePropertyCondition($_oUIA_Interface, $_iPropertyId, $_sCondition)
        If NOT ( (IsObj($_oUIA_Interface)) OR (IsNumber($_iPropertyId)) OR (StringLen($_sCondition) > 0) ) Then Return SetError(1, @extended, False)
        Local $_ptrPropCondition

        $_oUIA_Interface.CreatePropertyCondition($_iPropertyId, $_sCondition, $_ptrPropCondition)
        Local $_oPropCondition = ObjCreateInterface($_ptrPropCondition, $__UIA_sIID_IUIAutomationPropertyCondition, $__UIA_dtagIUIAutomationPropertyCondition)
            If NOT IsObj($_oPropCondition) Then Return SetError(2, 0, False)

        Return $_oPropCondition
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CreatePropertyConditionEx($_oUIA_Interface, $_iPropertyId, $_sCondition, $_iPropertyConditionFlag = $PropertyConditionFlags_IgnoreCase)
        Description ...: reates a condition that selects elements that have a property with the specified value, using optional flags
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertyconditionex

        Global vars....: $__UIA_sIID_IUIAutomationPropertyCondition, $__UIA_dtagIUIAutomationPropertyCondition, $PropertyConditionFlags_IgnoreCase
        Parameters.....: $_oUIA_Interface - UIA Interface object;
                         $_iPropertyId, $_sCondition - see: https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-entry-propids;
                         $_iPropertyConditionFlag - see: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags

        Return values..: Success - returns condition object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.02.01
    #ce ===============================================================================================================================
    Func _UIA_CreatePropertyConditionEx($_oUIA_Interface, $_iPropertyId, $_sCondition, $_iPropertyConditionFlag = $PropertyConditionFlags_IgnoreCase)
        If NOT ( (IsObj($_oUIA_Interface)) OR (IsNumber($_iPropertyId)) OR (StringLen($_sCondition) > 0) ) Then Return SetError(1, @extended, False)
        Local $_ptrPropConditionEx

        $_oUIA_Interface.CreatePropertyConditionEx($_iPropertyId, $_sCondition, $_iPropertyConditionFlag, $_ptrPropConditionEx)
        Local $_oPropConditionEx = ObjCreateInterface($_ptrPropConditionEx, $__UIA_sIID_IUIAutomationPropertyCondition, $__UIA_dtagIUIAutomationPropertyCondition)
            If NOT IsObj($_oPropConditionEx) Then Return SetError(2, 0, False)

        Return $_oPropConditionEx
    EndFunc

#EndRegion UIA_CONDITION_FUNCTIONS

#Region UIA_ELEMENT_FUNCTIONS

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_FindFirst($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
        Description ...: Retrieves the first child or descendant element that matches the specified condition
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oParentElement - element object to start from;
                         $_oCondition - condition object to satisfy search;
                         $_iTreeScope - see: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-treescope

        Return values..: Success - returns element object of selected element
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_FindFirst($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
        If NOT ( (IsObj($_oParentElement)) OR (IsObj($_oCondition)) OR (IsNumber($_iTreeScope)) ) Then Return SetError(1, 0, False)
        Local $_ptrElement

        $_oParentElement.FindFirst($_iTreeScope, $_oCondition, $_ptrElement)
        Local $_oElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oElement) Then Return SetError(2, 0, False)

        Return $_oElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_FindAll($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
        Description ...: Returns all UI Automation elements that satisfy the specified condition
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall

        Global vars....: $__UIA_sIID_IUIAutomationElementArray, $__UIA_dtagIUIAutomationElementArray, $TreeScope_Descendants
        Parameters.....: $_oParentElement - element object to start from;
                         $_oCondition - condition object to satisfy search;
                         $_iTreeScope - see: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-treescope

        Return values..: Success - returns element array object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_FindAll($_oParentElement, $_oCondition, $_iTreeScope = $TreeScope_Descendants)
        If NOT ( (IsObj($_oParentElement)) OR (IsObj($_oCondition)) OR (IsNumber($_iTreeScope)) ) Then Return SetError(1, 0, False)
        Local $_ptrElements

        $_oParentElement.FindAll($_iTreeScope, $_oCondition, $_ptrElements)
        Local $_oElementArray = ObjCreateInterface($_ptrElements, $__UIA_sIID_IUIAutomationElementArray, $__UIA_dtagIUIAutomationElementArray)
            If NOT IsObj($_oElementArray) Then Return SetError(2, 0, False)

        Return $_oElementArray
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetElement($_oElementArray, $_index = 0)
        Description ...: Retrieves a Microsoft UI Automation element from the collection
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelementarray-getelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oElementArray - array of element objects;
                         $_index - index number in array (starts with 0)

        Return values..: Success - returns element object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetElement($_oElementArray, $_index = 0)
        If NOT ( (IsObj($_oElementArray)) OR (IsNumber($_index)) ) Then Return SetError(1, 0, False)
        Local $_ptrElement

        $_oElementArray.GetElement($_index, $_ptrElement)
        Local $_oElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oElement) Then Return SetError(2, 0, False)

        Return $_oElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetCurrentPropertyValue($_oElement, $_iPropertyId)
        Description ...: Retrieves the current value of a property for this UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oElement - object of element;
                         $_iPropertyId - see: https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids

        Return values..: Success - returns selected property value from element
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.01.31
    #ce ===============================================================================================================================
    Func _UIA_GetCurrentPropertyValue($_oElement, $_iPropertyId)
        If NOT ( (IsObj($_oElement)) OR (IsNumber($_iPropertyId)) ) Then Return SetError(100+@error, @extended, False)
        Local $_aValueArray, $_sValueString, $i
        $_oElement.GetCurrentPropertyValue($_iPropertyId, $_aValueArray)

        $_sValueString = "" & $_aValueArray
        If NOT IsArray($_aValueArray) Then Return $_sValueString

        $_sValueString = ""
        For $i = 0 To UBound($_aValueArray) - 1
            $_sValueString = $_sValueString & StringStripWS($_aValueArray[$i], $STR_STRIPLEADING + $STR_STRIPTRAILING)
            If $i <> UBound($_aValueArray) - 1 Then $_sValueString = $_sValueString & ";"
        Next

        If $_iPropertyId = $UIA_NativeWindowHandlePropertyId Then $_sValueString = Hex($_sValueString)
        Return $_sValueString
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetFirstChildElement($_oTreeWalker, $_oElement)
        Description ...: Retrieves the first child element of the specified UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oTreeWalker - Treewalker object to use
                         $_oElement - object of element;

        Return values..: Success - returns child element object of selected element
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetFirstChildElement($_oTreeWalker, $_oElement)
        If NOT ( (IsObj($_oTreeWalker)) OR (IsObj($_oElement)) ) Then Return SetError(1, 0, False)
        Local $_ptrElement

        $_oTreeWalker.GetFirstChildElement($_oElement, $_ptrElement)
        Local $_oChildElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oChildElement) Then Return SetError(2, 0, False)

        Return $_oChildElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetNextSiblingElement($_oTreeWalker, $_oElement)
        Description ...: Retrieves the next sibling element of the specified UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oTreeWalker - Treewalker object to use
                         $_oElement - object of element;

        Return values..: Success - returns sibling element object of selected element
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetNextSiblingElement($_oTreeWalker, $_oElement)
        If NOT ( (IsObj($_oTreeWalker)) OR (IsObj($_oElement)) ) Then Return SetError(1, 0, False)
        Local $_ptrElement

        $_oTreeWalker.GetNextSiblingElement($_oElement, $_ptrElement)
        Local $_oSiblingElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oSiblingElement) Then Return SetError(2, 0, False)

        Return $_oSiblingElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetCurrentPattern($_oElement, $_iPatternId)
        Description ...: Retrieves the IUnknown interface of the specified control pattern on this UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern

        Global vars....: $__UIA_PatternArray
        Parameters.....: $_oElement - object of element;
                         $_iPatternId - see: https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids

        Return values..: Success - returns element object of selected element
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.02.01
    #ce ===============================================================================================================================
    Func _UIA_GetCurrentPattern($_oElement, $_iPatternId)
        If NOT ( (IsObj($_oElement)) OR (IsNumber($_iPatternId)) ) Then Return SetError(100, 0, False)
        Local $_ptrPattern, $_UIA_sIID_Pattern, $_UIA_sdTagPattern

        Local $i = _ArrayBinarySearch($__UIA_PatternArray, $_iPatternId)
            If @error Then Return SetError(200+@error, 0, False)

        $_UIA_sIID_Pattern = $__UIA_PatternArray[$i][1]
        $_UIA_sdTagPattern = $__UIA_PatternArray[$i][2]
        #cs
            For $i = 0 To UBound($__UIA_PatternArray) - 1
                If $__UIA_PatternArray[$i][0] = $_iPatternId Then
                    $_UIA_sIID_Pattern = $__UIA_PatternArray[$i][1]
                    $_UIA_sdTagPattern = $__UIA_PatternArray[$i][2]
                    ExitLoop
                EndIf
            Next
        #ce

        $_oElement.GetCurrentPattern($_iPatternId, $_ptrPattern)
        Local $oPattern = ObjCreateInterface($_ptrPattern, $_UIA_sIID_Pattern, $_UIA_sdTagPattern)
            If NOT IsObj($oPattern) Then Return SetError(300, 0, False)

        Return $oPattern
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetFocusedElement($_oUIA_Interface)
        Description ...: Retrieves the UI Automation element that has the input focus
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oUIA_Interface - UIA Interface object

        Return values..: Success - returns element object that is currently selected/focused in GUI globally
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetFocusedElement($_oUIA_Interface)
        If NOT IsObj($_oUIA_Interface) Then Return SetError(1, 0, False)
        Local $_ptrElement

        $_oUIA_Interface.GetFocusedElement($_ptrElement)
        Local $_oElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oElement) Then Return SetError(2, 0, False)

        Return $_oElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_GetParentElement($_oTreeWalker, $_oElement)
        Description ...: Retrieves the parent element of the specified UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getparentelement

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oTreeWalker - Treewalker object to use
                         $_oElement - object of element;

        Return values..: Success - returns element object that is currently selected/focused in GUI globally
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020-01-30
    #ce ===============================================================================================================================
    Func _UIA_GetParentElement($_oTreeWalker, $_oElement)
        If NOT ( (IsObj($_oTreeWalker)) OR (IsObj($_oElement)) ) Then Return SetError(1, 0, False)
        Local $_ptrParent

        $_oTreeWalker.GetParentElement($_oElement, $_ptrParent)
        Local $_oParentElement = ObjCreateInterface($_ptrParent, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oParentElement) Then Return SetError(2, 0, False)

        Return $_oParentElement
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_CurrentNativeWindowHandle($_oElement)
        Description ...: Retrieves the window handle of the element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentnativewindowhandle

        Global vars....: -
        Parameters.....: $_oElement - object of element

        Return values..: Success - returns element window handle
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.01.31
    #ce ===============================================================================================================================
    Func _UIA_CurrentNativeWindowHandle($_oElement)
        If NOT (IsObj($_oElement)) Then Return SetError(1, 0, False)
        Local $_iHWnd = 0

        $_oElement.CurrentNativeWindowHandle($_iHWnd)

        Return $_iHWnd
    EndFunc

    #cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_SetFocus($_oElement)
        Description ...: Sets the keyboard focus to this UI Automation element
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus

        Global vars....: -
        Parameters.....: $_oElement - object of element

        Return values..: Success - returns TRUE
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2020.01.31
    #ce ===============================================================================================================================
    Func _UIA_SetFocus($_oElement)
        If NOT (IsObj($_oElement)) Then Return SetError(1, 0, False)

        $_oElement.SetFocus()

        Return True
    EndFunc

	#cs #FUNCTION# ====================================================================================================================
        Name...........: _UIA_ElementFromHandle($_oUIA_Interface, $_iHWnd)
        Description ...: Retrieves a UI Automation element for the specified window/control.
        Syntax.........: https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandle

        Global vars....: $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement
        Parameters.....: $_oUIA_Interface - UIA Interface object
                         $_iHWnd - window/control handle

        Return values..: Success - returns element object
                         Failure - returns FALSE, sets @error + @extended
        Author ........: exorcistas@github.com
        Modified.......: 2021-03-25
    #ce ===============================================================================================================================
    Func _UIA_ElementFromHandle($_oUIA_Interface, $_iHWnd)
	    If NOT ((IsObj($_oUIA_Interface)) OR (IsHWnd($_iHWnd))) Then Return SetError(1, 0, False)
		Local $_ptrElement

        $_oUIA_Interface.ElementFromHandle($_iHWnd, $_ptrElement)
        Local $_oElement = ObjCreateInterface($_ptrElement, $__UIA_sIID_IUIAutomationElement, $__UIA_dtagIUIAutomationElement)
            If NOT IsObj($_oElement) Then Return SetError(2, 0, False)

        Return $_oElement
    EndFunc

#EndRegion UIA_ELEMENT_FUNCTIONS