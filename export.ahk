class performancemeasurement {	; --- Static Variables ---	__New(param_default:="") {		this.testRepeats := 10		this.data := {}		this.data.tests := {}		this.groupVar := ""		this.labelVar := ""	}	; --- Static Methods ---	_typeException() {
		if (this.throwExceptions == true) {
			throw Exception("Type Error", -2)
		}
	}
	group(param) {
		this.groupVar := param
	}
	label(param) {
		this.labelVar := param
	}
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
	reportWrite(param_filepath) {
		; FileAppend, avgSpeed, Filename]
	}
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
}