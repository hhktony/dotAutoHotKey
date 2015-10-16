;; ^ Ctrl
;; ! Alt
;; # Win
;; MButton Êó±êÖÐ¼ü

; #Include E:\kuaipan\Software\Window\SystemTools\AutoHotkey\cmd.ahk
; #0::run E:\kuaipan\Software\Window\SystemTools\AutoHotkey\shutdown.ahk

;; Alias

:*:h@::hhktony@gmail.com

;; Function to run a program or activate an already running instance 
RunOrActivateProgram(Program, WorkingDir="", WindowSize="") {
    SplitPath Program, ExeFile
    Process, Exist, %ExeFile%
    PID = %ErrorLevel%
    if (PID = 0) {
        Run, %Program%, %WorkingDir%, %WindowSize%
    } else {
        WinActivate, ahk_pid %PID%
    }
}

;; Program in common use
#a::RunOrActivateProgram("D:\kuaipan\software\Window\Network&Security\putty\putty.exe")
#s::RunOrActivateProgram("D:\Software\Sublime Text2\sublime_text.exe")
#f::RunOrActivateProgram("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
#q::RunOrActivateProgram("D:\Software\Everything\Everything.exe")
; #n::RunOrActivateProgram("C:\Program Files\Notepad++\notepad++.exe")

#z::Run www.zhihu.com
#g::Run https://www.google.com/search?q=%clipboard%
 
;; Other Url
; #u::Run D:\HOME

#c::run Calc

;; http://blog.csdn.net/liuyukuan
;; http://linux.brothersoft.com/searches/