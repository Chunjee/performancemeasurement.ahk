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
	this.data.tests[this.groupVar][this.labelVar] := round(avgSpeed, 4)
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
