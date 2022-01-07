#include-once

#Region UIA_ENUM_TREESCOPE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-treescope
	Global Const $TreeScope_Element = 1
	Global Const $TreeScope_Children = 2
	Global Const $TreeScope_Descendants = 4
	Global Const $TreeScope_Parent = 8
	Global Const $TreeScope_Ancestors = 16
	Global Const $TreeScope_Subtree = 7
#EndRegion UIA_ENUM_TREESCOPE

#Region UIA_ENUM_ELEMENT_NODE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-automationelementmode
	Global Const $AutomationElementMode_None = 0
	Global Const $AutomationElementMode_Full = 1
#EndRegion UIA_ENUM_ELEMENT_NODE

#Region UIA_ENUM_ORIENTATION_TYPE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-orientationtype
	Global Const $OrientationType_None = 0
	Global Const $OrientationType_Horizontal = 1
	Global Const $OrientationType_Vertical = 2
#EndRegion UIA_ENUM_ORIENTATION_TYPE

#Region UIA_ENUM_PROPERTY_CONDITION_FLAGS
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags
	Global Const $PropertyConditionFlags_None = 0
	Global Const $PropertyConditionFlags_IgnoreCase = 1
	Global Const $PropertyConditionFlags_MatchSubstring = 2
#EndRegion UIA_ENUM_PROPERTY_CONDITION_FLAGS

#Region UIA_ENUM_STRUCTURE_CHANGE_TYPE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-structurechangetype
	Global Const $StructureChangeType_ChildAdded = 0
	Global Const $StructureChangeType_ChildRemoved = 1
	Global Const $StructureChangeType_ChildrenInvalidated = 2
	Global Const $StructureChangeType_ChildrenBulkAdded = 3
	Global Const $StructureChangeType_ChildrenBulkRemoved = 4
	Global Const $StructureChangeType_ChildrenReordered = 5
#EndRegion UIA_ENUM_STRUCTURE_CHANGE_TYPE

#Region UIA_ENUM_DOCK_POSITION
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-dockposition
	Global Const $DockPosition_Top = 0
	Global Const $DockPosition_Left = 1
	Global Const $DockPosition_Bottom = 2
	Global Const $DockPosition_Right = 3
	Global Const $DockPosition_Fill = 4
	Global Const $DockPosition_None = 5
#EndRegion UIA_ENUM_DOCK_POSITION

#Region UIA_ENUM_EXPAND_COLLAPSE_STATE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-expandcollapsestate
	Global Const $ExpandCollapseState_Collapsed = 0
	Global Const $ExpandCollapseState_Expanded = 1
	Global Const $ExpandCollapseState_PartiallyExpanded = 2
	Global Const $ExpandCollapseState_LeafNode = 3
#EndRegion UIA_ENUM_EXPAND_COLLAPSE_STATE

#Region UIA_ENUM_SCROLL_AMOUNT
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-scrollamount
	Global Const $ScrollAmount_LargeDecrement = 0
	Global Const $ScrollAmount_SmallDecrement = 1
	Global Const $ScrollAmount_NoAmount = 2
	Global Const $ScrollAmount_LargeIncrement = 3
	Global Const $ScrollAmount_SmallIncrement = 4
#EndRegion UIA_ENUM_SCROLL_AMOUNT

#Region UIA_ENUM_SYNC_INPUT_TYPE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype
	Global Const $SynchronizedInputType_KeyUp = 1
	Global Const $SynchronizedInputType_KeyDown = 2
	Global Const $SynchronizedInputType_LeftMouseUp = 4
	Global Const $SynchronizedInputType_LeftMouseDown = 8
	Global Const $SynchronizedInputType_RightMouseUp = 16
	Global Const $SynchronizedInputType_RightMouseDown = 32
#EndRegion UIA_ENUM_SYNC_INPUT_TYPE

#Region UIA_ENUM_ROW_COLUMN_MAJOR
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-roworcolumnmajor
	Global Const $RowOrColumnMajor_RowMajor = 0
	Global Const $RowOrColumnMajor_ColumnMajor = 1
	Global Const $RowOrColumnMajor_Indeterminate = 2
#EndRegion UIA_ENUM_ROW_COLUMN_MAJOR

#Region UIA_ENUM_TOGGLE_STATE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-togglestate
	Global Const $ToggleState_Off = 0
	Global Const $ToggleState_On = 1
	Global Const $ToggleState_Indeterminate = 2
#EndRegion UIA_ENUM_TOGGLE_STATE

#Region UIA_ENUM_WINDOW_VISUAL_STATE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowvisualstate
	Global Const $WindowVisualState_Normal = 0
	Global Const $WindowVisualState_Maximized = 1
	Global Const $WindowVisualState_Minimized = 2
#EndRegion UIA_ENUM_WINDOW_VISUAL_STATE

#Region UIA_ENUM_WINDOW_INTERACTION_STATE
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-windowinteractionstate
	Global Const $WindowInteractionState_Running = 0
	Global Const $WindowInteractionState_Closing = 1
	Global Const $WindowInteractionState_ReadyForUserInteraction = 2
	Global Const $WindowInteractionState_BlockedByModalWindow = 3
	Global Const $WindowInteractionState_NotResponding = 4
#EndRegion UIA_ENUM_WINDOW_INTERACTION_STATE

#Region UIA_ENUM_TEXT_PATTERN_RANGE_ENDPOINT
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-textpatternrangeendpoint
	Global Const $TextPatternRangeEndpoint_Start = 0
	Global Const $TextPatternRangeEndpoint_End = 1
#EndRegion UIA_ENUM_TEXT_PATTERN_RANGE_ENDPOINT

#Region UIA_ENUM_TEXT_UNIT
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-textunit
	Global Const $TextUnit_Character = 0
	Global Const $TextUnit_Format = 1
	Global Const $TextUnit_Word = 2
	Global Const $TextUnit_Line = 3
	Global Const $TextUnit_Paragraph = 4
	Global Const $TextUnit_Page = 5
	Global Const $TextUnit_Document = 6
#EndRegion UIA_ENUM_TEXT_UNIT

#Region UIA_ENUM_SUPPORTED_TEXT_SELECTION
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-supportedtextselection
	Global Const $SupportedTextSelection_None = 0
	Global Const $SupportedTextSelection_Single = 1
	Global Const $SupportedTextSelection_Multiple = 2
#EndRegion UIA_ENUM_SUPPORTED_TEXT_SELECTION

#Region UIA_ENUM_PROVIDER_OPTIONS
	;-- https://docs.microsoft.com/en-us/windows/win32/api/uiautomationcore/ne-uiautomationcore-provideroptions
	Global Const $ProviderOptions_ClientSideProvider = 1
	Global Const $ProviderOptions_ServerSideProvider = 2
	Global Const $ProviderOptions_NonClientAreaProvider = 4
	Global Const $ProviderOptions_OverrideProvider = 8
	Global Const $ProviderOptions_ProviderOwnsSetFocus = 16
	Global Const $ProviderOptions_UseComThreading = 32
#EndRegion UIA_ENUM_PROVIDER_OPTIONS