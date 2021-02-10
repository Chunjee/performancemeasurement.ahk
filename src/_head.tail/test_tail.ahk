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
