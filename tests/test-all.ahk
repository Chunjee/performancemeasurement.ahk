#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk
#Include biga.ahk\export.ahk

#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1


performanceObj := new performancemeasurement()
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

assert.label("internal()")

; omit


assert.label("group()")


; omit


assert.label("label()")


; omit


assert.label("measure()")
performanceObj.group("shuffle")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "shuffle", array)
performanceObj.measure(boundFunc)

performanceObj.group("chunk")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "chunk", array)
performanceObj.measure(boundFunc)

performanceObj.group("compact")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "compact", array)
performanceObj.measure(boundFunc)

performanceObj.group("concat")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "concat", array, array)
performanceObj.measure(boundFunc)

performanceObj.group("difference")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "difference", array, array)
performanceObj.measure(boundFunc)

performanceObj.group("drop")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "drop", array)
performanceObj.measure(boundFunc)

performanceObj.group("dropRight")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "dropRight", array)
performanceObj.measure(boundFunc)

performanceObj.group("dropRightWhile")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "dropRightWhile", array, Func("fn_true"))
performanceObj.measure(boundFunc)

fn_true() {
	return true
}

fn_false() {
	return true
}

performanceObj.group("dropWhile")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "dropWhile", array, Func("fn_true"))
performanceObj.measure(boundFunc)

performanceObj.group("fill")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "fill", array)
performanceObj.measure(boundFunc)

performanceObj.group("findIndex")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "findIndex", array, Func("fn_false"))
performanceObj.label("object search")
boundFunc := ObjBindMethod(A, "findIndex", array, object)
performanceObj.measure(boundFunc)

performanceObj.group("findLastIndex")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "findLastIndex", array, Func("fn_false"))
performanceObj.measure(boundFunc)


; omit


assert.label("reportWrite()")


; omit


assert.label("test()")
; performanceObj.test(A.floor, 8.2)
; performanceObj.test(func("fn_test"), 8.2)'
; performanceObj.test(A.shuffle, array)

; omit

fn_test(param) {
	msgbox, function
	return param / 2
}
;; Display test results in GUI
msgbox, % assert._print(performanceObj.data.tests)
msgbox, % performanceObj.data.tests.count()
assert.fullreport()
msgbox, %speed%
ExitApp

QPC(R := 0)
{
	static P := 0, F := 0, Q := DllCall("QueryPerformanceFrequency", "Int64P", F)
	return ! DllCall("QueryPerformanceCounter", "Int64P", Q) + (R ? (P := Q) / F : (Q - P) / F)
}
