#SingleInstance on
	; ֻ����һ������
Gui, -Caption +AlwaysOnTop
	; ���ô������ԣ�-Caption ȥ���������ͱ߿�+AlwaysOnTop �����ö�
Gui, Add, Picture, x0 y0 w314 h200 , %A_ScriptDir%\images\bg.png
	; �� x=0 y=0 ��λ�����뱳��ͼƬ����ǰ·����A_ScriptDir���µ� images �ļ������ bg.png��������ͼƬ�Ŀ��Ϊ 314 ���أ�w314�����߶�Ϊ 200 ���أ�h200��
Gui, Add, Picture, x55 y80 w32 h32 gSleep, %A_ScriptDir%\images\sleep.png
	; ��� sleep.png ͼƬ��gSleep �������ǣ��� sleep.png �����ʱ��ִ�� Sleep ����Ρ�
Gui, Add, Picture, x140 y80 w32 h32 gShutdown, %A_ScriptDir%\images\close.png
Gui, Add, Picture, x226 y80 w32 h32 gRestart, %A_ScriptDir%\images\restart.png
Gui, Add, Button, x245 y170 w0 h0, none
	; ����һ����͸�Ϊ0�İ�ť����ֹ���ڳ��ֺ󣬾۽���ȡ����ť
Gui, Add, Button, x245 y170 w60 h20 gGuiEscape, ȡ��
	; �����ȡ����ťʱ��ִ�� GuiEscape �����
Gui, Show, w314 h200, �رռ����
	; ��ʾ���ڣ������� x y ֵ�Ļ���AHK ���Զ��Ѵ��ھ��У����ڵĿ�Ⱥ͸߶������Ǳ���ͼƬ�Ŀ�͸ߣ����ڵı����ǡ��رռ������
Return

GuiEscape:
	; ���� Esc ��ʱ
ExitApp
	; �˳� AHK ����

#IfWinActive �رռ����
	; ������Ϊ���رռ���������ڣ������������Ƕ���Ĵ��ڣ����ڼ���״̬ʱ������Ŀ�ݼ�����Ч��
S::
	; ��ݼ� S
Sleep:
	ShiftIsDown := GetKeyState("Shift")
		; �ж� Shift ���Ƿ���
	If ShiftIsDown = 1
		; �ǵĻ������������У�%comspec% /c����ִ�����powercfg -h on
		; ����������л�����������״̬�õģ�Hide ��������������������ʾ����
		Run, %comspec% /c powercfg -h on,,Hide
	else
		Run, %comspec% /c powercfg -h off,,Hide
	DllCall("Powrprof.dll\SetSuspendState", "str", Sleep)
		; �� DllCall �������� Powrprof.dll �ļ��е� SetSuspendState �������������Ǵ����������ߡ�
	ExitApp
		; �˳�
return

+S::
	; ��ݼ� Shift + S����ʼ����
	Run, %comspec% /c powercfg -h on,,Hide
	DllCall("Powrprof.dll\SetSuspendState", "str", Sleep)
	ExitApp
return

R::
Restart:
	Run, Shutdown /r /t 0,,Hide
		; ���� Windows ϵͳ�� Shutdown ���/r ��ʾ������ /t 0 �����̣�0���������
return

U::
Shutdown:
	Run, Shutdown /p,,Hide
		; �ػ��������Գ�ʱ�;���
Return

; Author: sfufoet http://www.appinn.com/author/sfufoet/ 