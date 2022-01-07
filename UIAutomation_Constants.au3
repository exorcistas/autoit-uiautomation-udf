#include-once
#include <UIAutomation_Const_Modules.au3>
#include <UIAutomation_Const_Enumerations.au3>

#Region UIA_CLASSES
	Global Const $__UIA_sCLSID_CUIAutomation = "{FF48DBA4-60EF-4201-AA87-54103EEF594E}"		;The Central Class for UIAutomation
	Global Const $__UIA_sCLSID_UIAutomationClient = "{944DE083-8FB8-45CF-BCB7-C477ACB2F897}"
#EndRegion Region UIA_CLASSES

#Region UIA_INTERFACE_&_STRUCTURE
	Global Const $__UIA_sIID_IUIAutomationElement = "{D22108AA-8AC5-49A5-837B-37BBB3D7591E}"
	Global $__UIA_dtagIUIAutomationElement = _
									"SetFocus hresult();" & _
									"GetRuntimeId hresult(ptr*);" & _
									"FindFirst hresult(long;ptr;ptr*);" & _
									"FindAll hresult(long;ptr;ptr*);" & _
									"FindFirstBuildCache hresult(long;ptr;ptr;ptr*);" & _
									"FindAllBuildCache hresult(long;ptr;ptr;ptr*);" & _
									"BuildUpdatedCache hresult(ptr;ptr*);" & _
									"GetCurrentPropertyValue hresult(int;variant*);" & _
									"GetCurrentPropertyValueEx hresult(int;long;variant*);" & _
									"GetCachedPropertyValue hresult(int;variant*);" & _
									"GetCachedPropertyValueEx hresult(int;long;variant*);" & _
									"GetCurrentPatternAs hresult(int;none;none*);" & _
									"GetCachedPatternAs hresult(int;none;none*);" & _
									"GetCurrentPattern hresult(int;ptr*);" & _
									"GetCachedPattern hresult(int;ptr*);" & _
									"GetCachedParent hresult(ptr*);" & _
									"GetCachedChildren hresult(ptr*);" & _
									"CurrentProcessId hresult(int*);" & _
									"CurrentControlType hresult(int*);" & _
									"CurrentLocalizedControlType hresult(bstr*);" & _
									"CurrentName hresult(bstr*);" & _
									"CurrentAcceleratorKey hresult(bstr*);" & _
									"CurrentAccessKey hresult(bstr*);" & _
									"CurrentHasKeyboardFocus hresult(long*);" & _
									"CurrentIsKeyboardFocusable hresult(long*);" & _
									"CurrentIsEnabled hresult(long*);" & _
									"CurrentAutomationId hresult(bstr*);" & _
									"CurrentClassName hresult(bstr*);" & _
									"CurrentHelpText hresult(bstr*);" & _
									"CurrentCulture hresult(int*);" & _
									"CurrentIsControlElement hresult(long*);" & _
									"CurrentIsContentElement hresult(long*);" & _
									"CurrentIsPassword hresult(long*);" & _
									"CurrentNativeWindowHandle hresult(hwnd*);" & _
									"CurrentItemType hresult(bstr*);" & _
									"CurrentIsOffscreen hresult(long*);" & _
									"CurrentOrientation hresult(long*);" & _
									"CurrentFrameworkId hresult(bstr*);" & _
									"CurrentIsRequiredForForm hresult(long*);" & _
									"CurrentItemStatus hresult(bstr*);" & _
									"CurrentBoundingRectangle hresult(struct*);" & _
									"CurrentLabeledBy hresult(ptr*);" & _
									"CurrentAriaRole hresult(bstr*);" & _
									"CurrentAriaProperties hresult(bstr*);" & _
									"CurrentIsDataValidForForm hresult(long*);" & _
									"CurrentControllerFor hresult(ptr*);" & _
									"CurrentDescribedBy hresult(ptr*);" & _
									"CurrentFlowsTo hresult(ptr*);" & _
									"CurrentProviderDescription hresult(bstr*);" & _
									"CachedProcessId hresult(int*);" & _
									"CachedControlType hresult(int*);" & _
									"CachedLocalizedControlType hresult(bstr*);" & _
									"CachedName hresult(bstr*);" & _
									"CachedAcceleratorKey hresult(bstr*);" & _
									"CachedAccessKey hresult(bstr*);" & _
									"CachedHasKeyboardFocus hresult(long*);" & _
									"CachedIsKeyboardFocusable hresult(long*);" & _
									"CachedIsEnabled hresult(long*);" & _
									"CachedAutomationId hresult(bstr*);" & _
									"CachedClassName hresult(bstr*);" & _
									"CachedHelpText hresult(bstr*);" & _
									"CachedCulture hresult(int*);" & _
									"CachedIsControlElement hresult(long*);" & _
									"CachedIsContentElement hresult(long*);" & _
									"CachedIsPassword hresult(long*);" & _
									"CachedNativeWindowHandle hresult(hwnd*);" & _
									"CachedItemType hresult(bstr*);" & _
									"CachedIsOffscreen hresult(long*);" & _
									"CachedOrientation hresult(long*);" & _
									"CachedFrameworkId hresult(bstr*);" & _
									"CachedIsRequiredForForm hresult(long*);" & _
									"CachedItemStatus hresult(bstr*);" & _
									"CachedBoundingRectangle hresult(struct*);" & _
									"CachedLabeledBy hresult(ptr*);" & _
									"CachedAriaRole hresult(bstr*);" & _
									"CachedAriaProperties hresult(bstr*);" & _
									"CachedIsDataValidForForm hresult(long*);" & _
									"CachedControllerFor hresult(ptr*);" & _
									"CachedDescribedBy hresult(ptr*);" & _
									"CachedFlowsTo hresult(ptr*);" & _
									"CachedProviderDescription hresult(bstr*);" & _
									"GetClickablePoint hresult(struct*;long*);"

	Global Const $__UIA_sIID_IUIAutomationCondition = "{352FFBA8-0973-437C-A61F-F64CAFD81DF9}"
	Global $__UIA_dtagIUIAutomationCondition = ""

	Global Const $__UIA_sIID_IUIAutomationElementArray = "{14314595-B4BC-4055-95F2-58F2E42C9855}"
	Global $__UIA_dtagIUIAutomationElementArray = "Length hresult(int*);GetElement hresult(int;ptr*);"

	Global Const $__UIA_sIID_IUIAutomationCacheRequest = "{B32A92B5-BC25-4078-9C08-D7EE95C48E03}"
	Global $__UIA_dtagIUIAutomationCacheRequest = _
											"AddProperty hresult(int);" & _
											"AddPattern hresult(int);" & _
											"Clone hresult(ptr*);" & _
											"get_TreeScope hresult(long*);" & _
											"put_TreeScope hresult(long);" & _
											"get_TreeFilter hresult(ptr*);" & _
											"put_TreeFilter hresult(ptr);" & _
											"get_AutomationElementMode hresult(long*);" & _
											"put_AutomationElementMode hresult(long);"

	Global Const $__UIA_sIID_IUIAutomationBoolCondition = "{1B4E1F2E-75EB-4D0B-8952-5A69988E2307}"
	Global $__UIA_dtagIUIAutomationBoolCondition = "BooleanValue hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationPropertyCondition = "{99EBF2CB-5578-4267-9AD4-AFD6EA77E94B}"
	Global $__UIA_dtagIUIAutomationPropertyCondition = "propertyId hresult(int*);" & _
												"PropertyValue hresult(variant*);" & _
												"PropertyConditionFlags hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationAndCondition = "{A7D0AF36-B912-45FE-9855-091DDC174AEC}"
	Global $__UIA_dtagIUIAutomationAndCondition = "ChildCount hresult(int*);" & _
										"GetChildrenAsNativeArray hresult(ptr*;int*);" & _
										"GetChildren hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationOrCondition = "{8753F032-3DB1-47B5-A1FC-6E34A266C712}"
	Global $__UIA_dtagIUIAutomationOrCondition = "ChildCount hresult(int*);" & _
										"GetChildrenAsNativeArray hresult(ptr*;int*);" & _
										"GetChildren hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationNotCondition = "{F528B657-847B-498C-8896-D52B565407A1}"
	Global $__UIA_dtagIUIAutomationNotCondition = "GetChild hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationTreeWalker = "{4042C624-389C-4AFC-A630-9DF854A541FC}"
	Global $__UIA_dtagIUIAutomationTreeWalker = "GetParentElement hresult(ptr;ptr*);" & _
										"GetFirstChildElement hresult(ptr;ptr*);" & _
										"GetLastChildElement hresult(ptr;ptr*);" & _
										"GetNextSiblingElement hresult(ptr;ptr*);" & _
										"GetPreviousSiblingElement hresult(ptr;ptr*);" & _
										"NormalizeElement hresult(ptr;ptr*);" & _
										"GetParentElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"GetFirstChildElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"GetLastChildElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"GetNextSiblingElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"GetPreviousSiblingElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"NormalizeElementBuildCache hresult(ptr;ptr;ptr*);" & _
										"condition hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationEventHandler = "{146C3C17-F12E-4E22-8C27-F894B9B79C69}"
	Global $__UIA_dtagIUIAutomationEventHandler = "HandleAutomationEvent hresult(ptr;int);"

	Global Const $__UIA_sIID_IUIAutomationPropertyChangedEventHandler = "{40CD37D4-C756-4B0C-8C6F-BDDFEEB13B50}"
	Global $__UIA_dtagIUIAutomationPropertyChangedEventHandler = "HandlePropertyChangedEvent hresult(ptr;int;variant);"
	;~ Global $__UIA_dtagIUIAutomationPropertyChangedEventHandler = "HandlePropertyChangedEvent hresult(ptr;int;variant*);"
	;~ Global $__UIA_dtagIUIAutomationPropertyChangedEventHandler = "HandlePropertyChangedEvent hresult(ptr;int;ptr*);"

	Global Const $__UIA_sIID_IUIAutomationStructureChangedEventHandler = "{E81D1B4E-11C5-42F8-9754-E7036C79F054}"
	Global $__UIA_dtagIUIAutomationStructureChangedEventHandler = "HandleStructureChangedEvent hresult(ptr;long;ptr);"

	Global Const $__UIA_sIID_IUIAutomationFocusChangedEventHandler = "{C270F6B5-5C69-4290-9745-7A7F97169468}"
	Global $__UIA_dtagIUIAutomationFocusChangedEventHandler = "HandleFocusChangedEvent hresult(ptr);"

	Global Const $__UIA_sIID_IUIAutomationInvokePattern = "{FB377FBE-8EA6-46D5-9C73-6499642D3059}"
	Global $__UIA_dtagIUIAutomationInvokePattern = "Invoke hresult();"

	Global Const $__UIA_sIID_IUIAutomationDockPattern = "{FDE5EF97-1464-48F6-90BF-43D0948E86EC}"
	Global $__UIA_dtagIUIAutomationDockPattern = "SetDockPosition hresult(long);" & _
										"CurrentDockPosition hresult(long*);" & _
										"CachedDockPosition hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationExpandCollapsePattern = "{619BE086-1F4E-4EE4-BAFA-210128738730}"
	Global $__UIA_dtagIUIAutomationExpandCollapsePattern = "Expand hresult();" & _
												"Collapse hresult();" & _
												"CurrentExpandCollapseState hresult(long*);" & _
												"CachedExpandCollapseState hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationGridPattern = "{414C3CDC-856B-4F5B-8538-3131C6302550}"
	Global $__UIA_dtagIUIAutomationGridPattern = "GetItem hresult(int;int;ptr*);" & _
										"CurrentRowCount hresult(int*);" & _
										"CurrentColumnCount hresult(int*);" & _
										"CachedRowCount hresult(int*);" & _
										"CachedColumnCount hresult(int*);"

	Global Const $__UIA_sIID_IUIAutomationGridItemPattern = "{78F8EF57-66C3-4E09-BD7C-E79B2004894D}"
	Global $__UIA_dtagIUIAutomationGridItemPattern = "CurrentContainingGrid hresult(ptr*);" & _
											"CurrentRow hresult(int*);" & _
											"CurrentColumn hresult(int*);" & _
											"CurrentRowSpan hresult(int*);" & _
											"CurrentColumnSpan hresult(int*);" & _
											"CachedContainingGrid hresult(ptr*);" & _
											"CachedRow hresult(int*);" & _
											"CachedColumn hresult(int*);" & _
											"CachedRowSpan hresult(int*);" & _
											"CachedColumnSpan hresult(int*);"

	Global Const $__UIA_sIID_IUIAutomationMultipleViewPattern = "{8D253C91-1DC5-4BB5-B18F-ADE16FA495E8}"
	Global $__UIA_dtagIUIAutomationMultipleViewPattern = "GetViewName hresult(int;bstr*);" & _
												"SetCurrentView hresult(int);" & _
												"CurrentCurrentView hresult(int*);" & _
												"GetCurrentSupportedViews hresult(ptr*);" & _
												"CachedCurrentView hresult(int*);" & _
												"GetCachedSupportedViews hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationRangeValuePattern = "{59213F4F-7346-49E5-B120-80555987A148}"
	Global $__UIA_dtagIUIAutomationRangeValuePattern = "SetValue hresult(ushort);" & _
											"CurrentValue hresult(ushort*);" & _
											"CurrentIsReadOnly hresult(long*);" & _
											"CurrentMaximum hresult(ushort*);" & _
											"CurrentMinimum hresult(ushort*);" & _
											"CurrentLargeChange hresult(ushort*);" & _
											"CurrentSmallChange hresult(ushort*);" & _
											"CachedValue hresult(ushort*);" & _
											"CachedIsReadOnly hresult(long*);" & _
											"CachedMaximum hresult(ushort*);" & _
											"CachedMinimum hresult(ushort*);" & _
											"CachedLargeChange hresult(ushort*);" & _
											"CachedSmallChange hresult(ushort*);"

	Global Const $__UIA_sIID_IUIAutomationScrollPattern = "{88F4D42A-E881-459D-A77C-73BBBB7E02DC}"
	Global $__UIA_dtagIUIAutomationScrollPattern = "Scroll hresult(long;long);" & _
											"SetScrollPercent hresult(ushort;ushort);" & _
											"CurrentHorizontalScrollPercent hresult(ushort*);" & _
											"CurrentVerticalScrollPercent hresult(ushort*);" & _
											"CurrentHorizontalViewSize hresult(ushort*);" & _
											"CurrentVerticalViewSize hresult(ushort*);" & _
											"CurrentHorizontallyScrollable hresult(long*);" & _
											"CurrentVerticallyScrollable hresult(long*);" & _
											"CachedHorizontalScrollPercent hresult(ushort*);" & _
											"CachedVerticalScrollPercent hresult(ushort*);" & _
											"CachedHorizontalViewSize hresult(ushort*);" & _
											"CachedVerticalViewSize hresult(ushort*);" & _
											"CachedHorizontallyScrollable hresult(long*);" & _
											"CachedVerticallyScrollable hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationScrollItemPattern = "{B488300F-D015-4F19-9C29-BB595E3645EF}"
	Global $__UIA_dtagIUIAutomationScrollItemPattern = "ScrollIntoView hresult();"

	Global Const $__UIA_sIID_IUIAutomationSelectionPattern = "{5ED5202E-B2AC-47A6-B638-4B0BF140D78E}"
	Global $__UIA_dtagIUIAutomationSelectionPattern = "GetCurrentSelection hresult(ptr*);" & _
											"CurrentCanSelectMultiple hresult(long*);" & _
											"CurrentIsSelectionRequired hresult(long*);" & _
											"GetCachedSelection hresult(ptr*);" & _
											"CachedCanSelectMultiple hresult(long*);" & _
											"CachedIsSelectionRequired hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationSelectionItemPattern = "{A8EFA66A-0FDA-421A-9194-38021F3578EA}"
	Global $__UIA_dtagIUIAutomationSelectionItemPattern = "Select hresult();" & _
												"AddToSelection hresult();" & _
												"RemoveFromSelection hresult();" & _
												"CurrentIsSelected hresult(long*);" & _
												"CurrentSelectionContainer hresult(ptr*);" & _
												"CachedIsSelected hresult(long*);" & _
												"CachedSelectionContainer hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationSynchronizedInputPattern = "{2233BE0B-AFB7-448B-9FDA-3B378AA5EAE1}"
	Global $__UIA_dtagIUIAutomationSynchronizedInputPattern = "StartListening hresult(long);Cancel hresult();"

	Global Const $__UIA_sIID_IUIAutomationTablePattern = "{620E691C-EA96-4710-A850-754B24CE2417}"
	Global $__UIA_dtagIUIAutomationTablePattern = "GetCurrentRowHeaders hresult(ptr*);" & _
										"GetCurrentColumnHeaders hresult(ptr*);" & _
										"CurrentRowOrColumnMajor hresult(long*);" & _
										"GetCachedRowHeaders hresult(ptr*);" & _
										"GetCachedColumnHeaders hresult(ptr*);" & _
										"CachedRowOrColumnMajor hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationTableItemPattern = "{0B964EB3-EF2E-4464-9C79-61D61737A27E}"
	Global $__UIA_dtagIUIAutomationTableItemPattern = "GetCurrentRowHeaderItems hresult(ptr*);" & _
											"GetCurrentColumnHeaderItems hresult(ptr*);" & _
											"GetCachedRowHeaderItems hresult(ptr*);" & _
											"GetCachedColumnHeaderItems hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationTogglePattern = "{94CF8058-9B8D-4AB9-8BFD-4CD0A33C8C70}"
	Global $__UIA_dtagIUIAutomationTogglePattern = "Toggle hresult();" & _
										"CurrentToggleState hresult(long*);" & _
										"CachedToggleState hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationTransformPattern = "{A9B55844-A55D-4EF0-926D-569C16FF89BB}"
	Global $__UIA_dtagIUIAutomationTransformPattern = "Move hresult(double;double);" & _ ;~ fixed ushort to be double
											"Resize hresult(double;double);" & _ ;~ fixed ushort to be double
											"Rotate hresult(ushort);" & _
											"CurrentCanMove hresult(long*);" & _
											"CurrentCanResize hresult(long*);" & _
											"CurrentCanRotate hresult(long*);" & _
											"CachedCanMove hresult(long*);" & _
											"CachedCanResize hresult(long*);" & _
											"CachedCanRotate hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationValuePattern = "{A94CD8B1-0844-4CD6-9D2D-640537AB39E9}"
	Global $__UIA_dtagIUIAutomationValuePattern = "SetValue hresult(bstr);" & _
										"CurrentValue hresult(bstr*);" & _
										"CurrentIsReadOnly hresult(long*);" & _
										"CachedValue hresult(bstr*);" & _
										"CachedIsReadOnly hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationWindowPattern = "{0FAEF453-9208-43EF-BBB2-3B485177864F}"
	Global $__UIA_dtagIUIAutomationWindowPattern = "Close hresult();" & _
										"WaitForInputIdle hresult(int;long*);" & _
										"SetWindowVisualState hresult(long);" & _
										"CurrentCanMaximize hresult(long*);" & _
										"CurrentCanMinimize hresult(long*);" & _
										"CurrentIsModal hresult(long*);" & _
										"CurrentIsTopmost hresult(long*);" & _
										"CurrentWindowVisualState hresult(long*);" & _
										"CurrentWindowInteractionState hresult(long*);" & _
										"CachedCanMaximize hresult(long*);" & _
										"CachedCanMinimize hresult(long*);" & _
										"CachedIsModal hresult(long*);" & _
										"CachedIsTopmost hresult(long*);" & _
										"CachedWindowVisualState hresult(long*);" & _
										"CachedWindowInteractionState hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationTextRange = "{A543CC6A-F4AE-494B-8239-C814481187A8}"
	Global $__UIA_dtagIUIAutomationTextRange = "Clone hresult(ptr*);" & _
										"Compare hresult(ptr;long*);" & _
										"CompareEndpoints hresult(long;ptr;long;int*);" & _
										"ExpandToEnclosingUnit hresult(long);" & _
										"FindAttribute hresult(int;variant;long;ptr*);" & _
										"FindText hresult(bstr;long;long;ptr*);" & _
										"GetAttributeValue hresult(int;variant*);" & _
										"GetBoundingRectangles hresult(ptr*);" & _
										"GetEnclosingElement hresult(ptr*);" & _
										"GetText hresult(int;bstr*);" & _
										"Move hresult(long;int;int*);" & _
										"MoveEndpointByUnit hresult(long;long;int;int*);" & _
										"MoveEndpointByRange hresult(long;ptr;long);" & _
										"Select hresult();" & _
										"AddToSelection hresult();" & _
										"RemoveFromSelection hresult();" & _
										"ScrollIntoView hresult(long);" & _
										"GetChildren hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationTextRangeArray = "{CE4AE76A-E717-4C98-81EA-47371D028EB6}"
	Global $__UIA_dtagIUIAutomationTextRangeArray = "Length hresult(int*);GetElement hresult(int;ptr*);"

	Global Const $__UIA_sIID_IUIAutomationTextPattern = "{32EBA289-3583-42C9-9C59-3B6D9A1E9B6A}"
	Global $__UIA_dtagIUIAutomationTextPattern = "RangeFromPoint hresult(struct;ptr*);" & _
										"RangeFromChild hresult(ptr;ptr*);" & _
										"GetSelection hresult(ptr*);" & _
										"GetVisibleRanges hresult(ptr*);" & _
										"DocumentRange hresult(ptr*);" & _
										"SupportedTextSelection hresult(long*);"

	Global Const $__UIA_sIID_IUIAutomationLegacyIAccessiblePattern = "{828055AD-355B-4435-86D5-3B51C14A9B1B}"
	Global $__UIA_dtagIUIAutomationLegacyIAccessiblePattern = "Select hresult(long);" & _
													"DoDefaultAction hresult();" & _
													"SetValue hresult(wstr);" & _
													"CurrentChildId hresult(int*);" & _
													"CurrentName hresult(bstr*);" & _
													"CurrentValue hresult(bstr*);" & _
													"CurrentDescription hresult(bstr*);" & _
													"CurrentRole hresult(uint*);" & _
													"CurrentState hresult(uint*);" & _
													"CurrentHelp hresult(bstr*);" & _
													"CurrentKeyboardShortcut hresult(bstr*);" & _
													"GetCurrentSelection hresult(ptr*);" & _
													"CurrentDefaultAction hresult(bstr*);" & _
													"CachedChildId hresult(int*);" & _
													"CachedName hresult(bstr*);" & _
													"CachedValue hresult(bstr*);" & _
													"CachedDescription hresult(bstr*);" & _
													"CachedRole hresult(uint*);" & _
													"CachedState hresult(uint*);" & _
													"CachedHelp hresult(bstr*);" & _
													"CachedKeyboardShortcut hresult(bstr*);" & _
													"GetCachedSelection hresult(ptr*);" & _
													"CachedDefaultAction hresult(bstr*);" & _
													"GetIAccessible hresult(idispatch*);"

	Global Const $__UIA_sIID_IAccessible = "{618736E0-3C3D-11CF-810C-00AA00389B71}"
	Global $__UIA_dtagIAccessible = "GetTypeInfoCount hresult(uint*);" & _ ; IDispatch
							"GetTypeInfo hresult(uint;int;ptr*);" & _
							"GetIDsOfNames hresult(struct*;wstr;uint;int;int);" & _
							"Invoke hresult(int;struct*;int;word;ptr*;ptr*;ptr*;uint*);" & _
							"get_accParent hresult(ptr*);" & _                               ; IAccessible
							"get_accChildCount hresult(long*);" & _
							"get_accChild hresult(variant;idispatch*);" & _
							"get_accName hresult(variant;bstr*);" & _
							"get_accValue hresult(variant;bstr*);" & _
							"get_accDescription hresult(variant;bstr*);" & _
							"get_accRole hresult(variant;variant*);" & _
							"get_accState hresult(variant;variant*);" & _
							"get_accHelp hresult(variant;bstr*);" & _
							"get_accHelpTopic hresult(bstr*;variant;long*);" & _
							"get_accKeyboardShortcut hresult(variant;bstr*);" & _
							"get_accFocus hresult(struct*);" & _
							"get_accSelection hresult(variant*);" & _
							"get_accDefaultAction hresult(variant;bstr*);" & _
							"accSelect hresult(long;variant);" & _
							"accLocation hresult(long*;long*;long*;long*;variant);" & _
							"accNavigate hresult(long;variant;variant*);" & _
							"accHitTest hresult(long;long;variant*);" & _
							"accDoDefaultAction hresult(variant);" & _
							"put_accName hresult(variant;bstr);" & _
							"put_accValue hresult(variant;bstr);"

	Global Const $__UIA_sIID_IUIAutomationItemContainerPattern = "{C690FDB2-27A8-423C-812D-429773C9084E}"
	Global $__UIA_dtagIUIAutomationItemContainerPattern = "FindItemByProperty hresult(ptr;int;variant;ptr*);"

	Global Const $__UIA_sIID_IUIAutomationVirtualizedItemPattern = "{6BA3D7A6-04CF-4F11-8793-A8D1CDE9969F}"
	Global $__UIA_dtagIUIAutomationVirtualizedItemPattern = "Realize hresult();"

	Global Const $__UIA_sIID_IUIAutomationProxyFactory = "{85B94ECD-849D-42B6-B94D-D6DB23FDF5A4}"
	Global $__UIA_dtagIUIAutomationProxyFactory = "CreateProvider hresult(hwnd;long;long;ptr*);ProxyFactoryId hresult(bstr*);"

	Global Const $__UIA_sIID_IRawElementProviderSimple = "{D6DD68D1-86FD-4332-8666-9ABEDEA2D24C}"
	Global $__UIA_dtagIRawElementProviderSimple = "ProviderOptions hresult(long*);" & _
										"GetPatternProvider hresult(int;ptr*);" & _
										"GetPropertyValue hresult(int;variant*);" & _
										"HostRawElementProvider hresult(ptr*);"

	Global Const $__UIA_sIID_IUIAutomationProxyFactoryEntry = "{D50E472E-B64B-490C-BCA1-D30696F9F289}"
	Global $__UIA_dtagIUIAutomationProxyFactoryEntry = "ProxyFactory hresult(ptr*);" & _
											"ClassName hresult(bstr*);" & _
											"ImageName hresult(bstr*);" & _
											"AllowSubstringMatch hresult(long*);" & _
											"CanCheckBaseClass hresult(long*);" & _
											"NeedsAdviseEvents hresult(long*);" & _
											"ClassName hresult(wstr);" & _
											"ImageName hresult(wstr);" & _
											"AllowSubstringMatch hresult(long);" & _
											"CanCheckBaseClass hresult(long);" & _
											"NeedsAdviseEvents hresult(long);" & _
											"SetWinEventsForAutomationEvent hresult(int;int;ptr);" & _
											"GetWinEventsForAutomationEvent hresult(int;int;ptr*);"

	Global Const $__UIA_sIID_IUIAutomationProxyFactoryMapping = "{09E31E18-872D-4873-93D1-1E541EC133FD}"
	Global $__UIA_dtagIUIAutomationProxyFactoryMapping = "count hresult(uint*);" & _
												"GetTable hresult(ptr*);" & _
												"GetEntry hresult(uint;ptr*);" & _
												"SetTable hresult(ptr);" & _
												"InsertEntries hresult(uint;ptr);" & _
												"InsertEntry hresult(uint;ptr);" & _
												"RemoveEntry hresult(uint);" & _
												"ClearTable hresult();" & _
												"RestoreDefaultTable hresult();"

	Global Const $__UIA_sIID_IUIAutomation = "{30CBE57D-D9D0-452A-AB13-7AC5AC4825EE}"
	Global $__UIA_dtagIUIAutomation = _
							"CompareElements hresult(ptr;ptr;long*);" & _
							"CompareRuntimeIds hresult(ptr;ptr;long*);" & _
							"GetRootElement hresult(ptr*);" & _
							"ElementFromHandle hresult(hwnd;ptr*);" & _
							"ElementFromPoint hresult(struct;ptr*);" & _
							"GetFocusedElement hresult(ptr*);" & _
							"GetRootElementBuildCache hresult(ptr;ptr*);" & _
							"ElementFromHandleBuildCache hresult(hwnd;ptr;ptr*);" & _
							"ElementFromPointBuildCache hresult(struct;ptr;ptr*);" & _
							"GetFocusedElementBuildCache hresult(ptr;ptr*);" & _
							"CreateTreeWalker hresult(ptr;ptr*);" & _
							"ControlViewWalker hresult(ptr*);" & _
							"ContentViewWalker hresult(ptr*);" & _
							"RawViewWalker hresult(ptr*);" & _
							"RawViewCondition hresult(ptr*);" & _
							"ControlViewCondition hresult(ptr*);" & _
							"ContentViewCondition hresult(ptr*);" & _
							"CreateCacheRequest hresult(ptr*);" & _
							"CreateTrueCondition hresult(ptr*);" & _
							"CreateFalseCondition hresult(ptr*);" & _
							"CreatePropertyCondition hresult(int;variant;ptr*);" & _
							"CreatePropertyConditionEx hresult(int;variant;long;ptr*);" & _
							"CreateAndCondition hresult(ptr;ptr;ptr*);" & _
							"CreateAndConditionFromArray hresult(ptr;ptr*);" & _
							"CreateAndConditionFromNativeArray hresult(ptr;int;ptr*);" & _
							"CreateOrCondition hresult(ptr;ptr;ptr*);" & _
							"CreateOrConditionFromArray hresult(ptr;ptr*);" & _
							"CreateOrConditionFromNativeArray hresult(ptr;int;ptr*);" & _
							"CreateNotCondition hresult(ptr;ptr*);" & _
							"AddAutomationEventHandler hresult(int;ptr;long;ptr;ptr);" & _
							"RemoveAutomationEventHandler hresult(int;ptr;ptr);" & _
							"AddPropertyChangedEventHandlerNativeArray hresult(ptr;long;ptr;ptr;struct*;int);" & _
							"AddPropertyChangedEventHandler hresult(ptr;long;ptr;ptr;ptr);" & _
							"RemovePropertyChangedEventHandler hresult(ptr;ptr);" & _
							"AddStructureChangedEventHandler hresult(ptr;long;ptr;ptr);" & _
							"RemoveStructureChangedEventHandler hresult(ptr;ptr);" & _
							"AddFocusChangedEventHandler hresult(ptr;ptr);" & _
							"RemoveFocusChangedEventHandler hresult(ptr);" & _
							"RemoveAllEventHandlers hresult();" & _
							"IntNativeArrayToSafeArray hresult(int;int;ptr*);" & _
							"IntSafeArrayToNativeArray hresult(ptr;int*;int*);" & _
							"RectToVariant hresult(struct;variant*);" & _
							"VariantToRect hresult(variant;struct*);" & _
							"SafeArrayToRectNativeArray hresult(ptr;struct*;int*);" & _
							"CreateProxyFactoryEntry hresult(ptr;ptr*);" & _
							"ProxyFactoryMapping hresult(ptr*);" & _
							"GetPropertyProgrammaticName hresult(int;bstr*);" & _
							"GetPatternProgrammaticName hresult(int;bstr*);" & _
							"PollForPotentialSupportedPatterns hresult(ptr;ptr*;ptr*);" & _
							"PollForPotentialSupportedProperties hresult(ptr;ptr*;ptr*);" & _
							"CheckNotSupported hresult(variant;long*);" & _
							"ReservedNotSupportedValue hresult(ptr*);" & _
							"ReservedMixedAttributeValue hresult(ptr*);" & _
							"ElementFromIAccessible hresult(idispatch;int;ptr*);" & _
							"ElementFromIAccessibleBuildCache hresult(iaccessible;int;ptr;ptr*);"

		Global Const $__UIA_SpecialProperty = -1
		Global $__UIA_ControlArray[41][3] = [ _
										["UIA_AppBarControlTypeId", 50040, "Identifies the AppBar control type. Supported starting with Windows 8.1."], _
										["UIA_ButtonControlTypeId", 50000, "Identifies the Button control type."], _
										["UIA_CalendarControlTypeId", 50001, "Identifies the Calendar control type."], _
										["UIA_CheckBoxControlTypeId", 50002, "Identifies the CheckBox control type."], _
										["UIA_ComboBoxControlTypeId", 50003, "Identifies the ComboBox control type."], _
										["UIA_CustomControlTypeId", 50025, "Identifies the Custom control type. For more information, see Custom Properties, Events, and Control Patterns."], _
										["UIA_DataGridControlTypeId", 50028, "Identifies the DataGrid control type."], _
										["UIA_DataItemControlTypeId", 50029, "Identifies the DataItem control type."], _
										["UIA_DocumentControlTypeId", 50030, "Identifies the Document control type."], _
										["UIA_EditControlTypeId", 50004, "Identifies the Edit control type."], _
										["UIA_GroupControlTypeId", 50026, "Identifies the Group control type."], _
										["UIA_HeaderControlTypeId", 50034, "Identifies the Header control type."], _
										["UIA_HeaderItemControlTypeId", 50035, "Identifies the HeaderItem control type."], _
										["UIA_HyperlinkControlTypeId", 50005, "Identifies the Hyperlink control type."], _
										["UIA_ImageControlTypeId", 50006, "Identifies the Image control type."], _
										["UIA_ListControlTypeId", 50008, "Identifies the List control type."], _
										["UIA_ListItemControlTypeId", 50007, "Identifies the ListItem control type."], _
										["UIA_MenuBarControlTypeId", 50010, "Identifies the MenuBar control type."], _
										["UIA_MenuControlTypeId", 50009, "Identifies the Menu control type."], _
										["UIA_MenuItemControlTypeId", 50011, "Identifies the MenuItem control type."], _
										["UIA_PaneControlTypeId", 50033, "Identifies the Pane control type."], _
										["UIA_ProgressBarControlTypeId", 50012, "Identifies the ProgressBar control type."], _
										["UIA_RadioButtonControlTypeId", 50013, "Identifies the RadioButton control type."], _
										["UIA_ScrollBarControlTypeId", 50014, "Identifies the ScrollBar control type."], _
										["UIA_SemanticZoomControlTypeId", 50039, "Identifies the SemanticZoom control type. Supported starting with Windows 8."], _
										["UIA_SeparatorControlTypeId", 50038, "Identifies the Separator control type."], _
										["UIA_SliderControlTypeId", 50015, "Identifies the Slider control type."], _
										["UIA_SpinnerControlTypeId", 50016, "Identifies the Spinner control type."], _
										["UIA_SplitButtonControlTypeId", 50031, "Identifies the SplitButton control type."], _
										["UIA_StatusBarControlTypeId", 50017, "Identifies the StatusBar control type."], _
										["UIA_TabControlTypeId", 50018, "Identifies the Tab control type."], _
										["UIA_TabItemControlTypeId", 50019, "Identifies the TabItem control type."], _
										["UIA_TableControlTypeId", 50036, "Identifies the Table control type."], _
										["UIA_TextControlTypeId", 50020, "Identifies the Text control type."], _
										["UIA_ThumbControlTypeId", 50027, "Identifies the Thumb control type."], _
										["UIA_TitleBarControlTypeId", 50037, "Identifies the TitleBar control type."], _
										["UIA_ToolBarControlTypeId", 50021, "Identifies the ToolBar control type."], _
										["UIA_ToolTipControlTypeId", 50022, "Identifies the ToolTip control type."], _
										["UIA_TreeControlTypeId", 50023, "Identifies the Tree control type."], _
										["UIA_TreeItemControlTypeId", 50024, "Identifies the TreeItem control type."], _
										["UIA_WindowControlTypeId", 50032, "Identifies the Window control type."] _
										]

		Global $__UIA_PatternArray[21][3] = [ _
									[$UIA_InvokePatternId, $__UIA_sIID_IUIAutomationInvokePattern, $__UIA_dtagIUIAutomationInvokePattern], _
									[$UIA_SelectionPatternId, $__UIA_sIID_IUIAutomationSelectionPattern, $__UIA_dtagIUIAutomationSelectionPattern], _
									[$UIA_ValuePatternId, $__UIA_sIID_IUIAutomationValuePattern, $__UIA_dtagIUIAutomationValuePattern], _
									[$UIA_RangeValuePatternId, $__UIA_sIID_IUIAutomationRangeValuePattern, $__UIA_dtagIUIAutomationRangeValuePattern], _
									[$UIA_ScrollPatternId, $__UIA_sIID_IUIAutomationScrollPattern, $__UIA_dtagIUIAutomationScrollPattern], _
									[$UIA_ExpandCollapsePatternId, $__UIA_sIID_IUIAutomationExpandCollapsePattern, $__UIA_dtagIUIAutomationExpandCollapsePattern], _
									[$UIA_GridPatternId, $__UIA_sIID_IUIAutomationGridPattern, $__UIA_dtagIUIAutomationGridPattern], _
									[$UIA_GridItemPatternId, $__UIA_sIID_IUIAutomationGridItemPattern, $__UIA_dtagIUIAutomationGridItemPattern], _
									[$UIA_MultipleViewPatternId, $__UIA_sIID_IUIAutomationMultipleViewPattern, $__UIA_dtagIUIAutomationMultipleViewPattern], _
									[$UIA_WindowPatternId, $__UIA_sIID_IUIAutomationWindowPattern, $__UIA_dtagIUIAutomationWindowPattern], _
									[$UIA_SelectionItemPatternId, $__UIA_sIID_IUIAutomationSelectionItemPattern, $__UIA_dtagIUIAutomationSelectionItemPattern], _
									[$UIA_DockPatternId, $__UIA_sIID_IUIAutomationDockPattern, $__UIA_dtagIUIAutomationDockPattern], _
									[$UIA_TablePatternId, $__UIA_sIID_IUIAutomationTablePattern, $__UIA_dtagIUIAutomationTablePattern], _
									[$UIA_TextPatternId, $__UIA_sIID_IUIAutomationTextPattern, $__UIA_dtagIUIAutomationTextPattern], _
									[$UIA_TogglePatternId, $__UIA_sIID_IUIAutomationTogglePattern, $__UIA_dtagIUIAutomationTogglePattern], _
									[$UIA_TransformPatternId, $__UIA_sIID_IUIAutomationTransformPattern, $__UIA_dtagIUIAutomationTransformPattern], _
									[$UIA_ScrollItemPatternId, $__UIA_sIID_IUIAutomationScrollItemPattern, $__UIA_dtagIUIAutomationScrollItemPattern], _
									[$UIA_LegacyIAccessiblePatternId, $__UIA_sIID_IUIAutomationLegacyIAccessiblePattern, $__UIA_dtagIUIAutomationLegacyIAccessiblePattern], _
									[$UIA_ItemContainerPatternId, $__UIA_sIID_IUIAutomationItemContainerPattern, $__UIA_dtagIUIAutomationItemContainerPattern], _
									[$UIA_VirtualizedItemPatternId, $__UIA_sIID_IUIAutomationVirtualizedItemPattern, $__UIA_dtagIUIAutomationVirtualizedItemPattern], _
									[$UIA_SynchronizedInputPatternId, $__UIA_sIID_IUIAutomationSynchronizedInputPattern, $__UIA_dtagIUIAutomationSynchronizedInputPattern] _
									]

		Global $__UIA_SupportedPropertiesArray[187][2] = [ _
													["indexrelative", $__UIA_SpecialProperty], _                                      			; Special propertyname
													["index", $__UIA_SpecialProperty], _                                       					; Special propertyname
													["instance", $__UIA_SpecialProperty], _                                       				; Special propertyname
													["title", $UIA_NamePropertyId], _                                       ; Alternate propertyname
													["text", $UIA_NamePropertyId], _                                        ; Alternate propertyname
													["regexptitle", $UIA_NamePropertyId], _                                 ; Alternate propertyname
													["class", $UIA_ClassNamePropertyId], _									; Alternate propertyname
													["regexpclass", $UIA_ClassNamePropertyId], _							; Alternate propertyname
													["iaccessiblevalue", $UIA_LegacyIAccessibleValuePropertyId], _			; Alternate propertyname
													["iaccessiblechildId", $UIA_LegacyIAccessibleChildIdPropertyId], _		; Alternate propertyname
													["id", $UIA_AutomationIdPropertyId], _                                  ; Alternate propertyname
													["handle", $UIA_NativeWindowHandlePropertyId], _ 						; Alternate propertyname
													["RuntimeId", $UIA_RuntimeIdPropertyId], _
													["BoundingRectangle", $UIA_BoundingRectanglePropertyId], _
													["ProcessId", $UIA_ProcessIdPropertyId], _
													["ControlType", $UIA_ControlTypePropertyId], _
													["LocalizedControlType", $UIA_LocalizedControlTypePropertyId], _
													["Name", $UIA_NamePropertyId], _
													["AcceleratorKey", $UIA_AcceleratorKeyPropertyId], _
													["AccessKey", $UIA_AccessKeyPropertyId], _
													["HasKeyboardFocus", $UIA_HasKeyboardFocusPropertyId], _
													["IsKeyboardFocusable", $UIA_IsKeyboardFocusablePropertyId], _
													["IsEnabled", $UIA_IsEnabledPropertyId], _
													["AutomationId", $UIA_AutomationIdPropertyId], _
													["ClassName", $UIA_ClassNamePropertyId], _
													["HelpText", $UIA_HelpTextPropertyId], _
													["ClickablePoint", $UIA_ClickablePointPropertyId], _
													["Culture", $UIA_CulturePropertyId], _
													["IsControlElement", $UIA_IsControlElementPropertyId], _
													["IsContentElement", $UIA_IsContentElementPropertyId], _
													["LabeledBy", $UIA_LabeledByPropertyId], _
													["IsPassword", $UIA_IsPasswordPropertyId], _
													["NativeWindowHandle", $UIA_NativeWindowHandlePropertyId], _
													["ItemType", $UIA_ItemTypePropertyId], _
													["IsOffscreen", $UIA_IsOffscreenPropertyId], _
													["Orientation", $UIA_OrientationPropertyId], _
													["FrameworkId", $UIA_FrameworkIdPropertyId], _
													["IsRequiredForForm", $UIA_IsRequiredForFormPropertyId], _
													["ItemStatus", $UIA_ItemStatusPropertyId], _
													["IsDockPatternAvailable", $UIA_IsDockPatternAvailablePropertyId], _
													["IsExpandCollapsePatternAvailable", $UIA_IsExpandCollapsePatternAvailablePropertyId], _
													["IsGridItemPatternAvailable", $UIA_IsGridItemPatternAvailablePropertyId], _
													["IsGridPatternAvailable", $UIA_IsGridPatternAvailablePropertyId], _
													["IsInvokePatternAvailable", $UIA_IsInvokePatternAvailablePropertyId], _
													["IsMultipleViewPatternAvailable", $UIA_IsMultipleViewPatternAvailablePropertyId], _
													["IsRangeValuePatternAvailable", $UIA_IsRangeValuePatternAvailablePropertyId], _
													["IsScrollPatternAvailable", $UIA_IsScrollPatternAvailablePropertyId], _
													["IsScrollItemPatternAvailable", $UIA_IsScrollItemPatternAvailablePropertyId], _
													["IsSelectionItemPatternAvailable", $UIA_IsSelectionItemPatternAvailablePropertyId], _
													["IsSelectionPatternAvailable", $UIA_IsSelectionPatternAvailablePropertyId], _
													["IsTablePatternAvailable", $UIA_IsTablePatternAvailablePropertyId], _
													["IsTableItemPatternAvailable", $UIA_IsTableItemPatternAvailablePropertyId], _
													["IsTextPatternAvailable", $UIA_IsTextPatternAvailablePropertyId], _
													["IsTogglePatternAvailable", $UIA_IsTogglePatternAvailablePropertyId], _
													["IsTransformPatternAvailable", $UIA_IsTransformPatternAvailablePropertyId], _
													["IsValuePatternAvailable", $UIA_IsValuePatternAvailablePropertyId], _
													["IsWindowPatternAvailable", $UIA_IsWindowPatternAvailablePropertyId], _
													["ValueValue", $UIA_ValueValuePropertyId], _
													["ValueIsReadOnly", $UIA_ValueIsReadOnlyPropertyId], _
													["RangeValueValue", $UIA_RangeValueValuePropertyId], _
													["RangeValueIsReadOnly", $UIA_RangeValueIsReadOnlyPropertyId], _
													["RangeValueMinimum", $UIA_RangeValueMinimumPropertyId], _
													["RangeValueMaximum", $UIA_RangeValueMaximumPropertyId], _
													["RangeValueLargeChange", $UIA_RangeValueLargeChangePropertyId], _
													["RangeValueSmallChange", $UIA_RangeValueSmallChangePropertyId], _
													["ScrollHorizontalScrollPercent", $UIA_ScrollHorizontalScrollPercentPropertyId], _
													["ScrollHorizontalViewSize", $UIA_ScrollHorizontalViewSizePropertyId], _
													["ScrollVerticalScrollPercent", $UIA_ScrollVerticalScrollPercentPropertyId], _
													["ScrollVerticalViewSize", $UIA_ScrollVerticalViewSizePropertyId], _
													["ScrollHorizontallyScrollable", $UIA_ScrollHorizontallyScrollablePropertyId], _
													["ScrollVerticallyScrollable", $UIA_ScrollVerticallyScrollablePropertyId], _
													["SelectionSelection", $UIA_SelectionSelectionPropertyId], _
													["SelectionCanSelectMultiple", $UIA_SelectionCanSelectMultiplePropertyId], _
													["SelectionIsSelectionRequired", $UIA_SelectionIsSelectionRequiredPropertyId], _
													["GridRowCount", $UIA_GridRowCountPropertyId], _
													["GridColumnCount", $UIA_GridColumnCountPropertyId], _
													["GridItemRow", $UIA_GridItemRowPropertyId], _
													["GridItemColumn", $UIA_GridItemColumnPropertyId], _
													["GridItemRowSpan", $UIA_GridItemRowSpanPropertyId], _
													["GridItemColumnSpan", $UIA_GridItemColumnSpanPropertyId], _
													["GridItemContainingGrid", $UIA_GridItemContainingGridPropertyId], _
													["DockDockPosition", $UIA_DockDockPositionPropertyId], _
													["ExpandCollapseExpandCollapseState", $UIA_ExpandCollapseExpandCollapseStatePropertyId], _
													["MultipleViewCurrentView", $UIA_MultipleViewCurrentViewPropertyId], _
													["MultipleViewSupportedViews", $UIA_MultipleViewSupportedViewsPropertyId], _
													["WindowCanMaximize", $UIA_WindowCanMaximizePropertyId], _
													["WindowCanMinimize", $UIA_WindowCanMinimizePropertyId], _
													["WindowWindowVisualState", $UIA_WindowWindowVisualStatePropertyId], _
													["WindowWindowInteractionState", $UIA_WindowWindowInteractionStatePropertyId], _
													["WindowIsModal", $UIA_WindowIsModalPropertyId], _
													["WindowIsTopmost", $UIA_WindowIsTopmostPropertyId], _
													["SelectionItemIsSelected", $UIA_SelectionItemIsSelectedPropertyId], _
													["SelectionItemSelectionContainer", $UIA_SelectionItemSelectionContainerPropertyId], _
													["TableRowHeaders", $UIA_TableRowHeadersPropertyId], _
													["TableColumnHeaders", $UIA_TableColumnHeadersPropertyId], _
													["TableRowOrColumnMajor", $UIA_TableRowOrColumnMajorPropertyId], _
													["TableItemRowHeaderItems", $UIA_TableItemRowHeaderItemsPropertyId], _
													["TableItemColumnHeaderItems", $UIA_TableItemColumnHeaderItemsPropertyId], _
													["ToggleToggleState", $UIA_ToggleToggleStatePropertyId], _
													["TransformCanMove", $UIA_TransformCanMovePropertyId], _
													["TransformCanResize", $UIA_TransformCanResizePropertyId], _
													["TransformCanRotate", $UIA_TransformCanRotatePropertyId], _
													["IsLegacyIAccessiblePatternAvailable", $UIA_IsLegacyIAccessiblePatternAvailablePropertyId], _
													["LegacyIAccessibleChildId", $UIA_LegacyIAccessibleChildIdPropertyId], _
													["LegacyIAccessibleName", $UIA_LegacyIAccessibleNamePropertyId], _
													["LegacyIAccessibleValue", $UIA_LegacyIAccessibleValuePropertyId], _
													["LegacyIAccessibleDescription", $UIA_LegacyIAccessibleDescriptionPropertyId], _
													["LegacyIAccessibleRole", $UIA_LegacyIAccessibleRolePropertyId], _
													["LegacyIAccessibleState", $UIA_LegacyIAccessibleStatePropertyId], _
													["LegacyIAccessibleHelp", $UIA_LegacyIAccessibleHelpPropertyId], _
													["LegacyIAccessibleKeyboardShortcut", $UIA_LegacyIAccessibleKeyboardShortcutPropertyId], _
													["LegacyIAccessibleSelection", $UIA_LegacyIAccessibleSelectionPropertyId], _
													["LegacyIAccessibleDefaultAction", $UIA_LegacyIAccessibleDefaultActionPropertyId], _
													["AriaRole", $UIA_AriaRolePropertyId], _
													["AriaProperties", $UIA_AriaPropertiesPropertyId], _
													["IsDataValidForForm", $UIA_IsDataValidForFormPropertyId], _
													["ControllerFor", $UIA_ControllerForPropertyId], _
													["DescribedBy", $UIA_DescribedByPropertyId], _
													["FlowsTo", $UIA_FlowsToPropertyId], _
													["ProviderDescription", $UIA_ProviderDescriptionPropertyId], _
													["IsItemContainerPatternAvailable", $UIA_IsItemContainerPatternAvailablePropertyId], _
													["IsVirtualizedItemPatternAvailable", $UIA_IsVirtualizedItemPatternAvailablePropertyId], _
													["IsSynchronizedInputPatternAvailable", $UIA_IsSynchronizedInputPatternAvailablePropertyId], _
													["OptimizeForVisualContent", $UIA_OptimizeForVisualContentPropertyId], _
													["IsObjectModelPatternAvailable", $UIA_IsObjectModelPatternAvailablePropertyId], _
													["AnnotationAnnotationTypeId", $UIA_AnnotationAnnotationTypeIdPropertyId], _
													["AnnotationAnnotationTypeName", $UIA_AnnotationAnnotationTypeNamePropertyId], _
													["AnnotationAuthor", $UIA_AnnotationAuthorPropertyId], _
													["AnnotationDateTime", $UIA_AnnotationDateTimePropertyId], _
													["AnnotationTarget", $UIA_AnnotationTargetPropertyId], _
													["IsAnnotationPatternAvailable", $UIA_IsAnnotationPatternAvailablePropertyId], _
													["IsTextPattern2Available", $UIA_IsTextPattern2AvailablePropertyId], _
													["StylesStyleId", $UIA_StylesStyleIdPropertyId], _
													["StylesStyleName", $UIA_StylesStyleNamePropertyId], _
													["StylesFillColor", $UIA_StylesFillColorPropertyId], _
													["StylesFillPatternStyle", $UIA_StylesFillPatternStylePropertyId], _
													["StylesShape", $UIA_StylesShapePropertyId], _
													["StylesFillPatternColor", $UIA_StylesFillPatternColorPropertyId], _
													["StylesExtendedProperties", $UIA_StylesExtendedPropertiesPropertyId], _
													["IsStylesPatternAvailable", $UIA_IsStylesPatternAvailablePropertyId], _
													["IsSpreadsheetPatternAvailable", $UIA_IsSpreadsheetPatternAvailablePropertyId], _
													["SpreadsheetItemFormula", $UIA_SpreadsheetItemFormulaPropertyId], _
													["SpreadsheetItemAnnotationObjects", $UIA_SpreadsheetItemAnnotationObjectsPropertyId], _
													["SpreadsheetItemAnnotationTypes", $UIA_SpreadsheetItemAnnotationTypesPropertyId], _
													["IsSpreadsheetItemPatternAvailable", $UIA_IsSpreadsheetItemPatternAvailablePropertyId], _
													["Transform2CanZoom", $UIA_Transform2CanZoomPropertyId], _
													["IsTransformPattern2Available", $UIA_IsTransformPattern2AvailablePropertyId], _
													["LiveSetting", $UIA_LiveSettingPropertyId], _
													["IsTextChildPatternAvailable", $UIA_IsTextChildPatternAvailablePropertyId], _
													["IsDragPatternAvailable", $UIA_IsDragPatternAvailablePropertyId], _
													["DragIsGrabbed", $UIA_DragIsGrabbedPropertyId], _
													["DragDropEffect", $UIA_DragDropEffectPropertyId], _
													["DragDropEffects", $UIA_DragDropEffectsPropertyId], _
													["IsDropTargetPatternAvailable", $UIA_IsDropTargetPatternAvailablePropertyId], _
													["DropTargetDropTargetEffect", $UIA_DropTargetDropTargetEffectPropertyId], _
													["DropTargetDropTargetEffects", $UIA_DropTargetDropTargetEffectsPropertyId], _
													["DragGrabbedItems", $UIA_DragGrabbedItemsPropertyId], _
													["Transform2ZoomLevel", $UIA_Transform2ZoomLevelPropertyId], _
													["Transform2ZoomMinimum", $UIA_Transform2ZoomMinimumPropertyId], _
													["Transform2ZoomMaximum", $UIA_Transform2ZoomMaximumPropertyId], _
													["FlowsFrom", $UIA_FlowsFromPropertyId], _
													["IsTextEditPatternAvailable", $UIA_IsTextEditPatternAvailablePropertyId], _
													["IsPeripheral", $UIA_IsPeripheralPropertyId], _
													["IsCustomNavigationPatternAvailable", $UIA_IsCustomNavigationPatternAvailablePropertyId], _
													["PositionInSet", $UIA_PositionInSetPropertyId], _
													["SizeOfSet", $UIA_SizeOfSetPropertyId], _
													["Level", $UIA_LevelPropertyId], _
													["AnnotationTypes", $UIA_AnnotationTypesPropertyId], _
													["AnnotationObjects", $UIA_AnnotationObjectsPropertyId], _
													["LandmarkType", $UIA_LandmarkTypePropertyId], _
													["LocalizedLandmarkType", $UIA_LocalizedLandmarkTypePropertyId], _
													["FullDescription", $UIA_FullDescriptionPropertyId], _
													["FillColor", $UIA_FillColorPropertyId], _
													["OutlineColor", $UIA_OutlineColorPropertyId], _
													["FillType", $UIA_FillTypePropertyId], _
													["VisualEffects", $UIA_VisualEffectsPropertyId], _
													["OutlineThickness", $UIA_OutlineThicknessPropertyId], _
													["CenterPoint", $UIA_CenterPointPropertyId], _
													["Rotation", $UIA_RotationPropertyId], _
													["Size", $UIA_SizePropertyId], _
													["IsSelectionPattern2Available", $UIA_IsSelectionPattern2AvailablePropertyId], _
													["Selection2FirstSelectedItem", $UIA_Selection2FirstSelectedItemPropertyId], _
													["Selection2LastSelectedItem", $UIA_Selection2LastSelectedItemPropertyId], _
													["Selection2CurrentSelectedItem", $UIA_Selection2CurrentSelectedItemPropertyId], _
													["Selection2ItemCount", $UIA_Selection2ItemCountPropertyId], _
													["HeadingLevel", $UIA_HeadingLevelPropertyId], _
													["IsDialog", $UIA_IsDialogPropertyId] _
													]
#EndRegion UIA_INTERFACE_&_STRUCTURE