# UI Automation library UDF

## Table of Contents
+ [About](#about)
+ [Installation](#installation)
+ [Usage](#usage)
+ [Documentation](#documentation)
+ [Examples](#examples)


## About <a name = "about"></a>
This UDF is an AutoIt wrapper for 'Windows UI Automation' (UIA) layer.   
It allows to interact with desktop application layers otherwise not reachable to standard Win32 spying with AutoIt3Info explorer.  
```Note, that not all functionality might be mapped or updated in current published version.```

## Installation <a name = "installation"></a>
Simply copy ```.au3``` files to your development directory and use ```#include``` to point to these files in the source code.  

## Usage <a name = "usage"></a>
* Use ```UIAutomation_*.au3``` for core functionality to UIA layer.   
* Tools like UISpy or Inspect allows to see applications in UIA layer.

## Documentation <a name = "documentation"></a>

* [MSDN Windows Accesibility Features PDF](./docs/MSDN-WindowsAccessibilityFeatures.pdf)
* [MSDN UIAutomation Overview](https://docs.microsoft.com/en-us/dotnet/framework/ui-automation/ui-automation-overview?redirectedfrom=MSDN)
* [MSDN UIA/MS Active Accessibility](https://docs.microsoft.com/en-us/windows/win32/winauto/uiauto-msaa)
* [MSDN UIA Entry](https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiauto-win32)
* [MSDN UIA Client](https://docs.microsoft.com/en-us/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation)
* [MSDN UIA Core Reference](https://docs.microsoft.com/en-us/windows/win32/winauto/entry-uiautocore-ref)
* [AutoIt UIA Framework](https://www.autoitscript.com/forum/topic/153520-iuiautomation-ms-framework-automate-chrome-ff-ie/)
* [AutoIt UIA Use](https://www.autoitscript.com/forum/topic/197080-using-ui-automation-code-in-autoit/page/2/?tab=comments#comment-1417296)

## Examples <a name = "examples"></a>
* [Example code](./examples/)