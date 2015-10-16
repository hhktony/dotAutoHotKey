@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set CONF_PATH=%HOME%\dotwindows
call mklink "%HOME%\Documents\AutoHotkey.ahk" "%CONF_PATH%\AutoHotkey\QuickStart.ahk"