# performancemeasurement.ahk

Allows you to write performance tests for AutoHotkey functions and boundfunctions

```autohotkey
performanceObj := new performancemeasurement()

performanceObj.group("array flattening")
performanceObj.label("arrayFlat1 function")
testBoundFunc := Func("arrayFlat1").bind([[[[[1, 2, [3]]]]])
arrayFlat1(arr)
{
	Loop % len := arr.Count()
	{
		i := len - A_Index + 1
		if IsObject(item := arr[i])
		{
			arr.RemoveAt(i)
			arr.InsertAt(i, arrayFlat(item)*)
		}
	}
	Return arr
}
performanceObj.measure(testBoundFunc)

; test a second function
performanceObj.label("arrayFlat2 function")
testBoundFunc := Func("arrayFlat1").bind([[[[[1, 2, [3]]]]])
arrayFlat2(arr)
{
	newarr := []
	for key, value in arr {
		if (IsObject(value)) {
			newarr.push(arrayFlat2(value))
		}
		newarr.push(value)
	}
	return newarr
}

;write report to file
performanceObj.reportWrite()
```

## API

Including the module provides a class `performancemeasurement` with these methods: `.measure`, `.group`, `.label`, and `.reportWrite`

# **Label methods**
## .group


## .label



# **Measurement methods**
## .measure



## .reportWrite



#### Arguments
none


#### Returns

#### Example
