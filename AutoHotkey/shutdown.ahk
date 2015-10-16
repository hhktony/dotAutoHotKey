#SingleInstance on
	; 只运行一个进程
Gui, -Caption +AlwaysOnTop
	; 设置窗口属性，-Caption 去掉标题栏和边框，+AlwaysOnTop 窗口置顶
Gui, Add, Picture, x0 y0 w314 h200 , %A_ScriptDir%\images\bg.png
	; 在 x=0 y=0 的位置载入背景图片：当前路径（A_ScriptDir）下的 images 文件夹里的 bg.png，并设置图片的宽度为 314 像素（w314），高度为 200 像素（h200）
Gui, Add, Picture, x55 y80 w32 h32 gSleep, %A_ScriptDir%\images\sleep.png
	; 添加 sleep.png 图片，gSleep 的作用是，当 sleep.png 被点击时，执行 Sleep 程序段。
Gui, Add, Picture, x140 y80 w32 h32 gShutdown, %A_ScriptDir%\images\close.png
Gui, Add, Picture, x226 y80 w32 h32 gRestart, %A_ScriptDir%\images\restart.png
Gui, Add, Button, x245 y170 w0 h0, none
	; 插入一个宽和高为0的按钮，防止窗口出现后，聚焦到取消按钮
Gui, Add, Button, x245 y170 w60 h20 gGuiEscape, 取消
	; 当点击取消按钮时，执行 GuiEscape 程序段
Gui, Show, w314 h200, 关闭计算机
	; 显示窗口，不设置 x y 值的话，AHK 会自动把窗口居中，窗口的宽度和高度正好是背景图片的宽和高，窗口的标题是“关闭计算机”
Return

GuiEscape:
	; 按下 Esc 键时
ExitApp
	; 退出 AHK 程序

#IfWinActive 关闭计算机
	; 当标题为“关闭计算机”窗口（就是上面我们定义的窗口）处于激活状态时，下面的快捷键才起效。
S::
	; 快捷键 S
Sleep:
	ShiftIsDown := GetKeyState("Shift")
		; 判断 Shift 键是否按下
	If ShiftIsDown = 1
		; 是的话，调用命令行（%comspec% /c）来执行命令：powercfg -h on
		; 这个命令是切换待机和休眠状态用的，Hide 参数用于隐藏命令行提示符。
		Run, %comspec% /c powercfg -h on,,Hide
	else
		Run, %comspec% /c powercfg -h off,,Hide
	DllCall("Powrprof.dll\SetSuspendState", "str", Sleep)
		; 用 DllCall 函数调用 Powrprof.dll 文件中的 SetSuspendState 函数，其作用是待机或者休眠。
	ExitApp
		; 退出
return

+S::
	; 快捷键 Shift + S，开始休眠
	Run, %comspec% /c powercfg -h on,,Hide
	DllCall("Powrprof.dll\SetSuspendState", "str", Sleep)
	ExitApp
return

R::
Restart:
	Run, Shutdown /r /t 0,,Hide
		; 运行 Windows 系统的 Shutdown 命令，/r 表示重启， /t 0 是立刻（0秒后）重启，
return

U::
Shutdown:
	Run, Shutdown /p,,Hide
		; 关机，并忽略超时和警告
Return

; Author: sfufoet http://www.appinn.com/author/sfufoet/ 