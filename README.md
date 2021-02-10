# dict.ahk
A modern dictionary package for AutoHotkey


### Installation

In a terminal or command line navigated to your project folder:

```bash
npm install dict.ahk
```

In your code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include dict.ahk\export.ahk

exampleDict := new dict()
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])
msgbox, % exampleDict.get(200)
; => "OK"

exampleDict.has(404)
; => true
```

You may also review or copy the package from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/dict.ahk/master/export.ahk); #Include it however you would normally when manually downloading a library.


### Attributes

The following attributes are accessible at all times:

`.size`
Contains the current `.Count()` length of the dictionary. There is no dedicated method for retrieving this value at this time.

`.data`
Contains all Key/Value pairs of the dictionary. Iterating is discouraged and no order is enforced.


## API

Including the module provides a class `dict` with seven methods: `.set`, `.get`, `.has`, `.map`, `.remove`, `.clear`, `.clone`

# **Label methods**
## .group




## .label





# **Measurement methods**
## .measure




## .reportWrite




## .test
creates and returns a new clone of the dictionary.

#### Arguments
none


#### Returns
(array): A new clone of the dictionary.

#### Example
```autohotkey
exampleDict.map([200, 403, 404], ["OK", "Access forbidden", "File not found"])

dictClone := exampleDict.clone()
dictClone.has(200)
; => true
```




