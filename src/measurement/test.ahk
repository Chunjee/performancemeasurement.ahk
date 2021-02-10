test(func, params*) {
	; obj := func(params[1]).bind(params[2])
	msgbox, % params.count()
	; Start speed function
	QPC(1)
	loop, % this.testRepeats {
		Switch params.count() {
		Case 1:
			func.call(params[1])
		Case 2:
			func.call(params[1], params[2])
		Case 3:
			func.call(params[1], params[2], params[3])
		Case 4:
			func.call(params[1], params[2], params[3], params[4])
		Case 5:
			func.call(params[1], params[2], params[3], params[4], params[5])
		Case 6:
			func.call(params[1], params[2], params[3], params[4], params[5], params[6])
		Default:
			msgbox, default entered
			func.call(params)
		}
	}
	speed := QPC(0)
	avgSpeed := speed / this.testRepeats
	msgbox, % "for 100: " speed "   for 1: " avgSpeed
}


; tests
; performanceObj.test(A.floor, 8.2)
; performanceObj.test(func("fn_test"), 8.2)'
; performanceObj.test(A.shuffle, array)

; omit

fn_test(param) {
	msgbox, function
	return param / 2
}