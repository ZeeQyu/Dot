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



# # Actually works, but is ugly, with using emit
# type Exports = object of RootObj
#   botName {.exportc.} : cstring
#   callable {.exportc.} : proc()
# var exported {.exportc.} : Exports
# exported.botName = "Strawberry"
# proc log() {.importc: "console.log".}
# exported.callable = log
# {.emit: "exports.nim = exported".}


# # JSFFI, works but unneccesary
# import jsffi
# exports.callable = bindMethod
#   proc log(that: JsObject) {.exportc.} : int = 
#     5
# import jsffi
# var obj = JsObject{ a: 10 }
# proc logged(that: JsObject): int =
#   that.a.to(int) + 42
# obj.someMethod = bindMethod log

# # Is not needed
# proc log(that: JsObject): int {.importc.
# log("ya")
# macro bindFunction(procedure: typed) : auto =
#   procedure
# template bindFunction(body: untyped) : typed =
  # proc intermediate(that: JsObject, text: cstring) =
  #   body("ya")
  # intermediate

# # junk on the way to the answer
# proc cLog() {.importc: "console.log".}
# cLog("text")
# proc consoleLogWrapper(that: JsObject, text: cstring) =
#   cLog(text)
# consoleLogWrapper("notext".tojs, "text")
# var exports {.importc.} : JsObject
# exports.callable = bindMethod consoleLogWrapper
# exports.callable = bindFunction cLog
# exports.callable = cLog
# exports.botName = "Banana".cstring

# Beautiful
import jsffi
proc cLog() {.importc: "console.log".}
var exports {.importc.} : JsObject
exports.callable = cLog
exports.botName = "Banana".cstring