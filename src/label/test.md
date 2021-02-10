creates and returns a new clone of the dictionary.

## Arguments
none


## Returns
(array): A new clone of the dictionary.

## Example
```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])

dictClone := exampleDict.clone()
dictClone.has(200)
; => true
```
