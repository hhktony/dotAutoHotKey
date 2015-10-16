;cmd 变 bash

; Redefine only when the active window is a console window   
#IfWinActive ahk_class ConsoleWindowClass  

^l::Send cls{Enter} 	;清除屏幕
^u::Send ^{Home} 		;删除当前行光标前内容
^k::Send ^{End} 		;删除当前行光标后内容
^a::Send {Home} 		;转到行首
^e::Send {End} 			;转到行尾
^p::Send {Up} 			;上一个命令
^n::Send {Down} 		;下一个命令
^b::Send {Left} 		;转到前一个字符
^f::Send {Right} 		;转到后一个字符
^d::Send {Delete} 		;删除后一个字符
^v::send %Clipboard% 	;粘贴
!b::Send ^{Left} 		;转到前一个单词
!f::Send ^{Right} 		;转到后一个单词


; Close Command Window with Ctrl+q  
$^q::  
WinGetTitle sTitle  
If (InStr(sTitle, "-")=0) 
{ 
	Send EXIT{Enter}  
} 
else 
{  
	Send ^w  
}  
return   

; find in command window  
;^F::  
; Spanish menu (Editar->find, I suppose English version is the same, Edit->find)  
;Send !{Space}ef  
;return  

^3::
send ping 10.78.28.15{enter}
return
#ifWinactive
