measure(param_boundFunc, params*) {
	; obj := func(params[1]).bind(params[2])
	if (IsFunc(param_boundFunc)) {
		msgbox, func passed
	}

	; Start speed function
	QPC(1)
	loop, % this.testRepeats {
		param_boundFunc.call()
	}
	speed := QPC(0)
	avgSpeed := speed / this.testRepeats
	if (!isObject(this.data.tests[this.groupVar])) {
		this.data.tests[this.groupVar] := []
	}
	this.data.tests[this.groupVar][this.labelVar] := round(avgSpeed, 2)
	return avgSpeed
}

buildTest() {
	; dynamically build test and lebel from superglobal?
}


; tests
performanceObj.group("shuffle")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "shuffle", array)
performanceObj.measure(boundFunc)

performanceObj.group("chunk")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "chunk", array, 3)
performanceObj.measure(boundFunc)

performanceObj.group("compact")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "compact", array, 3)
performanceObj.measure(boundFunc)

performanceObj.group("concat")
performanceObj.label("array")
boundFunc := ObjBindMethod(A, "concat", array, array)
performanceObj.measure(boundFunc)


fn_bleh(param) {
	msgbox, function
	return param / 2
}

; omit
