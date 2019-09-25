# when not defined(js):
#   {.fatal: "This file can only be compiled with js backend ('nim js client.nim')".}

import jsffi

var exports {.importc.} : JsObject
var methods {.exportc.} = newJsObject()

template exportMethod(name: untyped, body: untyped): untyped =
  proc `name`() =
    body
  methods.`name` = `name`

exportMethod serverRun:
  echo "Running server"

# proc serverStartup() {.exportc.} =
#     echo "Running server"

# methods.serverStartup = serverStartup

exports.data = methods