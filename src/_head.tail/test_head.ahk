#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk
#Include biga.ahk\export.ahk

#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1


performanceObj := new performance()
assert := new unittesting()
A := new biga()

; --- Variables ---
int := A.repeat("1", 1000)
string := A.repeat("a", 1000)
array := []
loop, 1000
{
	array.push("a")
}
object := array.clone()


;/--\--/--\--/--\--/--\--/--\
; MAIN
;\--/--\--/--\--/--\--/--\--/
