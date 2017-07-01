# # Works, but is basically writing javascript
# {.emit: "exports.expBanana = 'banana';".}

# # Does not work
# var exports {.importc.} : tuple

# # Does not work
# type Exports = tuple[
#   expBanana : string 
#   ]
# var exports {.exportc.} : Exports
# exports.expBanana = "strawberry"

# # Creates pretty js, but overwrites exports, instead of modifying it
# type Person = ref object of RootObj
#   name* {.exportc.} : string
#   age {.exportc.} : int
# var person {.exportc.} : Person
# person.name = "Banana"
# person.age = 47

# 
type Exports = object of RootObj
  botName {.exportc.} : cstring
  callable {.exportc.} : proc()
var exported {.exportc.} : Exports
exported.botName = "Strawberry"

proc log() {.importc: "console.log".} 

exported.callable = log
{.emit: "exports.nim = exported".}


type 
  Data = tuple[x, y: int, s: string]
var d = cast[ptr Data](alloc0(sizeof(Data)))
GcUnref(d.s)